//LAB12-3

package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.content;

public class contentDao {
	public static Connection getConnection(){  
	    Connection con=null;  
	    try{  
	        Class.forName("com.mysql.jdbc.Driver");  
	        con=DriverManager.getConnection("jdbc:mysql://www.db4free.net:3306/gudqlsdb","dlagudqls","4094704a");      
	    }catch(Exception e){System.out.println(e);}  
	    return con;  
	}
	
	public static int save(content u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("insert into contents(title,author,comments) values(?,?,?)");
			ps.setString(1, u.getTitle());
			ps.setString(2, u.getAuthor());
			ps.setString(3, u.getComments());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int update(content u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("update contents set title=?,  author=?,comments=? where id=?");
			ps.setString(1, u.getTitle());
			ps.setString(2, u.getAuthor());
			ps.setString(3, u.getComments());
			ps.setInt(4, u.getId());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int delete(content u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("delete from contents where id=?");
			ps.setInt(1, u.getId());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static List<content> getAllRecords() {
		List<content> list = new ArrayList<content>();
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from contents");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				content u = new content();
				u.setId(rs.getInt("id"));
				u.setTitle(rs.getString("title"));
				u.setAuthor(rs.getString("author"));
				u.setComments(rs.getString("comments"));
				list.add(u);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public static content getRecordById(int id) {
		content u = null;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from contents where id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u = new content();
				u.setId(rs.getInt("id"));
				u.setTitle(rs.getString("title"));
				u.setAuthor(rs.getString("author"));
				u.setComments(rs.getString("comments"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return u;
	}
}
