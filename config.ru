require 'rack/rewrite'
require 'rack/static'

use Rack::Static , :urls => { 
    "/" => "index.html", 
    "/index.html" => "index.html", 
    "/index.html" => "index.html", 
    "/wtfchuck" => "wtfchuck/index.html", 
    "/wtfchuck/" => "wtfchuck/index.html", 
    "/donate/fftf" => "index.html", 
    } , :root => "public"
    
run Rack::URLMap.new({
  "/"      => Rack::Directory.new("public"),
})
