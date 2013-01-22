git "/home/gollum/omnigollum-site" do
    repository 'git://github.com/moqada/omnigollum-site.git'
    reference 'master'
    action :sync
    user 'gollum'
    group 'gollum'
end

bash 'bundle_install' do
    user 'root'
    cwd '/home/gollum/omnigollum-site'
    code <<-EOH
        sudo -u gollum -H bash -l -c "bundle install"
    EOH
end

template '/home/gollum/omnigollum-site/gollum.yaml' do
    source 'gollum.yaml.erb'
    owner 'gollum'
    group 'gollum'
    mode 0644
end

template '/home/gollum/omnigollum-site/config.ru' do
    source 'config.erb'
    owner 'gollum'
    group 'gollum'
    mode 0644
end
