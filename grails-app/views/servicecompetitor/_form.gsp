<%@ page import="hss.service.catalog.Servicecompetitor" %>



<div class="fieldcontain ${hasErrors(bean: servicecompetitorInstance, field: 'competitorname', 'error')} required">
	<label for="competitorname">
		<g:message code="servicecompetitor.competitorname.label" default="Competitor name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="competitorname" required="" value="${servicecompetitorInstance?.competitorname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: servicecompetitorInstance, field: 'competitorservice', 'error')} ">
	<label for="competitorservice">
		<g:message code="servicecompetitor.competitorservice.label" default="Competitor service" />
		
	</label>
	<g:textField name="competitorservice" value="${servicecompetitorInstance?.competitorservice}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: servicecompetitorInstance, field: 'competitordescription', 'error')} ">
	<label for="competitordescription">
		<g:message code="servicecompetitor.competitordescription.label" default="Competitor description" />
		
	</label>
	<g:textArea name="competitordescription" cols="40" rows="5" maxlength="1000" value="${servicecompetitorInstance?.competitordescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: servicecompetitorInstance, field: 'compservicedifference', 'error')} ">
	<label for="compservicedifference">
		<g:message code="servicecompetitor.compservicedifference.label" default="Compservice difference" />
		
	</label>
	<g:textArea name="compservicedifference" cols="40" rows="5" maxlength="1000" value="${servicecompetitorInstance?.compservicedifference}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: servicecompetitorInstance, field: 'whousescompservice', 'error')} ">
	<label for="whousescompservice">
		<g:message code="servicecompetitor.whousescompservice.label" default="Who uses competitor service" />
		
	</label>
	<g:textArea name="whousescompservice" cols="40" rows="5" maxlength="1000" value="${servicecompetitorInstance?.whousescompservice}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: servicecompetitorInstance, field: 'competitorsmotivation', 'error')} ">
	<label for="competitorsmotivation">
		<g:message code="servicecompetitor.competitorsmotivation.label" default="Competitors motivation" />
		
	</label>
	<g:textArea name="competitorsmotivation" cols="40" rows="5" maxlength="1000" value="${servicecompetitorInstance?.competitorsmotivation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: servicecompetitorInstance, field: 'competitorvalue', 'error')} ">
	<label for="competitorvalue">
		<g:message code="servicecompetitor.competitorvalue.label" default="Competitor value" />
		
	</label>
	<g:textArea name="competitorvalue" cols="40" rows="5" maxlength="1000" value="${servicecompetitorInstance?.competitorvalue}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: servicecompetitorInstance, field: 'teamservices', 'error')} required">
	<label for="teamservices">
		<g:message code="servicecompetitor.teamservices.label" default="Team service" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="teamservices" name="teamservices.id" from="${hss.service.catalog.Teamservice.list()}" optionKey="id" required="" value="${servicecompetitorInstance?.teamservices?.id}" class="many-to-one"/>
</div>

