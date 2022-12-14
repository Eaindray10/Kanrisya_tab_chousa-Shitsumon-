﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KanrisyaTab.aspx.cs" Inherits="Kanrisya_Tab_Chousa.KanrisyaTab" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/jquery.min.js"></script>
    <script src="../Scripts/popper.min.js"></script>
    <link href="../Styles/bootstrap.min.css" rel="stylesheet" />
    <link href="../Styles/bootstrap-icons.css" rel="stylesheet" />
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

        .font {
            font-size: 14px;
            color: #000000;
        }

        #home-tab {
            font-family: 'Inter';
            font-style: normal;
            font-weight: 700;
            font-size: 14px;
            line-height: 17px;
            /* identical to box height */
            color: #000000;
        }

        #lbl_ques2 {
            margin-left: 27px;
        }

        #lbl_ques3 {
            margin-left: 37px;
        }

        #lbl_ques4 {
            margin-left: 36px;
        }

        #lbl_ques5 {
            margin-left: 34px;
        }

        .selectedRow {
            box-sizing: border-box;
            background-color: #DFDFDF;
            border-radius: 10px;
            height: 24px;
            border: 1px solid #CBCBCB;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.25);
            padding-left: 14px;
        }

        .rbColor {
            border-style: none !important;
            border-color: transparent;
        }

        .displayNone {
            display: none;
        }

        .displayTxt {
            display: block;
        }
    </style>
    <script type="text/javascript">
        $(function () {

            //window.onload = function () {

            //    // If sessionStorage is storing default values (ex. name), exit the function and do not restore data
            //    if (sessionStorage.getItem('name') == "name") {
            //        return;
            //    }

            //    // If values are not blank, restore them to the fields
            //    var id = sessionStorage.getItem('id');
               
            //    //if (name !== null) $('#inputName').val(name);

            //    var name = sessionStorage.getItem('name');
            //    //if (email !== null) $('#inputEmail').val(email);
            //    //alert(id + "\n" + name);
            //}

            // Before refreshing the page, save the form data to sessionStorage
            window.onbeforeunload = function () {
                <%--$("#<%=GV_ques.ClientID%> tr").each(function () {
                    var row = $(this).closest("tr");
                    //Determine the Row Index.
                    var index = (row[0].rowIndex - 1);
                    sessionStorage.setItem("id", $("#GV_ques_lblcT_" + index).val());
                    sessionStorage.setItem("name", $("#GV_ques_lbl_name_" + index).val());
                });--%>

            }

            //var arr_index = [];
            //var arr_name = [];

            //function setData(index, name) {
            //    arr_index.push(index);
            //    arr_name.push(name);
            //    sessionStorage("arr_index", arr_index);
            //}

            $("[id*=GV_ques]").sortable({
                items: 'tr:not(tr:first-child)',
                cursor: 'pointer',
                axis: 'y',
                dropOnEmpty: false,
                start: function (e, ui) {
                    ui.item.addClass("selected");
                    ui.item.addClass("rbColor");
                    $(ui.item).find(".row_item").addClass("selectedRow");
                    document.getElementById("<%=HF_beforeSortIndex.ClientID%>").value = ui.item.index();
            var ind = (ui.item.index() - 1);
            var name = $("[id*=GV_ques] tr").find("#GV_ques_lbl_name_" + ind).html();
            sessionStorage.setItem("r_name", name);
        },
        stop: function (e, ui) {
            ui.item.removeClass("selected");
            ui.item.removeClass("rbColor");
            $(ui.item).find(".row_item").removeClass("selectedRow");
            document.getElementById("<%=HF_afterSortIndex.ClientID%>").value = ui.item.index();
            sessionStorage.setItem("r_index", (ui.item.index() - 1));
            //setData(sessionStorage.getItem("r_index"), sessionStorage.getItem("r_name"));
            //alert(arr_index + "\n" + arr_name);
            //alert(sessionStorage.getItem("r_index") + "\n" + sessionStorage.getItem("r_name"));
            document.getElementById("<%=BT_Sort.ClientID%>").click();
                },
                receive: function (e, ui) {
                    $(this).find("tbody").append(ui.item);
                }
            });
            $('#GV_ques tr').click(function () {
                var row = $(this).closest("tr");
                //Determine the Row Index.
                var index = (row[0].rowIndex - 1);

                //alert(index + " " + $("#GV_ques_txt_name_" + index).val() + "\n" + $("#GV_ques_lbl_name_" + index).val());
                if ($("#GV_ques_txt_name_" + index).hasClass("displayNone")) {
                    $("#GV_ques_txt_name_" + index).removeClass("displayNone");
                    $("#GV_ques_txt_name_" + index).addClass("displayTxt");
                    $("#GV_ques_lbl_name_" + index).addClass("displayNone");
                    $("#GV_ques_lbl_name_" + index).removeClass("displayTxt");
                    $("#GV_ques_txt_name_" + index).focus();
                }

                $("#GV_ques_txt_name_" + index).focusout(function () {
                    var text = $(this).val();
                    $("#GV_ques_txt_name_" + index).removeClass("displayTxt");
                    $("#GV_ques_txt_name_" + index).addClass("displayNone");
                    $("#GV_ques_lbl_name_" + index).removeClass("displayNone");
                    $("#GV_ques_lbl_name_" + index).addClass("displayTxt");
                    $("#GV_ques_lbl_name_" + index).html(text);
                    //setData(index, text);
                });
            });
        });
</script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
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
                                <asp:UpdatePanel ID="updpnl" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                    <ContentTemplate>
                            <asp:GridView ID="GV_ques" runat="server" BorderColor="#AAAAAA"   Width="820px" AutoGenerateColumns="False"  HtmlEncode="false" CellPadding="4" AllowSorting="True" CssClass="RowHover GridViewStyle" BackColor="White" BorderStyle="None" BorderWidth="0.5px" ForeColor="Black" GridLines="Horizontal"
                                OnRowEditing="GV_ques_RowEditing" OnRowUpdating="GV_ques_RowUpdating" OnRowCancelingEdit="GV_ques_RowCancelingEdit">
                               <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle Height="34px" Width="820px" BorderWidth="0.5px" />
                                <HeaderStyle CssClass="displayNone" />
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
                                                 
                                                  <asp:Panel ID="Panel2" runat="server" >
                                                      <div>
                                                          <asp:Label runat="server" ID="lbl_name" CssClass="displayTxt" Text='<%# Bind("name") %>' Font-Underline="false" Font-Size="13px"  CommandArgument='<%# Container.DataItemIndex %>'  />
                                                <asp:TextBox ID="txt_name" runat="server" Text='<%# Bind("name") %>' CssClass="displayNone tbname"></asp:TextBox>
                                                      </div>
                                                      </asp:Panel>
                                                
                                                <asp:Panel ID="PopupMenu1" runat="server" CssClass="modalPopup dropdown-menu fontcss " aria-labelledby="dropdownMenuButton" Style="display: none; min-width: 1rem; width: 6rem; margin-left: 5px;">
                                                     <asp:LinkButton ID="imgbtnCopy" runat="server" CssClass="btn-icons" CommandName="Edit" CommandArgument="<%# Container.DataItemIndex %>" >
                                                  <i class="bi bi-trash-fill"></i>
                                                </asp:LinkButton>
                                                    <%--<asp:LinkButton ID="lnkbtnShiireEdit" class="dropdown-item" runat="server" Text='編集' Style="margin-right: 10px; font-size:13px;"></asp:LinkButton>
                                                    <asp:LinkButton ID="lnkbtnShiireDelete_Click" class="dropdown-item" runat="server" Text='削除' Style="margin-right: 10px;font-size:13px;"></asp:LinkButton>--%>
                                                </asp:Panel>
                                                <asp:HoverMenuExtender ID="hmeBumonListEdit" runat="server" TargetControlID="Panel2" 
                                                PopupControlID="PopupMenu1" PopupPosition="Right">
                                            </asp:HoverMenuExtender>
                                            </div>
                                        </ItemTemplate>
                                        <ItemStyle Width="820px"/>
                                    </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:HiddenField ID="HF_beforeSortIndex" runat="server" />
                                    <asp:HiddenField ID="HF_afterSortIndex" runat="server" />
                                    <asp:Button ID="BT_Sort" runat="server" Text="Button" OnClick="BT_Sort_Click" style="display:none;" />
                             </div>
                     </div>
           </div>
        </div>
    </div>
  </form>
</body>
</html>
