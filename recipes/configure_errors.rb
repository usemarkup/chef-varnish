directory '/etc/varnish/errors' do
  owner node['varnish']['user']
  mode '0755'
  action :create
end

template '/etc/varnish/errors/504.html' do
  source 'errors/504.html'
  cookbook node['varnish']['files']['504']
end

template '/etc/varnish/errors/503.html' do
  source 'errors/503.html'
  cookbook node['varnish']['files']['503']
end
