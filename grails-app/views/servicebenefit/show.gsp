
<%@ page import="hss.service.catalog.Servicebenefit" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'servicebenefit.label', default: 'Service benefit')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="eso-inner">
        <div class="navbar" role="navigation">
            <ul class="nav">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
%{--				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
                <li><g:link  action="show" controller="teamservice" id="${servicebenefitInstance?.teamservices?.id}"><g:message code="Back to ${servicebenefitInstance?.teamservices?.encodeAsHTML()}" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-servicebenefit" class="content scaffold-show" role="main">
            <div class="breadcrumb"> <h3><g:message code="default.show.label" args="[entityName]" /> for service <g:link controller="teamservice" action="show" id="${servicebenefitInstance?.teamservices?.id}">${servicebenefitInstance?.teamservices?.encodeAsHTML()}</g:link></h3>   </div>

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

            <section>
            <div class="formArea">
                <div class="form-horizontal">
                    <dl class="dl-horizontal">

				<g:if test="${servicebenefitInstance?.benefit}">

                    <dt><span id="benefit-label" class="property-label"><g:message code="servicebenefit.benefit.label" default="Service  Benefit" /></span>   </dt>

                    <dd><span class="property-value" aria-labelledby="benefit-label"><markdown:renderHtml><g:fieldValue bean="${servicebenefitInstance}" field="benefit"/></markdown:renderHtml></span>  </dd>
					

				</g:if>
			
				<g:if test="${servicebenefitInstance?.benefitmeasure}">

                    <dt><span id="benefitmeasure-label" class="property-label"><g:message code="servicebenefit.benefitmeasure.label" default="Service benefit measure" /></span>   </dt>

                    <dd><span class="property-value" aria-labelledby="benefitmeasure-label"><markdown:renderHtml><g:fieldValue bean="${servicebenefitInstance}" field="benefitmeasure"/></markdown:renderHtml></span></dd>
					

				</g:if>
			
				<g:if test="${servicebenefitInstance?.teamservices}">

                    <dt><span id="teamservices-label" class="property-label"><g:message code="servicebenefit.teamservices.label" default="Team service" /></span>   </dt>

                    <dd><span class="property-value" aria-labelledby="teamservices-label"><g:link controller="teamservice" action="show" id="${servicebenefitInstance?.teamservices?.id}">${servicebenefitInstance?.teamservices?.encodeAsHTML()}</g:link></span> </dd>
					

				</g:if>
			
             </dl>

			<g:form>
				<fieldset class="btn">
					<g:hiddenField name="id" value="${servicebenefitInstance?.id}" />
					<g:link class="edit" action="edit" id="${servicebenefitInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'This will delete the service benefit?')}');" />
				</fieldset>
			</g:form>
        </div>
                </div>
            </div>
    </div>
	</body>
</html>
