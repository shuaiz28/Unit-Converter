<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="_default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Unit Converter</title>
    <style type="text/css">
        .center {
            text-align: center;
        }
        .maindiv {
            margin: auto;
            border-style: solid;
            border-width: 1px;
            width: 800px;
            background-color: #C0C0C0;
            padding: 30px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div class="maindiv">
        <h1 class="center">
        Unit Converter
        </h1>
        <p class="center">
        <asp:TextBox ID="TextBox1" runat="server" Width="250px" ></asp:TextBox>&nbsp;=
        <asp:TextBox ID="TextBox2" runat="server" Width="250px" ReadOnly="True"></asp:TextBox>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="255px" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Unit" DataValueField="Factor">
        </asp:DropDownList>
        &nbsp;&nbsp; <asp:DropDownList ID="DropDownList2" runat="server" style="margin-left: 0px" Width="255px" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Unit" DataValueField="Factor">
        </asp:DropDownList>
        <br />
        <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Conversions]"></asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Convert" Width="150px" />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Modify Database" />
        </p>
    &nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" ></asp:Label>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please input numbers!" ValidationExpression="^-?\d*(\.\d+)?$"></asp:RegularExpressionValidator>
    </div>
    </form>
</body>
</html>
