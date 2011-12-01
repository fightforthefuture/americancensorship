use Rack::Static , :urls => { "/" => "index.html", "/index.html" => "index.html", "/modal" => "modal/index.html", "/js" => "modal/client.js.min", "/callwidget" => "modal/call-form.html", "/callwidget/thanks" => "modal/call-form-thanks.html", "/callwidget/next" => "modal/call-form-done.html" } , :root => "public"

run Rack::URLMap.new({
  "/"      => Rack::Directory.new("public"),
  "/modal" => Rack::Directory.new("public/modal"),
  "/modal/state-dept-petition" => Rack::Directory.new("public/modal/state-dept-petition")
})
