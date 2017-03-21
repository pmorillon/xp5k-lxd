require 'xp5k'
require 'xp5k/rake'

XP5K::Role.new({
  name: 'puppetserver',
  servers: ['lxc01'],
  size: 1
}).add

XP5K::Role.new({
  name: 'controller',
  servers: ['lxc02'],
  size: 1
}).add

XP5K::Role.new({
  name: 'compute',
  servers: ['lxc03'],
  size: 1
}).add

role 'all' do
    roles 'puppetserver', 'controller', 'compute'
end

XP5K::Config[:gateway] = 'root@localhost'

desc "Launch command on all nodes"
task :test do
  on(roles('all'), :user => 'root') do
    cmd = 'date && uptime'
    cmd
  end
end

