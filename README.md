# Chef Varnish
[![Build Status](https://travis-ci.org/usemarkup/chef-varnish.svg?branch=master)](https://travis-ci.org/usemarkup/chef-varnish)

Installs varnish from https://packagecloud.io/varnishcache/ for CentOS 

## Usage

Changing the versions of node can be done via the attributes, see attributes.rb

```ruby
default[:varnish][:version] = '41'
```

```json
  "run_list": [
    "recipe[varnish]"
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
