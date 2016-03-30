<!DOCTYPE html>
<html lang="en">
<head>
	  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <!-- The above 2 meta tags *must* come first in the head; any other head content must come *after* these tags  -->

    <title>Hipster Domain Finder - Real word domain hacks</title>

    <meta name="description" content="Browse hip domains">

    <meta property="og:title" content="Hipster Domains - Real word domain hacks" />
    <meta property="og:site_name" content="Hipster Domains" />
    <meta property="og:url" content="http://hipster.domains" />
    <meta property="og:description" content="Browse hip domains" />
    <meta property="fb:app_id" content="" />
    <meta property="og:image" content="hipster.domains/static/logo.png" />

    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans">
    <link rel="stylesheet" href="/static/normalize.css">
    <link rel="stylesheet" href="/static/skeleton.css">
    <link rel="stylesheet" href="/static/index.css">
    <link rel="icon" type="image/png" href="/static/logo.png">

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
    <div class="wrap">
        <header>
            <img src="/static/logo.png" class="logo" width="376.5" height="279">
            <div class="subtitle">
                Dot-com is so mainstream, find real word domain hacks with Hipster Domain Finder.
                <a href="https://github.com/djh-/hipster-domain-finder">Read more on GitHub</a>.
            </div>
        </header>

        <main class="container">
            % i = 0
            % for d in domains:
                % if i % 2 == 0:
                    <div class="row">
                % end
                        <a target="_blank" href="/register/{{d}}" class="domain six columns" data-opened="false">{{d}}</a>
                % if i % 2 != 0:
                    </div>
                % end
                % i += 1
            % end
        </main> 

        <nav>
            <a href="/{{page + 1}}" class="side">Next</a>

            % if page > 1:
                <a href="/{{page - 1}}" class="side">Previous</a>
            % end
        </nav>
<!-- 
        <section class="mailing">
            Receive a Hipster Domain in your inbox every Monday.
            <form method='get' action='http://mailing.bram.gg/join/hdf'>
                <input type="email" name="email" placeholder="you@example.com">
                <br>
                <input type="submit" value="Yes please!">
            </form>
        </section>

 -->        <section class="purchased">
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
            
        </footer>
    </div>
</body>
</html>
