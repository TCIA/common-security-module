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
<%@ page import="gov.nih.nci.security.cgmm.webapp.DisplayConstants"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	String serverPath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort();
	String hostURL = serverPath + "/"
			+ session.getAttribute("HOST_APPLICATION_NAME")
			+ session.getAttribute("HOST_APPLICATION_PUBLIC_HOME_PAGE");
%>
<tr>
	<td width="100%" valign="top">
		<!-- target of anchor to skip menus -->
		<a name="content" />
			<table summary="" cellpadding="0" cellspacing="0" border="0"
				width="600" height="100%">
				<!-- banner begins -->
				<tr>
					<td class="bannerHome">
						<img src="images/bannerHome.gif" height="140">
					</td>
				</tr>
				<!-- banner ends -->
				<tr>
					<td height="100%">
						<!-- target of anchor to skip menus -->
						<a name="content" />
							<table summary="" cellpadding="0" cellspacing="0" border="0"
								height="100%">
								<tr>
									<td class="home" width="5%">
										&nbsp;
									</td>
									<td valign="top">
										<table summary="" cellpadding="0" cellspacing="0" border="0"
											height="100">
											<tr>
												<td valign="top">
													<table cellpadding="0" cellspacing="0" border="0"
														class="contentBegins">

														<tr class="home">

															<td class="home" colspan="3">
																<br>
																<h3>
																	CSM to GAARDS Account Migration Module (CGMM)
																</h3>
																This text introduces the purpose of the tool: to migrate
																existing local (CSM) and caGrid accounts so they are
																linked together.
																<br>
																Other important infor goes here as well.
																<br>
																<br>
															</td>
														</tr>
														<tr>
															<td colspan="3" class="txtHighlight">
																<html:errors />
															</td>
														</tr>

														<tr>

															<td class="home" colspan="3" width="90%">
																<table cellpadding="0" cellspacing="0" border="0"
																	class="contentBegins">
																	<tr>
																		<td valign="top">
																			<table summary="" cellpadding="0" cellspacing="0"
																				border="0" width="300" height="100%">

																				<!-- grid login begins -->
																				<html:form styleId="gridLoginForm"
																					action="/GridLogin">
																					<tr>
																						<td valign="top">
																							<table summary="" cellpadding="2" cellspacing="0"
																								border="0" width="100%">
																								<tr>
																									<td align="center" height="20">
																										<h3>
																											Login to / Migrate a Grid Account
																										</h3>
																									</td>
																								</tr>
																								<tr>
																									<td>
																										<table cellpadding="2" cellspacing="0"
																											border="0" width="100%">
																											<%--<tr>
																												<td colspan="2">
																													<html:errors />
																												</td>
																											</tr>
																											--%>
																											<tr>
																												<td class="sidebarLogin" align="right">
																													<label for="loginId">
																														LOGIN ID
																													</label>
																												</td>
																												<td class="formFieldLogin">
																													<html:text style="formField" size="14"
																														property="loginID" value="" />
																												</td>
																											</tr>
																											<tr>
																												<td class="sidebarLogin" align="right">
																													<label for="password">
																														PASSWORD
																													</label>
																												</td>
																												<td class="formFieldLogin">
																													<html:password style="formField" size="14"
																														property="password" value="" />
																												</td>
																											</tr>
																											<bean:define
																												name="<%=DisplayConstants.AUTHENTICATION_SERVICE_MAP%>"
																												id="authenticationServiceMap" />
																											<tr>
																												<td class="sidebarLogin" align="right">
																													<label for="authenticationServiceURL">
																														AUTHENTICATION
																														<br>
																														SOURCE
																													</label>
																												</td>
																												<td class="formFieldLogin">
																													<html:select
																														property="authenticationServiceURL">
																														<html:options
																															collection="authenticationServiceMap"
																															property="value" labelProperty="key" />
																													</html:select>
																												</td>
																											</tr>
																											<tr>
																												<td>
																													&nbsp;
																												</td>
																												<td>
																													<html:submit style="actionButton"
																														value="Login" />
																												</td>
																											</tr>
																										</table>
																									</td>
																								</tr>
																							</table>
																						</td>
																					</tr>
																				</html:form>

																			</table>
																		</td>
																		<td valign="top" width="2%"></td>
																		<td valign="top" align="center">
																			OR
																			<br>
																			<table summary="" cellpadding="0" cellspacing="0"
																				border="1" width="1" height="100">
																				<tr>
																					<td>
																						<!-- Empty spacer to show vertical line -->
																					</td>
																				</tr>
																			</table>
																		</td>
																		<!-- OR Spacers -->
																		<td valign="top" width="2%"></td>
																		<td valign="top">
																			<table summary="" cellpadding="0" cellspacing="0"
																				border="0" width="300" height="100%">

																				<!-- new Grid account creation begins-->

																				<tr>
																					<td valign="top">
																						<table summary="" cellpadding="2" cellspacing="0"
																							border="0" width="100%">
																							<tr>
																								<td align="center" height="20">
																									<h3>
																										Create a new Grid Account
																									</h3>
																								</td>
																							</tr>
																							<tr>
																								<td class="home" colspan="3">
																									Dont have a Grid Account?<br> Click the Create new
																									Grid Account button to proceed.
																									<html:form action="/NewGridUser">
																									<html:submit style="actionButton"
																														value="Create New caGrid Account" />
																										<%--<input class="actionButton" type="submit"
																											value='<bean:message key="label.new_grid_user"/>' />
																									--%></html:form>
																								</td>
																							</tr>
																						</table>
																					</td>
																				</tr>
																			</table>
																		</td>

																	</tr>
																</table>
															</td>

														</tr>
													</table>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
					</td>
				</tr>
			</table>
	</td>
</tr>
