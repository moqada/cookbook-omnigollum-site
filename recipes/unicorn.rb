# Setup Unicorn

template '/home/gollum/omnigollum-site/unicorn.rb' do
    source 'unicorn.erb'
    owner 'gollum'
    group 'gollum'
    mode 0644
end

service 'omnigollum' do
    supports :restart => true, :start => true, :stop => true
    action :nothing
end

template '/etc/init.d/omnigollum' do
    source 'omnigollum.init.erb'
    owner 'root'
    group 'root'
    mode '755'
    notifies :enable, "service[omnigollum]"
    notifies :restart , "service[omnigollum]"
end
