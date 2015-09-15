using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Modify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownList1.SelectedIndex = 0;
        }
    }
    protected void Add_Click(object sender, EventArgs e)
    {
        Label3.Text = null;
        Label4.Text = null;
        if (TextBox1.Text == "" && TextBox2.Text == "")
        {
            Label4.Text = null;
            Label3.Text = "Missing Unit name and conversion factor! please add an unit and factor.";
            return;
        }

        if (TextBox1.Text == "")
        {
            Label4.Text = null;
            Label3.Text = "Missing Unit name! Please add an unit.";
            return;
        }

        if (TextBox2.Text == "")
        {
            Label4.Text = null;
            Label3.Text = "Missing conversion factor! Please add a factor.";
            return;
        }

        if (DropDownList1.Items.FindByText(TextBox1.Text) != null)
        {
            Label4.Text = null;
            Label3.Text = "The Unit already exist!";
            return;
        }

        if (TextBox1.Text != "" && TextBox2.Text != "")
        { 
            SqlDataSource1.Insert();
            TextBox1.Text = null;
            TextBox2.Text = null;
            Label3.Text = "Added successfully!";
            return;
        }
        
        
        //Label3.Text = DropDownList1.SelectedValue;
    }
    protected void Delete_Click(object sender, EventArgs e)
    {
        Label3.Text = null;
        Label4.Text = null;
        if (DropDownList1.SelectedItem != null)
        {
            SqlDataSource1.Delete();
            Label3.Text = "Deleted successfully!";
            return;
        }
        else
        {
            Label3.Text = "Error! There dropdownlist is empty!";
        }
    }
    protected void Show_Click(object sender, EventArgs e)
    {
        Label3.Text = null;
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        if (dv == null) 
        {
        //handle error
        }
        //The select query has returned the desired row 
        DataRow row = dv.Table.Rows[DropDownList1.SelectedIndex];
        double s = (double)row["Factor"];
        //obtain data from other columns
        Label4.Text = "The factor of the selected unit is " + s.ToString() + "."; //display the name 
        //display or use data from other columns;
        }
}
