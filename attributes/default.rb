default['varnish']['version'] = '41'
default['varnish']['package_version'] = '41'
default['varnish']['user'] = 'varnish'

# http://book.varnish-software.com/4.0/chapters/Tuning.html
default['varnish']['thread_pools'] = 2
default['varnish']['thread_pool_min'] = 200
default['varnish']['thread_pool_max'] = 2000
default['varnish']['thread_pool_timeout'] = 120

default['varnish']['conf'] = '/etc/varnish/default.vcl'
default['varnish']['memory'] = '256M'

default['varnish']['listen_port'] = 80
