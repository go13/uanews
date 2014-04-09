package com.uanews.controller;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uanews.NewsPost;
import com.uanews.dao.NewsPostDao;
 
@Controller
public class IndexController {
		
	@Autowired
	private NewsPostDao newsPostDao;
 
	@RequestMapping(value = {"/index.html"}, method = RequestMethod.GET)
	public String index(ModelMap model) {
		List<NewsPost> list = newsPostDao.getPostList();
		model.addAttribute("postList", list);		
		return "index";
	}
	
	@RequestMapping(value = {"/like/{id}.do"}, method = RequestMethod.POST, headers = "Accept=application/json")
	@ResponseBody
	public String like(@PathVariable Integer id) { 
		return id != null ? Boolean.toString(newsPostDao.likePost(id)) : Boolean.FALSE.toString();	
	}

	public NewsPostDao getNewsPostDao() {
		return newsPostDao;
	}

	public void setNewsPostDao(NewsPostDao postListDao) {
		this.newsPostDao = postListDao;
	}
 
}