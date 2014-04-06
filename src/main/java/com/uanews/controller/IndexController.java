package com.uanews.controller;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uanews.NewsLink;
import com.uanews.dao.LinkListDao;
 
@Controller
@RequestMapping("/index")
public class IndexController {
		
	@Autowired
	private LinkListDao linkListDao;
 
	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		List<NewsLink> list = linkListDao.getLinkList();
		model.addAttribute("linkList", list);		
		return "index";
 
	}

	public LinkListDao getLinkedListDao() {
		return linkListDao;
	}

	public void setLinkedListDao(LinkListDao linkedListDao) {
		this.linkListDao = linkedListDao;
	}
 
}