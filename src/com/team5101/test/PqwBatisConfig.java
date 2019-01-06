package com.team5101.test;

import java.io.InputStream;
import java.sql.DriverManager;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.team5101.po.Books;
import com.team5101.po.User;

public class PqwBatisConfig {
    
    public boolean userConfig(String root,String passwd) throws Exception {
	
	    	String resource = "mybatis-config.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		User user = new User();
		user.setUser_name(root);
		user.setPasswd(passwd);
		User users = sqlSession.selectOne("com.team5101.mapper"+
								".pqwMapper.findUser",user);
		if(users==null) {
		    //sqlSession.close();
		    return false;
		}
		//sqlSession.close();
		return true;
    }
    
    public boolean userModify(String passwd) throws Exception{
	String resource = "mybatis-config.xml";
	InputStream inputStream = Resources.getResourceAsStream(resource);
	
	SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	User user = new User();
	user.setUser_name("root");
	user.setPasswd(passwd);
	
	int rows = sqlSession.update("com.team5101.mapper"
						+".pqwMapper.updateUser",user);
	
	if(rows>0) {
	    sqlSession.commit();
	    return true;
	}
	return false;
    }
    
    public boolean findId(Integer id) throws Exception{
	String resource = "mybatis-config.xml";
	InputStream inputStream = Resources.getResourceAsStream(resource);
	
	SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	Books book = sqlSession.selectOne("com.team5101.mapper"+
								".pqwMapper.findId",id);
	
	if(book==null) {
	    sqlSession.close();
	    return false;
	}
	sqlSession.close();
	return true;
    }
}
