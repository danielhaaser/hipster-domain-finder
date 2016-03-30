<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <!-- The above 2 meta tags *must* come first in the head; any other head content must come *after* these tags  -->

    <title>Hipster Domains - Real word domain hacks</title>

    <meta name="description" content="Dot-com is so mainstream, find real word domain hacks with Hipster Domain Finder.">

    <meta property="og:title" content="Hipster Domains - Real word domain hacks" />
    <meta property="og:site_name" content="Hipster Domains" />
    <meta property="og:url" content="http://hipster.domains" />
    <meta property="og:description" content="Dot-com is so mainstream, find real word domain hacks with Hipster Domain Finder." />
    <meta property="fb:app_id" content="" />
    <meta property="og:image" content="http://hipster.domains/static/logo.png" />

    <link href='https://fonts.googleapis.com/css?family=Inconsolata' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="/static/normalize.css">
    <link rel="stylesheet" href="/static/skeleton.css">
    <link rel="stylesheet" href="/static/index.css">
    <link rel="stylesheet" href="/static/flex.css">
    <link rel="icon" type="/image/png" href="/static/logo.png">

    <!-- Google Analytics -->
    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-75744754-1', 'auto');
        ga('send', 'pageview');
    </script>

</head>
<body>
    <div class="container main">

      <div class="row">
        <header class="four columns mainleftcol textcenter flex flexcol justify-w-space">
            <div>
              <img src="/static/logo.png" class="logo">
              <div class="sidebar">
                <div class="subtitle">
                    <p>Dot-com is so mainstream, find real word domain hacks with Hipster Domain Finder.</p>
                    <!-- <a href="https://github.com/djh-/hipster-domain-finder">Read more on GitHub</a>. -->
                    <a class="button" href="/">Refresh</a>
                    <!--<img src="../static/hipimage.jpeg" class="hipimage">-->	               
                </div>

              </div>
          	</div>
          	<p class="mb05"><a>about</a></p>
        </header>

        <main class="eight columns mainrightcol">
            % i = 0
            % for d in domains:
                % if i % 2 == 0:
                    <div class="row custom">
                % end
                    % from random import randint
                    % random_image = str(randint(1, 14)) + '.png'
                    % random_image_path = '/static/icons/' + random_image
                    <a target="_blank" href="/register/{{d}}" class="domain six columns alpha" data-opened="false"> <img class="domainicon" src="{{random_image_path}}"/><p class="domaintext">{{d}}</p></a>
                % if i % 2 != 0:
                    </div>
                % end
                % i += 1
            % end
        </main> 
      </div>

      <div class="row textcenter mobilerefreshbtn mt3">
        <a class="button" href="#">the most hip</a>
      </div>

<!-- 
        <section class="mailing">
            Receive a Hipster Domain in your inbox every Monday.
            <form method='get' action='http://mailing.bram.gg/join/hdf'>
                <input type="email" name="email" placeholder="you@example.com">
                <br>
                <input type="submit" value="Yes please!">
            </form>
        </section>

 -->    
        <!-- <section class="purchased">
            {{len(purchased)}} Hipster Domains purchased this week.
            <br>
            {{', '.join(purchased)}}
        </section>

        <footer>
            Uses <a href="https://domainr.com/">Domainr</a> to check domain availability.
            <br>
            The logo was made with  <a href="http://hipsterlogogenerator.com/">Hipster Logo Generator</a>.
            <br><br>
            Made by <a href="http://www.bram.gg/">Bram Hoskin</a> in Portland.
            <br>
            Rehosted and rebranded by <a href="http://daniel.fail">Daniel Haaser</a>.
            
        </footer> -->

    </div>

</body>
</html>
