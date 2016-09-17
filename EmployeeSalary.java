/*
  File: EmployeeSalary.java
  September 2003
  September 2012
*/

import java.io.*;
import java.util.*;
import java.sql.*;
import java.awt.*;//added to change the font 
import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.SwingUtilities;

/**
 * This program retrieves the first and last names and salary
 * of all employees into an array-list of objects.  It then 
 * sorts the array-list by salary and prints the data
 *
 * @author Paul Werstein (2003)
 * @author Raymond (2012)
 */

@SuppressWarnings("serial")//surpress error

public class EmployeeSalary extends JFrame {

    //ResultSet result;//important
    //Object[][] data = new Object[][];
    
    Object[] objs;
    
    public static void main (String[] args) {
	new EmployeeSalary().go();

        SwingUtilities.invokeLater(new Runnable() {
                @Override
                public void run() {
                    new EmployeeSalary();
                }
            });
    }

    /** This is the function that does all the work
     * -- connect to the database
     * -- perform the query
     * -- load the data into a data structure
     * -- sort the data
     * -- output the data
     */
    
    private void go() {

	//Read pass.dat
	UserPass login = new UserPass();
	String user = login.getUserName();
	String pass = login.getPassWord();
	String host = "silver";   //login.getHost();

	Connection con = null;
	try {
	    // Register the driver and connect to Oracle
	    DriverManager.registerDriver 
		(new oracle.jdbc.driver.OracleDriver());

	    String url = "jdbc:oracle:thin:@" + host + ":1527:cosc344";
	    con = DriverManager.getConnection(url, user, pass);
	    System.out.println("Connected to Oracle");

	    Statement stmt = con.createStatement();

	    // Create the SQL statement and execute it.
	    String sql = new String("SELECT fname, lname, salary " +
				    "FROM employee");
	    System.out.println("SQL: " + sql);
	    Resultset result = stmt.executeQuery(sql);
            //data[][]{1, result.getString("fname"), 40.0, false,1};
            //Object[] objs = {1, result.getString("fname"), 40.0, false };

	} catch (SQLException e) {
	    quit(e.getMessage());
	} finally {
	    if (con != null) {
		try {
		    con.close();
		} catch (SQLException e) {
		    quit(e.getMessage());
		}
	    }
	}
    }  // end go()

    public EmployeeSalary ()
    {
        //headers for the table
        String[] col = new String[] {
            "Id", "Name", "Hourly Rate", "Part Time","test"
        };

        DefaultTableModel tableModel = new DefaultTableModel(col, 0);

        objs = {1, result.getString("fname"), 40.0, false };
        tableModel.addRow(objs);
        //actual data for the table in a 2d array
        /* Object[][] data = new Object[][] {
            //while(result.next()){
                    
                {1, result.getString("fname"), 40.0, false },
                {2, result.getString("lname"), 70.0, false },
                {3, result.getInt("salary"), 60.0, true },
                
                // }
            
                };*/

        //data[][]{1, result.getString("fname"), 40.0, false,1};
        /* Object[][] array = new Object[arrayList.size()][];
        for (int i = 0; i < arrayList.size(); i++) {
            ArrayList<String> row = arrayList.get(i);
            array[i] = row.toArray(new String[row.size()]);
            }*/
            
        //create table with data
        JTable table = new JTable(tableModel);
        table.setFont(new Font("Serif", Font.BOLD, 20));//set font
        table.setRowHeight(24);//change row height
        table.setPreferredSize(new Dimension(600, 200));//window size
        // table.setLayout(new GridLayout(3, 0, 10, 10,4));
        //add the table to the frame
        this.add(new JScrollPane(table));
         
        this.setTitle("Test");
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);       
        this.pack();
        this.setVisible(true);
    }
    }

   
    
    /** Used to output an error message and exit */
    private void quit(String message) {
	System.err.println(message);
	System.exit(1);
    }

} // end class EmployeeSalary


