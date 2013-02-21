    <!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		%{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">--}%
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'eso-theme.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
        <g:javascript library="jquery" plugin="jquery"/>
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>

    <div class="eso-body">
        <div class="eso-logo>"><a href="https://dart.qe.lab.eng.bne.redhat.com/"><img style="padding-left: 70px;" src="${resource(dir: 'images', file: 'RAP_logo_col_sml_w5.png')}" alt="PA Team"/>Blueprint</a></div>
           <div class="eso-inner">

            <g:layoutBody/>

        <div class="footer" role="contentinfo"></div>
        <div class="copyright">
            <p><a>Project Management service capture tool version <g:meta name="app.version"/></a></p>
            <p><a>Copyright 2013 Red Hat, Inc. All rights reserved.<a></p>
            <p><a>INTERNAL USE ONLY</a></p>
        </div>
        <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
    </div>
    </div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
