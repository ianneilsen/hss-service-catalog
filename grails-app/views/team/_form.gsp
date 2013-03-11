<%@ page import="hss.service.catalog.Team" %>

<!--name-->
<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'teamname', 'error')} required">
	<label class="control-label" for="teamname">
		<g:message code="team.teamname.label" default="Team Name" />
		<span class="required-indicator">*</span>
	</label>
    <div class="controls"><g:textField autofocus="true"  style="width: 400px;" name="teamname" required="" value="${teamInstance?.teamname}"/>
    <p class="help-block">Your internal OrgChart group name</p> </div>
</div>
</div>
 <!--division -->
<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'teamdivision', 'error')} required">
	<label class="control-label" for="teamdivision">
		<g:message code="team.teamdivision.label" default="Team Division" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls"> <g:textField style="width: 400px;" name="teamdivision" required="" value="${teamInstance?.teamdivision}"/>
    <p class="help-block">Your internal OrgChart parent group - i.e. HSS</p> </div>
</div>
</div>
<div class="control-group">
    <div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'teamcontact', 'error')} required">
        <label class="control-label" for="teamcontact">
            <g:message code="team.teamcontact.label" default="Team Contact" />
            <span class="required-indicator">*</span>
        </label>
        <div class="controls"><g:textField style="width: 200px;" name="teamcontact" required="" value="${teamInstance?.teamcontact}"/>
            <p class="help-block">The team managers name</p> </div>
    </div>
</div>
<div class="control-group">
    <div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'teammembers', 'error')}">
        <label class="control-label" for="teammembers">
            <g:message code="team.teammembers.label" default="Team Members" />
            </label>
        <div class="controls"><g:textField style="width: 400px;" name="teammembers" value="${teamInstance?.teammembers}"/>
            <p class="help-block">Link to OrgChart to display team members.</p> </div>
    </div>
</div>
<!-- services -->
%{--<div class="control-group">
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
            </ul>
        </div>
    </div>
</div>--}%


