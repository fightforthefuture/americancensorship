require 'rack/rewrite'
require 'rack/static'
require 'rack/ssl'

use Rack::SSL

use Rack::Static , :urls => { 
    "/" => "index.html", 
    "/index.html" => "index.html", 
    "/donate/fftf" => "index.html", 
    "/salsa/include/jquery-1.3.2.min.js" => "/salsa/include/jquery-1.3.2.min.js",
    "/thanks" => "thanks/index.html",
    "/thanks/" => "thanks/index.html",
    "/badges/" => "badges/index.html",
    "/badges" => "badges/index.html",
    "/launch/" => "launch/index.html",
    "/launch" => "launch/index.html",
    "/confirm/" => "confirm/index.html", 
    "/confirm" => "confirm/index.html",
    "/faq/" => "faq/index.html", 
    "/faq" => "faq/index.html", 
    } , :root => "public"
    
use Rack::Rewrite do
    r301 %r{/pp/(.*)}, 'https://www.paypal.com/cgi-bin/webscr?cmd=_xclick-subscriptions&business=ZSTKNQA4EFRK6&lc=US&item_name=Fight+for+the+Future+Monthly+Donation&item_number=fftf-recurring&no_note=1&no_shipping=2&src=1&p3=1&t3=M&a3=$1&currency_code=USD&bn=PP-SubscriptionsBF%3Abtn_subscribeCC_LG.gif%3ANonHosted'
        r301 %r{/jb/(.*)}, 'http://joshuablount.com/monkey?=$1&another=variable'
end
    
run Rack::URLMap.new({
  "/"      => Rack::Directory.new("public"),
})
