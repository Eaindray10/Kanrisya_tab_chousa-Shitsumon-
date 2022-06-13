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

        .selectedRow{
            box-sizing: border-box;
            background-color:#DFDFDF;
            border-radius:10px;
            height:24px;
            border:1px solid #CBCBCB;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.25);
            padding-left:14px;
        }
        .rbColor{
            border-style:none;
            border-color:transparent;
        }
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
            ui.item.addClass("rbColor");
            $(ui.item).find(".row_item").addClass("selectedRow");
        },
        stop: function (e, ui) {
            ui.item.removeClass("selected");
            ui.item.removeClass("rbColor");
            $(ui.item).find(".row_item").removeClass("selectedRow");
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
                 <div style="overflow-x: auto; width: 100% !important;padding-top:20px;">
                                <div style="background-color: white; width: 821px; overflow-y: auto; overflow-x: auto;" display: inline-block !important;">
                            <asp:GridView ID="GV_ques" runat="server" BorderColor="#AAAAAA"  Width="820px" AutoGenerateColumns="False"  HtmlEncode="false" CellPadding="4" AllowSorting="True" CssClass="RowHover GridViewStyle" BackColor="White" BorderStyle="None" BorderWidth="1px" ForeColor="Black" GridLines="Horizontal"
                                OnRowEditing="GV_ques_RowEditing" OnRowUpdating="GV_ques_RowUpdating" OnRowCancelingEdit="GV_ques_RowCancelingEdit" OnRowDataBound="OnRowDataBound">
                               <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle Height="34px" Width="820px" />
                                <%--<RowStyle BorderColor="#AAAAAA" Height="34px" Width="820px" />--%>
                                <Columns>
                                    <asp:TemplateField Visible="False">
                                        <ItemTemplate>
                                            <div id="div_code" style="text-align: left; padding-right: 4px; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical; word-break: break-all;">
                                                 <asp:Label runat="server" ID="lblcT" Text='<%# Bind("id") %>' Font-Underline="false" Font-Size="13px"  CommandArgument='<%# Container.DataItemIndex %>'  />
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <div class="row_item" style="text-align: left; padding-right: 4px; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical; word-break: break-all;">
                                                
                                                 <%--<asp:LinkButton ID="txt_name" runat="server" CommandArgument='<%# Eval("name","{0}") %>' Text='<%# Bind("name","{0}") %>' Font-Underline="false" CommandName="Edit" Font-Size="13px" style="display: none;"></asp:LinkButton>--%>
                                                
                                                <asp:Label runat="server" ID="lbl_name" Text='<%# Bind("name") %>' Font-Underline="false" Font-Size="13px"  CommandArgument='<%# Container.DataItemIndex %>'  />
                                            </div>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txt_name" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemStyle Width="820px"/>
                                    </asp:TemplateField>
                                    <asp:TemplateField>  
                                        <ItemTemplate>  
                                            <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" />  
                                        </ItemTemplate>  
                                        <EditItemTemplate>  
                                            <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update"/>  
                                            <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel"/>  
                                        </EditItemTemplate>  
                                    </asp:TemplateField>  
                                  
                                    </Columns>
                                </asp:GridView>
                                    </div>
                     </div>
           </div>
        </div>
    </div>
  </form>
</body>
    
</html>
