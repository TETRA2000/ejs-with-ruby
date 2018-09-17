require 'mini_racer'
require 'sprockets/cache'
require 'sprockets/ejs_processor'

input = {
      content_type: 'application/javascript',
      data: "<span>Hello, <%= name %></p>",
      cache: Sprockets::Cache.new
    }
ejs_func = Sprockets::EjsProcessor.call(input)
puts ejs_func
# function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('<span>Hello, ',  name ,'</p>');}return __p.join('');}

context = MiniRacer::Context.new
puts context.eval <<-JAVASCRIPT
 var f = #{ejs_func};
 f({name: 'Hoge'});
JAVASCRIPT
# <span>Hello, Hoge</p>
