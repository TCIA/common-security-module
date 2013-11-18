<%--L
   Copyright Ekagra Software Technologies Ltd.
   Copyright SAIC, SAIC-Frederick

   Distributed under the OSI-approved BSD 3-Clause License.
   See http://ncip.github.com/common-security-module/LICENSE.txt for details.
L--%>

<%@ taglib uri="/struts-tags" prefix="s" %>

<%@ taglib uri="/WEB-INF/Owasp.CsrfGuard.tld" prefix="csrf" %>
<%@ page import="java.util.*"%>
<%@ page import="gov.nih.nci.security.upt.constants.*"%>
<%@ page import="gov.nih.nci.security.authorization.domainobjects.*"%>
<script>
<!--
   	function setAndSubmit(target)
   	{
  		document.UserForm.operation.value=target;
  		document.UserForm.submit();
 	}
 	
function skipNavigation()
{
	document.getElementById("userPEAssoc").focus();
	window.location.hash="userPEAssoc";
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


	<table cellpadding="0" cellspacing="0" border="0"
		class="contentPage" width="100%" height="100%">
		
	<s:form name="UserForm" action="UserDBOperation" theme="simple">
	<s:set var="userForm" value="#session.CURRENT_FORM"/>
	<s:hidden name="operation" value="read" />
	<s:set var="userId" value="#userForm.getUserId()"/>
	<s:hidden name="userForm.userId" value="%{userId}"/>
	<input type="hidden" name="<csrf:token-name/>" value="<csrf:token-value uri='/UserDBOperation'/>"/>		
		<tr>
			<td>
			<h2><a id="userPEAssoc"></a>User, Protection Element and Privileges</h2>
			</td>
		</tr>
		<tr>
			<td valign="top" width="100%">
			<table cellpadding="0" cellspacing="0" border="0"
				width="100%" class="contentBegins">
				
				<s:if test='#userForm.userLoginName != ""'>
				<tr>
					<td>
						<table cellpadding="3" cellspacing="0" border="0" width="90%" align="center">
							<tr>
								<td class="formTitle" height="20" colspan="2">SELECTED USER</td>
							</tr>
							<tr class="dataRowDark">
								<td class="formRequiredLabel" width="40%" scope="row"><label for="userLoginName">User Login Name</label></td>
								<td class="formField" width="60%"><s:property value="#userForm.userLoginName"/></td>
							</tr>
						</table>
					</td>
				</tr>
				</s:if>
				<tr>
					<td>
					<table cellpadding="0" cellspacing="0" border="0"
						width="100%">
						<tr>
							<td class="errorMessage" colspan="3">
								<s:if test="hasActionErrors()">
								      <s:actionerror/>
								</s:if>
							</td>
						</tr>
						<tr><td><br></td></tr>
						<tr>
							<td class="formMessage" colspan="3">This report lists the <b>Protection Elements</b> to which the <b>User</b>
							 has access	and his/her associated <b>Privileges</b>.</td>
						</tr>
						<tr>
							<td class="dataTablePrimaryLabel" height="20">SEARCH RESULTS</td>
						</tr>
						<!-- paging begins -->
						<s:set var="oddRow" value="true"/>

						<s:if test="#session.AVAILABLE_PROTECTIONELEMENTPRIVILEGESCONTEXT_SET != null">
							<!-- paging ends -->
							<tr>
								<td>
								<table summary="Associate Protection element, user, role" cellpadding="3"
									cellspacing="0" border="0" class="dataTable" width="100%">
									<tr>
										<th class="dataTableHeader" scope="col" align="center"
											width="20%">Protection Element Name</th>
											
										<th class="dataTableHeader" scope="col" align="center"
											width="20%">Object ID</th>
											
										<th class="dataTableHeader" scope="col" align="center"
											width="20%">Attribute</th>
										
										<th class="dataTableHeader" scope="col" align="center"
											width="40%">Associated Privileges</th>
									</tr>
									<s:iterator value="#session.AVAILABLE_PROTECTIONELEMENTPRIVILEGESCONTEXT_SET" var="protectionElementPrivilegeContext">
										<s:set var="protectionElement" value="#protectionElementPrivilegeContext.getProtectionElement()"/>
										<s:if test='oddRow.equals("true")'>
										<s:set var="oddRow" value="false"/>
											<tr class="dataRowLight">
										</s:if>
										<s:else>
											<s:set var="oddRow" value="true"/>
											<tr class="dataRowDark">
										</s:else>
												<td class="dataCellText" width="20%">
												<s:property value="#protectionElement.protectionElementName"/>
												</td>
												
												<td class="dataCellText" width="20%">
												<s:property value="#protectionElement.objectId"/>
												</td>
												
												<td class="dataCellText" width="20%">
												<s:property value="#protectionElement.attribute"/>
												</td>												
												
												
												<td class="dataCellText" width="40%">
												<s:iterator value="#protectionElementPrivilegeContext.privileges" var="privilege">
													<s:property value="#privilege.name"/>&nbsp;
												</s:iterator>
												</td>
											</tr>
									</s:iterator>
								</table>
								</td>
							</tr>
							<tr>
								<td align="right" class="actionSection"><!-- action buttons begins -->
								<table cellpadding="4" cellspacing="0" border="0">
									<tr>
										<td><s:submit style="actionButton"
											onclick="setAndSubmit('read');" value="Back"/></td>
									</tr>
								</table>
								<!-- action buttons end --></td>
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
