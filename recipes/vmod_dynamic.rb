yum_repository 'varnish-uplex' do
  description 'Varnish Repository'
  baseurl "https://pkg.uplex.de/rpm/#{node['platform_version'].to_i}/uplex-varnish/$basearch"
  gpgcheck false
  action :create
end

if node['varnish']['dynamic_package_version']
  package 'vmod-dynamic' do
    action :install
    notifies :reload, 'service[varnish]', :delayed
    version node['varnish']['dynamic_package_version']
  end
  
  if node['varnish']['dynamic_package_lock_version']
    include_recipe 'yum-plugin-versionlock'

    yum_version_lock 'vmod-dynamic' do
      version node['varnish']['dynamic_package_lock_version']
      release '1'
      action :add
    end
  end
end
else
  package 'vmod-dynamic' do
    action :install
    notifies :reload, 'service[varnish]', :delayed
  end
end

