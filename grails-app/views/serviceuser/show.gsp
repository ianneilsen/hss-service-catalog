
<%@ page import="hss.service.catalog.Serviceuser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'serviceuser.label', default: 'Service user')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="eso-inner">
        <div class="navbar" role="navigation">
            <ul class="nav">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link>

			</ul>
		</div>
		<div id="show-serviceuser" class="content scaffold-show" role="main">
			<div class="breadcrumb"><h3><g:message code="default.show.label" args="[entityName]" /> for <g:link controller="teamservice" action="show" id="${serviceuserInstance?.teamservices?.id}">${serviceuserInstance?.teamservices?.encodeAsHTML()}</g:link></h3>   </div>

            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

            <div class="formArea">
                <div class="form-horizontal">
                    <dl class="dl-horizontal">

				<g:if test="${serviceuserInstance?.users}">

				<dt>	<span id="users-label" class="property-label"><g:message code="serviceuser.users.label" default="Users" /></span>  </dt>
					
				<dd>		<span class="property-value" aria-labelledby="users-label"><g:fieldValue bean="${serviceuserInstance}" field="users"/></span>     </dd>
					
				
				</g:if>
			
				<g:if test="${serviceuserInstance?.role}">

                    <dt><span id="role-label" class="property-label"><g:message code="serviceuser.role.label" default="Role" /></span>     </dt>

                    <dd>	<span class="property-value" aria-labelledby="role-label"><g:fieldValue bean="${serviceuserInstance}" field="role"/></span>    </dd>
					
				
				</g:if>
			
				<g:if test="${serviceuserInstance?.howtheyuse}">

                    <dt><span id="howtheyuse-label" class="property-label"><g:message code="serviceuser.howtheyuse.label" default="How they use service" /></span> </dt>

                    <dd><span class="property-value" aria-labelledby="howtheyuse-label"><g:fieldValue bean="${serviceuserInstance}" field="howtheyuse"/></span>  </dd>
					
				
				</g:if>
			
				<g:if test="${serviceuserInstance?.motivation}">

                    <dt><span id="motivation-label" class="property-label"><g:message code="serviceuser.motivation.label" default="Motivation" /></span>    </dt>

                    <dd><span class="property-value" aria-labelledby="motivation-label"><g:fieldValue bean="${serviceuserInstance}" field="motivation"/></span>  </dd>
					
				
				</g:if>
			
				<g:if test="${serviceuserInstance?.teamservices}">

                    <dt><span id="teamservices-label" class="property-label"><g:message code="serviceuser.teamservices.label" default="Team Services" /></span>   </dt>

                    <dd><span class="property-value" aria-labelledby="teamservices-label"><g:link controller="teamservice" action="show" id="${serviceuserInstance?.teamservices?.id}">${serviceuserInstance?.teamservices?.encodeAsHTML()}</g:link></span>  </dd>
					
				
				</g:if>
			 </dl>

			<g:form>
				<fieldset class="btn">
					<g:hiddenField name="id" value="${serviceuserInstance?.id}" />
					<g:link class="edit" action="edit" id="${serviceuserInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'This will delete the service user?')}');" />
				</fieldset>
			</g:form>
            </div>
                  </div>
            </div>
		</div>
	</body>
</html>
