displayAmericanCensorshipModal = function() {
  // Inject CSS
  var css = '#signupmodal-overlay{display:block;position:absolute;top:0;left:0;width:100%;height:100%;background-color:#444;z-index:1001;-moz-opacity:.8;opacity:.8;filter:alpha(opacity=80);}#signupmodal-lightbox{display:block;position:absolute;left:15%;top:15%;width:862px;height:527px;padding:0;margin:0;background-color:#fff;z-index:1500;overflow:hidden;box-shadow:0px 0px 25px #171717;-webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px;overflow:hidden;}#signupmodal-lightbox iframe{border:0;width:862px;height:527px;overflow:hidden;}#signupmodal-close{color:white;font-family:"Helvetica","Arial",sans-serif;float:right;vertical-align:10px;z-index:100;position:absolute;margin-left:800px;vertical-align:50px;}';
  var style = document.createElement('style');
  style.type = "text/css";
  style.innerHTML = css;
  document.body.appendChild(style);

  // Inject HTML
  var html = '<a id="signupmodal-overlay" href="javascript:void(0)" onclick="javascript:document.getElementById(\'signupmodal-overlay\').style.display=\'none\';document.getElementById(\'signupmodal-lightbox\').style.display=\'none\';"></a>'
           + '<div id="signupmodal-lightbox">'
           + '<a id="signupmodal-close" href="javascript:void(0)" onclick="javascript:document.getElementById(\'signupmodal-overlay\').style.display=\'none\';document.getElementById(\'signupmodal-lightbox\').style.display=\'none\';">'
           + '<img src="/modal/images/close.png" title="Close"/>'
           + '</a>'
           + '<iframe src="/modal/form.html"></iframe>'
           + '</div>';

  var injector = document.createElement('div');
  injector.innerHTML = html;
  document.body.appendChild(injector);
}
displayAmericanCensorshipModal();
