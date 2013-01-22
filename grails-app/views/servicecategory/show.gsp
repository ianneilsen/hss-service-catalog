
<%@ page import="hss.service.catalog.Servicecategory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'servicecategory.label', default: 'Servicecategory')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-servicecategory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-servicecategory" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list servicecategory">
			
				<g:if test="${servicecategoryInstance?.categoryname}">
				<li class="fieldcontain">
					<span id="categoryname-label" class="property-label"><g:message code="servicecategory.categoryname.label" default="Categoryname" /></span>
					
						<span class="property-value" aria-labelledby="categoryname-label"><g:fieldValue bean="${servicecategoryInstance}" field="categoryname"/></span>
					
				</li>
				</g:if>

			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${servicecategoryInstance?.id}" />
					<g:link class="edit" action="edit" id="${servicecategoryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
