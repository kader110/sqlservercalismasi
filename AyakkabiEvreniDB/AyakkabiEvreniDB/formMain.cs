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
    public partial class formMain : Form
    {
        public formMain()
        {
            InitializeComponent();
        }

        SqlConnection baglanti = new SqlConnection("Data Source=.;Initial Catalog=AyakkabiEvreni;Integrated Security=True");

        private void button1_Click(object sender, EventArgs e)
        {
            SqlDataAdapter da = new SqlDataAdapter(txtSorgu.Text,baglanti);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];

        }

        private void txtEnter(object sender, EventArgs e)
        {
            if (txtSorgu.Text.Equals(@"Buraya herhangi bir sorgu yazarak çalıştırabilirsiniz..."))
            {
                txtSorgu.Text = "";
            }
        }

        private void txtSorgu_Leave(object sender, EventArgs e)
        {
            if (txtSorgu.Text.Equals(""))
            {
                txtSorgu.Text = @"Buraya herhangi bir sorgu yazarak çalıştırabilirsiniz...";
            }
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            SqlDataAdapter ma = new SqlDataAdapter("Select * from musterileri_Listele", baglanti);
            DataSet dc = new DataSet();
            ma.Fill(dc);
            dataGridView1.DataSource = dc.Tables[0];
        }

        private void linkLabel2_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            SqlDataAdapter ga = new SqlDataAdapter("execute MaxGoruntulenme", baglanti);
            DataSet gc = new DataSet();
            ga.Fill(gc);
            dataGridView1.DataSource = gc.Tables[0];
        }

        private void linkLabel3_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            SqlDataAdapter ka = new SqlDataAdapter("SELECT * FROM TBL_Satis WHERE Satis_SiparisDurumID='4'", baglanti);
            DataSet kc = new DataSet();
            ka.Fill(kc);
            dataGridView1.DataSource = kc.Tables[0];
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
            Application.Exit();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
