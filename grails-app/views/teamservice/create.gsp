<%@ page import="hss.service.catalog.Teamservice" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'teamservice.label', default: 'Teamservice')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="eso-inner">
        <div class="navbar" role="navigation">
            <ul class="nav" role="navigation">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>

		<div id="create-teamservice" class="content scaffold-create" role="main">
			<div class="breadcrumb"> <h3><g:message code="default.create.label" args="[entityName]" /></h3> </div>

            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

            <g:hasErrors bean="${teamserviceInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${teamserviceInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>

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
     <!--todo ensure service is saved first before allowing user to move on to tools, costs etc -->
<!-- todo not picking up service id correctly when adding in 1 to 7 items for service -->
<!-- todo - allow more than one url to be included along with a explanation filed for url -->
<!-- todo blank out or hide team id field at bottom of form -->