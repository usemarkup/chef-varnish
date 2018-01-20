yum_repository 'varnish' do
  description 'Varnish Repository'
  baseurl "https://packagecloud.io/varnishcache/varnish#{node['varnish']['version']}/el/#{node['platform_version'].to_i}/$basearch"
  gpgkey "https://packagecloud.io/varnishcache/varnish#{node['varnish']['version']}/gpgkey"
  gpgcheck false
  action :create
end

package 'varnish' do
  action :upgrade
  notifies :restart, 'service[varnish]', :delayed
end
