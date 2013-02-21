
<%@ page import="hss.communications.plan.Commlevel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'commlevel.label', default: 'Communications level')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

    <div class="eso-inner">
        <div class="navbar" role="navigation">
            <ul class="nav">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link controller="communicationplan" action="list"><g:message code="back to Communication Plans" args="[entityName]" /></g:link></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-commlevel" class="content scaffold-show" role="main">
            <div class="breadcrumb"> <h3><g:message code="default.show.label" args="[entityName]" /></h3></div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
            <section>
           %{-- <div class="formArea">--}%
                <div class="form-horizontal">
                    <dl class="dl-horizontal">
			
				<g:if test="${commlevelInstance?.comlevelname}">

					<dt><span id="comlevelname-label" class="property-label"><g:message code="commlevel.comlevelname.label" default="Level name" /></span></dt>
					
						<dd><span class="property-value" aria-labelledby="comlevelname-label"><g:fieldValue bean="${commlevelInstance}" field="comlevelname"/></span></dd>
					

				</g:if>
			
				<g:if test="${commlevelInstance?.comleveldsecrip}">

					<dt><span id="comleveldsecrip-label" class="property-label"><g:message code="commlevel.comleveldsecrip.label" default="Level description" /></span></dt>
					
						<dd><span class="property-value" aria-labelledby="comleveldsecrip-label"><g:fieldValue bean="${commlevelInstance}" field="comleveldsecrip"/></span></dd>
					

				</g:if>

	%{--			<g:if test="${commlevelInstance?.communications}">

					<dt><span id="communications-label" class="property-label"><g:message code="commlevel.communications.label" default="Communications" /></span></dt>

						<dd><span class="property-value" aria-labelledby="communications-label"><g:link controller="communication" action="show" id="${commlevelInstance?.communications?.id}">${commlevelInstance?.communications?.encodeAsHTML()}</g:link></span></dd>


				</g:if>--}%
			
			</dl>
			<g:form>
				<fieldset class="btn">
					<g:hiddenField name="id" value="${commlevelInstance?.id}" />
					<g:link class="edit" action="edit" id="${commlevelInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
                </div>
           %{-- </div>--}%
        </div>
    </div>
	</body>
</html>
