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
            MySqlConnection con = new MySqlConnection(constr);
            DataTable dt = new DataTable();
            ViewState["Customers"] = null;
            if (!this.IsPostBack)
            {
                    con.Open();
                    string select_ques = "select id,name from m_ess;";
                    MySqlCommand cmd = new MySqlCommand(select_ques, con);
                    MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
                   
                    DataSet ds = new DataSet();
                    adapter.Fill(dt);
                GV_ques.DataSource = ViewState["Customers"] == null ? dt: ViewState["Customers"] as DataTable;
                    GV_ques.DataBind();
                    con.Close();
                GV_ques.HeaderRow.Cells[1].Visible = false;
            }
            else
            {
                BT_Sort_Click(sender, e);
            }
        }
        protected void BindGrid()
        {
            GV_ques.DataSource = (DataTable)ViewState["Customers"];
            GV_ques.DataBind();
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

        private DataTable CreateTableColomn()
        {
            DataTable dt_ques = new DataTable();
            dt_ques.Columns.Add("id");
            dt_ques.Columns.Add("name");
            return dt_ques;
        }
        private DataTable GetGridViewData()
        {
            DataTable dt = new DataTable();
            if (ViewState["Customers"] == null)
            {
                dt = CreateTableColomn();
                foreach (GridViewRow row in GV_ques.Rows)
                {
                    Label lbl_id = (row.FindControl("lblcT") as Label);
                    //Label lbl_name = (row.FindControl("lbl_name") as Label);
                    TextBox lbl_name = (row.FindControl("txt_name") as TextBox);

                    DataRow dr = dt.NewRow();
                    dr[0] = lbl_id.Text;
                    dr[1] = lbl_name.Text;
                    dt.Rows.Add(dr);
                }
            }
            else
            {
                dt = ViewState["Customers"] as DataTable;
            }
                
            return dt;
        }

        protected void BT_Sort_Click(object sender, EventArgs e)
        {
            DataTable dt = GetGridViewData();
            if (ViewState["Customers"] != null)
            {
                var dr_copy = dt.NewRow();
                int before_index = Convert.ToInt32(HF_beforeSortIndex.Value) - 1;
                int after_index = Convert.ToInt32(HF_afterSortIndex.Value) - 1;
                DataRow dr = dt.Rows[before_index];
                dr_copy.ItemArray = dr.ItemArray.Clone() as object[];
                dt.Rows.RemoveAt(before_index);
                dt.Rows.InsertAt(dr_copy, after_index);

                //DataTable dt_SyohinOriginal = GetGridViewData();
                DataTable dt_SyohinOriginal = new DataTable();
                dt_SyohinOriginal = dt;
                ViewState["Customers"] = dt_SyohinOriginal;
                GV_ques.DataSource = dt_SyohinOriginal;
                GV_ques.DataBind();
                updpnl.Update();
            }
            else
            {
                ViewState["Customers"] = dt;
            }
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
            //TextBox name = GV_ques.Rows[e.RowIndex].FindControl("txt_name") as TextBox;
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

        protected void lnkbtnShiireEdit_Click(object sender, EventArgs e)
        {
            GridViewRow gvrow = (sender as LinkButton).NamingContainer as GridViewRow;
            (gvrow.FindControl("txt_name") as TextBox).CssClass = "displayTxt";
            (gvrow.FindControl("lbl_name") as TextBox).CssClass = "displayNone";
        }
    }
}