/* Geolocation Toolkit for http://americancensorship.org
 * Depends on jQuery
 * Include code: <script type="text/javascript" src="/geo.js"></script>
 */
$(function(){
  // Detect non-US users and ask them to petition the state department instead.
  $.get('http://api.hostip.info/country.php', function(response) {
    if(response !== 'US') {
      document.location.pathname = "/modal/state-dept-petition/index.html";
    }
  });
});
