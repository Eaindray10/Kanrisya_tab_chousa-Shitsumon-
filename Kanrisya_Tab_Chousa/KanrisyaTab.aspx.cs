﻿using MySql.Data.MySqlClient;
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

                //Cell Edit Test
                //DataTable dt = new DataTable();
                //dt.Columns.AddRange(new DataColumn[3] { new DataColumn("Id"), new DataColumn("Name"), new DataColumn("Country") });
                //dt.Rows.Add(1, "John Hammond", "United States");
                //dt.Rows.Add(2, "Mudassar Khan", "India");
                //dt.Rows.Add(3, "Suzanne Mathews", "France");
                //dt.Rows.Add(4, "Robert Schidner", "Russia");
                //dt.PrimaryKey = null;
                //ViewState["dt"] = dt;
                //this.BindGrid();
            }
                
        }

        //protected void BindGrid()
        //{
        //    GridView1.Columns[2].Visible = false;
        //    GridView1.DataSource = ViewState["dt"] as DataTable;
        //    GridView1.DataBind();
        //}
        protected void GV_ques_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            //NewEditIndex property used to determine the index of the row being edited.  
            //GV_ques.EditIndex = e.NewEditIndex;
            //ShowData();
        }
        protected void GV_ques_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update
            //TextBox name = GV_ques.Rows[e.RowIndex].FindControl("txt_name") as TextBox;
            //con = new SqlConnection(cs);
            //con.Open();
            ////updating the record  
            //SqlCommand cmd = new SqlCommand("Update tbl_Employee set Name='" + name.Text + "',City='" + city.Text + "' where ID=" + Convert.ToInt32(id.Text), con);
            //cmd.ExecuteNonQuery();
            //con.Close();
            ////Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            //GridView1.EditIndex = -1;
            ////Call ShowData method for displaying updated data  
            //ShowData();
        }

        //protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Edit$" + e.Row.RowIndex);
        //        e.Row.Attributes["style"] = "cursor:pointer";
        //    }
        //}
        //protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    GridView1.EditIndex = e.NewEditIndex;
        //    this.BindGrid();
        //    GridView1.Rows[e.NewEditIndex].Attributes.Remove("onclick");
        //    GridView1.Columns[2].Visible = true;
        //}
        //protected void index_changes(object sender,EventArgs e)
        //{
        //    GridViewRow row = GridView1.SelectedRow;
        //    int i = row.RowIndex;
        //}
        //protected void OnUpdate(object sender, EventArgs e)
        //{
        //    GridViewRow row = (sender as LinkButton).NamingContainer as GridViewRow;
        //    string name = (row.Cells[0].Controls[0] as TextBox).Text;
        //    string country = (row.Cells[1].Controls[0] as TextBox).Text;
        //    DataTable dt = ViewState["dt"] as DataTable;
        //    dt.Rows[row.RowIndex]["Name"] = name;
        //    dt.Rows[row.RowIndex]["Country"] = country;
        //    ViewState["dt"] = dt;
        //    GridView1.EditIndex = -1;
        //    this.BindGrid();
        //}

        //protected void OnCancel(object sender, EventArgs e)
        //{
        //    GridView1.EditIndex = -1;
        //    this.BindGrid();
        //}
    }
}