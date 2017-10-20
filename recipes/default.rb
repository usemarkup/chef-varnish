yum_repository 'varnish' do
  description 'Varnish Repository'
  baseurl "https://packagecloud.io/varnishcache/varnish#{node['varnish']['version']}/el/6/$basearch"
  gpgkey "https://packagecloud.io/varnishcache/varnish#{node['varnish']['version']}/gpgkey"
  gpgcheck false
  action :create
end

package 'varnish' do
  notifies :start, 'service[varnish]', :delayed
end

template '/etc/sysconfig/varnish' do
  source 'sysconfig/varnish.erb'
  notifies :reload, 'service[varnish]', :delayed
end

template '/etc/default/default.vcl' do
  source 'varnish.vcl.erb'
  notifies :reload, 'service[varnish]', :delayed
end

service 'varnish' do
  if node['platform_version'].to_i > 6
    provider Chef::Provider::Service::Systemd
  end
  supports status: true, restart: true, reload: true, enable: true, start: true
  action [:enable, :start]
end
