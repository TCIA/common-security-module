<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic"
	prefix="logic"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles"
	prefix="tiles"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-template"
	prefix="template"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested"
	prefix="nested"%>

<%@ page import="java.util.*"%>
<%@ page import="gov.nih.nci.security.upt.constants.*"%>
<%@ page import="gov.nih.nci.security.authorization.domainobjects.*"%>
<script>
<!--
   	function setAndSubmit(target)
   	{
  		document.searchResultForm.operation.value=target;
 	}
// -->
</script>

<html:form styleId="searchResultForm"
	action="<%="/UserDBOperation"%>">
	<html:hidden property="operation" value="error" />
	<table summary="" cellpadding="0" cellspacing="0" border="0"
		class="contentPage" width="100%" height="100%">
		<tr>
			<td>
			<h2>User, Protection Group and Roles</h2>
			</td>
		</tr>
		<tr>
			<td valign="top">
			<table cellpadding="0" cellspacing="0" border="0"
				class="contentBegins">
				<tr>
					<td>
					<table summary="" cellpadding="0" cellspacing="0" border="0"
						width="600">
						<tr>
							<td class="dataTablePrimaryLabel" height="20">SEARCH RESULTS</td>
						</tr>
						<!-- paging begins -->
						<logic:present name="<%=DisplayConstants.AVAILABLE_PROTECTIONGROUPROLECONTEXT_SET%>">
							<bean:define id="oddRow" value="true" />
							<!-- paging ends -->
							<tr>
								<td>
								<table summary="Enter summary of data here" cellpadding="3"
									cellspacing="0" border="0" class="dataTable" width="100%">
									<tr>
										<th class="dataTableHeader" scope="col" align="center"
											width="10%">Select</th>
										<th class="dataTableHeader" scope="col" align="center"
											width="45%">Associated Protection Group Name</th>
										<th class="dataTableHeader" scope="col" align="center"
											width="45%">Associated Role Name</th>
									</tr>
									<logic:iterate name="<%=DisplayConstants.AVAILABLE_PROTECTIONGROUPROLECONTEXT_SET%>" id="protectionGroupRoleContext" type="ProtectionGroupRoleContext">
										<bean:define name="protectionGroupRoleContext" property="protectionGroup" id="protectionGroup" type="ProtectionGroup"/>
										<bean:define name="protectionGroupRoleContext" property="roles" id="roles" type="Set" />
										<%if (oddRow.equals("true")) { oddRow ="false";%>
											<tr class="dataRowLight">
												<td class="dataCellNumerical" width="10%"><html:radio
													style="formFieldSized" property="protectionGroupAssociatedId" value="<bean:write name='protectionGroup' property='protectionGroupId' />"/></td>
												<td class="dataCellText" width="45%"><bean:write
													name="protectionGroup" property="protectionGroupName" /></td>
												<td class="dataCellText" width="45%">
												<logic:iterate name="roles" id="role" type="Role">
													<bean:write	name="role" property="name" />&nbsp;
												</logic:iterate>
												</td>
											</tr>
										<%}else{ oddRow = "true";%>
											<tr class="dataRowDark">
												<td class="dataCellNumerical" width="10%"><html:radio
													style="formFieldSized" property="protectionGroupAssociatedId"
													value="<bean:write name='protectionGroup' property='protectionGroupId' />" /></td>
												<td class="dataCellText" width="45%"><bean:write
													name="protectionGroup" property="protectionGroupName" /></td>
												<td class="dataCellText" width="45%">
												<logic:iterate name="roles" id="role" type="Role">
													<bean:write	name="role" property="name" />&nbsp;
												</logic:iterate>
												</td>
											</tr>
										<%}%>
									</logic:iterate>
								</table>
								</td>
							</tr>
							<tr>
								<td align="right" class="actionSection"><!-- action buttons begins -->
								<table cellpadding="4" cellspacing="0" border="0">
									<tr>
										<td><html:submit style="actionButton"
											onclick="setAndSubmit('read');">Back</html:submit></td>
										<td><html:submit style="actionButton"
											onclick="setAndSubmit('removeProtectionGroupAssociation');">Update Role Association</html:submit></td>											
										<td><html:submit style="actionButton"
											onclick="setAndSubmit('loadRoleAssociation');">Update Role Association</html:submit></td>
									</tr>
								</table>
								<!-- action buttons end --></td>
							</tr>
						</logic:present>
					</table>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
</html:form>