<%@ page import="hss.service.catalog.Teamservice" %>
<%@ page import="hss.service.catalog.Servicecatagory" %>

<div class="formAreaLeft">
<div class="control-group">
  <div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'servicename', 'error')} ">
	<label class="control-label" for="servicename">
		<g:message code="teamservice.servicename.label" default="Service Name" />
		
	</label>
	<div class="controls"> <g:field type="text" autofocus="true" style="width: 400px;" name="servicename" value="${teamserviceInstance?.servicename}"/>
        <p class="help-block">Name of the service</p></div>
  </div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'servicedescription', 'error')} ">
	<label class="control-label" for="servicedescription">
		<g:message code="teamservice.servicedescription.label" default="Service Description" />
		
	</label>
	<div class="controls"> <g:textArea style="width: 400px;" name="servicedescription" cols="40" rows="5" maxlength="1000" value="${teamserviceInstance?.servicedescription}"/>
    <p class="help-block">Description of your service</p> </div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'coreresponsibility', 'error')} ">
	<label class="control-label" for="coreresponsibility">
		<g:message code="teamservice.coreresponsibility.label" default="Core Responsibility" />
		
	</label>
	<div class="controls"> <g:textArea style="width: 400px;" name="coreresponsibility" cols="40" rows="5" maxlength="1000" value="${teamserviceInstance?.coreresponsibility}"/>
    <p class="help-block">Core responsibility from your team compass</p>
        <p class="help-block">see <a href="https://redhat.hua.hrsmart.com/">Red Hat Compass</a> for the teams core responsiblity</p>
        </div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'competencyalignment', 'error')} ">
	<label class="control-label" for="competencyalignment">
		<g:message code="teamservice.competencyalignment.label" default="Competency Alignment" />
		
	</label>
	<div class="controls"> <g:textArea style="width: 400px;" name="competencyalignment" cols="40" rows="5" maxlength="1000" value="${teamserviceInstance?.competencyalignment}"/>
    <p class="help-block">Competency alignment from your team compass</p> </div>
</div>
</div>

    <div class="control-group">
        <div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'servicecontact', 'error')} ">
            <label class="control-label" for="servicecontact">
                <g:message code="teamservice.servicecontact.label" default="Service Contact" />

            </label>
            <div class="controls"> <g:field name="servicecontact" value="${teamserviceInstance?.servicecontact}" type="text"/>
                <p class="help-block">Who is the main contact for this service?</p> </div>
        </div>
    </div>


    <div class="control-group">
        <div class="fieldcontain ${hasErrors(bean: teamserviceInstance.servicecatagory, field: 'catagoryname', 'error')}">
            <label class="control-label" for="catagoryname">
                <g:message code="teamservice.catagoryname.label" default="Service catagory" />

            </label>
        <div class="controls"><g:select name="servicecatagory.id" from="${hss.service.catalog.Servicecatagory.list()}" optionKey="id" require="" value="${teamserviceInstance?.servicecatagory?.id}" class="many-to-one"/></div>
    </div>
    </div>

    <div class="control-group">
        <div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'baselevelservices', 'error')} ">
            <label class="control-label" for="baselevelservices">
                <g:message code="teamservice.baselevelservices.label" default="Base level service" />

            </label>
            <div class="controls"> <g:textArea style="width: 400px;" cols="40" rows="5" name="baselevelservices" value="${teamserviceInstance?.baselevelservices}" type="text"/>
                <p class="help-block">The base level offering by this service?</p> </div>
        </div>
    </div>

    <div class="control-group">
        <div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'notincludeservices', 'error')} ">
            <label class="control-label" for="notincludeservices">
                <g:message code="teamservice.notincludeservices.label" default="Not included     in this service" />

            </label>
            <div class="controls"> <g:textArea style="width: 400px;" cols="40" rows="5" name="notincludeservices" value="${teamserviceInstance?.notincludeservices}" type="text"/>
                <p class="help-block">This service does not include the following</p> </div>
        </div>
    </div>

    <div class="control-group">
        <div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'serviceowner', 'error')} ">
            <label class="control-label" for="serviceowner">
                <g:message code="teamservice.serviceowner.label" default="Key service manager" />

            </label>
            <div class="controls"> <g:field name="serviceowner" value="${teamserviceInstance?.serviceowner}" type="text"/>
                <p class="help-block">The key person who owns this service if applicable</p> </div>
        </div>
    </div>

    <div class="control-group">
        <div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'serviceactive', 'error')} ">
            <label class="control-label" for="serviceactive">
                <g:message code="teamservice.serviceactive.label" default="Is the service active?" />

            </label>
            <div class="controls"><g:select style="width: 200px;" name="serviceactive" from="${teamserviceInstance.constraints.serviceactive.inList}" required="" value="${teamserviceInstance?.serviceactive}" valueMessagePrefix="teamservice.serviceactive"/>
                <p class="help-block">Is the service active?</p> </div>
        </div>
    </div>

    <div class="control-group">
        <div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'servicedocumentation', 'error')} ">
            <label class="control-label" for="servicedocumentation">
                <g:message code="teamservice.servicedocumentation.label" default="Link to service documentation" />

            </label>
            <div class="controls"> <g:field  name="servicedocumentation" value="${teamserviceInstance?.servicedocumentation}" type="url"/>
                <p class="help-block">URL link to service docs</p> </div>
        </div>
    </div>

    <div class="control-group">
        <div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'team', 'error')} required">
            <label class="control-label" for="team">
                <g:message code="teamservice.team.label" default="Team" />
                <span class="required-indicator">*</span>
            </label>
            <div class="controls">
                <g:select style="width: 255px;" readonly="true" id="team" name="team.id" from="${hss.service.catalog.Team.list()}" optionKey="id" required="" value="${teamserviceInstance?.team?.id}" class="many-to-one"/>
            </div>
        </div>
    </div>
</div>
         <!--todo team service is not picking up correctly when a user enters a new service for the team - this needs to show, not be selectable and select the correct service id -->

%{--<div class="formAreaRight">

    <div class="control-group">
        <div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'tools', 'error')} ">
            <label class="control-label" for="tools">
                <g:message code="teamservice.tools.label" default="1. Tools" />

            </label>

            <div class="controls">
                <ul class="one-to-many">
                    <g:each in="${teamserviceInstance?.tools?}" var="t">
                        <li><g:link controller="teamtool" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
                    </g:each>
            </div>
            <div class="controls">

                <li class="add">
                    <g:link controller="teamtool" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'teamtool.label', default: 'Team Tools')])}</g:link>
                </li>
            </ul>
            </div>
        </div>
    </div>

    <div class="control-group">
        <div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'servicesusers', 'error')} ">
            <label class="control-label" for="servicesusers">
                <g:message code="teamservice.servicesusers.label" default="2. Services Users" />

            </label>

            <div class="controls">
                <ul class="one-to-many">
                    <g:each in="${teamserviceInstance?.servicesusers?}" var="s">
                        <li><g:link controller="serviceuser" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                    </g:each>
            </div>
            <div class="controls">
                <li class="add">
                    <g:link controller="serviceuser" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'serviceuser.label', default: 'Service Users')])}</g:link>
                </li>
            </ul>
            </div>
        </div>
    </div>



<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'costs', 'error')} ">
    <label class="control-label" for="costs">
        <g:message code="teamservice.costs.label" default="3. Costs" />

    </label>
    <div class="controls">
    <ul class="one-to-many">
        <g:each in="${teamserviceInstance?.costs?}" var="c">
            <li><g:link controller="costanalysis" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
        </g:each>
    </div>
    <div class="controls">
        <li class="add">
            <g:link controller="costanalysis" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'costanalysis.label', default: 'Cost Analysis')])}</g:link>
        </li>
    </ul>
    </div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'servicebenefits', 'error')} ">
    <label class="control-label" for="servicebenefits">
        <g:message code="teamservice.servicebenefits.label" default="4. Service Benefits" />

    </label>
    <div class="controls">
    <ul class="one-to-many">
        <g:each in="${teamserviceInstance?.servicebenefits?}" var="s">
            <li><g:link controller="servicebenefit" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
        </g:each>
    </div>
    <div class="controls">
        <li class="add">
            <g:link controller="servicebenefit" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'servicebenefit.label', default: 'Service Benefits')])}</g:link>
        </li>
    </ul>
    </div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'competitors', 'error')} ">
	<label class="control-label" for="competitors">
		<g:message code="teamservice.competitors.label" default="5. Competitors" />
	</label>

    <div class="controls">
      <ul class="one-to-many">
        <g:each in="${teamserviceInstance?.competitors?}" var="c">
          <li><g:link controller="servicecompetitor" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
        </g:each>
     </div>
    <div class="controls">
      <li class="add">
        <g:link controller="servicecompetitor" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'servicecompetitor.label', default: 'a service competitor')])}</g:link>
      </li>
    </ul>
    </div>
</div>
</div>--}%
%{--
<div class="control-group">
    <div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'serviceenvironments', 'error')} ">
        <label class="control-label" for="serviceenvironments">
            <g:message code="teamservice.serviceenvironments.label" default="6. Service environments" />
        </label>

        <div class="controls">
            <ul class="one-to-many">
                <g:each in="${teamserviceInstance?.serviceenvironments}" var="c">
                    <li><g:link controller="serviceenvironment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                </g:each>
        </div>
        <div class="controls">
            <li class="add">
                <g:link controller="serviceenvironment" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'serviceenvironment.label', default: 'Service environments')])}</g:link>
            </li>
        </ul>
        </div>
    </div>
</div>--}%


%{--<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'swots', 'error')} ">
	<label class="control-label" for="swots">
		<g:message code="teamservice.swots.label" default="7. Swot" />

	</label>
	<div class="controls">
      <ul class="one-to-many">
        <g:each in="${teamserviceInstance?.swots?}" var="s">
          <li><g:link controller="swot" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
        </g:each>
    </div>
        <div class="controls">
        <li class="add">
            <g:link controller="swot" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'swot.label', default: 'Swot')])}</g:link>
        </li>
       </ul>
    </div>
</div>
</div>
</div>--}%




