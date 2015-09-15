using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox2.Text = null;
        Label1.Text = null;
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox2.Text = null;
        Label1.Text = null;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        Label1.Text = null;
        TextBox2.Text = null;
        String str = TextBox1.Text;
        double num = Double.Parse(str);
        double convert_num;
        
        double val1 = double.Parse(DropDownList1.SelectedItem.Value);
        double val2 = double.Parse(DropDownList2.SelectedItem.Value);

        if (val1 == val2)
        {
            Label1.Text = "No conversion needed!";
            TextBox2.Text = TextBox1.Text;
            return;
        }
        else
        {
            convert_num = num * val1 / val2;
            TextBox2.Text = convert_num.ToString();
            return;
        }
        
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Modify.aspx");
    }
}