import java.sql.*;
public class DBConnection{
	static Connection con;
	public static Connection connect(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver OK");
			con=DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/bank",
				"root",
				"1234");
				System.out.println("Connected");
		}
		catch(ClassNotFoundException | SQLException se){
			se.printStackTrace();
                                              System.out.println("Not Connected");
		}
		//System.out.println(con);
		return con;
	}
	
	public static void main(String []args){
		connect();
	}
}//"jdbc:mysql://localhost:3306/prakhar",