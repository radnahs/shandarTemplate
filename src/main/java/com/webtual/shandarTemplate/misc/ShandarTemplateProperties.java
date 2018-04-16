package com.webtual.shandarTemplate.misc;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.logging.Logger;

/**
 * @author Shantanu Sikdar
 *
 */
public class ShandarTemplateProperties {
	private static Logger logger = Logger.getLogger(ShandarTemplateProperties.class.getName());
	private static Properties properties = new Properties();
	private static InputStream in = ShandarTemplateProperties.class.getResourceAsStream("/ShandarTemplate.properties");

	static {
		try {
			properties.load(in);
			in.close();
		} catch (IOException e) {
		} finally {
		}
	}

	public static String DOMAIN = properties.getProperty("shandarTemplate.domain");
	public static String USERNAME = properties.getProperty("shandarTemplate.username");
	public static String PASSWORD = properties.getProperty("shandarTemplate.password");

	public static String TOI_URL = properties.getProperty("toi.URL");
	public static String BBC_URL = properties.getProperty("bbc.URL");
	
	public static void main(String[] args) {
		System.out.println(ShandarTemplateProperties.USERNAME);
		System.out.println(ShandarTemplateProperties.PASSWORD);
	}
}
