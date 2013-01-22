# Add gollum user

user 'gollum' do
    comment 'Gollum'
    home '/home/gollum'
    supports :manage_home => true
end

bash 'chmod_home' do
    user 'root'
    code <<-EOH
        chmod 751 /home/gollum
    EOH
end

