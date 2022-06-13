using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kanrisya_Tab_Chousa
{
    public partial class KanrisyaTab : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
          
            if (!IsPostBack)
            {
                MySqlConnection con = new MySqlConnection(constr);
                con.Open();
                string select_ques = "select id,name from m_ess;";
                MySqlCommand cmd = new MySqlCommand(select_ques, con);
                MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                GV_ques.DataSource = ds;
                GV_ques.DataBind();
                con.Close();
                GV_ques.HeaderRow.Cells[1].Visible = false;
               
            }
        }
    }
}