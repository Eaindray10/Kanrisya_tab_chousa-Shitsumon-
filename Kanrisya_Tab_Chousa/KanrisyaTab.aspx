<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KanrisyaTab.aspx.cs" Inherits="Kanrisya_Tab_Chousa.KanrisyaTab" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/jquery.min.js"></script>
    <script src="../Scripts/popper.min.js"></script>
    <link href="../Styles/bootstrap.min.css" rel="stylesheet" />
   <%-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>--%>
    <%--<style>
        .nav a{
              float: left;
              display: block;
              color: black;
              text-align: center;
              padding: 14px 16px;
              text-decoration: none;
              font-size: 17px;
              border-bottom: 3px solid transparent;
        }
        .nav a:active{
            border-bottom: 3px solid red;
        }
        .nav a:hover{
            border-bottom: 3px solid red;
        }
    </style>--%>
</head>
<body>
    <form id="form1" runat="server">
      <%--  <div>
            <nav class="nav">
              <a class="nav-link active" href="#" data-bs-target="#Shitsumon.aspx">Active</a>
              <a class="nav-link" href="#">Link</a>
              <a class="nav-link" href="#">Link</a>
            </nav>
        </div>--%>
        <%--<nav>--%>
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
        #lbl_title{
            margin-top:148px;
        }
    </style>
    <br />
    <div class="container">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">管理者</a>
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane container fade show active" id="home" role="tabpanel" aria-labelledby="home-tab" style="margin-top:26px;">
                <asp:Label ID="lbl_title" runat="server" CssClass="font">採点基準</asp:Label>
            </div>
        </div>
    </div>
  </form>
</body>
    
</html>
