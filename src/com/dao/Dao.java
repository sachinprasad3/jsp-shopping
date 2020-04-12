package com.dao;

import java.io.IOException;


import java.io.InputStream;
import java.sql.Blob;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.cart.Cart;
import com.cart.CartProduct;
import com.category.Category;
import com.delivery.address.Address;
import com.mysql.jdbc.Statement;
import com.order.Order;
import com.product.Product;
import com.sub.category.Subcategory;
import com.user.User;


public class Dao {
	
	final static String url = "jdbc:mysql://localhost:3306/db_shopping";
	final static String username = "root";
	final static String password = "";
	
	
	
	/************ connection *********/
	
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url,username,password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;	
	}
	
	/********** Authentication **********/
	
	// admin auth function
	
	public boolean adminAuth(String email, String pass) {
		Connection con = null;
		PreparedStatement st = null; 
		ResultSet rs = null;
		try {
			con = Dao.getConnection();
			st = con.prepareStatement("select * from admin where email=? and password=?");
			
			st.setString(1, email);
			st.setString(2, pass);
			rs = st.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
		    try { rs.close(); } catch (Exception e) {}
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
		
		return false;
		
	}
	
	
	//user registration function
	
	public boolean register(String uname, String uemail, String uphone, String upassword) {
		Connection con = null;
		PreparedStatement st = null; 

		try {
			con = Dao.getConnection();
			st = con.prepareStatement("insert into users (name,phone,email,password,created_at) values(?,?,?,?,?)");
				
			Date date= new Date();				 
			long time = date.getTime();
			Timestamp ts = new Timestamp(time);
				 
			st.setString(1, uname);
			st.setString(2, uphone);
			st.setString(3, uemail);
			st.setString(4, upassword);
			st.setTimestamp(5, ts);
				
			st.executeUpdate();
				
		}  catch (SQLException e) {
			e.printStackTrace();
		}finally {
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
		return true;
			
	
	}

// user auth function

	public boolean login(String email, String pass) {
		Connection con = null;
		PreparedStatement st = null; 
		ResultSet rs = null;
		try {
			con = Dao.getConnection();
			st = (PreparedStatement) con.prepareStatement("select * from users where email=? and password=?");
			st.setString(1, email);
			st.setString(2, pass);

			rs = st.executeQuery();
			if (rs.next()) {

				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
		    try { rs.close(); } catch (Exception e) {}
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
	
	return false;
}
	
	//get user name
	public String getUserName(String email) {
		Connection con = null;
		PreparedStatement st = null; 
		ResultSet rs = null;
		String userName = null;
		try {
			con = Dao.getConnection();
			st = con.prepareStatement("select name from users where email=?");
			
			st.setString(1, email);
			rs = st.executeQuery();
			while(rs.next()) {
				
				userName = rs.getString("name");	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
		    try { rs.close(); } catch (Exception e) {}
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
		
		return userName;
		
	}
	
	
	//getting user id
	
	public int getUserId(String email) {
		Connection con = null;
		PreparedStatement st = null; 
		ResultSet rs = null;
		int user_id = 0;
		try {
			con = Dao.getConnection();
			st = con.prepareStatement("select id from users where email=?");
			
			st.setString(1, email);
			rs = st.executeQuery();
			while(rs.next()) {
				
				user_id = rs.getInt("id");	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
		    try { rs.close(); } catch (Exception e) {}
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
		
		return user_id;
		
	}

	
	/********** Admin functionality **********/
	
	// add category
	
	public boolean addCategory(String cat) {
		Connection con = null;
		PreparedStatement st = null; 
		
		try {
			con = Dao.getConnection();
			st = con.prepareStatement("insert into category (category) values(?)");
			
			st.setString(1, cat);
			st.executeUpdate();
			
		}  catch (SQLException e) {
			e.printStackTrace();
		}finally {
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}	
		return false;
		
	}

	//get category
	
	public List<Category> getCategory(){
		Connection con = null;
		Statement st = null; 
		ResultSet rs = null;
		List<Category> list = new ArrayList<Category>();
		
		try {
			con = Dao.getConnection();
			st = (Statement) con.createStatement();
            rs = st.executeQuery("select * from category"); 
		    
		    while(rs.next()) {
		    	Category cat =new Category();   
		    	
		    	cat.setId(rs.getInt("id"));
		    	cat.setCategory(rs.getString("category"));	
		    	
		    	list.add(cat);
		    }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
		    try { rs.close(); } catch (Exception e) {}
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
		return list;	
	}
	
	// count number of category
	
	public int getNumberOfCategoy() {
		Connection con = null;
		PreparedStatement st = null; 
		ResultSet rs = null;
		int num_rows = 0;
		try {
			con = Dao.getConnection();
			st = (PreparedStatement) con.prepareStatement("select count(*) from category");
			rs = st.executeQuery();
			if(rs.next()) {
				num_rows = rs.getInt("count(*)");
			}
			
		} catch (SQLException e) {		
			e.printStackTrace();
		}finally {
		    try { rs.close(); } catch (Exception e) {}
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
		return num_rows;
	}
	
	
	//get category by id
	
	public Category getCategoryById(int c_id){
		Connection con = null;
		PreparedStatement st = null; 
		ResultSet rs = null;
		
		Category cat = null;
		try {
			con = Dao.getConnection();
			st = (PreparedStatement) con.prepareStatement("select * from category where id=?");
			
			st.setInt(1, c_id);
            rs = st.executeQuery();  
    
		    while(rs.next()) {
		    	cat = new Category();   
		    	cat.setId(rs.getInt("id"));
		    	cat.setCategory(rs.getString("category"));  	
		    }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
		    try { rs.close(); } catch (Exception e) {}
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
		return cat;
	}
	
	// Update Category
	
	public boolean updateCategory(int c_id,String c_name) {
		Connection con = null;
		PreparedStatement st = null; 
		
		try {
			con = Dao.getConnection();
			st = con.prepareStatement("update category set category=? where id=?");
			st.setString(1, c_name);
			st.setInt(2, c_id);
			st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
		
		return false;	
	}
	
	//add sub category
	public boolean addSubCategory(int cat_id, String subCategory) {
		Connection con = null;
		PreparedStatement st = null; 
		
		try {
			con = Dao.getConnection();
			st = con.prepareStatement("insert into subcategory (category_id,title) values(?,?)");
			
			st.setInt(1, cat_id);
			st.setString(2, subCategory);
			st.executeUpdate();
			
		}  catch (SQLException e) {
			e.printStackTrace();
		}	finally {
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
		return false;
		
	}
	
	//get sub category(ajax calling)
	public List<Subcategory> getSubCategory(int cat_id){
		Connection con = null;
		Statement st = null; 
		ResultSet rs = null;
		
		List<Subcategory> list = new ArrayList<Subcategory>();
		
		try {
			con = Dao.getConnection();
			st = (Statement) con.createStatement();
            rs = st.executeQuery("select * from subcategory where category_id="+cat_id); 
		    
		    while(rs.next()) {
		    	Subcategory scat =new Subcategory();   
		    	
		    	scat.setId(rs.getInt("id"));
		    	scat.setCat_id(rs.getInt("category_id"));
		    	scat.setTitle(rs.getString("title"));		    	
		    	list.add(scat);
		    }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
		    try { rs.close(); } catch (Exception e) {}
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
		return list;	
	}
	
	//add product
	
	public boolean addProduct(int cat_id,int sub_cat_id,String title, String details, String price, Part part) {
		Connection con = null;
		PreparedStatement st = null; 
		
		try {
			con = Dao.getConnection();
			st = con.prepareStatement("insert into products(category_id,sub_category_id,product_name,product_detail,price,image,created_at) values(?,?,?,?,?,?,?)");
			
			Part prt = part;
			InputStream is = prt.getInputStream();
			
			Date date= new Date();				 
			long time = date.getTime();
			Timestamp ts = new Timestamp(time);
			
			st.setInt(1, cat_id);
			st.setInt(2, sub_cat_id);
			st.setString(3, title);
			st.setString(4, details);
			st.setString(5, price);
			
			if (is != null) {
                st.setBlob(6, is);
            }
			
			st.setTimestamp(7, ts);	
			st.executeUpdate();
		
		}  catch (SQLException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}finally {
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
		return true;
		
	}
	
	
	//get product(index.jsp)
	
	public List<Product> getProduct(){
		Connection con = null;
		Statement st = null; 
		ResultSet rs = null;
		List<Product> list = new ArrayList<Product>();
		
		try {
			con = Dao.getConnection();
			st = (Statement) con.createStatement();
            rs = st.executeQuery("select * from products");  
		    //ResultSet rs=st.executeQuery();
		    
		    while(rs.next()) {
		    	Product pro =new Product();   
		    	
		    	pro.setId(rs.getInt("id"));
		    	pro.setCat_id(rs.getInt("category_id"));
		    	pro.setSub_cat_id(rs.getInt("sub_category_id"));
		    	pro.setProduct_name(rs.getString("product_name"));
		    	pro.setProduct_detail(rs.getString("product_detail"));
		    	pro.setPrice(rs.getString("price"));
		    	pro.setCreated_at(rs.getTimestamp("created_at"));
		    			    	
		    	list.add(pro);
		    }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
		    try { rs.close(); } catch (Exception e) {}
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
		return list;
		
	}
	
	//get all products(viewProduct.jsp)
	public List<Product> getAllProduct(int offset ,int noOfRecords){
		Connection con = null;
		PreparedStatement st = null; 
		ResultSet rs = null;
		List<Product> list = new ArrayList<Product>();
		
		try {
			con = Dao.getConnection();
			
			st = (PreparedStatement) con.prepareStatement("select * from products limit ?,?");
			
			st.setInt(1, offset);
			st.setInt(2, noOfRecords);
			
		    rs=st.executeQuery();
		    
		    while(rs.next()) {
		    	Product pro =new Product();   
		    	
		    	pro.setId(rs.getInt("id"));
		    	pro.setCat_id(rs.getInt("category_id"));
		    	pro.setSub_cat_id(rs.getInt("sub_category_id"));
		    	pro.setProduct_name(rs.getString("product_name"));
		    	pro.setProduct_detail(rs.getString("product_detail"));
		    	pro.setPrice(rs.getString("price"));
		    	pro.setCreated_at(rs.getTimestamp("created_at"));
		    			    	
		    	list.add(pro);
		    }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
		    try { rs.close(); } catch (Exception e) {}
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
		return list;	
	}


	// get number of products

	public int getNumberOfProducts() {
		Connection con = null;
		PreparedStatement st = null; 
		ResultSet rs = null;
		int num_rows = 0;
		try {
			con = Dao.getConnection();
			st = (PreparedStatement) con.prepareStatement("select count(*) from products");
			rs = st.executeQuery();
			if(rs.next()) {
				num_rows = rs.getInt("count(*)");
			}
			
		} catch (SQLException e) {		
			e.printStackTrace();
		}finally {
		    try { rs.close(); } catch (Exception e) {}
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
		return num_rows;
	}


	// get product image(show)

	public byte[] getImage(int id) {
		Connection con = null;
		PreparedStatement st = null; 
		ResultSet rs = null;
		
		byte[] image = null;
		
		try {
			con = Dao.getConnection();
	
			st = (PreparedStatement) con.prepareStatement("select image from products where id=?");
			st.setInt(1, id);
			rs = st.executeQuery();
			
			if(rs.next()) {
				image = rs.getBytes(1);
			}		
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
		    try { rs.close(); } catch (Exception e) {}
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
	return image;	
}

	//get product by id(updateProduct.jsp)

	public Product getProductById(int p_id){
		Connection con = null;
		PreparedStatement st = null; 
		ResultSet rs = null;
		
		Product prd = null;
		try {
			con = Dao.getConnection();
			st = (PreparedStatement) con.prepareStatement("select * from products where id=?");
			
			st.setInt(1, p_id);
            rs = st.executeQuery();  
    
		    while(rs.next()) {
		    	prd = new Product();   
		    	
		    	prd.setId(rs.getInt("id"));
		    	prd.setCat_id(rs.getInt("category_id"));
		    	prd.setSub_cat_id(rs.getInt("sub_category_id"));
		    	prd.setProduct_name(rs.getString("product_name"));
		    	prd.setProduct_detail(rs.getString("product_detail"));
		    	prd.setPrice(rs.getString("price"));
		    	prd.setCreated_at(rs.getTimestamp("created_at"));
		    	
		    }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
		    try { rs.close(); } catch (Exception e) {}
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
		return prd;

	}
	
	//update product
	
	public boolean updateProduct(int p_id, int cat_id,int subCatId,String title, String details, String price) {
		Connection con = null;
		PreparedStatement st = null; 
		
		try {
			con = Dao.getConnection();
			st = con.prepareStatement("update products set category_id=?,sub_category_id=?,product_name=?,product_detail=?,price=? where id=?");
				
			st.setInt(1, cat_id);
			st.setInt(2, subCatId);
			st.setString(3, title);
			st.setString(4, details);
			st.setString(5, price);
			st.setInt(6, p_id);	
			st.executeUpdate();
		
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
		return true;
		
	}

	
	// delete product
	
	public boolean deleteProduct(int p_id) {
		Connection con = null;
		PreparedStatement st = null; 
		
		try {
			con = Dao.getConnection();
			st = con.prepareStatement("delete from products where id=?");
			st.setInt(1, p_id);
			st.executeUpdate();
			
			//delete from cart
			deleteProductFromCart(p_id);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
		
		return false;	
	}
	
	//delete product from cart(used by admin)
	
	public boolean deleteProductFromCart(int p_id) {
		Connection con = null;
		PreparedStatement st = null; 
		
		try {
			con = Dao.getConnection();
			st = con.prepareStatement("delete from cart where product_id = ?");		
			st.setInt(1, p_id);					
			st.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
		return false;
		
	}
	/********** end of admin functionality **********/
	
	
	
	
	/********** user functionality **********/
	
	// add to cart
	public boolean addToCart(int id, String uemail) {
		Connection con = null;
		PreparedStatement st = null; 
		
		//getting user id
		int user_id = getUserId(uemail);
		
		try {
			con = Dao.getConnection();
			st = con.prepareStatement("insert into cart(product_id,user_id,created_at)values(?,?,?)");
			
			Date date= new Date();				 
			long time = date.getTime();
			Timestamp ts = new Timestamp(time);
			
			st.setInt(1, id);
			st.setInt(2, user_id);
			st.setTimestamp(3, ts);	
			st.executeUpdate();
					
		}catch (SQLException e) {		
			e.printStackTrace();
		}finally {
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
	
		return false;	
	}

	//getNumberOfCardItems
	
	public int getNumberOfCardItems(String uemail) {
		Connection con = null;
		PreparedStatement st = null; 
		ResultSet rs = null;
		
		int num_rows = 0;
		int user_id = getUserId(uemail);
		try {
			con = Dao.getConnection();
			st = (PreparedStatement) con.prepareStatement("select count(*) from cart where user_id=?");
			st.setInt(1, user_id);
			
			rs = st.executeQuery();
			
			if(rs.next()) {
				num_rows = rs.getInt("count(*)");
			}
			
		}  catch (SQLException e) {		
			e.printStackTrace();
		}finally {
		    try { rs.close(); } catch (Exception e) {}
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
		return num_rows;
	}

	// show products in cart(by identical user)
	
	public List<Cart> getCart(String uemail){
		Connection con = null;
		PreparedStatement st = null; 
		ResultSet rs = null;
		PreparedStatement ps = null;
		ResultSet result = null;
		
		List<Cart> list = new ArrayList<Cart>();
	
		int user_id = getUserId(uemail);
	
		try {
			con = Dao.getConnection();
			st = (PreparedStatement) con.prepareStatement("select * from cart where user_id=?");
			st.setInt(1, user_id);
			
			rs = st.executeQuery();
			
			while(rs.next()) {
				int p_id = rs.getInt("product_id");
				ps = con.prepareStatement("select * from products where id=?");			
				ps.setInt(1, p_id);
				result = ps.executeQuery();
				
				while(result.next()) {			
					Cart cart = new Cart();
					cart.setProduct_id(result.getInt("id"));
					cart.setProduct_name(result.getString("product_name"));
					cart.setPrice(result.getString("price"));
			    	list.add(cart);
			    }
	        }	        	       
		}  catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			try { result.close(); } catch (Exception e) {}
			try { ps.close(); } catch (Exception e) {}
		    try { rs.close(); } catch (Exception e) {}
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
		
		return list;		
	}

	// delete item from cart
	
	public boolean deleteFromCart(int p_id, String uemail) {
		Connection con = null;
		PreparedStatement st = null; 
		
		int userid = getUserId(uemail);
		
		try {
			con = Dao.getConnection();
			st = con.prepareStatement("delete from cart where product_id = ? and user_id=?");
			
			st.setInt(1, p_id);
			st.setInt(2, userid);
			
			st.executeUpdate();
			
		}  catch (SQLException e) {
			e.printStackTrace();
		}finally {
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
		return false;
		
	}


	// Shipping Address

	public boolean checkout(String fullAddress, String addressMobileNo, String payMode,String uemail) {
		Connection con = null;
		Statement st = null; 
		ResultSet rs = null;
		PreparedStatement ps = null;
		
		int userId = getUserId(uemail);
		
		try {
			con = Dao.getConnection();
			st = (Statement) con.createStatement();
			rs = st.executeQuery("select * from cart");
			
			while(rs.next()) {
				int p_id = rs.getInt("product_id");
				int status = 0;
				
				ps = con.prepareStatement("insert into oders(product_id,user_id,delivery_address,delivery_address_mobile,order_date,status)values(?,?,?,?,?,?)");
				
				Date date= new Date();				 
				long time = date.getTime();
				Timestamp ts = new Timestamp(time);
				
				ps.setInt(1, p_id);
				ps.setInt(2, userId);
				ps.setString(3, fullAddress);
				ps.setString(4, addressMobileNo);
				ps.setTimestamp(5, ts);	
				ps.setInt(6, status);
				ps.executeUpdate();
				
				//delete cart item
				deleteFromCart(p_id,uemail);
				
			}
		} catch (SQLException e) {		
			e.printStackTrace();
		}finally {
		    try { rs.close(); } catch (Exception e) {}
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
		return false;
		
	}

	
	//get order list
	
	public List<Order> getOrderList(String uemail){
		Connection con = null;
		PreparedStatement st = null; 
		ResultSet rs = null;
		
		List<Order> order = new ArrayList<Order>();

		int userId = getUserId(uemail);

		try {
			con = Dao.getConnection();
			
			st = (PreparedStatement) con.prepareStatement("select * from oders where user_id=?");
			st.setInt(1, userId);
			
			rs = st.executeQuery();
			
			while(rs.next()) {
				
				int p_id = rs.getInt("product_id");
				Timestamp timestamp = rs.getTimestamp("order_date");
				Date date = new java.sql.Date(timestamp.getTime());
				
				Order ord = new Order();
				ord.setId(rs.getInt("id"));
				ord.setUserId(rs.getInt("user_id"));
				ord.setProductId(rs.getInt("product_id"));
				ord.setDeliveryAddress(rs.getString("delivery_address"));
				ord.setDeliveryMobileNo(rs.getString("delivery_address_mobile"));
				//ord.setOrderDate(rs.getTimestamp("order_date"));
				ord.setOrderDate(date);
			
				PreparedStatement ps = con.prepareStatement("select * from products where id=?");
						
				ps.setInt(1, p_id);
				ResultSet result = ps.executeQuery();
				
				while(result.next()) {
					
					ord.setProductName(result.getString("product_name"));
					ord.setProductPrice(result.getString("price"));
				
			    } 
				order.add(ord);
	        }	       
		}catch (SQLException e) {			
			e.printStackTrace();
		}finally {
		    try { rs.close(); } catch (Exception e) {}
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
		
		return order;
	
	}
	
	
	//search product
	
	 public List<Product> searchProduct(String cat, String query, int offset ,int noOfRecords){
		Connection con = null;
		PreparedStatement st = null; 
		ResultSet rs = null;
		 //String category = cat;
		 
		List<Product> list = new ArrayList<Product>();
		
		try {
			con = Dao.getConnection();
			
			int catt = Integer.parseInt(cat);
			//String cat2 = "all";
			if(catt == 0) {
				st = con.prepareStatement("select * from products where product_name like '%"+query+"%' limit ?,?");   
				st.setInt(1, offset);
	    		st.setInt(2, noOfRecords);
			}
			
			else{
				//int catt = Integer.parseInt(cat);
				st = con.prepareStatement("select * from products where category_id=? and product_name like '%"+query+"%' limit ?,?");    						
				st.setInt(1, catt);
				st.setInt(2, offset);
	    		st.setInt(3, noOfRecords);
			}

    	    rs=st.executeQuery();
    	    
		    while(rs.next()) {
		    	Product pro =new Product();   	    	
		    	pro.setId(rs.getInt("id"));
		    	pro.setCat_id(rs.getInt("category_id"));
		    	pro.setSub_cat_id(rs.getInt("sub_category_id"));
		    	pro.setProduct_name(rs.getString("product_name"));
		    	pro.setProduct_detail(rs.getString("product_detail"));
		    	pro.setPrice(rs.getString("price"));
		    	pro.setCreated_at(rs.getTimestamp("created_at"));  			    	
		    	list.add(pro);
		    }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
		    try { rs.close(); } catch (Exception e) {}
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
		return list;
		
	} 
	 
	//sorting search product
		
		 public List<Product> getSortedProduct(int sort, String query, String cat ){
			Connection con = null;
			PreparedStatement st = null; 
			ResultSet rs = null;
			 //String category = cat;
			int sortOrder = sort;
			String order = null;
			switch(sortOrder) {
				case 1:
					order = "ORDER BY created_at ASC";
					break;
				case 2:
					order = "ORDER BY price ASC";
					break;
				case 3:
					order = "ORDER BY price DESC";
					break;
				case 4:
					order = "ORDER BY created_at DESC";
					break;
				default:
					order = null;
			}
			 
			List<Product> list = new ArrayList<Product>();
			
			try {
				con = Dao.getConnection();
				
				int catt = Integer.parseInt(cat);
				//String cat2 = "all";
				if(catt == 0) {
					st = con.prepareStatement("select * from products where product_name like '%"+query+"%'"+order);   
					
				}
				
				else{
					//int catt = Integer.parseInt(cat);
					st = con.prepareStatement("select * from products where category_id=? and product_name like '%"+query+"%'"+order);    						
					st.setInt(1, catt);
					
				}

	    	    rs=st.executeQuery();
	    	    
			    while(rs.next()) {
			    	Product pro =new Product();   	    	
			    	pro.setId(rs.getInt("id"));
			    	pro.setCat_id(rs.getInt("category_id"));
			    	pro.setSub_cat_id(rs.getInt("sub_category_id"));
			    	pro.setProduct_name(rs.getString("product_name"));
			    	pro.setProduct_detail(rs.getString("product_detail"));
			    	pro.setPrice(rs.getString("price"));
			    	pro.setCreated_at(rs.getTimestamp("created_at"));  			    	
			    	list.add(pro);
			    }
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
			    try { rs.close(); } catch (Exception e) {}
			    try { st.close(); } catch (Exception e) {}
			    try { con.close(); } catch (Exception e) {}
			}
			return list;
			
		} 


	
	
	/* public List<Product> searchProduct(String query, int offset ,int noOfRecords){
		
		List<Product> list = new ArrayList<Product>();
		Product pro = null;
		try {
			Connection con = Dao.getConnection();
    		PreparedStatement st = (PreparedStatement) con.prepareStatement("select * from products where product_name like '%"+query+"%' limit ?,?");
			st.setInt(1, offset);
    		st.setInt(2, noOfRecords);
    	    ResultSet rs=st.executeQuery();    
		    while(rs.next()) {
		    	pro = new Product();     	
		    	pro.setId(rs.getInt("id"));
		    	pro.setCat_id(rs.getInt("category_id"));
		    	pro.setProduct_name(rs.getString("product_name"));
		    	pro.setProduct_detail(rs.getString("product_detail"));
		    	pro.setPrice(rs.getString("price"));
		    	pro.setCreated_at(rs.getTimestamp("created_at"));			    	
		    	//list.add(pro);
		    }
		    
		    PreparedStatement st2 = con.prepareStatement("select * from products inner join category on products.category_id = category.id where category.category like '%"+query+"%' ");
    	    ResultSet rs2 = st2.executeQuery();
    	    while(rs2.next()) {
    	    	int id = rs2.getInt("id");	 
    	    	if(id!= pro.getCat_id()) {
    	    		pro = new Product();     	
    		    	pro.setId(rs.getInt("id"));
    		    	pro.setCat_id(rs.getInt("category_id"));
    		    	pro.setProduct_name(rs.getString("product_name"));
    		    	pro.setProduct_detail(rs.getString("product_detail"));
    		    	pro.setPrice(rs.getString("price"));
    		    	pro.setCreated_at(rs.getTimestamp("created_at"));			    	
    		    	list.add(pro);
    	    	}
    	    }  
    	    
    	    //list.add(pro);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;		
	} */
	
	//get total no of searched product

	public int getNumberOfSearchProducts(String cat, String query) {
		Connection con = null;
		Statement st = null; 
		ResultSet rs = null;
		
		int num_rows = 0;
		try {
			con = Dao.getConnection();
			st = (Statement) con.createStatement();
			rs = null ;
			String cat2 = "all";
			if(cat.equals(cat2)) {
				rs = st.executeQuery("select count(*) from products where product_name like '%"+query+"%' ");
			}
			else {
				rs = st.executeQuery("select count(*) from products where category_id='"+cat+"' and product_name like '%"+query+"%' ");
			}
						
			if(rs.next()) {
				num_rows = rs.getInt("count(*)");
			}
			
		} catch (SQLException e) {		
			e.printStackTrace();
		}finally {
		    try { rs.close(); } catch (Exception e) {}
		    try { st.close(); } catch (Exception e) {}
		    try { con.close(); } catch (Exception e) {}
		}
		return num_rows;
	}



	
	
		
	

}
