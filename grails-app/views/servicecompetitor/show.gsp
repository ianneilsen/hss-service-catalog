
<%@ page import="hss.service.catalog.Servicecompetitor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'servicecompetitor.label', default: 'Service competitor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="eso-inner">
        <div class="navbar" role="navigation">
            <ul class="nav">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
%{--				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
                <li><g:link  action="show" controller="teamservice" id="${servicecompetitorInstance?.teamservices?.id}"><g:message code="Back to ${servicecompetitorInstance?.teamservices?.encodeAsHTML()}" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-servicecompetitor" class="content scaffold-show" role="main">
            <div class="breadcrumb"> <h3><g:message code="default.show.label" args="[entityName]" /> for <g:link controller="teamservice" action="show" id="${servicecompetitorInstance?.teamservices?.id}">${servicecompetitorInstance?.teamservices?.encodeAsHTML()}</g:link></h3>   </div>

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

            <div class="formArea">
                <div class="form-horizontal">
                   <dl class="dl-horizontal">
				<g:if test="${servicecompetitorInstance?.competitorname}">

                    <dt><span id="competitorname-label" class="property-label"><g:message code="servicecompetitor.competitorname.label" default="Competitor name" /></span> </dt>

                    <dd>	<span class="property-value" aria-labelledby="competitorname-label"><g:fieldValue bean="${servicecompetitorInstance}" field="competitorname"/></span></dd>
					

				</g:if>
			
				<g:if test="${servicecompetitorInstance?.competitorservice}">

                    <dt><span id="competitorservice-label" class="property-label"><g:message code="servicecompetitor.competitorservice.label" default="Competitor service" /></span>  </dt>

                    <dd>	<span class="property-value" aria-labelledby="competitorservice-label"><g:fieldValue bean="${servicecompetitorInstance}" field="competitorservice"/></span> </dd>
					

				</g:if>
			
				<g:if test="${servicecompetitorInstance?.competitordescription}">

					<dt><span id="competitordescription-label" class="property-label"><g:message code="servicecompetitor.competitordescription.label" default="Competitor description" /></span>  </dt>
					
					<dd>	<span class="property-value" aria-labelledby="competitordescription-label"><g:fieldValue bean="${servicecompetitorInstance}" field="competitordescription"/></span> </dd>
					

				</g:if>
			
				<g:if test="${servicecompetitorInstance?.compservicedifference}">

                    <dt><span id="compservicedifference-label" class="property-label"><g:message code="servicecompetitor.compservicedifference.label" default="Compservice difference" /></span>  </dt>

                    <dd><span class="property-value" aria-labelledby="compservicedifference-label"><g:fieldValue bean="${servicecompetitorInstance}" field="compservicedifference"/></span> </dd>
					

				</g:if>
			
				<g:if test="${servicecompetitorInstance?.whousescompservice}">

                    <dt><span id="whousescompservice-label" class="property-label"><g:message code="servicecompetitor.whousescompservice.label" default="Who uses competitior service" /></span>  </dt>

                    <dd><span class="property-value" aria-labelledby="whousescompservice-label"><g:fieldValue bean="${servicecompetitorInstance}" field="whousescompservice"/></span>   </dd>
					

				</g:if>
			
				<g:if test="${servicecompetitorInstance?.competitorsmotivation}">

                    <dt><span id="competitorsmotivation-label" class="property-label"><g:message code="servicecompetitor.competitorsmotivation.label" default="Competitors motivation" /></span> </dt>

                    <dd><span class="property-value" aria-labelledby="competitorsmotivation-label"><g:fieldValue bean="${servicecompetitorInstance}" field="competitorsmotivation"/></span>  </dd>

				</g:if>
			
				<g:if test="${servicecompetitorInstance?.competitorvalue}">

                    <dt><span id="competitorvalue-label" class="property-label"><g:message code="servicecompetitor.competitorvalue.label" default="Competitor value" /></span>    </dt>

                    <dd><span class="property-value" aria-labelledby="competitorvalue-label"><g:fieldValue bean="${servicecompetitorInstance}" field="competitorvalue"/></span>    </dd>
					

				</g:if>
			
				<g:if test="${servicecompetitorInstance?.teamservices}">

                    <dt><span id="teamservices-label" class="property-label"><g:message code="servicecompetitor.teamservices.label" default="Team service" /></span>     </dt>

                    <dd><span class="property-value" aria-labelledby="teamservices-label"><g:link controller="teamservice" action="show" id="${servicecompetitorInstance?.teamservices?.id}">${servicecompetitorInstance?.teamservices?.encodeAsHTML()}</g:link></span>  </dd>
					

				</g:if>
              </dl>

			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${servicecompetitorInstance?.id}" />
					<g:link class="edit" action="edit" id="${servicecompetitorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'This will delete competitor service?')}');" />
				</fieldset>
			</g:form>
            </div>
            </div>
            </div>
		</div>
	</body>
</html>
