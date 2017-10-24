default['varnish']['version'] = '41'
default['varnish']['user'] = 'varnish'

# http://book.varnish-software.com/4.0/chapters/Tuning.html
default['varnish']['thread_pools'] = 2
default['varnish']['thread_pool_min'] = 200
default['varnish']['thread_pool_max'] = 2000
default['varnish']['thread_pool_timeout'] = 120

default['varnish']['conf'] = '/etc/varnish/default.vcl'
default['varnish']['memory'] = '256M'

default['varnish']['listen_port'] = 80

default['varnish']['templates']['recv']['cookbook'] = 'varnish-centos'
default['varnish']['templates']['backend_error']['cookbook'] = 'varnish-centos'
default['varnish']['templates']['backend_response']['cookbook'] = 'varnish-centos'

default['varnish']['files']['504'] = nil
default['varnish']['files']['503'] = nil

