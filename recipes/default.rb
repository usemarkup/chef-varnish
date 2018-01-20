include_recipe 'varnish-centos::install'

include_recipe 'varnish-centos::configure_errors'
include_recipe 'varnish-centos::configure_subroutines'

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
