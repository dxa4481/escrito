<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>  <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>  <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>  <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <title>Escrito - Collaborative writing with Markdown &amp; Textile</title>
  <meta name="description" content="Escrito - Collaborative writing with Markdown &amp; Textile">
  <meta name="author" content="David Francisco">

  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="shortcut icon" href="/favicon.ico">
  <link rel="apple-touch-icon" href="/apple-touch-icon.png">
  <link rel="stylesheet" href="/css/style.css?v=2">
  <link rel="stylesheet" href="/css/editor.css">
  <link rel="stylesheet" href="/lib/ace/theme-escrito.css">

  <script src="/js/libs/modernizr-1.7.min.js"></script>
</head>
<body>
  <div id="container">
    <header>
      <div id="toolbar">
        <div class="logo"></div>
        <span class="code">Write</span>
        <div id="switch"></div>
        <span class="preview">Preview</span>

        <div id="language-menu" class="menu right">
          <div>
          <a href="#" class="opener">Language</a>
          <ul class="popup">
            <li><a class="language" id="language-plain" href="#plain">Plain text</a></li>
            <li><a class="language" id="language-textile" href="#textile">Textile</a></li>
            <li><a class="language" id="language-markdown" href="#markdown">Markdown</a></li>
            <li><span class="language" id="language-latex">Latex</span></li>
          </ul>
          <div class="clear"></div>
          </div>
        </div>

        <span class="import-button">
          <a href="#" class="return-button return-button-left" id="import-button" title="Import a text file from your system">Import</a>
        </span>

        <div id="export-menu" class="menu right">
          <div>
          <a href="#" class="opener opener-right">Export</a>
          <ul class="popup">
            <li><a class="export" id="export-text" href="#">Text file</a></li>
            <li><a class="export" id="export-html" href="#">HTML file</a></li>
            <li><span class="export" id="export-pdf">PDF file</span></li>
          </ul>
          <div class="clear"></div>
          </div>
        </div>

        <span class="print-button">
          <a href="javascript:window.print()" class="return-button" id="print-button">Print</a>
        </span>
      </div>
    </header>

    <div id="main" role="main">
      <div id="editbox">
        <div id="editor">{{{content}}}</div>
      </div>

      <div id="preview">
        <div id="desk">
          <div id="toolbar-tip"></div>
          <div id="paper"></div>
        </div>
      </div>
    </div>
  </div>

  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
  <script>!window.jQuery && document.write(unescape('%3Cscript src="/js/libs/jquery-1.4.2.min.js"%3E%3C/script%3E'))</script>

  <script src="/lib/markdown/showdown.js" type="text/javascript"></script>
  <script src="/lib/ace/ace.js" type="text/javascript" charset="utf-8"></script>
  <script src="/socket.io/socket.io.js"></script>
  <script src="/share/share.js"></script>
  <script src="/share/share-ace.js"></script>

  <script src="/lib/ace/behaviour.js"></script>
  <script src="/lib/ace/mode-text.js"></script>
  <script src="/lib/ace/mode-textile.js"></script>
  <script src="/lib/ace/mode-markdown.js"></script>
  <script src="/lib/ace/theme-escrito.js"></script>

  <script src="/js/libs/jquery.uniform.min.js"></script>
  <script src="/js/plugins.js"></script>

  <script src="/js/libs/json2.js"></script>
  <script src="/js/libs/diff_match_patch.js"></script>

  <script type="text/javascript">
    var document_id = '{{{docName}}}';
  </script>

  <script src="/js/script.js"></script>
  <!--[if lt IE 7 ]>
  <script src="/js/libs/dd_belatedpng.js"></script>
  <script> DD_belatedPNG.fix('img, .png_bg');</script>
  <![endif]-->
</body>
</html>