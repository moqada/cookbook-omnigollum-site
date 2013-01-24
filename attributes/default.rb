default[:omnigollum_site][:base_path] = '/home/gollum/wiki'

default[:omnigollum_site][:wiki_options][:show_all] = true
default[:omnigollum_site][:wiki_options][:collapse_tree] = true
default[:omnigollum_site][:wiki_options][:mathjax] = true
default[:omnigollum_site][:wiki_options][:h1_title] = true
default[:omnigollum_site][:wiki_options][:user_icons] = 'gravatar'

default[:omnigollum_site][:ldap][:host] = '127.0.0.1'
default[:omnigollum_site][:ldap][:port] = '389'
default[:omnigollum_site][:ldap][:method] = 'plain'
default[:omnigollum_site][:ldap][:base] = 'dc=example,dc=com'
default[:omnigollum_site][:ldap][:uid] = 'uid'
default[:omnigollum_site][:ldap][:bind_dn] = 'cn=manager,dc=example,dc=com'
default[:omnigollum_site][:ldap][:password] = 'password'

default[:omnigollum_site][:unicorn][:port] = 9090
default[:omnigollum_site][:unicorn][:worker_processes] = 2

default[:omnigollum_site][:nginx][:port] = 80
default[:omnigollum_site][:nginx][:allow_ips] = []

default[:omnigollum_site][:htpasswd][:path] = '/etc/nginx/htpasswd'
default[:omnigollum_site][:htpasswd][:user] = ''
default[:omnigollum_site][:htpasswd][:password] = ''
