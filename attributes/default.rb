default['varnish']['version'] = '60'
# Only set this if you need a specific version i.e. 6.0.0
default['varnish']['package_version'] = '6.0.0-1.el7'

default['varnish']['start_at_boot'] = true

default['varnish']['vmod']['dynamic'] = false
default['varnish']['vmod']['dynamic_backend_host'] = nil

default['varnish']['backends'] = {}
default['varnish']['backends']['default'] = {}
default['varnish']['backends']['default']['host'] = '127.0.0.1'
default['varnish']['backends']['default']['port'] = '8080'

default['varnish']['user'] = 'varnish'

default['varnish']['invalidators'] = ['localhost', '127.0.0.1', '::1']

default['varnish']['clients_banned'] = []

default['varnish']['trusted_hosts'] = []

default['varnish']['user_agents_banned'] = [
  '^Java',
  '^Apache',
  'YandexBot',
  'Scrapy',
  'deepcrawl',
  'SearchmetricsBot',
  'archive.org_bot',
  'AhrefsBot',
  'SemrushBot',
  'SurdotlyBot',
  'VeBot',
  'DotBot',
  'diffbot',
  'IDBot',
  'id-search',
  'User-Agent',
  'ConveraCrawler',
  '^Mozilla$',
  'libwww',
  'lwp-trivial',
  'curl',
  'PHP/',
  'urllib',
  'GT:WWW',
  'Snoopy',
  'MFC_Tear_Sample',
  'HTTP::Lite',
  'PHPCrawl',
  'URI::Fetch',
  'Zend_Http_Client',
  'http client',
  'PECL::HTTP',
  'panscient.com',
  'IBM EVV',
  'Bork-edition',
  'Fetch API Request',
  'PleaseCrawl',
  'Pcore-HTTP',
  '^python-requests',
  '^bl.uk_lddc_bot',
  '^IAS crawler',
  '^YisouSpider',
  '^Screaming',
  '^Ruby',
  '^Go-http-client',
  '^WordPress',
  '^Typhoeus',
  '^rogerbot',
  '^Instart',
  'Baiduspider',
  'mj12bot',
  'shopstyle',
  'GarlikCrawler',
  'omgili',
  'RU_Bot',
  'muhstik',
  'UptimeRobot',
  'check_http',
  '^Go-http-client',
]

default['varnish']['debug'] = true

# http://book.varnish-software.com/4.0/chapters/Tuning.html
default['varnish']['thread_pools'] = 4
default['varnish']['thread_pool_min'] = 50
default['varnish']['thread_pool_max'] = 1000
default['varnish']['thread_pool_timeout'] = 120

default['varnish']['conf'] = '/etc/varnish/default.vcl'
default['varnish']['memory'] = '256M'

default['varnish']['listen_port'] = 80

default['varnish']['templates']['cookbook']['init'] = 'varnish-centos'
default['varnish']['templates']['cookbook']['recv'] = 'varnish-centos'
default['varnish']['templates']['cookbook']['backend_error'] = 'varnish-centos'
default['varnish']['templates']['cookbook']['backend_response'] = 'varnish-centos'
default['varnish']['templates']['cookbook']['deliver'] = 'varnish-centos'

default['varnish']['templates']['cookbook']['extra_miscellaneous'] = 'varnish-centos'

default['varnish']['files']['cookbook']['504'] = 'varnish-centos'
default['varnish']['files']['cookbook']['503'] = 'varnish-centos'
