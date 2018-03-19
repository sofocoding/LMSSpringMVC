package com.gcit.lms;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;

import com.gcit.lms.dao.*;
import com.gcit.lms.service.AdminBookService;
import com.gcit.lms.service.AdminBorrowerService;
import com.gcit.lms.service.AdminBranchService;
import com.gcit.lms.service.AdminLoanService;
import com.gcit.lms.service.BorrowerService;
import com.gcit.lms.service.LibrarianService;

@Configuration
public class LMSConfig {
	
	public String driver = "com.mysql.jdbc.Driver";
	public String url = "jdbc:mysql://localhost/library";
	public String username = "root";
	public String password = "root";
	
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, username, password);
		conn.setAutoCommit(Boolean.FALSE);
		return conn;
	}
	
	
	
	@Bean
	public BasicDataSource dataSource()  throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName(driver);
		ds.setUrl(url);
		ds.setUsername(username);
		ds.setPassword(password);
		
		return ds;
	}
	
	@Bean(value="MySQL")
	public JdbcTemplate template() throws ClassNotFoundException, SQLException{
		return new JdbcTemplate(dataSource());
	}
	
	@Bean
	public AdminBookService adminBookService(){
		return new AdminBookService();
	}
	
	@Bean
	public AdminBranchService adminBranchService(){
		return new AdminBranchService();
	}
	
	@Bean
	public AdminBorrowerService adminBorrowerService(){
		return new AdminBorrowerService();
	}
	
	@Bean
	public AdminLoanService adminLoanService(){
		return new AdminLoanService();
	}
	
	@Bean
	public BorrowerService borrowerService(){
		return new BorrowerService();
	}
	
	@Bean
	public LibrarianService librarianService(){
		return new LibrarianService();
	}
	
	@Bean
	public AuthorDAO adao(){
		return new AuthorDAO();
	}
	
	@Bean
	public BookDAO bdao(){
		return new BookDAO();
	}
	
	@Bean
	public GenreDAO gdao(){
		return new GenreDAO();
	}
	
	@Bean
	public PublisherDAO pdao(){
		return new PublisherDAO();
	}
	
	@Bean
	public BranchDAO brdao(){
		return new BranchDAO();
	}
	
	@Bean
	public BorrowerDAO bodao(){
		return new BorrowerDAO();
	}
	
	@Bean
	public BookCopiesDAO bcdao(){
		return new BookCopiesDAO();
	}
	
	@Bean
	public BookLoansDAO bldao(){
		return new BookLoansDAO();
	}
	
	
	@Bean
	public PlatformTransactionManager txManager() throws ClassNotFoundException, SQLException{
		return new DataSourceTransactionManager(dataSource());
	}

}
