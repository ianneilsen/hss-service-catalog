<%@ page import="hss.service.catalog.Servicelevel" %>


<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'slaname', 'error')} ">
    <label class="control-label" for="slaname">
        <g:message code="servicelevel.slaname.label" default="SLA Name" />

    </label>
    <div class="controls"> <g:textField autofocus="true" style="width: 270px;" name="slaname" value="${servicelevelInstance?.slaname}"/></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'slatype', 'error')} ">
    <label class="control-label" for="slatype">
        <g:message code="servicelevel.slatype.label" default="Type of SLA" />

    </label>
    <div class="controls"><g:textField name="slatype" value="${servicelevelInstance?.slatype}"/>
    <p class="help-block">Is this service a premium or standard service? Give it a type</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'businesshours', 'error')} ">
	<label class="control-label" for="businesshours">
		<g:message code="servicelevel.businesshours.label" default="Business hours of service" />
		
	</label>
    <div class="controls"><g:textField name="businesshours" value="${servicelevelInstance?.businesshours}"/></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'servicehours', 'error')} ">
    <label class="control-label" for="servicehours">
        <g:message code="servicelevel.servicehours.label" default="Hours that service is available?" />

    </label>
    <div class="controls"><g:textField name="servicehours" value="${servicelevelInstance?.servicehours}"/></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'frequencyservice', 'error')} ">
	<label class="control-label" for="frequencyservice">
		<g:message code="servicelevel.frequencyservice.label" default="Frequency service" />
		
	</label>
    <div class="controls"><g:textField name="frequencyservice" value="${servicelevelInstance?.frequencyservice}"/>
    <p class="help-block">How often can a user request the service?</p> </div>
</div>
</div>

 <div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'implementrequire', 'error')} ">
	<label class="control-label" for="implementrequire">
		<g:message code="servicelevel.implementrequire.label" default="Is implementation required?" />
		
	</label>
    <div class="controls"><g:textArea style="width: 400px;" cols="40" rows="5" maxlength="1000" name="implementrequire" value="${servicelevelInstance?.implementrequire}"/>
    <p class="help-block">Are special inplementation plans needed?</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'offpeakusers', 'error')} ">
	<label class="control-label" for="offpeakusers">
		<g:message code="servicelevel.offpeakusers.label" default="Off peak users times" />
		
	</label>
    <div class="controls"><g:textField name="offpeakusers" value="${servicelevelInstance?.offpeakusers}"/>
    <p class="help-block">What are the off-peak times for this service if applicable?</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'peakusage', 'error')} ">
	<label class="control-label" for="peakusage">
		<g:message code="servicelevel.peakusage.label" default="Peak usage is" />
		
	</label>
    <div class="controls"><g:textField name="peakusage" value="${servicelevelInstance?.peakusage}"/>
        <p class="help-block">What are the peak times for this service if applicable?</p>
        <p class="help-block">This can be hours or periods of the year</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'peakusers', 'error')} ">
	<label class="control-label" for="peakusers">
		<g:message code="servicelevel.peakusers.label" default="Peak number of users are?" />
		
	</label>
    <div class="controls"><g:textField name="peakusers" value="${servicelevelInstance?.peakusers}"/>
        <p class="help-block">What are the approx number users of this service?</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'responsetime', 'error')} ">
	<label class="control-label" for="responsetime">
		<g:message code="servicelevel.responsetime.label" default="Response time by service provider will be" />
		
	</label>
    <div class="controls"><g:textField name="responsetime" value="${servicelevelInstance?.responsetime}"/>
        <p class="help-block">Average response times for this service in hours or minutes</p></div>
</div>
</div>



<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'servicelifetime', 'error')} ">
	<label class="control-label" for="servicelifetime">
		<g:message code="servicelevel.servicelifetime.label" default="Service lifetime is?" />
		
	</label>
    <div class="controls"><g:textField name="servicelifetime" value="${servicelevelInstance?.servicelifetime}"/>
        <p class="help-block">The service lives for a period of how many hours or months?</p></div>
</div>
</div>


<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'slareview', 'error')} ">
	<label class="control-label" for="slareview">
		<g:message code="servicelevel.slareview.label" default="Service SLA is reviewed every period" />
		
	</label>
    <div class="controls"><g:textField name="slareview" value="${servicelevelInstance?.slareview}"/>
        <p class="help-block">The SLA is reviewed every, how many months or years?</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'teamservices', 'error')} required">
	<label class="control-label" for="teamservices">
		<g:message code="servicelevel.teamservices.label" default="Belongs to Team service" />
		<span class="required-indicator">*</span>
	</label>
    <div class="controls"><g:select id="teamservices" name="teamservices.id" from="${hss.service.catalog.Teamservice.list()}" optionKey="id" required="" value="${servicelevelInstance?.teamservices?.id}" class="many-to-one"/>  </div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'whatifnoservice', 'error')} ">
	<label class="control-label" for="whatifnoservice">
		<g:message code="servicelevel.whatifnoservice.label" default="If no service provided, then this will happen" />
		
	</label>
    <div class="controls"><g:textArea style="width: 400px;" cols="40" rows="5" maxlength="1000" name="whatifnoservice" value="${servicelevelInstance?.whatifnoservice}"/>
        <p class="help-block">If a service cannot satisfy a user what happens next?</p></div>
</div>
</div>
