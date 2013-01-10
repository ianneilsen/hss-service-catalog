<%@ page import="hss.service.catalog.Team" %>

<!--name-->
<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'teamname', 'error')} required">
	<label class="control-label" for="teamname">
		<g:message code="team.teamname.label" default="Team Name" />
		<span class="required-indicator">*</span>
	</label>
    <div class="controls"><g:textField name="teamname" required="" value="${teamInstance?.teamname}"/>
    <p class="help-block">Your internal team name i.e. RAP</p> </div>
</div>
</div>
 <!--division -->
<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'teamdivision', 'error')} required">
	<label class="control-label" for="teamdivision">
		<g:message code="team.teamdivision.label" default="Team Division" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls"> <g:textField name="teamdivision" required="" value="${teamInstance?.teamdivision}"/>
    <p class="help-block">i.e. Hosted and Shared Services or HSS</p> </div>
</div>
</div>
<!-- services -->
<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'teamservices', 'error')} ">
	<label class="control-label" for="teamservices">
		<g:message code="team.teamservices.label" default="Team Services" />
	</label>
</div>
<div class="controls">
<ul class="one-to-many">
<g:each in="${teamInstance?.teamservices?}" var="t">
    <g:link controller="teamservice" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link>
</g:each>
</div>
<div class="controls">
<g:link controller="teamservice" action="create" params="['team.id': teamInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'teamservice.label', default: 'a team service')])}</g:link>
</ul>
</div>
</div>
</div>


