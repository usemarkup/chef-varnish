yum_repository 'varnish' do
  description 'Varnish Repository'
  baseurl "https://packagecloud.io/varnishcache/varnish#{node['varnish']['version']}/el/#{node['platform_version'].to_i}/$basearch"
  gpgkey "https://packagecloud.io/varnishcache/varnish#{node['varnish']['version']}/gpgkey"
  gpgcheck false
  action :create
end

package 'varnish' do
  action :install
  notifies :reload, 'service[varnish]', :delayed
  version node['varnish']['package_version']
end

unless node['varnish']['package_version'].nil?
  include_recipe 'yum-plugin-versionlock'

  yum_version_lock 'varnish' do
    version node['varnish']['package_version']
    release '*'
    action :add
  end
end

varnish-6.0.0-1.el7.*

if node['varnish']['vmod']['dynamic']
  include_recipe 'varnish-centos::vmod_dynamic'
end
