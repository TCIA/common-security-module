package gov.nih.nci.security.cgmm.exceptions;

public class CGMMConfigurationException extends CGMMException {
	/**
	 * Default serial id
	 */
	private static final long serialVersionUID = 1L;

	public CGMMConfigurationException(String message)
	{
		super(message);
	}
	
	public CGMMConfigurationException(String message, Exception exception)
	{
		super (message, exception);
	}
}
