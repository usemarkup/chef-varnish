yum_repository 'varnish' do
  description 'Varnish Repository'
  baseurl "https://packagecloud.io/varnishcache/varnish#{node['varnish']['version']}/el/#{node['platform_version'].to_i}/$basearch"
  gpgkey "https://packagecloud.io/varnishcache/varnish#{node['varnish']['version']}/gpgkey"
  gpgcheck false
  action :create
end

if node['varnish']['package_version']
  package 'varnish' do
    action :install
    notifies :reload, 'service[varnish]', :delayed
    version node['varnish']['package_version']
  end
else
    package 'varnish' do
    action :install
    notifies :reload, 'service[varnish]', :delayed
  end
end

if node['varnish']['package_lock']
  include_recipe 'yum-plugin-versionlock'

  yum_version_lock 'varnish' do
    version node['varnish']['package_lock_version']
    release '1'
    action :add
  end
end

if node['varnish']['vmod']['dynamic']
  include_recipe 'varnish-centos::vmod_dynamic'
end

execute 'generate secret if required' do
  command 'dd if=/dev/random of=/etc/varnish/secret count=1'
  not_if { ::File.exist?('/etc/varnish/secret') }
end
