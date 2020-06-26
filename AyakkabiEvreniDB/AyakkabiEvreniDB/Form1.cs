using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace AyakkabiEvreniDB
{
    public partial class Form1 : Form
    {
        SqlConnection con = new SqlConnection();
        SqlCommand com = new SqlCommand();
        public Form1()
        {
            InitializeComponent();

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtUserEnter(object sender, EventArgs e)
        {
            if (txtUsername.Text.Equals(@"Kullanıcı Adı \ Email"))
            {
                txtUsername.Text = "";
            }
        }

        private void txtUserLeave(object sender, EventArgs e)
        {
            if (txtUsername.Text.Equals(""))
            {
                txtUsername.Text = @"Kullanıcı Adı \ Email";
            }
        }

        private void txtPassEnter(object sender, EventArgs e)
        {
            if (txtPassword.Text.Equals("Şifre"))
            {
                txtPassword.Text = "";
            }
        }

        private void txtPassLeave(object sender, EventArgs e)
        {
            if (txtPassword.Text.Equals(""))
            {
                txtPassword.Text = "Şifre";
            }
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {  //sql injection koruması başlangıç
            string connStr = @"Data Source=.;Initial Catalog=AyakkabiEvreni;Integrated Security=True";
            String KullaniciAdi = this.txtUsername.Text;
            String Sifre = this.txtPassword.Text;
            String query = "Select count(*) from TBL_Auth where KullaniciAdi = @KullaniciAdi and Sifre = @Sifre";
            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    using (SqlCommand command = new SqlCommand(query, conn))
                    {
                        command.Parameters.Add(new SqlParameter("@KullaniciAdi", KullaniciAdi));
                        command.Parameters.Add(new SqlParameter("@Sifre", Sifre));
                        int result = (int)command.ExecuteScalar();
                        if (result > 0)
                        {
                            formMain objFrmMain = new formMain();
                            this.Hide();
                            objFrmMain.Show();
                        }
                        else
                        {
                            MessageBox.Show("Giriş hatalı! Kullanıcı adı veya şifreyi yanlış girdiniz", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Giriş hatalı! Kullanıcı adı veya şifreyi yanlış girdiniz", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            con.Close();
        }//sql injection koruması bitiş

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
