
Partial Class ShowWindow_DefaultEX2
    Inherits System.Web.UI.Page

    Dim ClassName As String
    Dim ClassValue As String
    Dim CurrentPage As Long
    Dim Gender As String
    Dim ItemsPerPage As Integer = 16
    Dim TotalItems As Integer
    Dim conDefaultMenBrand As String
    Dim conDefaultWomenBrand As String

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender

        ViewState("CN") = ClassName
        ViewState("CV") = ClassValue
        ViewState("CP") = CurrentPage
        ViewState("GD") = Gender

    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim strServerName As String = Request.ServerVariables("SERVER_NAME")

        Page.Title = strServerName

        Dim eoMenu As EO.Web.Menu = Master.FindControl("SlideMenu1")

        Page.Title = "TrendyRags.com"
        If IsPostBack() Then
            ClassName = ViewState("CN")
            ClassValue = ViewState("CV")
            CurrentPage = ViewState("CP")
            Gender = ViewState("GD")
        Else
            ClassName = Request("CN")
            ClassValue = Request("CV")
            CurrentPage = Request("CP")
            Gender = Request("GD")

            ClassName = "Exclusive"

            Me.lblClassName.Text = ClassName

            If getTotalItems() > 0 Then
                Call initList()
            Else
                Response.Redirect("~/Default.aspx")
            End If
        End If

        Session.Item("ListingClass") = "Exclusive"

        Call renderPage()
        Session.Item("CurrentPage") = "~/ShowWindow/DefaultEX2.aspx?CN=Exclusive"
        Page.Title = strServerName + " : Exclusive"

    End Sub

    Private Sub renderPage()
        Dim strList As String = ""
        Dim nTotalPages, ni As Integer

        TotalItems = getTotalItems()
        nTotalPages = Int(TotalItems / ItemsPerPage) + 1

        For ni = 1 To nTotalPages

            If ni = CurrentPage Then
                strList += "<a href=""DefaultEX.aspx?CN=Exclusive"">&nbsp;<font size=""3"">[<b>" & Trim(Str(ni)) & "</b>]</font>&nbsp;</a>"
            Else
                strList += "<a href=""DefaultEX.aspx?CN=Exclusive"">&nbsp;<font size=""2"">" & Str(ni) & "</font>&nbsp;</a> "
            End If
        Next
        Me.ltrListPage.Text = strList

    End Sub

    Private Sub initList()

        Me.ltrTotalItems.Text = getTotalItems() + " item(s)"
        Me.lblClassName.Text = ClassValue
        Call listProduct()

    End Sub

    Private Function getTotalItems() As String
        Dim lngResult As Long = 0

        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commHowMany As Data.SqlClient.SqlCommand
        Dim rdHowMany As Data.SqlClient.SqlDataReader
        Dim sqlHowMany As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()
        sqlHowMany = "SELECT Count(ProductNo) as HowMany FROM ProductMaster WHERE (ExclusiveSales='Exclusive') And (Status='Live') And (WebDisplay='YES')  "

        commHowMany = New Data.SqlClient.SqlCommand
        commHowMany.CommandText = sqlHowMany
        commHowMany.Connection = connTR
        rdHowMany = commHowMany.ExecuteReader()

        rdHowMany.Read()
        lngResult = rdHowMany("HowMany")
        rdHowMany.Close()
        connTR.Close()

        Return lngResult.ToString("#,##0")

    End Function

    Private Sub listProduct()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commList As Data.SqlClient.SqlCommand
        Dim rdList As Data.SqlClient.SqlDataReader
        Dim sqlList As String = ""
        Dim strLiteral As String = ""
        Dim nCounter As Integer = 0
        Dim strProductNo, strFolderName, strImageRep, strDiv As String
        Dim strUserClass As String = Session.Item("Class").ToString.ToUpper
        Dim strWholesaleLevel As String = Session.Item("WholesaleLevel").ToString.ToUpper

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        '******************************
        '*
        '*      sqlBCast = "SELECT TOP " & perPage & " * FROM BC_Master WHERE BCNumber NOT IN "
        '*      sqlBCast += " (SELECT TOP " & ((CInt(CurrentPage) - 1) * perPage) & " BCNumber FROM BC_Master Order By DateSchedule DESC ) "
        '*      sqlBCast += "   Order BY DateSchedule Desc "
        '*
        '******************************
        If CurrentPage < 1 Then
            CurrentPage = 1
        End If
        sqlList = "SELECT  * FROM ProductMaster "
        sqlList += "                 WHERE ( (ExclusiveSales='Exclusive') And (Status='Live') And (WebDisplay='YES') )  "
        sqlList += "                 ORDER By Gender Desc, BrandName, DisplayOrder Desc, ProductNo  "

        commList = New Data.SqlClient.SqlCommand
        commList.CommandText = sqlList
        commList.Connection = connTR
        rdList = commList.ExecuteReader()

        strLiteral += "<Table border=""0"" CellSpacing=""0"" Cellpadding=""0"">"
        strDiv = ""
        Do While rdList.Read()
            If (nCounter Mod 8) = 0 Then
                strLiteral += "<Tr>"
            End If

            strProductNo = rdList("ProductNo")
            strFolderName = getFolderName(strProductNo)
            strImageRep = getImageRep(strProductNo)

            strLiteral += "<td width=100 align=""center"" valign=""top"" style=""padding-left:1px;margin-bottom:10px;"">"
            strLiteral += "<a href=""Goods.aspx?PN=" + strProductNo + """>"
            strLiteral += "<img src=""" & strFolderName & "Rep/" & strImageRep & """ border=""0"" width=""100"" oncontextmenu=""return false"" ><br>"
            If rdList("NewItem").ToString = "YES" Then
                strLiteral += "<font color=red><b>New </b></font>&nbsp;"
            End If

            strLiteral += rdList("ProductName") & "<br>"
            Select Case strUserClass
                Case "WHOLESALE"
                    strLiteral += "<span style=""color:#669999;"">" + Format(rdList("PriceRetail"), "$#,##0.00") + "/R</span>" + "<br>"
                    Select Case strWholesaleLevel
                        Case "A"
                            strLiteral += "<span style=""color:#FFCC00;"">" + Format(rdList("PriceWholesale1"), "$#,##0.00") + "/W</span>" + "</a><br><br>"
                        Case "B"
                            strLiteral += "<span style=""color:#FFCC00;"">" + Format(rdList("PriceWholesale2"), "$#,##0.00") + "/W</span>" + "</a><br><br>"
                        Case "C"
                            strLiteral += "<span style=""color:#FFCC00;"">" + Format(rdList("PriceWholesale3"), "$#,##0.00") + "/W</span>" + "</a><br><br>"
                        Case "D"
                            strLiteral += "<span style=""color:#FFCC00;"">" + Format(rdList("PriceWholesale4"), "$#,##0.00") + "/W</span>" + "</a><br><br>"
                        Case "E"
                            strLiteral += "<span style=""color:#FFCC00;"">" + Format(rdList("PriceWholesale5"), "$#,##0.00") + "/W</span>" + "</a><br><br>"
                        Case Else
                            strLiteral += "<span style=""color:#FFCC00;"">Wholesale:$xxx.xx</span></a><br><br>"
                    End Select
                Case "USER"
                    strLiteral += "<span style=""color:#FE7901;"">" + Format(rdList("PriceRetail"), "$#,##0.00") + "</span></a><br><br>"
                Case "ADMIN"
                    strLiteral += "<span style=""color:#FE7901;"">" + Format(rdList("PriceRetail"), "$#,##0.00") + "</span></a><br><br>"
                Case "PREWHOLESALE"
                    strLiteral += "<span style=""color:#669999;"">" + Format(rdList("PriceRetail"), "$#,##0.00") + "/R</span><br>"
                    strLiteral += "<span style=""color:#FFCC00;"">$xxx.xx/W</span></a><br><br>"
                Case Else
                    strLiteral += "<span style=""color:#FE7901;"">" + Format(rdList("PriceRetail"), "$#,##0.00") + "</span></a><br><br>"
            End Select
            strLiteral += "</td>"

            If (nCounter Mod 8) = 7 Then
                strLiteral += "</Tr>"
            End If
            nCounter += 1
        Loop
        If (nCounter Mod 8) > 0 Then
            strLiteral += "</Tr>"
        End If
        strLiteral += "</Table>"

        Me.ltrList.Text = strLiteral
        'Me.ltrDiv.Text = strDiv

        rdList.Close()
        connTR.Close()

    End Sub

    Private Function getFolderName(ByVal ProductNo As String) As String
        Dim strResult As String = ""

        strResult += "../Pictures/"
        strResult += Left(ProductNo, 2) + "/" + ProductNo + "/"

        Return strResult
    End Function

    Private Function getImageRep(ByVal ProductNo As String) As String
        Dim strResult As String = ""

        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commImage As Data.SqlClient.SqlCommand
        Dim rdImage As Data.SqlClient.SqlDataReader
        Dim sqlImage As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlImage = "SELECT * FROM Pictures WHERE ProductNo=@ProductNo And Usage='Rep' "

        commImage = New Data.SqlClient.SqlCommand
        commImage.CommandText = sqlImage
        commImage.Connection = connTR
        commImage.Parameters.AddWithValue("@ProductNo", ProductNo)
        rdImage = commImage.ExecuteReader()
        rdImage.Read()
        strResult = rdImage("FileName")
        rdImage.Close()
        connTR.Close()

        Return strResult
    End Function

    Private Sub MessageBox(ByVal msg As String)
        Dim lbl As New Label()

        lbl.Text = "<script language='javascript'>" & Environment.NewLine & _
                   "window.alert('" + msg + "')</script>"

        Page.Controls.Add(lbl)

    End Sub


    Protected Sub lbtnViewAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbtnViewAll.Click

        Response.Redirect("DefaultEX.aspx?CN=Exclusive")

    End Sub

End Class
