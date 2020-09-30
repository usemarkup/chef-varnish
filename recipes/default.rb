if node['varnish']['version'].to_i >= 60
  template '/etc/systemd/system/varnish.service' do
    source 'systemd/varnish.service.erb'
    variables(varnish: node['varnish'])
    notifies :reload, 'service[varnish]', :delayed
  end
end

cookbook_file '/usr/sbin/varnishreload' do
  source 'varnishreload'
  owner 'root'
  group 'root'
  mode '0755'
  action :create_if_missing
end

include_recipe 'varnish-centos::install'

include_recipe 'varnish-centos::configure_errors'
include_recipe 'varnish-centos::configure_subroutines'

template '/etc/varnish/default.vcl' do
  source 'varnish.vcl.erb'
  variables(varnish: node['varnish'])
  notifies :reload, 'service[varnish]', :delayed
end

if node['varnish']['version'].to_i >= 60
  # https://varnish-cache.org/docs/6.0/whats-new/upgrading-6.0.html
  # Even though this says `/etc/varnish/varnish.params` isnt used.. it is, see /usr/lib/systemd/system/varnish.service
  template '/etc/varnish/varnish.params' do
    source 'sysconfig/varnish.erb'
    variables(varnish: node['varnish'])
    notifies :reload, 'service[varnish]', :delayed
  end
end

if node['varnish']['version'].to_i >= 60
  template '/etc/sysconfig/varnish' do
    source 'sysconfig/varnish.erb'
    variables(varnish: node['varnish'])
    notifies :reload, 'service[varnish]', :delayed
  end
end

service_provider = nil
service_provider = if node['platform_version'].to_i > 6
                     Chef::Provider::Service::Systemd
                   end

service 'varnish' do
  provider service_provider if service_provider
  supports status: true, restart: true, reload: true, enable: true, start: true
  timeout 10
end

execute 'ensure-varnish-is-running' do
  command 'echo ensure-varnish-is-running'
  action :run
  notifies :start, 'service[varnish]', :delayed
end

execute 'ensure-varnish-is-started-at-boot' do
  command 'echo ensure-varnish-is-started-at-boot'
  action :run
  notifies :enable, 'service[varnish]', :delayed
  only_if { node['varnish']['start_at_boot'] }
end
