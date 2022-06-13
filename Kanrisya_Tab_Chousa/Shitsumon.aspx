<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shitsumon.aspx.cs" Inherits="Kanrisya_Tab_Chousa.Shitsumon" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" AllowPaging="true"
            PageSize="10">
            <Columns>
                <asp:BoundField  DataField="PersonType" HeaderText="Person Type" />
                <asp:BoundField  DataField="FirstName" HeaderText="First Name" />
                <asp:BoundField  DataField="LastName" HeaderText="Last Name" />
               
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
