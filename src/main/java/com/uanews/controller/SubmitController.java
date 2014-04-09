package com.uanews.controller;
 
import java.util.Date;

import org.apache.commons.validator.UrlValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uanews.NewsPost;
import com.uanews.dao.NewsPostDao;
 
@Controller
@RequestMapping("/submit.html")
public class SubmitController {
		
	@Autowired
	private NewsPostDao newsPostDao;
 
	@RequestMapping(method = RequestMethod.GET)
	public String submitGet(ModelMap model) {		
		return "submit"; 
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String submitPost(@ModelAttribute("newsPost") NewsPost newsPost, ModelMap model) {		
		if(isValidUrl(newsPost.getLink())){
			newsPost.setCreated(new Date());
			newsPostDao.addNewPost(newsPost);
			return "redirect:index.html";
		}else{
			model.addAttribute("validation", "linkError");
			model.addAttribute("newsPost", newsPost);
			return "submit";
		}
		
	}
	
	private boolean isValidUrl(String link){
		String[] schemes = {"http","https"};	
	    UrlValidator urlValidator = new UrlValidator(schemes);
		return urlValidator.isValid(link);
	}

	public NewsPostDao getNewsPostDao() {
		return newsPostDao;
	}

	public void setNewsPostDao(NewsPostDao postListDao) {
		this.newsPostDao = postListDao;
	}
 
}