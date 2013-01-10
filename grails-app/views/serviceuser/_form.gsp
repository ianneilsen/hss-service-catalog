<%@ page import="hss.service.catalog.Serviceuser" %>



<div class="fieldcontain ${hasErrors(bean: serviceuserInstance, field: 'users', 'error')} required">
	<label for="users">
		<g:message code="serviceuser.users.label" default="Users" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="users" required="" value="${serviceuserInstance?.users}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: serviceuserInstance, field: 'role', 'error')} required">
	<label for="role">
		<g:message code="serviceuser.role.label" default="Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="role" required="" value="${serviceuserInstance?.role}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: serviceuserInstance, field: 'howtheyuse', 'error')} required">
	<label for="howtheyuse">
		<g:message code="serviceuser.howtheyuse.label" default="How do they use" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="howtheyuse" cols="40" rows="5" maxlength="1000" required="" value="${serviceuserInstance?.howtheyuse}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: serviceuserInstance, field: 'motivation', 'error')} required">
	<label for="motivation">
		<g:message code="serviceuser.motivation.label" default="Motivation" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="motivation" cols="40" rows="5" maxlength="1000" required="" value="${serviceuserInstance?.motivation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: serviceuserInstance, field: 'teamservices', 'error')} required">
	<label for="teamservices">
		<g:message code="serviceuser.teamservices.label" default="Team Services" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="teamservices" name="teamservices.id" from="${hss.service.catalog.Teamservice.list()}" optionKey="id" required="" value="${serviceuserInstance?.teamservices?.id}" class="many-to-one"/>
</div>

