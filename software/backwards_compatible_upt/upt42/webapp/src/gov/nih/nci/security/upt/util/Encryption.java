package gov.nih.nci.security.upt.util;

import gov.nih.nci.security.util.StringEncrypter.EncryptionException;

public interface Encryption {

	public abstract String encrypt(String unencryptedString)
			throws EncryptionException;

	public abstract String decrypt(String encryptedString)
			throws EncryptionException;

}