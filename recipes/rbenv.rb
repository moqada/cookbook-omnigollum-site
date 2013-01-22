# install ruby
git "/home/gollum/.rbenv" do
    repository 'git://github.com/sstephenson/rbenv.git'
    reference 'master'
    action :sync
    user 'gollum'
    group 'gollum'
end

directory "/home/gollum/.rbenv/plugins" do
    owner 'gollum'
    group 'gollum'
    action :create
end

git "/home/gollum/.rbenv/plugins/ruby-build" do
    repository 'git://github.com/sstephenson/ruby-build.git'
    reference 'master'
    action :sync
    user 'gollum'
    group 'gollum'
end

bash 'setup_rbenv' do
    user 'root'
    cwd '/home/gollum'
    action :run
    code <<-EOH
        grep -sq 'export PATH=\"$HOME/.rbenv/bin:$PATH\"' /home/gollum/.bashrc || sudo -u gollum -H bash -c "echo 'export PATH=\\"\\$HOME/.rbenv/bin:\\$PATH\\"' >> .bashrc"
        grep -sq 'eval "$(rbenv init -)"' /home/gollum/.bashrc || sudo -u gollum -H bash -c "echo 'eval \\"\\$(rbenv init -)\\"' >> .bashrc"
        sudo -u gollum -H bash -c "source .bashrc"
    EOH
end

bash 'install_ruby_and_gems' do
    user 'root'
    cwd '/home/gollum'
    action :run
    code <<-EOH
        sudo -u gollum -H bash -l -c 'rbenv versions | grep -sq '1.9.3-p374' || rbenv install 1.9.3-p374'
        sudo -u gollum -H bash -l -c 'rbenv global 1.9.3-p374'
        sudo -u gollum -H bash -l -c 'rbenv rehash'
        sudo -u gollum -H bash -l -c 'gem install bundler --no-rdoc --no-ri'
        sudo -u gollum -H bash -l -c 'rbenv rehash'
    EOH
end
