require 'mini_racer'

context = MiniRacer::Context.new

ejs_src = File.read('./ejs.js')

puts context.eval ejs_src + "\n" + <<-JAVASCRIPT
  var people = ['geddy', 'neil', 'alex'];
  var html = ejs.render('<%= people.join(", "); %>', {people: people});
  html
JAVASCRIPT
# geddy, neil, alex
