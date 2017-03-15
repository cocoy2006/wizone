package com.wicloud.main.java.util;


import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;

public class Crypt {

	private static final String TRANSFORMATION = "DES/ECB/PKCS5Padding";
	private Key key;
	
	public Crypt() {
		try {
			key = this.getPriveKey();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private Key getPriveKey() throws Exception {  
    	String key = "molab~123";
    	DESKeySpec dks = new DESKeySpec(key.getBytes());  
        SecretKeyFactory kf = SecretKeyFactory.getInstance("DES");
        SecretKey sk = kf.generateSecret(dks);
        return sk;
    }
	/**
	 * 加密 */
	public byte[] encrypt(byte[] str) {
		byte[] cipherText = null;
		try {
			Cipher cipher = Cipher.getInstance(TRANSFORMATION);
			cipher.init(Cipher.ENCRYPT_MODE, key);
			cipherText = cipher.doFinal(str);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		}
		return cipherText;
	}
	/**
	 * 解密 */
	public byte[] decrypt(byte[] str) {
		byte[] plainText = null;
		try {
			Cipher cipher = Cipher.getInstance(TRANSFORMATION);
			cipher.init(Cipher.DECRYPT_MODE, key);
			plainText = cipher.doFinal(str);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		}  
		return plainText;
	}
}