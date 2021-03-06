directory '/etc/varnish/subroutines' do
  owner node['varnish']['user']
  mode '0755'
  action :create
end

template '/etc/varnish/subroutines/init.vcl' do
  source 'subroutines/init.vcl.erb'
  cookbook node['varnish']['templates']['cookbook']['init']
  variables(varnish: node['varnish'])
  notifies :reload, 'service[varnish]', :delayed
end

template '/etc/varnish/subroutines/recv_extra.vcl' do
  source 'subroutines/recv_extra.vcl.erb'
  cookbook node['varnish']['templates']['cookbook']['recv_extra']
  variables(varnish: node['varnish'])
  notifies :reload, 'service[varnish]', :delayed
end

template '/etc/varnish/subroutines/recv.vcl' do
  source 'subroutines/recv.vcl.erb'
  cookbook node['varnish']['templates']['cookbook']['recv']
  variables(varnish: node['varnish'])
  notifies :reload, 'service[varnish]', :delayed
end

template '/etc/varnish/subroutines/hash.vcl' do
  source 'subroutines/hash.vcl.erb'
  cookbook node['varnish']['templates']['cookbook']['hash']
  variables(varnish: node['varnish'])
  notifies :reload, 'service[varnish]', :delayed
end

template '/etc/varnish/subroutines/backend_response.vcl' do
  source 'subroutines/backend_response.vcl.erb'
  cookbook node['varnish']['templates']['cookbook']['backend_response']
  variables(varnish: node['varnish'])
  notifies :reload, 'service[varnish]', :delayed
end

template '/etc/varnish/subroutines/backend_error.vcl' do
  source 'subroutines/backend_error.vcl.erb'
  cookbook node['varnish']['templates']['cookbook']['backend_error']
  variables(varnish: node['varnish'])
  notifies :reload, 'service[varnish]', :delayed
end

template '/etc/varnish/subroutines/deliver.vcl' do
  source 'subroutines/deliver.vcl.erb'
  cookbook node['varnish']['templates']['cookbook']['deliver']
  variables(varnish: node['varnish'])
  notifies :reload, 'service[varnish]', :delayed
end

template '/etc/varnish/subroutines/shield.vcl' do
  source 'extra/shield.vcl.erb'
  variables(varnish: node['varnish'])
  notifies :reload, 'service[varnish]', :delayed
end

template '/etc/varnish/subroutines/client_ban.vcl' do
  source 'extra/client_ban.vcl.erb'
  variables(varnish: node['varnish'])
  notifies :reload, 'service[varnish]', :delayed
end

template '/etc/varnish/subroutines/miscellaneous.vcl' do
  source 'extra/miscellaneous.vcl.erb'
  cookbook node['varnish']['templates']['cookbook']['extra_miscellaneous']
  variables(varnish: node['varnish'])
  notifies :reload, 'service[varnish]', :delayed
end

template '/etc/varnish/subroutines/before_backend.vcl' do
  source 'extra/before_backend.vcl.erb'
  cookbook node['varnish']['templates']['cookbook']['before_backend']
  variables(varnish: node['varnish'])
  notifies :reload, 'service[varnish]', :delayed
end

template '/etc/varnish/subroutines/malicious.vcl' do
  source 'extra/malicious.vcl.erb'
  variables(varnish: node['varnish'])
  notifies :reload, 'service[varnish]', :delayed
end
