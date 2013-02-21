
<%@ page import="hss.service.catalog.Servicecatagory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'servicecatagory.label', default: 'Service catagory')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="eso-inner">
        <div class="navbar" role="navigation">
            <ul class="nav">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-servicecatagory" class="content scaffold-show" role="main">
			<div class="breadcrumb"><h3><g:message code="default.show.label" args="[entityName]" /></h3></div>

            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

            <section>
            <ol class="property-list servicecatagory">
			
				<g:if test="${servicecatagoryInstance?.catagoryname}">
				<li class="fieldcontain">
					<span id="catagoryname-label" class="property-label"><g:message code="servicecatagory.catagoryname.label" default="Catagory name:" /></span>
					
						<span class="property-value" aria-labelledby="catagoryname-label"><g:fieldValue bean="${servicecatagoryInstance}" field="catagoryname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${servicecatagoryInstance?.teamservices}">
				<li class="fieldcontain">
					<span id="teamservices-label" class="property-label"><g:message code="servicecatagory.teamservices.label" default="Teamservices" /></span>
					
						<g:each in="${servicecatagoryInstance.teamservices}" var="t">
						<span class="property-value" aria-labelledby="teamservices-label"><g:link controller="teamservice" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${servicecatagoryInstance?.id}" />
					<g:link class="edit" action="edit" id="${servicecatagoryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
