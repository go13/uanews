package com.uanews.controller;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uanews.NewsPost;
import com.uanews.dao.PostListDao;
 
@Controller
@RequestMapping("/index.html")
public class IndexController {
		
	@Autowired
	private PostListDao postListDao;
 
	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		List<NewsPost> list = postListDao.getPostList();
		model.addAttribute("postList", list);		
		return "index";
 
	}

	public PostListDao getLinkedListDao() {
		return postListDao;
	}

	public void setLinkedListDao(PostListDao postListDao) {
		this.postListDao = postListDao;
	}
 
}