
  <meta charset='utf-8'>
  <meta name="viewport" content="initial-scale=1">
  <title>{{title}}</title>
  <noscript>
    <meta http-equiv="refresh" content="30" />
  </noscript>
  <meta name="robots" content="noindex,nofollow">
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/img/ico/sitespeed.io-144.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/mg/ico/sitespeed.io-114.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/img/ico/sitespeed.io-72.png">
  <link rel="apple-touch-icon-precomposed" href="/img/ico/sitespeed.io-57.png">
  <link rel="shortcut icon" href="/img/ico/sitespeed.io.ico">
  <meta name="description" content="{{description}}">
  <meta name="keywords" content="sitespeed.io, wpo, webperf, perfmatters">
  <script type = "text/javascript">

  var oldState = 'unknown';

  function worker() {

  var xhr = new XMLHttpRequest();
  xhr.open("GET", "/api/status/{{id}}", true);

  xhr.onload = function() {
    var serverResponse = JSON.parse(xhr.responseText);
     if (serverResponse.status === oldState) {
       oldState = serverResponse.status;
       setTimeout(worker, 5000);
     }
     else if (oldState !== 'unknown') {
       document.getElementById("status").innerHTML = serverResponse.status;
       if (serverResponse.status === 'done' || serverResponse.status === 'failed') {
         location.reload();
       } else {
         oldState = serverResponse.status;
         setTimeout(worker, 5000);
       }
     } else {
     oldState = serverResponse.status;
     setTimeout(worker, 5000);
   }
  };

  xhr.onerror = function() {
    // oops couldn't fetch the response
  };

  xhr.send();
}

worker();

var showCats = false;

  function getACat(date) {

    if (!showCats) {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "/texts/webperf.json", true);

    xhr.onload = function() {
    var serverResponse = JSON.parse(xhr.responseText);

    var mess = serverResponse.messages[Math.floor(Math.random() * serverResponse.messages.length)];

     document.getElementById("randomcats").innerHTML = mess.m;
   };

    xhr.onerror = function() {
      // oops couldn't fetch the response
    };

    xhr.send();
    showCats = true;
  }
  else {
    document.getElementById("randomcats").innerHTML =
    "<img src=\"http://thecatapi.com/api/images/get?format=src&type=gif&date=" + date + "\" id=\"result\">";
    showCats = false;
  }
    /*
      document.getElementById("result").src = "http://thecatapi.com/api/images/get?format=src&type=gif&date=" + date;
      */
  }

  setInterval(function(){getACat(new Date())}, 10000);
  </script>
  <style>
  {{> css}}
  </style>
