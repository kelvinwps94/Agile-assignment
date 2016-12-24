<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerReserve.aspx.cs" Inherits="EzCabAssignment.CustomerReserve" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <style type="text/css">
        .Background {
            position: fixed;
            top: 0px;
            bottom: 0px;
            left: 0px;
            right: 0px;
            overflow: hidden;
            padding: 0;
            margin: 0;
            background-color: #F0F0F0;
            filter: alpha(opacity=80);
            opacity: 0.8;
            z-index: 100000;
        }

        .Progress {
            position: fixed;
            top: 10%;
            left: 10%;
            height: 80%;
            width: 80%;
            background-image: url('scripts/ajax_loader_gray_350.gif');
            background-repeat: no-repeat;
            background-position: center;
            z-index: 100001;
        }

        .auto-style1 {
            width: 253px;
        }

        .auto-style2 {
            width: 253px;
            height: 20px;
        }

        .auto-style3 {
            height: 20px;
            width: 627px;
        }

        .auto-style4 {
            width: 627px;
        }

        .modalBackground {
            background-color: Grey;
            filter: alpha(opacity=80);
            opacity: 0.8;
            z-index: 10000;
        }

        .auto-style5 {
            width: 253px;
            height: 27px;
        }

        .auto-style6 {
            height: 27px;
            width: 627px;
        }

        .auto-style7 {
            width: 253px;
            height: 225px;
        }

        .auto-style8 {
            width: 627px;
            height: 225px;
        }
        .auto-style9 {
            width: 253px;
            height: 48px;
        }
        .auto-style10 {
            width: 627px;
            height: 48px;
        }

        .container {
            padding: 80px 120px;
        }

        .person {
            border: 10px solid transparent;
            margin-bottom: 25px;
            width: 80%;
            height: 80%;
            opacity: 0.7;
        }

            .person:hover {
                border-color: #f1f1f1;
            }

        .inputText {
            width: 100%;
            padding: 7px 20px;
            margin: 3px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
    </style>



</head>
<body>
    <div class="row">
        <div class="col-sm-2"></div>
        <div class="col-sm-8">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <img src="scripts/photo/Logo.png" class="auto-style9" height="60" width="194" />
                    </div>
                </div>
            </nav>
        </div>

        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>

        <div>
            RESERVATION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            
         
&nbsp;
            <button type="button" onclick="loadDoc2()" class="btn btn-default">New Reservation</button>&nbsp;
            <script>
                function loadDoc2() {
                    location.reload();
                }
</script>
            <button type="button" onclick="loadDoc()" class="btn btn-default">Favourite</button>&nbsp;
            <script>
                function loadDoc() {
                    //2) get memberid from the new label
                    var id = document.getElementById("Label2").innerText;
                    var urlToGo = "favourite.aspx?memberid=" + id;
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (xhttp.readyState == 4 && xhttp.status == 200) {
                            document.getElementById("UpdatePanel7").innerHTML = xhttp.responseText;
                            document.getElementById("UpdatePanel7").style.display = "inline";
                            document.getElementById("UpdatePanel8").style.display = "none";
                            document.getElementById("UpdatePanel5").style.display = "none";
                        }
                    };
                    
                    xhttp.open("GET", urlToGo, true);
                    xhttp.send();
                }
</script>
            <button type="button" onclick="loadDoc1()" class="btn btn-default">History</button>&nbsp;
            <script>
                function loadDoc1() {
                    //2) get memberid from the new label
                    var id = document.getElementById("Label2").innerText;
                    var urlToGo = "history.aspx?memberid=" + id;
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (xhttp.readyState == 4 && xhttp.status == 200) {
                            document.getElementById("UpdatePanel8").innerHTML = xhttp.responseText;
                            document.getElementById("UpdatePanel8").style.display = "inline";
                            document.getElementById("UpdatePanel7").style.display = "none";
                            document.getElementById("UpdatePanel5").style.display = "none";
                        }
                    };
                    xhttp.open("GET", urlToGo, true);
                    xhttp.send();
                }
</script>
            
            
    </form>
</body>
</html>
