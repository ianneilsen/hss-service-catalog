
<%@ page import="hss.service.catalog.Team" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'team.label', default: 'Team')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="eso-inner">
		<div class="navbar" role="navigation">
			<ul class="nav">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>

		<div id="show-team" class="content scaffold-show" role="main">
		<div class="breadcrumb"><h1><g:message code="default.show.label" args="[entityName]" /></h1> </div>
            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

            <div class="formArea">
            <div class="form-horizontal">

            <dl class="dl-horizontal">

				<g:if test="${teamInstance?.teamname}">

				<dt>	<span id="teamname-label" class="property-label"><g:message code="team.teamname.label" default="Team Name" /></span>   </dt>

				<dd>		<span class="property-value" aria-labelledby="teamname-label"><g:fieldValue bean="${teamInstance}" field="teamname"/></span>    </dd>


				</g:if>
			
				<g:if test="${teamInstance?.teamdivision}">

				<dt>	<span id="teamdivision-label" class="property-label"><g:message code="team.teamdivision.label" default="Team Division" /></span>     </dt>
					
				<dd>		<span class="property-value" aria-labelledby="teamdivision-label"><g:fieldValue bean="${teamInstance}" field="teamdivision"/></span>    </dd>
					

				</g:if>
			
				<g:if test="${teamInstance?.teamservices}">

				<dt>	<span id="teamservices-label" class="property-label"><g:message code="team.teamservices.label" default="Teamservices" /></span>      </dt>
					
						<g:each in="${teamInstance.teamservices}" var="t">
				<dd><span class="property-value" aria-labelledby="teamservices-label"><g:link controller="teamservice" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>  </dd>
						</g:each>
					

				</g:if>

            </dl>

            </div>
                <g:form>
				<fieldset class="btn">
					<g:hiddenField name="id" value="${teamInstance?.id}" />
					<div class="btn btn-primary"> <g:link class="edit" action="edit" id="${teamInstance?.id}"><g:message code="default.button.edit.label" default="Edit Team" /></g:link></div>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			    </g:form>
		</div>
      </div>
    </div>
  </body>
</html>
