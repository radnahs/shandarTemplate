/**
 * <p>Project: shandarTemplate </p>
 * <p>Package Name: com.webtual.shandarTemplate.misc </p>
 * <p>File Name: CommonUtilss.java</p>
 * <p>Create Date: Nov 13, 2017 </p>
 * <p>Create Time: 12:50:14 PM </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2012</p>
 * <p>Company:  </p>
 * @author Shantanu Sikdar
 * @version 1.0
 */

package com.webtual.shandarTemplate.misc;

/**
 * @author Shantanu Sikdar 
 *
 */
public class CommonUtils {
	
	public static boolean isBlankOrNull(String toBeChecked){
		return toBeChecked!=null?"".equals(toBeChecked.trim()):true;
	}
	
	public static String trimTextFromEnd(String strToBeTrimmed, int trimToWhatLength){
		return (strToBeTrimmed!=null && strToBeTrimmed.length()>trimToWhatLength)?(strToBeTrimmed.substring(0, trimToWhatLength)+".."):"";
	}
	
	
	public static String trimTextLength2(String strToBeTrimmed, int trimToWhatLength){
		return (strToBeTrimmed!=null && strToBeTrimmed.length()>trimToWhatLength)?("\""+strToBeTrimmed.substring(0, trimToWhatLength)+"\"  "):"";
	}
	
	
	public static String encryptPassword(String passwd){
		StringBuilder stbldr =  new StringBuilder(passwd);
		//do not use base64
		return stbldr.reverse().toString(); 
	}
	
	public static String decryptPassword(String passwd){
		StringBuilder stbldr =  new StringBuilder(passwd);
		return stbldr.reverse().toString(); 
	}
	
	public static void main(String[] args) {		
		//System.out.println(""+encryptPassword("shantanu"));
		System.out.println(isBlankOrNull(null));
	}
	
}
