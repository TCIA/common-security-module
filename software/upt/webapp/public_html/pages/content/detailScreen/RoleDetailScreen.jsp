<%--L
   Copyright Ekagra Software Technologies Ltd.
   Copyright SAIC, SAIC-Frederick

   Distributed under the OSI-approved BSD 3-Clause License.
   See http://ncip.github.com/common-security-module/LICENSE.txt for details.
L--%>

<%@ taglib uri="/struts-tags" prefix="s" %>

<%@ taglib uri="/WEB-INF/Owasp.CsrfGuard.tld" prefix="csrf" %>
<%@ page import="gov.nih.nci.security.upt.viewobjects.*"%>
<%@ page import="gov.nih.nci.security.upt.constants.*"%>
<%@ page import="gov.nih.nci.security.upt.forms.*"%>
<%@ page import="gov.nih.nci.security.constants.Constants"%>
<script>
<!--
   	function setAndSubmit(target)
   	{
   		if (target == "delete")
   		{
   			if (confirm("Are you sure you want to delete the record?"))
   			{
   				document.RoleForm.operation.value=target;
				document.RoleForm.submit();
			}
		}
		else
		{
	  		document.RoleForm.operation.value=target;
	  		document.RoleForm.submit();
	  	}
 	}
 	
function skipNavigation()
{
	document.getElementById("roleDetail").focus();
	window.location.hash="roleDetail";
	document.getElementById("ncilink").tabIndex = -1;
	document.getElementById("nihlink").tabIndex = -1;
	document.getElementById("skipmenu").tabIndex = -1;
	
	document.getElementById("homeLink").tabIndex = -1;
	if(document.getElementById("adminhomeLink"))
		document.getElementById("adminhomeLink").tabIndex = -1;
		
	document.getElementById("menuHome").tabIndex = -1;
	document.getElementById("menuUser").tabIndex = -1;
	document.getElementById("menuPE").tabIndex = -1;
	document.getElementById("menuPrivilege").tabIndex = -1;
	document.getElementById("menuGroup").tabIndex = -1;
	document.getElementById("menuPG").tabIndex = -1;
	document.getElementById("menuRole").tabIndex = -1;
	document.getElementById("menuInstance").tabIndex = -1;
	document.getElementById("menulogout").tabIndex = -1;
}
 	
// -->
</script>

<s:set var="submitValue" value="error" />
<s:set var="currentForm" value="#session.CURRENT_FORM"/>
<s:if test='#currentForm.getPrimaryId().equals("")'>
	<s:if test='#session.CURRENT_ACTION.equals("ADD")'>
		<s:set var="submitValue" value="create" />
	</s:if>
	<s:if test='#session.CURRENT_ACTION.equals("SEARCH")'>
		<s:set var="submitValue" value="search" />
	</s:if>
</s:if>
<s:else>
	<s:if test='#session.CURRENT_ACTION.equals("ADD")'>
		<s:set var="submitValue" value="loadAdd" />
	</s:if>
	<s:if test='#session.CURRENT_ACTION.equals("SEARCH")'>
		<s:set var="submitValue" value="loadSearchResult" />
	</s:if>
</s:else>


	<table cellpadding="0" cellspacing="0" border="0" class="contentPage" width="100%" height="100%">
	<s:form name="RoleForm" action="RoleDBOperation" theme="simple">
	<s:hidden name="operation" value="error"/>
	<s:hidden property="userLoginName"/>
	<input type="hidden" name="<csrf:token-name/>" value="<csrf:token-value uri='/RoleDBOperation'/>"/>
			<tr>
			<td valign="top">
			<table cellpadding="0" cellspacing="0" border="0" width="100%" class="contentBegins">
				<tr>
					<td>
					<table summary="Role detail" cellpadding="3" cellspacing="0" border="0" width="100%" align="center">
						<tr>
							<td class="infoMessage" colspan="3">
							<s:if test="hasActionMessages()">
							      <s:actionmessage/>
							</s:if>			  
			  				</td>
						</tr>
						<tr>
							<td class="errorMessage" colspan="3">
							<s:if test="hasActionErrors()">
							      <s:actionerror/>
							</s:if>
							</td>
						</tr>
						<tr>
					<s:if test="#session.CURRENT_FORM != null">
						<s:if test='#currentForm.getPrimaryId().equals("")'>
							<s:if test='#session.CURRENT_ACTION.equals("ADD")'>
								<tr>
									<td class="formMessage" colspan="3"><a id="roleDetail"></a>Enter the details to add a new Role. 
									The <b>Role Name</b> uniquely identifies the Role and is a required field. 
									The <b>Role Description</b> is a brief summary about the Role.</td>
								</tr>
								<tr>
									<td class="formMessage" colspan="3">* indicates a required field</td>
								</tr>
								</s:if>
								<s:if test="#session.CURRENT_ACTION.equals(DisplayConstants.SEARCH)}">
								<tr>
									<td class="formMessage" colspan="3"><a id="roleDetail"></a>Search for an existing Role by entering the <b>Role Name</b>.</td>
								</tr>
								<tr>
									<td class="formMessage" colspan="3">Use * to perform wildcard searches</td>
								</tr>
								</s:if>
							</s:if>
							<s:else>
								<tr>
									<td class="formMessage" colspan="3"><a id="roleDetail"></a>Update the details of the displayed Role. 
									The <b>Role Name</b> uniquely identifies the Role and is a required field. 
									The <b>Role Description</b> is a brief summary about the Role. The <b>Update Date</b> indicates the date when this Role's Details were last updated.</td>
								</tr>							
							</s:else>
						</tr>
						<tr>
							<s:if test='#currentForm.getPrimaryId().equals("")'>
								<s:if test='#session.CURRENT_ACTION.equals("ADD")'>
									<td class="formTitle" height="20" colspan="3">ENTER THE NEW ROLE DETAILS</td>	
								</s:if>
								<s:if test='#session.CURRENT_ACTION.equals("SEARCH")'>
									<td class="formTitle" height="20" colspan="3">ENTER THE ROLE SEARCH CRITERIA</td>
								</s:if>
							</s:if>
							<s:else>
									<td class="formTitle" height="20" colspan="3">ROLE DETAILS</td>
							</s:else>
						</tr>
							<s:if test='#currentForm.getPrimaryId().equals("")'>
								<s:if test='#session.CURRENT_ACTION.equals("SEARCH")'>
									<s:set var="formElements" value="#currentForm.getSearchFormElements()"/>
								</s:if>
								<s:if test='#session.CURRENT_ACTION.equals("ADD")'>
									<s:set var="formElements" value="#currentForm.getAddFormElements()"/>
								</s:if>
							</s:if>
							<s:else>
								<s:set var="formElements" value="#currentForm.getDisplayFormElements()"/>
								<s:set var="roleId" value="#currentForm.getPrimaryId()"/>
								<s:hidden name="roleForm.roleId" value="%{roleId}"/>
								
							</s:else>
							
							<s:iterator value="formElements" var="formElement">
							
								<tr>
									<s:if test='(#formElement.propertyRequired.equals("REQUIRED"))'>
										<td class="formRequiredNotice" width="5">*</td>
										<td class="formRequiredLabel2"><label for="<s:property value="#formElement.propertyName"/>"><s:property value="#formElement.propertyLabel"/></label></td>
									</s:if>
									<s:else>
										<td class="formRequiredNotice" width="5">&nbsp;</td>
										<td class="formLabel"><label for="<s:property value="#formElement.propertyName"/>"><s:property value="#formElement.propertyLabel"/></label></td>
									</s:else>
									<s:if test='(#formElement.propertyType.equals("INPUT_BOX"))'>
										<td class="formField"><s:textfield style="formFieldSized" size="30" maxlength="100" name="roleForm.%{propertyName}" value="%{propertyValue}" disabled="%{propertyDisabled}"/></td>
									</s:if>
									<s:if test='(#formElement.propertyType.equals("PASSWORD"))'>
										<td class="formField"><s:password style="formFieldSized" size="30" maxlength="100" name="roleForm.%{propertyName}" value="%{propertyValue}" disabled="%{propertyDisabled}" showPassword="true"/></td>
									</s:if>
									<s:if test='(#formElement.propertyType.equals("INPUT_DATE"))'>
										<td class="formField">
										<s:if test='(#formElement.propertyReadonly.equals(DisplayConstants.READONLY))'>
											<label for="<s:property value="#formElement.propertyName"/>"><s:property value="#formElement.propertyValue"/>(MM/DD/YYYY)</label>
										</s:if>
										<s:else>
											<s:if test='#formElement.propertyDisabled'>
												<label for="<s:property value="#formElement.propertyName"/>"><s:property value="#formElement.propertyLabel"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(MM/DD/YYYY)</label>
											</s:if>
											<s:else>
											<s:textfield size="10" maxlength="10"  name="roleForm.%{propertyName}" value="%{propertyValue}" disabled="%{propertyDisabled}"/>  (MM/DD/YYYY)
											</s:else>										
										</s:else>
										</td>
									</s:if>
									<s:if test='(#formElement.propertyType.equals("INPUT_TEXTAREA"))'>
										<td class="formField"><s:textarea style="formFieldSized" cols="32" rows="2" name="roleForm.%{propertyName}" value="%{propertyValue}" disabled="%{propertyDisabled}" /></td>
									</s:if>
									<s:if test='(#formElement.propertyType.equals("INPUT_RADIO"))'>
										<td class="formField"><s:radio name="roleForm.%{propertyName}" list="#{'YES':'Yes','NO':'No'}" value="%{propertyValue}" /></td>
									</s:if>
								</tr>
							</s:iterator>
						<tr>
							<td align="right" colspan="3"><!-- action buttons begins -->
							<table cellpadding="4" cellspacing="0" border="0">
								<tr>
									<s:if test='#currentForm.getPrimaryId().equals("")'>
										<s:if test='#session.CURRENT_ACTION.equals("ADD")'>
											<td><s:submit style="actionButton" onclick="setAndSubmit('create');" value="Add"/></td>
										</s:if>
										<s:if test='#session.CURRENT_ACTION.equals("SEARCH")'>
											<td><s:submit style="actionButton" onclick="setAndSubmit('search');" value="Search"/></td>
										</s:if>
										<td><s:reset style="actionButton" value="Reset"/></td>
										<td><s:submit style="actionButton" onclick="setAndSubmit('loadHome');" value="Back"/></td>
									</s:if>
									<s:else>
										<s:if test='#session.UPDATE_UPT_ROLE_OPERATION != null'>
											<td><s:submit style="actionButton" onclick="setAndSubmit('update');" value="Update"/></td>
										</s:if>
										<s:else>
											<td><s:submit disabled="true" value="Update"/></td>
										</s:else>
										<s:if test='#session.DELETE_UPT_ROLE_OPERATION != null'>
											<td><s:submit class="actionButton" onclick="setAndSubmit('delete');" value="Delete"/></td>
										</s:if>
										<s:else>
											<td><s:submit disabled="true" value="Delete"/></td>
										</s:else>
										<td><s:submit style="actionButton" onclick="setAndSubmit('loadAssociation');" value="Associated Privileges"/></td>
										<s:if test='#session.CURRENT_ACTION.equals("ADD")'>
											<td><s:submit style="actionButton" onclick="setAndSubmit('loadAdd');" value="Back"/></td>
										</s:if>
										<s:if test='#session.CURRENT_ACTION.equals("SEARCH")'>
											<td><s:submit style="actionButton" onclick="setAndSubmit('loadSearchResult');" value="Back"/></td>
										</s:if>
									</s:else>
								</tr>
							</table>
							</td><!-- action buttons end -->
						</tr>
						</s:if>
					</table>
					</td>
				</tr>
			</table>
			</td>
		</tr>
		</s:form>
	</table>

