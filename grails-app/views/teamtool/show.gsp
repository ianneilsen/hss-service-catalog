
<%@ page import="hss.service.catalog.Teamtool" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'teamtool.label', default: 'Team tool')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="eso-inner">
		<div class="navbar" role="navigation">
			<ul class="nav">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				%{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
                %{--<li><g:message code="Back to " args="[entityName]" /><g:link controller="teamservice" action="show" id="${teamtoolInstance?.teamservices?.id}">${teamtoolInstance?.teamservices?.encodeAsHTML()}</g:link></li>--}%
                <li><g:link  action="show" controller="teamservice" id="${teamtoolInstance?.teamservices?.id}"><g:message code="Back to ${teamtoolInstance?.teamservices?.encodeAsHTML()}" args="[entityName]" /></g:link></li>
			</ul>
		</div>

		<div id="show-teamtool" class="content scaffold-show" role="main">
            <div class="breadcrumb"><h3>Updated service tool "${teamtoolInstance?.toolname}"  for service <g:link controller="teamservice" action="show" id="${teamtoolInstance?.teamservices?.id}">${teamtoolInstance?.teamservices?.encodeAsHTML()}</g:link></span></h3></div>


            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

            <div class="formArea" >
                <div class="form-horizontal">
                    <div class="dl-horizontal">
			
				<g:if test="${teamtoolInstance?.toolname}">

				<dt><span id="toolname-label" class="property-label"><g:message code="teamtool.toolname.label" default="Tool Name" /></span></dt>

                    <dd><span class="property-value" aria-labelledby="toolname-label"><g:fieldValue bean="${teamtoolInstance}" field="toolname"/></span></dd>
					

				</g:if>
			
				<g:if test="${teamtoolInstance?.tooluse}">

				<dt><span id="tooluse-label" class="property-label"><g:message code="teamtool.tooluse.label" default="Tool Use" /></span></dt>
					
						<dd><span class="property-value" aria-labelledby="tooluse-label"><g:fieldValue bean="${teamtoolInstance}" field="tooluse"/></span></dd>
					

				</g:if>
			
				<g:if test="${teamtoolInstance?.toolmotivation}">

					<dt><span id="toolmotivation-label" class="property-label"><g:message code="teamtool.toolmotivation.label" default="Tool Motivation" /></span></dt>
					
						<dd><span class="property-value" aria-labelledby="toolmotivation-label"><markdown:renderHtml><g:fieldValue bean="${teamtoolInstance}" field="toolmotivation"/></span></dd> </markdown:renderHtml>
					

				</g:if>
			
				<g:if test="${teamtoolInstance?.teamservices}">

					<dt><span id="teamservices-label" class="property-label"><g:message code="teamtool.teamservices.label" default="Team Service" /></span></dt>
					
						<dd><span class="property-value" aria-labelledby="teamservices-label"><g:link controller="teamservice" action="show" id="${teamtoolInstance?.teamservices?.id}">${teamtoolInstance?.teamservices?.encodeAsHTML()}</g:link></span></dd>
					
				</g:if>

            </div>
            </div>
            </div>
			<g:form>
				<fieldset class="btn">
					<g:hiddenField name="id" value="${teamtoolInstance?.id}" />
					<div class="btn btn-primary"> <g:link class="edit" action="edit" id="${teamtoolInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link> </div>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
            </div>
            </div>
		</div>
    </div>
    </body>
</html>
