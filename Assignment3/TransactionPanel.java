/**
 * Transaction GUI for Cosc344 Assignment 3 2016.
 */
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class TransactionPanel extends JPanel{
  
    String[] buttonLabels =  {"Hit","Me","Baby","One", "More", "Time"};
    ButtonListener listener = new ButtonListener();
    private JButton [] buttons = new JButton [buttonLabels.length];
    
    private CustomerPanel cPanel = new CustomerPanel();
    private BookPanel bPanel = new BookPanel();
    private SQLPanel qPanel = new SQLPanel();

    
    private JTextField custSearchBox = new JTextField(10);
    private JLabel custSearchLabel = new JLabel("Customer Search:");
    private JTextField bookSearchBox = new JTextField(10);
    private JLabel bookSearchLabel = new JLabel("Book Search:");


    
    /** TransactionPanel constructor */
    public TransactionPanel (){
            
        JPanel purchasePanel = new JPanel();
        setPreferredSize (new Dimension(1280,720));

        /* Change layout to make similar to drawing*/
        setLayout(new GridLayout(2,2));
    
        /* Create a button with each button label, add it to buttons, and register the button as a listener. */
        // for (int but = 0; but < buttonLabels.length; but++) {
        //    buttons[but] = new JButton(buttonLabels[but]);
        //    buttons[but].addActionListener(listener);
        //    purchasePanel.add(buttons[but]);
        //}


        
        purchasePanel.setPreferredSize (new Dimension(600,800));
        purchasePanel.setBackground (Color.green);
        

        cPanel.add (custSearchLabel);
        cPanel.add (custSearchBox);
        bPanel.add (bookSearchLabel);
        bPanel.add (bookSearchBox);

        
        add (cPanel);        
        add (bPanel);
        add (qPanel);
        add (purchasePanel);
        
    }

    private class CustomerPanel extends JPanel{
        /** set size and background of customer panel */
        public CustomerPanel (){
            setPreferredSize (new Dimension(1280,300));
            setBackground (Color.red);
        }
    }

    private class BookPanel extends JPanel{
        /** set size and background of BookPanel */
        public BookPanel (){
            setPreferredSize (new Dimension(680,200));
            setBackground (Color.blue);
        }
    }

    private class SQLPanel extends JPanel{
        /** set size and background of BookPanel */
        public SQLPanel (){
            setPreferredSize (new Dimension(680,200));
            setBackground (Color.gray);
        }
    }


    
    private class ButtonListener implements ActionListener{
    
        /** What happens when the Jbuuton is pressed */
        public void actionPerformed (ActionEvent event) {

            JButton button = (JButton) event.getSource();
        
            if (button.getText().equals("Something")){          
             
            }
            else if (button.getText().equals("Search")){          

                    
            }
            else if (button.getText().equals("Add")){          

               
            }
            else if (button.getText().equals("Delete")){ 

                    
            }
            else if (button.getText().equals("Complete_Transaction")){
          
                    
            } 
        
        repaint();
        }
    }

    public static void main (String [] args){
        JFrame guiFrame = new JFrame("Transaction GUI");
        guiFrame.getContentPane().add(new TransactionPanel());
        guiFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        guiFrame.pack();
        guiFrame.setVisible(true);  
    }
 
}





