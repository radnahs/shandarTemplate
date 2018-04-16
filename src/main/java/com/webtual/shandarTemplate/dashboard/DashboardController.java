/**
 * <p>Project: shandarTemplate </p>
 * <p>Package Name: com.webtual.shandarTemplate.dashboard </p>
 * <p>File Name: DashboardController.java</p>
 * <p>Create Date: Nov 12, 2017 </p>
 * <p>Create Time: 12:50:14 PM </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2012</p>
 * <p>Company:  </p>
 * @author Shantanu Sikdar
 * @version 1.0
 */

package com.webtual.shandarTemplate.dashboard;

import static com.webtual.shandarTemplate.misc.ShandarTemplateProperties.BBC_URL;
import static com.webtual.shandarTemplate.misc.ShandarTemplateProperties.TOI_URL;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.webtual.shandarTemplate.misc.ShandarTemplateProperties;
import com.webtual.shandarTemplate.news.RSSFeedData;
import com.webtual.shandarTemplate.news.RssFeedService;
import com.webtual.shandarTemplate.user.UserData;

@Controller
public class DashboardController {
	
	private static final Logger logger = LoggerFactory.getLogger(DashboardController.class);
	
	@RequestMapping( value="Login", method = RequestMethod.POST)
    public ModelAndView login(UserData user, BindingResult result, Map model, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("dashboard/dashboard");
		try {						
			user.setUserDomain(ShandarTemplateProperties.DOMAIN);
			session.setAttribute("user", user);
			
			modelAndView.addObject("messageData", user);
			RssFeedService toiFeedService =new RssFeedService();
			modelAndView.addObject("toiDataList", toiFeedService.topFeed(TOI_URL,5));
			
			RssFeedService bbcFeedService =new RssFeedService();
			modelAndView.addObject("bbcDataList", bbcFeedService.topFeed(BBC_URL,5));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndView;
    }
	
	@RequestMapping( value="TOIFeed")
	public @ResponseBody String showTOIFeed(@RequestParam(value = "titleAsId") String titleString, HttpServletRequest request,HttpSession session) {
		System.out.println("Shandar titleString ="+titleString);
		String retStr="";
		RssFeedService rssFeedService =new RssFeedService();
		List<RSSFeedData> rssFeedDataList =rssFeedService.topFeed(TOI_URL,5);
		for (RSSFeedData rssFeedData : rssFeedDataList) {
			if(rssFeedData.getTitle().equalsIgnoreCase(titleString)){
				retStr=rssFeedData.getNewsDescription();
				break;
			}
		}
		System.out.println("Shandar retStr ="+retStr);
		return retStr;
    }
	
	@RequestMapping( value="BBCFeed")
	public @ResponseBody String showBBCFeed(@RequestParam(value = "titleAsId") String titleString, HttpServletRequest request,HttpSession session) {
		String retStr="";
		RssFeedService rssFeedService =new RssFeedService();
		List<RSSFeedData> rssFeedDataList =rssFeedService.topFeed(BBC_URL,5);
		for (RSSFeedData rssFeedData : rssFeedDataList) {
			if(rssFeedData.getTitle().equalsIgnoreCase(titleString)){
				retStr=rssFeedData.getNewsDescription();
				break;
			}
		}
		System.out.println("Shandar retStr ="+retStr);
		return retStr;
    }
	
}
