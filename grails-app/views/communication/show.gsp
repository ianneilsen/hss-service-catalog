<%@ page import="hss.communications.plan.Commlevel" %>
<%@ page import="hss.communications.plan.Communication" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'communication.label', default: 'Communication')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

    <div class="eso-inner">
        <div class="navbar" role="navigation">
            <ul class="nav">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				%{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
                <li><g:link controller="communicationplan" action="show" id="${communicationInstance?.commplan?.id}"> back to ${communicationInstance?.commplan?.encodeAsHTML()}</g:link></li>
			</ul>
		</div>
		<div id="show-communication" class="content scaffold-show" role="main">
            %{--<g:message code="default.show.label" args="[entityName]" /></h3></div>--}%
        <div class="breadcrumb"> <h3><g:if test="${communicationInstance?.commplan}">



                <dd><span class="property-value" aria-labelledby="commplan-label"><g:link controller="communicationplan" action="show" id="${communicationInstance?.commplan?.id}">${communicationInstance?.commplan?.encodeAsHTML()}</g:link></span></dd>


            </g:if></div>

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
            <section>
      %{--      <div class="formArea">--}%
                <div class="form-horizontal">
                    <dl class="dl-horizontal">
			
				<g:if test="${communicationInstance?.communication}">

					<dt><span id="communication-label" class="property-label"><g:message code="communication.communication.label" default="Communication" /></span></dt>
					
						<dd><span class="property-value" aria-labelledby="communication-label"><g:fieldValue bean="${communicationInstance}" field="communication"/></span></dd>
					

				</g:if>


                        <g:if test="${communicationInstance?.commlevel}">

                            <dt><span id="comlevel-label" class="property-label"><g:message code="communication.commlevel.label" default="Level"/></span></dt>
                            <dd><span class="property-value" aria-labelledby="comlevel-label"><g:fieldValue field="comlevelname" bean="${communicationInstance?.commlevel}"/></span> </dd>
                        </g:if>


				<g:if test="${communicationInstance?.purpose}">

					<dt><span id="purpose-label" class="property-label"><g:message code="communication.purpose.label" default="Purpose" /></span></dt>
					
						<dd><span class="property-value" aria-labelledby="purpose-label"><markdown:renderHtml><g:fieldValue bean="${communicationInstance}" field="purpose"/></markdown:renderHtml></span></dd>
					

				</g:if>
			
				<g:if test="${communicationInstance?.targetGroups}">

					<dt><span id="targetGroups-label" class="property-label"><g:message code="communication.targetGroups.label" default="Target Groups" /></span></dt>
					
						<dd><span class="property-value" aria-labelledby="targetGroups-label"><g:fieldValue bean="${communicationInstance}" field="targetGroups"/></span></dd>
					

				</g:if>
			
				<g:if test="${communicationInstance?.expectations}">

					<dt><span id="expectations-label" class="property-label"><g:message code="communication.expectations.label" default="Expectations" /></span></dt>
					
						<dd><span class="property-value" aria-labelledby="expectations-label"><g:fieldValue bean="${communicationInstance}" field="expectations"/></span></dd>
					

				</g:if>
			
				<g:if test="${communicationInstance?.communicator}">

					<dt><span id="communicator-label" class="property-label"><g:message code="communication.communicator.label" default="Communicator" /></span></dt>
					
						<dd><span class="property-value" aria-labelledby="communicator-label"><g:fieldValue bean="${communicationInstance}" field="communicator"/></span></dd>
					

				</g:if>
			
				<g:if test="${communicationInstance?.datacollector}">

					<dt><span id="datacollector-label" class="property-label"><g:message code="communication.datacollector.label" default="Datacollector" /></span></dt>
					
						<dd><span class="property-value" aria-labelledby="datacollector-label"><g:fieldValue bean="${communicationInstance}" field="datacollector"/></span></dd>
					

				</g:if>
			
				<g:if test="${communicationInstance?.monitor}">

					<dt><span id="monitor-label" class="property-label"><g:message code="communication.monitor.label" default="Monitor" /></span></dt>
					
						<dd><span class="property-value" aria-labelledby="monitor-label"><g:fieldValue bean="${communicationInstance}" field="monitor"/></span></dd>
					

				</g:if>
			
				<g:if test="${communicationInstance?.commchannelsmedia}">

					<dt><span id="commchannelsmedia-label" class="property-label"><g:message code="communication.commchannelsmedia.label" default="Commchannelsmedia" /></span></dt>
					
						<dd><span class="property-value" aria-labelledby="commchannelsmedia-label"><g:fieldValue bean="${communicationInstance}" field="commchannelsmedia"/></span></dd>
					

				</g:if>
			
				<g:if test="${communicationInstance?.timingfrequency}">

					<dt><span id="timingfrequency-label" class="property-label"><g:message code="communication.timingfrequency.label" default="Timingfrequency" /></span></dt>
					
						<dd><span class="property-value" aria-labelledby="timingfrequency-label"><g:fieldValue bean="${communicationInstance}" field="timingfrequency"/></span></dd>
					

				</g:if>
			
				<g:if test="${communicationInstance?.processdetailsdescrip}">

					<dt><span id="processdetailsdescrip-label" class="property-label"><g:message code="communication.processdetailsdescrip.label" default="Processdetailsdescrip" /></span></dt>
					
						<dd><span class="property-value" aria-labelledby="processdetailsdescrip-label"><markdown:renderHtml><g:fieldValue bean="${communicationInstance}" field="processdetailsdescrip"/></markdown:renderHtml></span></dd>
					

				</g:if>
			

			
			</dl>
			<g:form>
				<fieldset class="btn">
					<g:hiddenField name="id" value="${communicationInstance?.id}" />
					<g:link class="edit" action="edit" id="${communicationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
                </div>
         %{--   </div>--}%
        </div>
    </div>
	</body>
</html>
