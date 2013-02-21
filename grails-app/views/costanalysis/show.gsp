
<%@ page import="hss.service.catalog.Costanalysis" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'costanalysis.label', default: 'Cost analysis')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="eso-inner">
        <div class="navbar" role="navigation">
            <ul class="nav">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
%{--				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
                <li><g:link  action="show" controller="teamservice" id="${costanalysisInstance?.teamservices?.id}"><g:message code="Back to ${costanalysisInstance?.teamservices?.encodeAsHTML()}" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-costanalysis" class="content scaffold-show" role="main">
            <div class="breadcrumb"> <h3><g:message code="default.show.label" args="[entityName]" /> for service <g:link controller="teamservice" action="show" id="${costanalysisInstance?.teamservices?.id}">${costanalysisInstance?.teamservices?.encodeAsHTML()}</g:link></h3></div>

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

            <section>
            <div class="formArea">
            <div class="form-horizontal">
            <dl class="dl-horizontal">
			
				<g:if test="${costanalysisInstance?.role}">

				<dt><span id="role-label" class="property-label"><g:message code="costanalysis.role.label" default="Role" /></span></dt>
					
					<dd>	<span class="property-value" aria-labelledby="role-label"><g:fieldValue bean="${costanalysisInstance}" field="role"/></span></dd>
					

				</g:if>
			
				<g:if test="${costanalysisInstance?.reason}">

                    <dt><span id="reason-label" class="property-label"><g:message code="costanalysis.reason.label" default="Reason" /></span> </dt>

                    <dd>	<span class="property-value" aria-labelledby="reason-label"><g:fieldValue bean="${costanalysisInstance}" field="reason"/></span>       </dd>
					

				</g:if>
			
				<g:if test="${costanalysisInstance?.cost}">

                    <dt><span id="cost-label" class="property-label"><g:message code="costanalysis.cost.label" default="Cost in Hours" /></span> </dt>

                    <dd>	<span class="property-value" aria-labelledby="cost-label"><g:fieldValue bean="${costanalysisInstance}" field="cost"/></span>  </dd>
					

				</g:if>

				<g:if test="${costanalysisInstance?.othercosts}">

                    <dt><span id="othercosts-label" class="property-label"><g:message code="costanalysis.othercosts.label" default="Other costs" /></span>    </dt>

                    <dd>	<span class="property-value" aria-labelledby="othercosts-label"><markdown:renderHtml><g:fieldValue bean="${costanalysisInstance}" field="othercosts"/></span></dd></markdown:renderHtml>
					

				</g:if>

                <g:if test="${costanalysisInstance?.totalmoneycosts}">

                    <dt><span id="totalmoneycosts-label" class="property-label"><g:message code="costanalysis.totalmoneycosts.label" default="Total" /></span>    </dt>

                    <dd><span class="property-value" aria-labelledby="totalmoneycosts-label"><g:fieldValue bean="${costanalysisInstance}" field="totalmoneycosts"/></span></dd>


                </g:if>
			
				<g:if test="${costanalysisInstance?.teamservices}">

                    <dt><span id="teamservices-label" class="property-label"><g:message code="costanalysis.teamservices.label" default="Team service" /></span> </dt>

                    <dd>	<span class="property-value" aria-labelledby="teamservices-label"><g:link controller="teamservice" action="show" id="${costanalysisInstance?.teamservices?.id}">${costanalysisInstance?.teamservices?.encodeAsHTML()}</g:link></span>     </dd>
					

				</g:if>
            </dl>

			<g:form>
				<fieldset class="btn">
					<g:hiddenField name="id" value="${costanalysisInstance?.id}" />
					<g:link class="edit" action="edit" id="${costanalysisInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'This will delete the costs?')}');" />
				</fieldset>
			</g:form>
        </div>
        </div>
        </div>
    </div>
	</body>
</html>
