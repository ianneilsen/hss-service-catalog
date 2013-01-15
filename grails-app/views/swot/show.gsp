
<%@ page import="hss.service.catalog.Swot" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'swot.label', default: 'Swot')}" />
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
		<div id="show-swot" class="content scaffold-show" role="main">
            <div class="breadcrumb"> <h3><g:message code="default.show.label" args="[entityName]" /> for team service <g:link controller="teamservice" action="show" id="${swotInstance?.teamservices?.id}">${swotInstance?.teamservices?.encodeAsHTML()}</g:link></h3>   </div>

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

            <div class="formArea">
                <div class="form-horizontal">
                    <dl class="dl-horizontal">

				<g:if test="${swotInstance?.swotnumber}">

                    <dt><span id="swotnumber-label" class="property-label"><g:message code="swot.swotnumber.label" default="Swot number" /></span>    </dt>

                    <dd><span class="property-value" aria-labelledby="swotnumber-label"><markdown:renderHtml><g:fieldValue bean="${swotInstance}" field="swotnumber"/></markdown:renderHtml></span>  </dd>
					

				</g:if>
			
				<g:if test="${swotInstance?.strength}">

                    <dt><span id="strength-label" class="property-label"><g:message code="swot.strength.label" default="Strengths" /></span>    </dt>

                    <dd><span class="property-value" aria-labelledby="strength-label"><markdown:renderHtml><g:fieldValue bean="${swotInstance}" field="strength"/></markdown:renderHtml></span> </dd>
					

				</g:if>
			
				<g:if test="${swotInstance?.opportunities}">

                    <dt><span id="opportunities-label" class="property-label"><g:message code="swot.opportunities.label" default="Opportunities" /></span> </dt>

                    <dd><span class="property-value" aria-labelledby="opportunities-label"><markdown:renderHtml><g:fieldValue bean="${swotInstance}" field="opportunities"/></markdown:renderHtml></span>  </dd>
					

				</g:if>
			
				<g:if test="${swotInstance?.weaknesses}">

                    <dt><span id="weaknesses-label" class="property-label"><g:message code="swot.weaknesses.label" default="Weaknesses" /></span>      </dt>

                    <dd><span class="property-value" aria-labelledby="weaknesses-label"><markdown:renderHtml><g:fieldValue bean="${swotInstance}" field="weaknesses"/></markdown:renderHtml></span> </dd>
					

				</g:if>
			
				<g:if test="${swotInstance?.threats}">

                    <dt><span id="threats-label" class="property-label"><g:message code="swot.threats.label" default="Threats" /></span>   </dt>

                    <dd><span class="property-value" aria-labelledby="threats-label"><markdown:renderHtml><g:fieldValue bean="${swotInstance}" field="threats"/></markdown:renderHtml></span>  </dd>


				</g:if>
			
				<g:if test="${swotInstance?.gaps}">

                    <dt><span id="gaps-label" class="property-label"><g:message code="swot.gaps.label" default="Gaps" /></span>      </dt>

                    <dd><span class="property-value" aria-labelledby="gaps-label"><markdown:renderHtml><g:fieldValue bean="${swotInstance}" field="gaps"/></markdown:renderHtml></span>  </dd>
					

				</g:if>
			
				<g:if test="${swotInstance?.teamservices}">

                    <dt><span id="teamservices-label" class="property-label"><g:message code="swot.teamservices.label" default="for team service" /></span>    </dt>

                    <dd><span class="property-value" aria-labelledby="teamservices-label"><g:link controller="teamservice" action="show" id="${swotInstance?.teamservices?.id}">${swotInstance?.teamservices?.encodeAsHTML()}</g:link></span>    </dd>
					

				</g:if>
			
            </dl>
			<g:form>
				<fieldset class="btn">
					<g:hiddenField name="id" value="${swotInstance?.id}" />
					<g:link class="edit" action="edit" id="${swotInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'This will delete the swot for ${swotInstance?.teamservice?.id}?')}');" />
				</fieldset>
			</g:form>
            </div>
            </div>
            </div>
		</div>
	</body>
</html>
