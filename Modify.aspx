<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Modify.aspx.cs" Inherits="Modify" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Modify Database</title>
    <style type="text/css">
        .center {
            text-align: center;
        }
        .maindiv {
            margin: auto;
            border-style: solid;
            border-width: 1px;
            width: 600px;
            background-color: #C0C0C0;
            padding: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="maindiv">
        <h1 class="center">
        Modify Database
        </h1>
        <p class="center">
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Unit" DataValueField="Id">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Conversions]" InsertCommand="INSERT INTO Conversions(Unit, Factor) VALUES (@newunit, @newfactor)" DeleteCommand="DELETE FROM Conversions WHERE (Id = @deleteid)">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="deleteid" PropertyName="SelectedValue" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="newunit" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBox2" Name="newfactor" PropertyName="Text" />
                </InsertParameters>
            </asp:SqlDataSource>
            </p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            &nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Text="Please add a new Unit to this box."></asp:Label>
            &nbsp;</p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            &nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Text="Please add a new conversion factor to this box."></asp:Label>
            </p>
        <p class="center">
            <asp:Button ID="Button1" runat="server" OnClick="Add_Click" Text="Add" />
            <asp:Button ID="Button2" runat="server" OnClick="Delete_Click" Text="Delete" />
            <asp:Button ID="Button3" runat="server" OnClick="Show_Click" Text="Show Factor" />
            </p>
        <p class="center">
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
            <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
            </p>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Please input a number in the Factor box!" ValidationExpression="^-?\d*(\.\d+)?$"></asp:RegularExpressionValidator>

    </div>
    </form>
</body>
</html>
