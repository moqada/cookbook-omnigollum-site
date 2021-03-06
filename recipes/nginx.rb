# Setup nginx for omnigollum-site

# Install nginx
package 'nginx'
include_recipe 'nginx::commons'

service 'nginx' do
    supports :status => true, :restart => true, :reload => true
    action :enable
end

if node[:omnigollum_site][:htpasswd][:user] != ''
    htpasswd node[:omnigollum_site][:htpasswd][:path] do
        user node[:omnigollum_site][:htpasswd][:user]
        password node[:omnigollum_site][:htpasswd][:password]
    end
end

ruby_block 'set-nginx-site' do
    block do
        # Gollum library path
        gollum_path = `cd /home/gollum/omnigollum-site && sudo -u gollum -H bash -l -c "source /home/gollum/.bashrc && bundle show gollum"`.chomp()
        # Set nginx config file
        t = Chef::Resource::Template.new('omnigollum-site', run_context)
        t.path("#{node[:nginx][:dir]}/sites-available/omnigollum-site")
        t.source('omnigollum-site.erb')
        t.owner('root')
        t.mode('0644')
        t.cookbook_name = cookbook_name
        t.notifies_immediately(:restart, 'service[nginx]')
        t.variables({
            :assets_root => "#{gollum_path}/lib/gollum/frontend/public/gollum"
        })
        t.run_action(:create)
    end
end

nginx_site 'omnigollum-site' do
    enable true
end

service 'nginx' do
    supports :status => true, :restart => true, :reload => true
    action :start
end
