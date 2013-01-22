default[:omnigollum_site][:base_path] = '/home/gollum/wiki'

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