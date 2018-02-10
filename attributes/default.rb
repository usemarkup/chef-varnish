# For Varnish 5.2
default['varnish']['version'] = '52'
# default['varnish']['version'] = '41'

default['varnish']['user'] = 'varnish'

default['varnish']['invalidators'] = ['localhost', '127.0.0.1', '::1']

default['varnish']['clients_banned'] = []

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
    'muhstik'
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

default['varnish']['templates']['cookbook']['recv'] = 'varnish-centos'
default['varnish']['templates']['cookbook']['backend_error'] = 'varnish-centos'
default['varnish']['templates']['cookbook']['backend_response'] = 'varnish-centos'
default['varnish']['templates']['cookbook']['deliver'] = 'varnish-centos'

default['varnish']['files']['cookbook']['504'] = 'varnish-centos'
default['varnish']['files']['cookbook']['503'] = 'varnish-centos'
