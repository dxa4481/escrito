var strings = {
  "import-button-title-plain"    : "Import a text file from your system",
  "import-button-title-textile"  : "Import a Textile file from your system",
  "import-button-title-markdown" : "Import a Markdown file from your system"
}

$(document).ready(function()
{
  var renderMode = "textile";
  $('#language-textile').append(" ✓");

  // jQuery uniform controls (http://pixelmatrixdesign.com/uniform)
  $("select, input:checkbox, input:radio, input:file").uniform();

  // Tooltips (http://onehackoranother.com/projects/jquery/tipsy)
  $('#import-button').tipsy({opacity: 1, trigger: 'manual'});
  $('#import-button').bind('mouseenter', function (e) {
     var allMenus = $('.opener');
     // Check if there is a menu opened
     if (allMenus.filter('.open').length != 0) {
       // Hide all opened menus but add a class to enable linked menus
       allMenus.each(function() {
         hideWindow($(this));
         $(this).addClass('menu-link');
       });
     }
     $(this).tipsy("show");
  });
  $('#import-button').bind('mouseleave', function (e) {
     $(this).tipsy("hide");
  });
  $(document).click( function(e) {
     // Hide all opened menus
     var allMenus = $('.opener');
     allMenus.each(function() {
       hideWindow($(this));
     });
  });


  var converter = new Showdown.converter();

  // Editor
  var editor = CodeMirror.fromTextArea('code', {
    parserfile: ["javascripts/modes/markdown.js", "javascripts/modes/textile.js"],
    stylesheet: "stylesheets/modes/default.css",
    basefiles: ["javascripts/codemirror/codemirror_base.js"],
    textWrapping: true,
    indentUnit: 4,
    parserConfig: {'strictErrors': true},
    iframeClass: "editor",
    height: '100%',
    initCallback: init
  });

  function render(val) {
    switch(renderMode)
    {
      case "plain":
        val = val.replace(/\r\n|\r|\n/g,"<br />"); // Newlines
        val = val.replace(/  /g, "&nbsp;&nbsp;"); // Whitespaces
        $('#paper').html("<p></p>" + val);
        $('#import-button').attr("title", strings['import-button-title-plain']);
        break;
      case "textile":
        editor.setParser('TextileParser');
        $('#paper').html(textile(val));
        $('#import-button').attr("title", strings['import-button-title-textile']);
        break;
      case "markdown":
        editor.setParser('MarkdownParser');
        $('#paper').html(converter.makeHtml(val));
        $('#import-button').attr("title", strings['import-button-title-markdown']);
        break;
      case "latex":
        break;
    }
  }

  // Switch
  $('#switch').iphoneSwitch("on",
    function() {
      $('.editor').hide();
      $('#preview').show();
      render(editor.getCode());
      $('#preview').css('top', '35px');
      $('#preview').focus();
    },
    function() {
      $('#preview').hide();
      $('.editor').show();
      $('.editor').focus();
    }, editor.win.document,
    {
      switch_path: 'images/switch.png'
    }
  );

  // Manage click events
  $('.language').click(function() {
    $('.language').each(function() {
      $(this).text($(this).text().replace(' ✓',''));
    })
    $(this).append(" ✓");

    switch(this.id)
    {
      case "language-plain":
        renderMode = "plain";
        break;
      case "language-textile":
        renderMode = "textile";
        break;
      case "language-markdown":
        renderMode = "markdown";
        break;
      case "language-latex":
        renderMode = "latex";
        break;
    }
    render(editor.getCode());
  });

  $('.editor').hide();
  function init() {
    render($('#code').val());
  }
});