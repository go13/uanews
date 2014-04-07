package com.uanews.controller;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
	public String submitPost(ModelMap model) {
		NewsPost newsPost = new NewsPost();
		newsPostDao.addNewPost(newsPost);
		return "submit"; 
	}

	public NewsPostDao getNewsPostDao() {
		return newsPostDao;
	}

	public void setNewsPostDao(NewsPostDao postListDao) {
		this.newsPostDao = postListDao;
	}
 
}