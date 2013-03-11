<%@  page import="hss.communications.plan.Commlevel" %>
<%@ page import="hss.communications.plan.Communicationplan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'communicationplan.label', default: 'Plans')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
       %{-- <link href="../css/report.css" rel="stylesheet" type="text/css">--}%
        <script type="text/JavaScript" src="../js/eso-theme.js"></script>
        <script type="text/JavaScript" src="../js/plugins.js"></script>
        <script type="text/JavaScript" src="../js/lib/jquery-1.7.2.js"></script>
        <script type="text/JavaScript" src="../js/lib/modal.js"></script>
        <script type="text/JavaScript" src="../js/lib/tab.js"></script>


	</head>
	<body>

    <div class="eso-inner">
        <div class="navbar" role="navigation">
            <ul class="nav">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>

		%{--		<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			</ul>
		</div>
		<div id="show-communicationplan" class="content scaffold-show" role="main">
            <div class="breadcrumb"> <h4>${communicationplanInstance?.planname?.encodeAsHTML()}</h4></div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

            <section>
                <ul class="nav nav-tabs" id="myTab" data-tabs="tabs">
                    <li class="active"><a href="#PLANMAME">Plan Overview</a></li>
                    <li class=""><a href="#MEASURES">Measures</a></li>
                    <li class=""><a href="#CHANGES">Changes</a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane active" id="BRD">
                        <section>

                            <div class="page-header clear"></div>
                            <g:if test="${communicationplanInstance?.planname}">

                                <dt><span id="planname-label" class="property-label"><g:message code="communicationplan.planname.label" default="Plan name" /></span></dt>

                                <dd><span class="property-value" aria-labelledby="planname-label"><markdown:renderHtml><g:fieldValue bean="${communicationplanInstance}" field="planname"/></markdown:renderHtml></span></dd>


                            </g:if>

                            <g:if test="${communicationplanInstance?.planoverview}">

                                <dt><span id="planoverview-label" class="property-label"><g:message code="communicationplan.planoverview.label" default="Plan overview" /></span></dt>

                                <dd><span class="property-value" aria-labelledby="planoverview-label"><markdown:renderHtml><g:fieldValue bean="${communicationplanInstance}" field="planoverview"/></markdown:renderHtml></span></dd>


                            </g:if>

                    </div>



                    <div class="tab-pane fade" id="MEASURES">

                           <div class="page-header clear"></div>
                            <g:if test="${communicationplanInstance?.planmeasures}">

                                <dt><span id="planmeasures-label" class="property-label"><g:message code="communicationplan.planmeasures.label" default="Plan measures" /></span></dt>

                                <dd><span class="property-value" aria-labelledby="planmeasures-label"><markdown:renderHtml><g:fieldValue bean="${communicationplanInstance}" field="planmeasures"/></markdown:renderHtml></span></dd>


                            </g:if>

                    </div>



                    <div class="tab-pane fade" id="CHANGES">

                           <g:if test="${communicationplanInstance?.planchanges}">

                                <dt><span id="planchanges-label" class="property-label"><g:message code="communicationplan.planchanges.label" default="Plan changes" /></span></dt>

                                <dd><span class="property-value" aria-labelledby="planchanges-label"><markdown:renderHtml><g:fieldValue bean="${communicationplanInstance}" field="planchanges"/></markdown:renderHtml></span></dd>


                            </g:if>
                    </div>

                </div>
			
           %{--</section>--}%

<!--communciation table -->
                <div class="add">
                    <g:link controller="communication" action="create" params="['communicationplan.id': communicationplanInstance?.id]">${message(code: '<b>+</b> ADD new communication', args: [message(code: 'communication.label', default: 'Communication')])}</g:link>
                </div>
				<g:if test="${communicationplanInstance?.communications}">

                <table class="eso-table">
                        <thead>
                        <tr>

                            <g:sortableColumn property="id" title="${message(code: 'communications.id.label', default: 'Id')}" />

                            <g:sortableColumn property="communication" title="${message(code: 'communications.communication.label', default: 'Communication')}" />

                            <g:sortableColumn property="comlevelname" title="${message(code: 'commlevel.comlevelname.label', default: 'Level')}" />

                            <g:sortableColumn property="purpose" title="${message(code: 'communications.purpose.label', default: 'Purpose')}" />

                            <g:sortableColumn property="targetGroups" title="${message(code: 'communications.targetGroups.label', default: 'Target Groups')}" />

                            <g:sortableColumn property="expectations" title="${message(code: 'communications.expectations.label', default: 'Expectations')}" />

                            <g:sortableColumn property="communicator" title="${message(code: 'communications.communicator.label', default: 'Communicator')}" />

                            <g:sortableColumn property="datacollector" title="${message(code: 'communications.datacollector.label', default: 'Datacollector')}" />

                            <g:sortableColumn property="monitor" title="${message(code: 'communications.monitor.label', default: 'Monitor')}" />

                            <g:sortableColumn property="commchannelsmedia" title="${message(code: 'communications.commchannelsmedia.label', default: 'Communication channels/media')}" />

                            <g:sortableColumn property="timingfrequency" title="${message(code: 'communications.timingfrequency.label', default: 'Timing/frequency')}" />

                            <g:sortableColumn property="processdetailsdescrip" title="${message(code: 'communications.processdetailsdescrip.label', default: 'Process/details description')}" />

                            <g:sortableColumn title="Action" property="edit" />


                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${communicationplanInstance.communications}" status="i" var="communicationInstance">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                <td><g:link controller="communication" action="show" id="${communicationInstance.id}">${communicationInstance?.id}</g:link></td>

                                <td><g:link controller="communication" action="show" id="${communicationInstance.id}">${fieldValue(bean: communicationInstance, field: "communication")}</g:link></td>

                                <td>${fieldValue(bean: communicationInstance?.commlevel, field: "comlevelname")}</td>

                                <td><markdown:renderHtml>${fieldValue(bean: communicationInstance, field: "purpose")}</markdown:renderHtml></td>

                                <td><markdown:renderHtml>${fieldValue(bean: communicationInstance, field: "targetGroups")}</markdown:renderHtml></td>

                                <td><markdown:renderHtml>${fieldValue(bean: communicationInstance, field: "expectations")}</markdown:renderHtml></td>

                                <td>${fieldValue(bean: communicationInstance, field: "communicator")}</td>

                                <td>${fieldValue(bean: communicationInstance, field: "datacollector")}</td>

                                <td>${fieldValue(bean: communicationInstance, field: "monitor")}</td>

                                <td><markdown:renderHtml>${fieldValue(bean: communicationInstance, field: "commchannelsmedia")}</markdown:renderHtml></td>

                                <td>${fieldValue(bean: communicationInstance, field: "timingfrequency")}</td>

                                <td><markdown:renderHtml>${fieldValue(bean: communicationInstance, field: "processdetailsdescrip")}</markdown:renderHtml></td>

                                <td><g:link controller="communication" action="edit" name="edit" id="${communicationInstance.id}">+Edit</g:link> </td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>

				</g:if>
			
			</dl>
<!-- action items -->
			<g:form>
				<fieldset class="btn">
					<g:hiddenField name="id" value="${communicationplanInstance?.id}" />
					<g:link class="edit" action="edit" id="${communicationplanInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
                </div>
            </div>
        </div>
    </div>
	</body>
</html>
