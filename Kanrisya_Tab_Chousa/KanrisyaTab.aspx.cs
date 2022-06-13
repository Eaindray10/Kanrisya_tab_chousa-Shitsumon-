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
                showData();
                GV_ques.HeaderRow.Cells[1].Visible = false;
               
            }
        }

        protected void showData()
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
        }
        protected void GV_ques_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            //NewEditIndex property used to determine the index of the row being edited.  
            GV_ques.EditIndex = e.NewEditIndex;
            showData();
        }
        protected void GV_ques_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            TextBox name = GV_ques.Rows[e.RowIndex].FindControl("txt_name") as TextBox;
            //MySqlConnection con = new MySqlConnection(constr);
            //con.Open();
            ////updating the record  
            //SqlCommand cmd = new SqlCommand("Update tbl_Employee set Name='" + name.Text + "',City='" + city.Text + "' where ID=" + Convert.ToInt32(id.Text), con);
            //cmd.ExecuteNonQuery();
            //con.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GV_ques.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            showData();
        }
        protected void GV_ques_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GV_ques.EditIndex = -1;
            showData();
        }

        protected void GV_ques_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GV_ques.SelectedRow;
            string b = row.Cells[1].Text;
        }

        protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GV_ques, "Edit$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }
    }
}