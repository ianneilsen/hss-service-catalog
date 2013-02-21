<%@ page import="hss.service.catalog.Servicecatagory" %>



<div class="fieldcontain ${hasErrors(bean: servicecatagoryInstance, field: 'catagoryname', 'error')} ">
	<label for="catagoryname">
		<g:message code="servicecatagory.catagoryname.label" default="Service Catagory name" />
		
	</label>
	<g:textField autofocus="true" name="catagoryname" maxlength="170" value="${servicecatagoryInstance?.catagoryname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: servicecatagoryInstance, field: 'teamservices', 'error')} ">
	<label for="teamservices">
		<g:message code="servicecatagory.teamservices.label" default="Services under this catagory" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${servicecatagoryInstance?.teamservices?}" var="t">
    <li><g:link controller="teamservice" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="teamservice" action="show" params="['servicecatagory.id': servicecatagoryInstance?.id]">${message(code: '', args: [message(code: 'teamservice.label', default: 'Teamservice')])}</g:link>
</li>
</ul>

</div>

