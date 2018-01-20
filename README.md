# Chef Varnish
[![Build Status](https://travis-ci.org/usemarkup/chef-varnish.svg?branch=master)](https://travis-ci.org/usemarkup/chef-varnish)

Installs varnish from https://packagecloud.io/varnishcache/ for CentOS 

# Varnish Documentation

Standard library functions
https://varnish-cache.org/docs/5.0/reference/vmod_std.generated.html?highlight=vmod_std

VCL manual
https://varnish-cache.org/docs/5.0/reference/vcl.html#varnish-configuration-language

## Using Vagrant

```bash
# You can just use `make all` which will do the following

make bundle
make berks
make vagrant

# then visit http://10.100.100.100/
```

## Usage

Changing the versions of node can be done via the attributes, see attributes.rb

```ruby
default[:varnish][:version] = '41'
```

```json
  "run_list": [
    "recipe[varnish-centos]"
  ]
```

## Requirements

This cookbook assumes you already have `epel-release` installed. 

## Support

- CentOS 6.x
- CentOS 7.x

### Chef Support (tested)

- Chef 12.7+
- Chef 13.1
