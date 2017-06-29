


import java.sql.*;
import java.util.*;

/**
 * The class implements methods of the Sales database
 * interface.
 *
 * All methods of the class receive a Connection object through which all
 * communication to the database should be performed. Note: the
 * Connection object should not be closed by any method.
 *
 * Also, no method should throw any exceptions. In particular, in case
 * that an error occurs in the database, then the method should print an
 * error message and call System.exit(-1);
 */
public class SalesApplication {

    private Connection connection;
    
    /*
     * Constructor
     */
    public SalesApplication(Connection connection) {
        this.connection = connection;
    }
    
    public Connection getConnection()
    {
        return connection;
    }
    
     /**
     * Return list of product names for products whose total sales 
     * i.e. , the total price of the sale of the product across all sales
     * is greater than some specified amount
     * 
     */
    public List<String> getProductNamesWithTotalPriceLargerThan(double amount) {
        List<String> result = new ArrayList<String>();
        // your code here
        String statement = "SELECT name FROM lab4.Products WHERE product_id IN (SELECT product_id FROM lab4.Sales GROUP BY product_id HAVING SUM(quantity*unit_price)>"+amount+")";
        try{
            PreparedStatement st = connection.prepareStatement(statement);
            ResultSet rs = st.executeQuery();

            System.out.print("\n---------Product names greater than the amount specified--------- \n");
            while (rs.next())
            {
               result.add(rs.getString(1));
               System.out.println(rs.getString(1));
               
            }
            System.out.println();

            rs.close();
            st.close();
        }catch(SQLException se){
            se.printStackTrace();
        }

        // end of your code
        return result;  
    }

    /**
     * Add a product to the database. If the product’s name and manufacturer
     * already exists in the database, return the product’s id. Otherwise,
     * add the product to the database, and return the new product id.
     * When a new product is added to the database, its category should be NULL.
     *
     * Adding a product and a manufacturer should be done
     * within a transaction. The isolation level should be Serializable.
     *
     * You will lose credit if this is not done in a transaction; you will get extra
     * credit if you do this in a stored procedure.
     */
    public int addProduct(String name, String manufacturer) {
        int product_id = 0;
        // your code here
        String st_exist = "SELECT * FROM lab4.Products WHERE name='"+name+"' AND manufacturer='"+manufacturer+"'";
        String st_insert, st_id_exist;

        try{
            
            PreparedStatement st = connection.prepareStatement(st_exist);
            ResultSet rs = st.executeQuery();
            
            // if this ID already exists, we quit
            if(rs.next())
            {    
                product_id = rs.getInt("product_id");
                connection.close();
                rs.close();
                System.out.println("\nProduct_id that already exist in database: "+product_id+"\n");
                return product_id;
            }
            connection.setAutoCommit(false);   

            while(true)
            {
                st_id_exist ="SELECT * FROM lab4.Products WHERE product_id = "+product_id;
                PreparedStatement p = connection.prepareStatement(st_id_exist);
                ResultSet rst = p.executeQuery();

                if(rst.next())
                    product_id+=1;
                else
                {
                    p.close();
                    rst.close();
                    break;
                }
            }
            System.out.println("\nProduct_id for newly added product: "+product_id+"\n");

            st_insert = "INSERT INTO lab4.Products(product_id, name, category,manufacturer) VALUES("+product_id+",'"+name+"',"+"NULL,'"+manufacturer+"')";
            Statement ps = connection.createStatement();
            ps.executeUpdate(st_insert);
            connection.commit();

        }catch(SQLException se){
            se.printStackTrace();
        }
        // end of your code
        return product_id;
    }

};
