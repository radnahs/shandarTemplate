/**
 * <p>Project: shandarTemplate </p>
 * <p>Package Name: com.webtual.shandarTemplate.news </p>
 * <p>File Name: RssFeedService.java</p>
 * <p>Create Date: Nov 12, 2017 </p>
 * <p>Create Time: 07:50:14 PM </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2012</p>
 * <p>Company:  </p>
 * @author Shantanu Sikdar
 * @version 1.0
 */

package com.webtual.shandarTemplate.news;

import static com.webtual.shandarTemplate.misc.ShandarTemplateProperties.BBC_URL;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.FeedException;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.XmlReader;

public class RssFeedService {

	/**
	 * 
	 * @param strURL
	 * @return
	 */
	private List<RSSFeedData> readFeed(String strURL){
		URL url = null;
		XmlReader reader = null;
		List<RSSFeedData> newsFeedDataList = new ArrayList<>();
		try {
			url = new URL(strURL);
			reader = new XmlReader(url);
			SyndFeed feed = new SyndFeedInput().build(reader);
			System.out.println("Feed Title: " + feed.getAuthor());
			for (Iterator i = feed.getEntries().iterator(); i.hasNext();) {
				SyndEntry entry = (SyndEntry) i.next();
				RSSFeedData newsFeedData= new RSSFeedData();
				newsFeedData.setTitle(entry.getTitle());
				newsFeedData.setLink(entry.getLink());
				newsFeedData.setNewsDescription(entry.getDescription().getValue());
				newsFeedDataList.add(newsFeedData);
			}
		}catch (FeedException | IOException e) {
			e.printStackTrace();
		}finally {
			try{
				if (reader != null)
					reader.close();
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
		return newsFeedDataList;
	}
	
	public List<RSSFeedData> topFeed(String strURL,int noOfTopFeed){
		List<RSSFeedData> newsFeedDataList = readFeed(strURL);
		List<RSSFeedData> newsFeedDataTopList = new ArrayList<>(newsFeedDataList.subList(0, 5));
		return newsFeedDataTopList;
	}
	
	private void display(List<RSSFeedData> newsFeedDataList){
		for(RSSFeedData newsFeedData:newsFeedDataList){
			System.out.println(newsFeedData.getNewsDescription()+"\n\n");
		}
	}

	public static void main(String[] args) throws Exception { 
		RssFeedService rssFeedNews = new RssFeedService();
		
		rssFeedNews.display(rssFeedNews.readFeed(BBC_URL));
		rssFeedNews.display(rssFeedNews.topFeed(BBC_URL,5));
	}

}
