//package net.codejava.swing;
import java.awt.*;//added to change the font 
import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.SwingUtilities;

@SuppressWarnings("serial")//surpress error

public class TableExample extends JFrame
{
    public TableExample()
    {
        //headers for the table
        String[] columns = new String[] {
            "Id", "Name", "Hourly Rate", "Part Time","test"
        };
         
        //actual data for the table in a 2d array
        Object[][] data = new Object[][] {
            {1, "John", 40.0, false,1 },
            {2, "Rambo", 70.0, false,1 },
            {3, "Zorro", 60.0, true,1 },
            {4, "Assman", 60.0, true,1 },
            
        };
 
        //create table with data
        JTable table = new JTable(data, columns);
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
     
    public static void main(String[] args)
    {
        SwingUtilities.invokeLater(new Runnable() {
                @Override
                public void run() {
                    new TableExample();
                }
            });
    }   
}

//http://stackoverflow.com/questions/7212114/how-to-control-font-style-color-and-size-inside-a-jtable
