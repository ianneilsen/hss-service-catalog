<%@ page import="hss.service.catalog.Teamtool" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'teamtool.label', default: 'Teamtool')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="eso-inner">
        <!-- nav -->
        <div class="navbar" role="navigation">
			<ul class="nav">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				%{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
			</ul>
		</div>
        <!-- bread -->
		<div id="create-teamtool" class="content scaffold-create" role="main">
			<div class="breadcrumb"> <h3><g:message code="Create new service tool" args="[entityName]" /></h3> </div>
        <!-- error msgs -->
            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${teamtoolInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${teamtoolInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
        <!-- form -->
            <div class="formArea">
                <div class="form-horizontal">
                <g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
                 </div>
            </div>

		</div>
    </div>
  </body>
</html>
    <!--todo -redirect after new and edit back to teamservice show page -->
<!-- todo - ensure that service name is selected in session when adding in tools, costs etc for new and edit pages on teamtool -->