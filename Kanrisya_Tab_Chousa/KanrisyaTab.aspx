<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KanrisyaTab.aspx.cs" Inherits="Kanrisya_Tab_Chousa.KanrisyaTab"  EnableEventValidation = "false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/jquery.min.js"></script>
    <script src="../Scripts/popper.min.js"></script>
    <link href="../Styles/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/jquery-ui.min.js"></script>
    <style type="text/css">
        .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
            border-top: #FFFFFF;
            border-right: #FFFFFF;
            border-left: #FFFFFF;
            border-bottom: 2px solid #00B12C;
        }
        .font{
            font-size:14px;
            color:#000000;
        }
        #home-tab{
            font-family: 'Inter';
            font-style: normal;
            font-weight: 700;
            font-size: 14px;
            line-height: 17px;
            /* identical to box height */
            color: #000000;
        }
        #lbl_ques2{
            margin-left:27px;
        }
        #lbl_ques3{
            margin-left:37px;
        }
        #lbl_ques4{
            margin-left:36px;
        }
        #lbl_ques5{
            margin-left:34px;
        }

        .rowHover{
            background-color:#DFDFDF;
            border-radius:20px;
            height:24px;
            border:1px #CBCBCB;
        }

/*table.RowHover tr:hover td {
    background: rgb(235, 235, 245) !important;
}*/
    </style>
    <script type="text/javascript">
$(function () {
    $("[id*=GV_ques]").sortable({
        items: 'tr:not(tr:first-child)',
        cursor: 'pointer',
        axis: 'y',
        dropOnEmpty: false,
        start: function (e, ui) {
            ui.item.addClass("selected");
            ui.item.addClass("rowHover");
        },
        stop: function (e, ui) {
            ui.item.removeClass("selected");
            ui.item.removeClass("rowHover");
        },
        receive: function (e, ui) {
            $(this).find("tbody").append(ui.item);
        }

    });
});
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <ul class="nav nav-tabs" id="myTab" role="tablist" style="margin-left:72px;margin-top:97px;">
            <li class="nav-item">
                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">管理者</a>
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane container fade show active font" id="home" role="tabpanel" aria-labelledby="home-tab" style="margin-top:26px;margin-left:43px;">
                <asp:Label ID="lbl_title" runat="server" CssClass="font">採点基準</asp:Label>
                <div class="font" style="margin-top:9px;">
                    <asp:Label ID="lbl_ques1" runat="server"  Text="1. 全く当てはまらない"></asp:Label>
                    <asp:Label ID="lbl_ques2" runat="server" Text="2. あまり当てはまらない"></asp:Label>
                    <asp:Label ID="lbl_ques3" runat="server" Text="3. どちらとも言えない"></asp:Label>
                    <asp:Label ID="lbl_ques4" runat="server" Text="4. おおむね当てはまる"></asp:Label>
                    <asp:Label ID="lbl_ques5" runat="server" Text="5. 大いに当てはまる"></asp:Label>
                </div>
                 <div style="overflow-x: auto; width: 100% !important;">
                                <div style="background-color: white; width: 821px; overflow-y: auto; overflow-x: auto;" display: inline-block !important;">
                            <asp:GridView ID="GV_ques" runat="server" BorderColor="#CCCCCC" Width="820px" AutoGenerateColumns="False"  HtmlEncode="false" CellPadding="4" AllowSorting="True" CssClass="RowHover GridViewStyle" BackColor="White" BorderStyle="None" BorderWidth="1px" ForeColor="Black" GridLines="Horizontal"
                                OnRowEditing="GV_ques_RowEditing" OnRowUpdating="GV_ques_RowUpdating">
                                
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle BorderColor="#AAAAAA" Height="34px" Width="820px" />
                                <Columns>
                                    <asp:TemplateField HeaderText="仕入先コード"  Visible="False">
                                        <ItemTemplate>
                                            <div class="grip" style="text-align: left; padding-right: 4px; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical; word-break: break-all;">
                                                
                                                 <asp:Label runat="server" ID="lblcT" Text='<%# Bind("id") %>' Font-Underline="false" Font-Size="13px"  CommandArgument='<%# Container.DataItemIndex %>'  />
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <div class="grip" style="text-align: left; padding-right: 4px; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical; word-break: break-all;">
                                                 <asp:Label runat="server" ID="lbl_name" Text='<%# Bind("name") %>' Font-Underline="false" Font-Size="13px"  CommandArgument='<%# Container.DataItemIndex %>'  />
                                            </div>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txt_name" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemStyle Width="820px"/>
                                    </asp:TemplateField>
                                    <%--<asp:TemplateField>
                                        <ItemTemplate>
                                              <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="編集" CssClass="JC09GridGrayBtn" Width="50px" Height="28px" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="更新" CssClass="JC09GridGrayBtn" Width="50px" Height="28px" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>--%>

                                    <%--<asp:CommandField ShowEditButton="True" />--%>

                                    </Columns>
                                </asp:GridView>

                                    <%-- Cell Edit Test --%>
                                    <%--<asp:GridView ID="GridView1" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
                                        runat="server" AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound"
                                        OnRowEditing="OnRowEditing" OnSelectedIndexChanged="index_changes">
                                        <Columns>
                                            <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="150" />
                                            <asp:BoundField DataField="Country" HeaderText="Country" ItemStyle-Width="150" />
                                            <asp:TemplateField>
                                            <EditItemTemplate>
                                                <asp:LinkButton Text="Update" runat="server" OnClick = "OnUpdate" />
                                                <asp:LinkButton Text="Cancel" runat="server" OnClick = "OnCancel" />
                                            </EditItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>--%>


                                    </div>
                     </div>
                
           </div>
        </div>
    </div>
  </form>
</body>
    
</html>
