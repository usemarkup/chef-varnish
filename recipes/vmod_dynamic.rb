yum_repository 'varnish-uplex' do
  description 'Varnish Repository'
  baseurl "https://pkg.uplex.de/rpm/#{node['platform_version'].to_i}/uplex-varnish/$basearch"
  gpgcheck false
  action :create
end

package 'vmod-dynamic' do
  action :install
  notifies :reload, 'service[varnish]', :delayed
end
