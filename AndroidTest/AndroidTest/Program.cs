using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AndroidTest
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            string fileString = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) + "/testFile.txt";
            System.IO.File.WriteAllText(fileString, "X\r\nX");
            Application.Run(new Form1());
        }
    }
}
