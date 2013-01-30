<%@ page import="hss.service.catalog.Serviceuser" %>


<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: serviceuserInstance, field: 'users', 'error')} required">
	<label class="control-label" for="users">
		<g:message code="serviceuser.users.label" default="Users" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls"> <g:field type="text" autofocus="true" style="width: 400px;" name="users" required="" value="${serviceuserInstance?.users}"/>
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
	<div class="controls"><g:textArea style="width: 400px;" name="howtheyuse" cols="40" rows="5" maxlength="1000" required="" value="${serviceuserInstance?.howtheyuse}"/>
    </div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: serviceuserInstance, field: 'motivation', 'error')} required">
	<label class="control-label" for="motivation">
		<g:message code="serviceuser.motivation.label" default="Motivation" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls"><g:textArea style="width: 400px;" name="motivation" cols="40" rows="5" maxlength="1000" required="" value="${serviceuserInstance?.motivation}"/>     </div>

</div>
</div>

<div class="control-group">
    <div class="fieldcontain ${hasErrors(bean: serviceuserInstance, field: 'estimatedusers', 'error')} required">
        <label class="control-label" for="estimatedusers">
            <g:message code="serviceuser.estimatedusers.label" default="Approximate total number of users" />
            <span class="required-indicator">*</span>
        </label>
        <div class="controls"><g:field type="number" style="width: 100px;" name="estimatedusers" required="" value="${serviceuserInstance?.estimatedusers}"/></div>
    </div>

</div>

<div class="control-group">
    <div class="fieldcontain ${hasErrors(bean: serviceuserInstance, field: 'peakusetimes', 'error')} required">
        <label class="control-label" for="peakusetimes">
            <g:message code="serviceuser.peakusetimes.label" default="Peak use times" />
            <span class="required-indicator">*</span>
        </label>
        <div class="controls"><g:textArea style="width: 400px;" name="peakusetimes" required="" value="${serviceuserInstance?.peakusetimes}"/></div>
    </div>

</div>

<div class="control-group">
    <div class="fieldcontain ${hasErrors(bean: serviceuserInstance, field: 'frequencyofserviceoffering', 'error')} required">
        <label class="control-label" for="frequencyofserviceoffering">
            <g:message code="serviceuser.frequencyofserviceoffering.label" default="How frequently is service used?" />
            <span class="required-indicator">*</span>
        </label>
        <div class="controls"><g:textArea style="width: 400px;" name="frequencyofserviceoffering" required="" value="${serviceuserInstance?.frequencyofserviceoffering}"/>
        <p class="help-block">How often does the users consume the service, i.e. 10 times a year, 20 hours a year</p></div>
    </div>

</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: serviceuserInstance, field: 'teamservices', 'error')} required">
	<label class="control-label" for="teamservices">
		<g:message code="serviceuser.teamservices.label" default="Service used by this user" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls"> <g:select id="teamservices" name="teamservices.id" from="${hss.service.catalog.Teamservice.list()}" optionKey="id" required="" value="${serviceuserInstance?.teamservices?.id}" class="many-to-one"/> </div>
</div>

