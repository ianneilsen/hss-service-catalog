
<%@ page import="hss.service.catalog.Servicecatagory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'servicecatagory.label', default: 'Servicecatagory')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="eso-inner">
        <div class="navbar" role="navigation">
            <ul class="nav">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-servicecatagory" class="content scaffold-list" role="main">
			<div class="breadcrumb"> <h1><g:message code="default.list.label" args="[entityName]" /></h1> </div>

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

            <table class="eso-table">
				<thead>
					<tr>
					
						<g:sortableColumn property="catagoryname" title="${message(code: 'servicecatagory.catagoryname.label', default: 'Catagoryname')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${servicecatagoryInstanceList}" status="i" var="servicecatagoryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${servicecatagoryInstance.id}">${fieldValue(bean: servicecatagoryInstance, field: "catagoryname")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${servicecatagoryInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
