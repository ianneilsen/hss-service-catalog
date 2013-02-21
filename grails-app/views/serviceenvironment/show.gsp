
<%@ page import="hss.service.catalog.Serviceenvironment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'serviceenvironment.label', default: 'Service environment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="eso-inner">
        <div class="navbar" role="navigation">
            <ul class="nav">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
%{--				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
                <li><g:link  action="show" controller="teamservice" id="${serviceenvironmentInstance?.teamservices?.id}"><g:message code="Back to ${serviceenvironmentInstance?.teamservices?.encodeAsHTML()}" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-serviceenvironment" class="content scaffold-show" role="main">
            <div class="breadcrumb"> <h3><g:message code="default.show.label" args="[entityName]" /> for service <g:link controller="teamservice" action="show" id="${serviceenvironmentInstance?.teamservices?.id}">${serviceenvironmentInstance?.teamservices?.encodeAsHTML()}</g:link></h3>   </div>

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
            <section>
            <div class="formArea">
                <div class="form-horizontal">
                    <dl class="dl-horizontal">

				<g:if test="${serviceenvironmentInstance?.successfactors}">

                    <dt><span id="successfactors-label" class="property-label"><g:message code="serviceenvironment.successfactors.label" default="Success factors" /></span>   </dt>

                    <dd>	<span class="property-value" aria-labelledby="successfactors-label"><markdown:renderHtml><g:fieldValue bean="${serviceenvironmentInstance}" field="successfactors"/></markdown:renderHtml></span></dd>


				</g:if>
			
				<g:if test="${serviceenvironmentInstance?.successmeasure}">

                    <dt><span id="successmeasure-label" class="property-label"><g:message code="serviceenvironment.successmeasure.label" default="Success measure" /></span>   </dt>

                    <dd><span class="property-value" aria-labelledby="successmeasure-label"><markdown:renderHtml><g:fieldValue bean="${serviceenvironmentInstance}" field="successmeasure"/></markdown:renderHtml></span> </dd>
					

				</g:if>
			
				<g:if test="${serviceenvironmentInstance?.teamservices}">

                    <dt><span id="teamservices-label" class="property-label"><g:message code="serviceenvironment.teamservices.label" default="Team service" /></span>    </dt>

                    <dd><span class="property-value" aria-labelledby="teamservices-label"><g:link controller="teamservice" action="show" id="${serviceenvironmentInstance?.teamservices?.id}">${serviceenvironmentInstance?.teamservices?.encodeAsHTML()}</g:link></span> </dd>
					

				</g:if>

             </dl>
            </div>
			<g:form>
				<fieldset class="btn">
					<g:hiddenField name="id" value="${serviceenvironmentInstance?.id}" />
					<g:link class="edit" action="edit" id="${serviceenvironmentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'This will delete service environment entry?')}');" />
				</fieldset>
			</g:form>
        </div>
            </div>
        </div>
    </div>
	</body>
</html>
