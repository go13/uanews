package com.uanews.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import com.uanews.NewsPost;

@Repository("newsPostDao")
public class NewsPostDao {
	
	public static final String LIST_SQL = "SELECT * FROM POSTS"; 
	
	private JdbcTemplate jdbcTemplate;
    
    @Autowired
    public void init(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }    
	
	public List<NewsPost> getPostList(){
		return jdbcTemplate.query(LIST_SQL, new Object[]{ }, new NewsPostRowMapper());		
	}
	
	private class NewsPostRowMapper  implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			NewsPost newsPost = new NewsPost();			
			newsPost.setId(rs.getLong("id"));
			newsPost.setTitle(rs.getString("title"));
			newsPost.setLink(rs.getString("link"));
			newsPost.setCreated(rs.getDate("created"));
			return newsPost;
		}
	 
	}
}