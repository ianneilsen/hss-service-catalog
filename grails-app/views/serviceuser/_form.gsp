<%@ page import="hss.service.catalog.Serviceuser" %>


<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: serviceuserInstance, field: 'users', 'error')} required">
	<label class="control-label" for="users">
		<g:message code="serviceuser.users.label" default="Users" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls"> <g:textField name="users" required="" value="${serviceuserInstance?.users}"/>
        <p class="help-block">Name of team or users of your service</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: serviceuserInstance, field: 'role', 'error')} required">
	<label class="control-label" for="role">
		<g:message code="serviceuser.role.label" default="Role" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls"><g:textField name="role" required="" value="${serviceuserInstance?.role}"/>
        <p class="help-block">What is the title or role of the users</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: serviceuserInstance, field: 'howtheyuse', 'error')} required">
	<label class="control-label" for="howtheyuse">
		<g:message code="serviceuser.howtheyuse.label" default="How do they use the service" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls"><g:textArea name="howtheyuse" cols="40" rows="5" maxlength="1000" required="" value="${serviceuserInstance?.howtheyuse}"/>
    </div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: serviceuserInstance, field: 'motivation', 'error')} required">
	<label class="control-label" for="motivation">
		<g:message code="serviceuser.motivation.label" default="Motivation" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls"><g:textArea name="motivation" cols="40" rows="5" maxlength="1000" required="" value="${serviceuserInstance?.motivation}"/>     </div>

</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: serviceuserInstance, field: 'teamservices', 'error')} required">
	<label class="control-label" for="teamservices">
		<g:message code="serviceuser.teamservices.label" default="Team Services" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls"> <g:select id="teamservices" name="teamservices.id" from="${hss.service.catalog.Teamservice.list()}" optionKey="id" required="" value="${serviceuserInstance?.teamservices?.id}" class="many-to-one"/> </div>
</div>

