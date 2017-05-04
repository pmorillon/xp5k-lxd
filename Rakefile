require 'xp5k'
require 'xp5k/rake'

XP5K::Role.new({
  name: 'puppetserver',
  servers: ['lxc01.lxd'],
  size: 1
}).add

XP5K::Role.new({
  name: 'controller',
  servers: ['lxc02.lxd'],
  size: 1
}).add

XP5K::Role.new({
  name: 'computes',
  servers: (4..20).to_a.map {|x| "lxc#{format('%02d', x)}.lxd" },
  size: 17
}).add

role 'all' do
    roles 'puppetserver', 'controller', 'computes'
end

XP5K::Config[:gateway] = 'root@localhost'

desc "Launch command on all nodes"
task :test do
  on(roles('all'), :user => 'root') do
    cmd = 'date && uptime'
    cmd
  end
end

