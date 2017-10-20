yum_repository 'varnish' do
  description 'Varnish Repository'
  baseurl "https://packagecloud.io/varnishcache/varnish#{node['varnish']['version']}/el/#{node['platform_version'].to_i}/$basearch"
  gpgkey "https://packagecloud.io/varnishcache/varnish#{node['varnish']['version']}/gpgkey"
  gpgcheck false
  action :create
end

package 'varnish'

directory '/etc/varnish/subroutines' do
  owner node['varnish']['user']
  mode '0755'
  action :create
end

directory '/etc/varnish/errors' do
  owner node['varnish']['user']
  mode '0755'
  action :create
end

template '/etc/varnish/subroutines/recv.vcl' do
  source 'subroutines/recv.vcl.erb'
  variables(varnish: node['varnish'])
end

template '/etc/varnish/subroutines/backend_response.vcl' do
  source 'subroutines/backend_response.vcl.erb'
  variables(varnish: node['varnish'])
end

template '/etc/varnish/subroutines/backend_error.vcl' do
  source 'subroutines/backend_error.vcl.erb'
  variables(varnish: node['varnish'])
end

template '/etc/varnish/errors/504.html' do
  source 'errors/504.html'
end

template '/etc/varnish/errors/503.html' do
  source 'errors/503.html'
end

# Lets also compose default VCL
template '/etc/varnish/default.vcl' do
  source 'varnish.vcl.erb'
  variables(varnish: node['varnish'])
  notifies :reload, 'service[varnish]', :delayed
end

template '/etc/sysconfig/varnish' do
  source 'sysconfig/varnish.erb'
  variables(varnish: node['varnish'])
  notifies :restart, 'service[varnish]', :delayed
end

service_provider = nil
service_provider = if node['platform_version'].to_i > 6
                     Chef::Provider::Service::Systemd
                   end

service 'varnish' do
  provider service_provider if service_provider
  supports status: true, restart: true, reload: true, enable: true, start: true
  action [:enable, :start]
  timeout 10
end
