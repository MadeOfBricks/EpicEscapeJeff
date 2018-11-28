using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AndroidTest
{
    public partial class Form1 : Form
    {
        public delegate void AddDataDelegate(String myString);// Delegate for richtextbox
        public AddDataDelegate myDelegate;// An instance of AddDataDelegate
        public delegate void AddDataDelegate_button(String myString);// Delegate for button
        public AddDataDelegate_button myDelegate_button;// An instance of AddDataDelegate_button
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            string fileString = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) + "/testFile.txt";
            //System.IO.File.Create(fileString);
            System.IO.File.WriteAllText(fileString, "X\r\nX");
            try
            {
                serialPort3.Open();//Opening the serial port
            } catch(Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
            this.myDelegate = new AddDataDelegate(AddDataMethod);//Assigning "the function that changes richtextbox text" to the delegate
            this.myDelegate_button = new AddDataDelegate_button(AddDataMethod_button);//Assigning "the function that changes button text" to the delegate


           





        }
        public void AddDataMethod_button(String myString)
        {
            button1.Text = myString;//changes button text
        }
        
        public void AddDataMethod(String myString)
        {
            richTextBox1.Clear();
            richTextBox1.Text = myString + Environment.NewLine;//changes richtextbox text
            string fileString = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) + "/testFile.txt";

            string[] lineArray = System.IO.File.ReadAllLines(fileString);

            if (myString.Contains("L")){
                Console.WriteLine("Lever pulled");
                //lineArray[0] = "P";
                System.IO.File.WriteAllText(fileString, "P\r\nX");
            } else if (myString.Contains("S"))
            {
                Console.WriteLine("Lever pulled");
                //lineArray[0] = "P";
                System.IO.File.WriteAllText(fileString, "P\r\nP");
            }
        }
         
        private void serialPort1_DataReceived(object sender, System.IO.Ports.SerialDataReceivedEventArgs e)
        {
            string s = serialPort3.ReadExisting();//reads the serialport buffer
            richTextBox1.Invoke(this.myDelegate, new Object[] { s });//adds the recieved bytes to the richtextbox

        }

        
        private void button1_Click_1(object sender, EventArgs e)
        {
            string fileString = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) + "/testFile.txt";

            System.IO.File.WriteAllText(fileString, "X\r\nX");
        }
    }
}
