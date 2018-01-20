#default['varnish']['version'] = '52'
default['varnish']['version'] = '41'

default['varnish']['user'] = 'varnish'

default['varnish']['invalidators'] = ['127.0.0.1']

default['varnish']['debug'] = true

# http://book.varnish-software.com/4.0/chapters/Tuning.html
default['varnish']['thread_pools'] = 2
default['varnish']['thread_pool_min'] = 200
default['varnish']['thread_pool_max'] = 2000
default['varnish']['thread_pool_timeout'] = 120

default['varnish']['conf'] = '/etc/varnish/default.vcl'
default['varnish']['memory'] = '256M'

default['varnish']['listen_port'] = 80

default['varnish']['templates']['cookbook']['recv'] = 'varnish-centos'
default['varnish']['templates']['cookbook']['backend_error'] = 'varnish-centos'
default['varnish']['templates']['cookbook']['backend_response'] = 'varnish-centos'
default['varnish']['templates']['cookbook']['deliver'] = 'varnish-centos'

default['varnish']['files']['cookbook']['504'] = 'varnish-centos'
default['varnish']['files']['cookbook']['503'] = 'varnish-centos'
