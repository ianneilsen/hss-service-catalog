
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
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>

			</ul>
		</div>
		<div id="show-costanalysis" class="content scaffold-show" role="main">
            <div class="breadcrumb"> <h3><g:message code="default.show.label" args="[entityName]" /> for service <g:link controller="teamservice" action="show" id="${costanalysisInstance?.teamservices?.id}">${costanalysisInstance?.teamservices?.encodeAsHTML()}</g:link></h3></div>

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

            <div class="formArea">
            <div class="form-horizontal">
            <dl class="dl-horizontal">
			
				<g:if test="${costanalysisInstance?.costname}">

				<dt><span id="costname-label" class="property-label"><g:message code="costanalysis.costname.label" default="Cost Name" /></span></dt>
					
					<dd>	<span class="property-value" aria-labelledby="costname-label"><g:fieldValue bean="${costanalysisInstance}" field="costname"/></span></dd>
					

				</g:if>
			
				<g:if test="${costanalysisInstance?.rapcost}">

                    <dt><span id="rapcost-label" class="property-label"><g:message code="costanalysis.rapcost.label" default="RAP Costs" /></span> </dt>

                    <dd>	<span class="property-value" aria-labelledby="rapcost-label"><g:fieldValue bean="${costanalysisInstance}" field="rapcost"/></span>       </dd>
					

				</g:if>
			
				<g:if test="${costanalysisInstance?.eipcost}">

                    <dt><span id="eipcost-label" class="property-label"><g:message code="costanalysis.eipcost.label" default="EIP Costs" /></span> </dt>

                    <dd>	<span class="property-value" aria-labelledby="eipcost-label"><g:fieldValue bean="${costanalysisInstance}" field="eipcost"/></span>  </dd>
					

				</g:if>
			
				<g:if test="${costanalysisInstance?.pacost}">

                    <dt><span id="pacost-label" class="property-label"><g:message code="costanalysis.pacost.label" default="PA Costs" /></span> </dt>

                    <dd>	<span class="property-value" aria-labelledby="pacost-label"><g:fieldValue bean="${costanalysisInstance}" field="pacost"/></span>   </dd>
					

				</g:if>
			
				<g:if test="${costanalysisInstance?.iedcost}">

                    <dt><span id="iedcost-label" class="property-label"><g:message code="costanalysis.iedcost.label" default="IED Costs" /></span>  </dt>

                    <dd>	<span class="property-value" aria-labelledby="iedcost-label"><g:fieldValue bean="${costanalysisInstance}" field="iedcost"/></span> </dd>
					

				</g:if>
			
				<g:if test="${costanalysisInstance?.engopscost}">

                    <dt><span id="engopscost-label" class="property-label"><g:message code="costanalysis.engopscost.label" default="Eng-Ops Costs" /></span> </dt>

                    <dd>	<span class="property-value" aria-labelledby="engopscost-label"><g:fieldValue bean="${costanalysisInstance}" field="engopscost"/></span>   </dd>
					

				</g:if>
			
				<g:if test="${costanalysisInstance?.qecost}">

                    <dt><span id="qecost-label" class="property-label"><g:message code="costanalysis.qecost.label" default="QE Costs" /></span>   </dt>

                    <dd>	<span class="property-value" aria-labelledby="qecost-label"><g:fieldValue bean="${costanalysisInstance}" field="qecost"/></span> </dd>
					

				</g:if>
			
				<g:if test="${costanalysisInstance?.othercosts}">

                    <dt><span id="othercosts-label" class="property-label"><g:message code="costanalysis.othercosts.label" default="Other costs" /></span>    </dt>

                    <dd>	<span class="property-value" aria-labelledby="othercosts-label"><g:fieldValue bean="${costanalysisInstance}" field="othercosts"/></span></dd>
					

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
