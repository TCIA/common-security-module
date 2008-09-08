package gov.nih.nci.security.cgmm.webapp.action;

import gov.nih.nci.security.cgmm.util.CGMMProperties;
import gov.nih.nci.security.cgmm.util.StringUtils;
import gov.nih.nci.security.cgmm.webapp.DisplayConstants;
import gov.nih.nci.security.cgmm.webapp.ForwardConstants;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class NewCsmUserAction extends Action
{

	/**
	 * Method execute
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
	{
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		
		String loginWorkflow = null;
		loginWorkflow = (String) session.getAttribute(DisplayConstants.LOGIN_WORKFLOW);
		if(session.isNew() || StringUtils.isBlankOrNull(loginWorkflow)){
			// No Workflow selected.
			return mapping.findForward(ForwardConstants.FORWARD_HOME);
		}
				
	
		if(!StringUtils.isBlankOrNull(loginWorkflow) && DisplayConstants.GRID_WORKFLOW.equalsIgnoreCase(loginWorkflow)){
			// GRID Workflow.  
			// 1. Verify Grid Proxy and other information is available in request object.
			request.setAttribute(DisplayConstants.CGMM_EMAIL_ID, session.getAttribute(DisplayConstants.CGMM_EMAIL_ID));
			request.setAttribute(DisplayConstants.CGMM_FIRST_NAME, session.getAttribute(DisplayConstants.CGMM_FIRST_NAME));
			request.setAttribute(DisplayConstants.CGMM_LAST_NAME, session.getAttribute(DisplayConstants.CGMM_LAST_NAME));
			request.setAttribute(DisplayConstants.GRID_PROXY,session.getAttribute(DisplayConstants.GRID_PROXY));
			
			
			// 2.Forward to host applications new csm user creation workflow URL
			
			
			//Get the URL for Host applications New CSM User Creation workflow page.
			String hostAppNewCSMUserPageURL = null;			
			hostAppNewCSMUserPageURL = CGMMProperties.getHostApplicationInformation().getHostNewLocalUserCreationURL();
			String hostAppContextName = CGMMProperties.getHostApplicationInformation().getHostContextName();
			
			if(StringUtils.isBlankOrNull(hostAppContextName) || StringUtils.isBlankOrNull(hostAppNewCSMUserPageURL)){
				errors.add(ActionErrors.GLOBAL_ERROR, new ActionError(DisplayConstants.ERROR_ID, DisplayConstants.EXCEPTION_CGMM_CONFIGURATION_DETAILS_HOST_INFO));
				saveErrors( request,errors );
			}else{
				ServletContext sc = this.getServlet().getServletConfig().getServletContext().getContext("/"+hostAppContextName);
				RequestDispatcher rd = sc.getRequestDispatcher(hostAppNewCSMUserPageURL);
				try {
					rd.forward(request, response);
				} catch (ServletException e) {
					errors.add(ActionErrors.GLOBAL_ERROR, new ActionError(DisplayConstants.ERROR_ID, e.getMessage()));			
					saveErrors( request,errors );
				} catch (IOException e) {
					errors.add(ActionErrors.GLOBAL_ERROR, new ActionError(DisplayConstants.ERROR_ID, e.getMessage()));			
					saveErrors( request,errors );
				}
			}
		}

		return mapping.findForward(ForwardConstants.FORWARD_CSM_LOGIN);

	}

	

	
}
