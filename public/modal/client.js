// Include code
// <script type="text/javascript" src="http://freebieber.org/client.js"></script>
SignupModal = {

  initialize: function () {
    // Patch some JSON parse features.
    JSON.stringify = JSON.stringify || function (obj) {
      var t = typeof (obj);
      if (t != "object" || obj === null) {
        // simple data type
        if (t == "string") obj = '"'+obj+'"';
          return String(obj);
      } else {
      // recurse array or object
        var n, v, json = [], arr = (obj && obj.constructor == Array);
        for (n in obj) {
          v = obj[n]; t = typeof(v);
          if (t == "string") v = '"'+v+'"';
          else if (t == "object" && v !== null) v = JSON.stringify(v);
          json.push((arr ? "" : '"' + n + '":') + String(v));
        }
        return (arr ? "[" : "{") + String(json) + (arr ? "]" : "}");
      }
    };
 
    // Patch the JSON object again.
    JSON.parse = JSON.parse || function (str) {
      if (str === "") str = '""';
      eval("var p=" + str + ";");
      return p;
    };

    // Get location from freegeoip via jsonp.
    try {
      var url = "http://freegeoip.net/json/?callback=SignupModal.foundLocation";
      var script = document.createElement('script');
      script.src = url;
      document.body.appendChild(script);
    } catch(err) {
      this.displayModal();
    }
  },

  // Handle the callback from the injected json.
  foundLocation: function(payload) {
    try {
      var json = JSON.parse(payload);
      // Display the modal if we're in the US, else, don't.
      if(json["country_name"] === "United States") {
        this.displayModal();
      }
    } catch(err) {
      this.displayModal();
    }
  },

  // Inject the HTML and CSS we need to show the modal.
  displayModal: function() {
    // Inject CSS
    var css = '.black_overlay{display:block;position:absolute;top:0;left:0;width:100%;height:100%;background-color:#444;z-index:1001;-moz-opacity:.8;opacity:.8;filter:alpha(opacity=80)}.white_content{display:block;position:absolute;top:25%;left:25%;width:600px;height:400px;padding:0;margin:0;background-color:#fff;z-index:1002;overflow:visible;box-shadow:0px 0px 25px #171717;-webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px;}.white_content iframe{border:0;width:900px;height:500px;}.white_content a{color:white;font-family:"Helvetica","Arial",sans-serif;float:right;vertical-align:10px;z-index:1500;display:inline;}';
    var style = document.createElement('style');
    style.type = "text/css";
    style.innerHTML = css;
    document.body.appendChild(style);

    // Inject HTML
    var html = '<div id="signupmodal-overlay" class="black_overlay"></div>'
             + '<div id="signupmodal-lightbox" class="white_content">'
             + '<a class="signupmodal-close" href="javascript:void(0)" onclick="javascript:document.getElementById(\'signupmodal-overlay\').style.display=\'none\';document.getElementById(\'signupmodal-lightbox\').style.display=\'none\';">'
             + '<img src="/modal/images/close.png" title="Close"/>'
             + '</a>'
             + '<iframe src="/modal/form.html"></iframe>'
             + '</div>';

    var injector = document.createElement('div');
    injector.innerHTML = html;
    document.body.appendChild(injector);
  }

};

SignupModal.initialize();
