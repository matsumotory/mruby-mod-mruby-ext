# mruby-mod-mruby-ext   [![Build Status](https://travis-ci.org/matsumoto-r/mruby-mod-mruby-ext.png?branch=master)](https://travis-ci.org/matsumoto-r/mruby-mod-mruby-ext)
Extended Apache class for mod_mruby. You can exnted Apache class by mrbgem.

## install by mrbgems 
- add conf.gem line to `build_config.rb` 

```ruby
MRuby::Build.new do |conf|

    # ... (snip) ...

    conf.gem :git => 'https://github.com/matsumoto-r/mruby-mod-mruby-ext.git'
end
```
## example 
```ruby
class Apache
  class Request
    def reverse_proxy path
      self.handler  = "proxy-server"
      self.proxyreq = Apache::PROXYREQ_REVERSE
      self.filename = "proxy:" + path
    end
  end
end
```
- proxy implementation by mod_mruby before link this mrbgem

```ruby
r = Apache::Request.new
r.handler  = "proxy-server"
r.proxyreq = Apache::PROXYREQ_REVERSE
r.filename = "proxy:" + "http://127.0.0.1:8001/proxy.html"
```

- proxy implementation by mod_mruby after link this mrbgem

```ruby
r = Apache::Request.new
r.reverse_proxy "http://127.0.0.1:8001/proxy.html"
```

## License
under the MIT License:
- see LICENSE file
