<%@ page import="hss.service.catalog.Servicecategory" %>



<div class="fieldcontain ${hasErrors(bean: servicecategoryInstance, field: 'categoryname', 'error')} required">
	<label for="categoryname">
		<g:message code="servicecategory.categoryname.label" default="Categoryname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="categoryname" maxlength="100" required="" value="${servicecategoryInstance?.categoryname}"/>
</div>


