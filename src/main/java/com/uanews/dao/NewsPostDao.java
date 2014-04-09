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
	
	public static final String LIST_SQL = "SELECT * FROM POSTS ORDER BY created desc LIMIT 25";
	public static final String ADD_SQL = "INSERT INTO POSTS (link, title, created) values (?, ?, ?) ";
	public static final String LIKE_SQL = "UPDATE POSTS SET likes = likes + 1 where id = ? ";
	
	private JdbcTemplate jdbcTemplate;
    
    @Autowired
    public void init(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }    
	
    public void addNewPost(NewsPost newsPost){
		jdbcTemplate.update(ADD_SQL, new Object[]{
				newsPost.getLink(),
				newsPost.getTitle(),
				newsPost.getCreated()
				});		
	}
    
	public List<NewsPost> getPostList(){
		return jdbcTemplate.query(LIST_SQL, new Object[]{ }, new NewsPostRowMapper());		
	}
	
	public boolean likePost(int id){
		return jdbcTemplate.update(LIKE_SQL, new Object[]{ Integer.valueOf(id) }) > 0;		
	}
	
	private class NewsPostRowMapper  implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			NewsPost newsPost = new NewsPost();			
			newsPost.setId(rs.getLong("id"));
			newsPost.setTitle(rs.getString("title"));
			newsPost.setLink(rs.getString("link"));
			newsPost.setCreated(rs.getDate("created"));
			newsPost.setLikes(rs.getInt("likes"));
			return newsPost;
		}
	 
	}
}
