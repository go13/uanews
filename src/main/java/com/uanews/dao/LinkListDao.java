package com.uanews.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
import com.uanews.NewsLink;

@Repository("linkListDao")
public class LinkListDao {
	
	public LinkListDao(){
		System.out.println("LinkListDao");
	}
	
	public List<NewsLink> getLinkList(){
		List<NewsLink> list = new ArrayList<NewsLink>();
		list.add(new NewsLink());
		list.add(new NewsLink());
		list.add(new NewsLink());
		list.add(new NewsLink());		
		return list;		
	}
}
