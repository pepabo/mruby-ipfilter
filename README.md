# mruby-ipfilter   [![Build Status](https://travis-ci.org/pepabo/mruby-ipfilter.svg?branch=master)](https://travis-ci.org/pepabo/mruby-ipfilter)
IPFilter class
## install by mrbgems
- add conf.gem line to `build_config.rb`

```ruby
MRuby::Build.new do |conf|

    # ... (snip) ...

    conf.gem :github => 'tahira/mruby-ipfilter'
end
```
## example
```ruby
# CountryFromIP sample
cip = IPFilter::CountryFromIP.new('/tmp/GeoLite2-City.mmdb')
cip.permit = ['JP']

target_ip = '8.8.8.8'
if cip.permit?(target_ip)
  p "#{target_ip} is permit"
else
  p "#{target_ip} is deny"
end

# Path sample
path = IPFilter::Path.new()
path.deny = ['wp-login.php', 'xmlrpc.php']
target_path = '/blog/wp-login.php'
if path.deny?(target_path)
  p "#{target_path} is deny"
else
  p "#{target_path} is permit"
end

# UserAgent sample
ua = IPFilter::UserAgent.new()
ua.permit = ['Googlebot', 'Twitterbot']
target_ua='Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'
if ua.permit?(target_ua)
  p "#{target_ua} is permit"
else
  p "#{target_ua} is permit"
end
```

```sh
❯ mruby/bin/mruby example/example.rb                                                                  1h 37m 24s 309ms
"8.8.8.8 is deny"
"/blog/wp-login.php is deny"
"Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html) is permit"
```

## License
under the MIT License:
- see LICENSE file
