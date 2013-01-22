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

if node[:omnigollum_site][:wiki_source] == ""
    bash 'initialize-wiki-repository' do
        user 'gollum'
        group 'gollum'
        cwd '/home/gollum'
        code <<-EOH
            test -d $BASE_PATH || git init $BASE_PATH
        EOH
        environment 'BASE_PATH' => node[:omnigollum_site][:base_path]
    end
else
    git 'sync-wiki-repository' do
        repository node[:omnigollum_site][:wiki_source]
        reference 'master'
        action :sync
        user 'gollum'
        group 'gollum'
        destination node[:omnigollum_site][:base_path]
    end
end
