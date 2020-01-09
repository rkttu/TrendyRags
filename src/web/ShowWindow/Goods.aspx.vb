
Partial Class ShowWindow_Goods
    Inherits System.Web.UI.Page

    Dim ProductNo As String
    Dim WholesaleSize As String = "Size(Wholesale)"

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender

        ViewState("PN") = ProductNo

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim strServerName As String = Request.ServerVariables("SERVER_NAME")
        Page.Title = strServerName

        If IsPostBack() Then
            ProductNo = ViewState("PN")
        Else
            ProductNo = Request("PN")

            Call getImages(ProductNo)
            Call getSize(ProductNo)
            Call getColor(ProductNo)
            Call getProductInfo(ProductNo)
        End If
        Session.Item("CurrentPage") = "~/ShowWindow/Goods.aspx?PN=" & ProductNo

    End Sub

    Private Sub getImages(ByVal ProductNo As String)
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commImages As Data.SqlClient.SqlCommand
        Dim rdImages As Data.SqlClient.SqlDataReader
        Dim sqlImagesThumb, sqlImagesDetail, sqlImagesRep As String
        Dim strImageRep As String = ""
        Dim aImageThumb(10), aImageDetail(10) As String
        Dim intIndex As Integer = 0
        Dim intThumb As Integer = 0

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        '//
        '// get Image-Thumbnail
        sqlImagesThumb = "SELECT TOP 7 * FROM Pictures WHERE ProductNo=@ProductNo And Usage='Thumb'  Order by DisplayOrder"
        commImages = New Data.SqlClient.SqlCommand
        commImages.CommandText = sqlImagesThumb
        commImages.Connection = connTR
        commImages.Parameters.AddWithValue("@ProductNo", ProductNo)
        rdImages = commImages.ExecuteReader()
        intIndex = 0
        Do While rdImages.Read()
            intIndex += 1
            aImageThumb(intIndex) = rdImages("FileName")
        Loop
        rdImages.Close()

        '//
        '// get Image-Detail
        sqlImagesDetail = "SELECT TOP 7 * FROM Pictures WHERE ProductNo=@ProductNo And Usage='Detail'   Order by DisplayOrder"
        commImages = New Data.SqlClient.SqlCommand
        commImages.CommandText = sqlImagesDetail
        commImages.Connection = connTR
        commImages.Parameters.AddWithValue("@ProductNo", ProductNo)
        rdImages = commImages.ExecuteReader()
        intIndex = 0
        Do While rdImages.Read()
            intIndex += 1
            aImageDetail(intIndex) = rdImages("FileName")
        Loop
        intThumb = intIndex
        rdImages.Close()

        '//
        '// get Image-Rep.
        sqlImagesRep = "SELECT TOP 1 * FROM Pictures WHERE ProductNo=@ProductNo And Usage='Rep' "
        commImages = New Data.SqlClient.SqlCommand
        commImages.CommandText = sqlImagesRep
        commImages.Connection = connTR
        commImages.Parameters.AddWithValue("@ProductNo", ProductNo)
        rdImages = commImages.ExecuteReader()
        rdImages.Read()
        strImageRep = rdImages("FileName")
        rdImages.Close()

        connTR.Close()

        Dim strURL As String = getImageURL(ProductNo)
        Dim strRepImage As String
        strRepImage = "<Img border=0 width=300 src=.." & strURL & "Rep/" & strImageRep & " oncontextmenu=""return false"" >"
        Me.ltrRepImage.Text = strRepImage

        Dim ni As Integer = 0
        Dim strLiteralThumb As String = "<Table border=0>" + Constants.vbCrLf
        strLiteralThumb += "<tr>" + Constants.vbCrLf
        For ni = 1 To intThumb
            strLiteralThumb += "<td>" + Constants.vbCrLf
            strLiteralThumb += "<a href="".." & strURL & "Detail/" & aImageDetail(ni) & """ class=""highslide"" onclick=""return hs.expand(this)"" >"
            strLiteralThumb += "<Img border=0 width=60 src=.." + strURL + "Thumb/" + aImageThumb(ni) + "  oncontextmenu=""return false"" ></a>"
            strLiteralThumb += "</td>" + Constants.vbCrLf
        Next
        strLiteralThumb += "</tr>" + Constants.vbCrLf
        strLiteralThumb += "</Table>"

        Me.ltrThumbnails.Text = strLiteralThumb

    End Sub

    Private Function getImageURL(ByVal ProductNo As String) As String
        Dim strURL As String

        strURL = "/Pictures/" + Left(ProductNo, 2) + "/" + ProductNo + "/"

        Return strURL
    End Function

    Private Sub getSize(ByVal ProductNo As String)
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commSize As Data.SqlClient.SqlCommand
        Dim rdSize As Data.SqlClient.SqlDataReader
        Dim sqlSize As String = ""

        If Session.Item("Class") = "WHOLESALE" Then
            Me.ddlSize.Items.Add(WholesaleSize)
            Me.ddlSize.Text = WholesaleSize
        Else
            connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
            connTR.Open()

            sqlSize = "SELECT * FROM ProductSize WHERE ProductNo=@ProductNo Order by SerialNo "

            commSize = New Data.SqlClient.SqlCommand
            commSize.CommandText = sqlSize
            commSize.Connection = connTR
            commSize.Parameters.AddWithValue("@ProductNo", ProductNo)
            rdSize = commSize.ExecuteReader()
            Do While rdSize.Read()
                Me.ddlSize.Items.Add(rdSize("SizeName"))
            Loop

            rdSize.Close()
            connTR.Close()
        End If

    End Sub

    Private Sub getColor(ByVal ProductNo As String)
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commColor As Data.SqlClient.SqlCommand
        Dim rdColor As Data.SqlClient.SqlDataReader
        Dim sqlColor As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlColor = "SELECT * FROM ProductColor WHERE ProductNo=@ProductNo Order by SerialNo "

        commColor = New Data.SqlClient.SqlCommand
        commColor.CommandText = sqlColor
        commColor.Connection = connTR
        commColor.Parameters.AddWithValue("@ProductNo", ProductNo)
        rdColor = commColor.ExecuteReader()
        Do While rdColor.Read()
            Me.ddlColor.Items.Add(rdColor("ColorName"))
        Loop

        rdColor.Close()
        connTR.Close()

    End Sub

    Private Sub getProductInfo(ByVal ProductNo As String)
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commDetail As Data.SqlClient.SqlCommand
        Dim rdDetail As Data.SqlClient.SqlDataReader
        Dim sqlDetail As String = ""
        Dim strPrice As String = ""
        Dim strUserClass As String = Session.Item("Class").ToString.ToUpper
        Dim strWholesaleLevel As String = Session.Item("WholesaleLevel").ToString.ToUpper
        Dim strMessageWholesale As String = ""
        Dim strURL As String
        Dim strLinesheet1, strLinesheet2, strLinesheet3 As String

        strMessageWholesale = "<b>Wholesale notice</b> : First orders require credit card purchase.  After the first, order your order must be approved by Trendyrags credit department.<br><br>"
        strMessageWholesale += "There is a minimum order of 4 x each size  per product code.<br>"
        strMessageWholesale += "Please call 213-471-2913 if there are any questions."

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlDetail = "SELECT * FROM ProductMaster WHERE ProductNo=@ProductNo "


        commDetail = New Data.SqlClient.SqlCommand
        commDetail.CommandText = sqlDetail
        commDetail.Connection = connTR
        commDetail.Parameters.AddWithValue("@ProductNo", ProductNo)
        rdDetail = commDetail.ExecuteReader()
        rdDetail.Read()
        Me.lblProductName.Text = rdDetail("BrandName")
        Me.ltrBriefDescription.Text = rdDetail("ProductName") + "<br><br>" + rdDetail("ProductNo")
        Me.ltrFullDescription.Text = rdDetail("Description")
        Me.hlnkTellAFriend.NavigateUrl = "../Event/TellAFriend.aspx?SN=" + rdDetail("ProductNo")

        Select Case strUserClass
            Case "WHOLESALE"
                Me.ltrRetailPrice.Text = Format(rdDetail("PriceRetail"), "$#,##0.00")
                Me.lblRetailPrice.Text = "Retail Price : "
                strPrice = ""
                Me.lblWholesalePrice.Visible = True
                Me.ltrWholesalePrice.Visible = True
                Select Case strWholesaleLevel
                    Case "A"
                        strPrice += Format(rdDetail("PriceWholesale1"), "$#,##0.00")
                    Case "B"
                        strPrice += Format(rdDetail("PriceWholesale2"), "$#,##0.00")
                    Case "C"
                        strPrice += Format(rdDetail("PriceWholesale3"), "$#,##0.00")
                    Case "D"
                        strPrice += Format(rdDetail("PriceWholesale4"), "$#,##0.00")
                    Case "E"
                        strPrice += Format(rdDetail("PriceWholesale5"), "$#,##0.00")
                    Case Else
                        strPrice += "$xxx.xx"
                End Select
                Me.ltrWholesaleNotice.Text = strMessageWholesale
                Me.ltrWholesaleNotice.Visible = True

                strURL = getImageURL(ProductNo)
                strLinesheet1 = rdDetail("Linesheet1").ToString
                strLinesheet2 = rdDetail("Linesheet2").ToString
                strLinesheet3 = rdDetail("Linesheet3").ToString
                If strLinesheet1.Length > 0 Then
                    Me.ltrRepImage.Text += "<br><br><a href="".." + strURL + strLinesheet1 + """ target=""_blank""><font face=""Verdana"" color=""Yellow"" size=2><b>View Line Sheet-1</b></font></a>"
                End If

                If strLinesheet2.Length > 0 Then
                    Me.ltrRepImage.Text += "<br><a href="".." + strURL + strLinesheet2 + """ target=""_blank""><font face=""Verdana"" color=""Yellow"" size=2><b>View Line Sheet-2</b></font></a>"
                End If

                If strLinesheet3.Length > 0 Then
                    Me.ltrRepImage.Text += "<br><a href="".." + strURL + strLinesheet3 + """ target=""_blank""><font face=""Verdana"" color=""Yellow"" size=2><b>View Line Sheet-3</b></font></a>"
                End If

            Case "USER"
                Me.lblRetailPrice.Text = "Price : "
                Me.ltrRetailPrice.Text = Format(rdDetail("PriceRetail"), "$#,##0.00")
                Me.lblWholesalePrice.Visible = False
                Me.ltrWholesalePrice.Visible = False
                Me.ltrWholesaleNotice.Visible = False
            Case "ADMIN"
                Me.lblRetailPrice.Text = "Retail Price : "
                Me.ltrRetailPrice.Text = Format(rdDetail("PriceRetail"), "$#,##0.00")
                strPrice = ""
                strPrice += "Wholesale-A : " + Format(rdDetail("PriceWholesale1"), "$#,##0.00") + "<br>"
                strPrice += "Wholesale-B : " + Format(rdDetail("PriceWholesale2"), "$#,##0.00") + "<br>"
                strPrice += "Wholesale-C : " + Format(rdDetail("PriceWholesale3"), "$#,##0.00") + "<br>"
                strPrice += "Wholesale-D : " + Format(rdDetail("PriceWholesale4"), "$#,##0.00") + "<br>"
                strPrice += "Wholesale-E : " + Format(rdDetail("PriceWholesale5"), "$#,##0.00")
                Me.lblWholesalePrice.Text = ""
                Me.lblWholesalePrice.Visible = True
                Me.ltrWholesalePrice.Visible = True
                Me.ltrWholesaleNotice.Visible = False
            Case "PREWHOLESALE"
                Me.lblRetailPrice.Text = "Retail Price : "
                Me.ltrRetailPrice.Text = Format(rdDetail("PriceRetail"), "$#,##0.00")
                strPrice = "$xxx.xx"
                Me.lblWholesalePrice.Visible = True
                Me.ltrWholesalePrice.Visible = True
                Me.ltrWholesaleNotice.Text = strMessageWholesale
                Me.ltrWholesaleNotice.Visible = True

                strLinesheet1 = rdDetail("Linesheet1").ToString
                strLinesheet2 = rdDetail("Linesheet2").ToString
                strLinesheet3 = rdDetail("Linesheet3").ToString
                If strLinesheet1.Length > 0 Then
                    Me.ltrRepImage.Text += "<br><br><font face=""Verdana"" color=""Yellow"" size=2><b>Line Sheet-1</b></font>"
                End If

                If strLinesheet2.Length > 0 Then
                    Me.ltrRepImage.Text += "<br><font face=""Verdana"" color=""Yellow"" size=2><b>Line Sheet-2</b></font>"
                End If

                If strLinesheet3.Length > 0 Then
                    Me.ltrRepImage.Text += "<br><font face=""Verdana"" color=""Yellow"" size=2><b>Line Sheet-3</b></font>"
                End If

            Case Else
                Me.lblRetailPrice.Text = "Price : "
                Me.ltrRetailPrice.Text = Format(rdDetail("PriceRetail"), "$#,##0.00")
                Me.lblWholesalePrice.Visible = False
                Me.ltrWholesalePrice.Visible = False
                Me.ltrWholesaleNotice.Visible = False
        End Select
        Me.ltrWholesalePrice.Text = strPrice

        rdDetail.Close()
        connTR.Close()

    End Sub

    Protected Sub btnAdd2CART_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAdd2CART.Click
        Dim strUserClass As String = Session.Item("Class").ToString

        Select Case strUserClass.ToUpper
            Case "USER"
                Call AddtoUserCART()
            Case "WHOLESALE"
                Call AddtoWholesaleCART()
            Case Else
                Call AddtoUserCART()
        End Select
        Response.Redirect("../Checkout/ViewCART.aspx?PU=" & Server.UrlEncode(Session.Item("CurrentPage")))

    End Sub

    Private Sub AddtoUserCART()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commCART As Data.SqlClient.SqlCommand
        'Dim rdCART As Data.SqlClient.SqlDataReader
        Dim sqlCART As String = ""
        Dim strSessionID, strEmail, strColorName, strSizeName As String
        Dim intQty As Integer = 1
        Dim dblUnitPrice As Double = 0

        dblUnitPrice = CDbl(Microsoft.VisualBasic.Right(Me.ltrRetailPrice.Text.Trim, (Me.ltrRetailPrice.Text.Trim.Length - 1)))
        strSessionID = Session.SessionID.ToString
        strEmail = Session.Item("UserID")
        strColorName = Me.ddlColor.Text
        strSizeName = Me.ddlSize.Text

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        intQty = chkInCart(strColorName, strSizeName)
        If intQty > 1 Then
            sqlCART = "UPDATE CART SET Qty=@Qty  Where  "
            sqlCART += " (SessionID=@SessionID) And (ProductNo=@ProductNo) And (ColorName=@ColorName) And (SizeName=@SizeName) "

            commCART = New Data.SqlClient.SqlCommand
            commCART.CommandText = sqlCART
            commCART.Connection = connTR
            commCART.Parameters.AddWithValue("@SessionID", strSessionID)
            commCART.Parameters.AddWithValue("@ProductNo", ProductNo)
            commCART.Parameters.AddWithValue("@ColorName", strColorName)
            commCART.Parameters.AddWithValue("@SizeName", strSizeName)
            commCART.Parameters.AddWithValue("@Qty", intQty)
        Else
            sqlCART = "INSERT INTO CART (SessionID, Email, ProductNo, ColorName, SizeName, Qty, UnitPrice) Values  "
            sqlCART += " (@SessionID, @Email, @ProductNo, @ColorName, @SizeName, @Qty, @UnitPrice)  "

            commCART = New Data.SqlClient.SqlCommand
            commCART.CommandText = sqlCART
            commCART.Connection = connTR
            commCART.Parameters.AddWithValue("@SessionID", strSessionID)
            commCART.Parameters.AddWithValue("@Email", strEmail)
            commCART.Parameters.AddWithValue("@ProductNo", ProductNo)
            commCART.Parameters.AddWithValue("@ColorName", strColorName)
            commCART.Parameters.AddWithValue("@SizeName", strSizeName)
            commCART.Parameters.AddWithValue("@Qty", intQty)
            commCART.Parameters.AddWithValue("@UnitPrice", dblUnitPrice)
        End If

        commCART.ExecuteNonQuery()
        connTR.Close()
    End Sub

    Private Sub AddtoWholesaleCART()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim strMinQty As String = ConfigurationManager.AppSettings("Wholesale.Minimum.Order")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commCART As Data.SqlClient.SqlCommand
        'Dim rdCART As Data.SqlClient.SqlDataReader
        Dim sqlCART As String = ""
        Dim strSessionID, strEmail, strColorName, strSizeName As String
        Dim intQty As Integer = 1
        Dim dblUnitPrice As Double = 0
        Dim aSize() As String
        Dim intMinQty As Integer = CInt(strMinQty)

        dblUnitPrice = CDbl(Microsoft.VisualBasic.Right(Me.ltrWholesalePrice.Text.Trim, (Me.ltrWholesalePrice.Text.Trim.Length - 1)))
        strSessionID = Session.SessionID.ToString
        strEmail = Session.Item("UserID")
        strColorName = Me.ddlColor.Text
        strSizeName = getSizeWholesale(ProductNo)
        aSize = Split(strSizeName, "/")
        'strSizeName = Me.ddlSize.Text

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)

        If BeInTheCART(strColorName) Then

            For Each strSize As String In aSize

                intQty = chkInCart(strColorName, strSize)
                If intQty < intMinQty Then
                    intQty = intMinQty
                End If

                connTR.Open()

                sqlCART = "UPDATE CART SET Qty=@Qty  Where  "
                sqlCART += " (SessionID=@SessionID) And (ProductNo=@ProductNo) And (ColorName=@ColorName) And (SizeName=@SizeName) "
                commCART = New Data.SqlClient.SqlCommand
                commCART.CommandText = sqlCART
                commCART.Connection = connTR
                commCART.Parameters.AddWithValue("@SessionID", strSessionID)
                commCART.Parameters.AddWithValue("@ProductNo", ProductNo)
                commCART.Parameters.AddWithValue("@ColorName", strColorName)
                commCART.Parameters.AddWithValue("@SizeName", strSize)
                commCART.Parameters.AddWithValue("@Qty", intQty)

                commCART.ExecuteNonQuery()
                connTR.Close()
            Next

        Else
            intQty = intMinQty

            For Each strSize As String In aSize
                connTR.Open()
                sqlCART = "INSERT INTO CART (SessionID, Email, ProductNo, ColorName, SizeName, Qty, UnitPrice) Values  "
                sqlCART += " (@SessionID, @Email, @ProductNo, @ColorName, @SizeName, @Qty, @UnitPrice)  "

                commCART = New Data.SqlClient.SqlCommand
                commCART.CommandText = sqlCART
                commCART.Connection = connTR
                commCART.Parameters.AddWithValue("@SessionID", strSessionID)
                commCART.Parameters.AddWithValue("@Email", strEmail)
                commCART.Parameters.AddWithValue("@ProductNo", ProductNo)
                commCART.Parameters.AddWithValue("@ColorName", strColorName)
                commCART.Parameters.AddWithValue("@SizeName", strSize)
                commCART.Parameters.AddWithValue("@Qty", intQty)
                commCART.Parameters.AddWithValue("@UnitPrice", dblUnitPrice)

                commCART.ExecuteNonQuery()
                connTR.Close()
            Next

        End If

    End Sub

    Private Function BeInTheCART(ByVal ColorName As String) As Boolean
        Dim blnResult As Boolean = False
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commCART As Data.SqlClient.SqlCommand
        Dim rdCART As Data.SqlClient.SqlDataReader
        Dim sqlCART As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlCART = "SELECT * FROM CART WHERE (SessionID=@SessionID) AND (ProductNo=@ProductNo) AND (ColorName=@ColorName)  "

        commCART = New Data.SqlClient.SqlCommand
        commCART.CommandText = sqlCART
        commCART.Connection = connTR
        commCART.Parameters.AddWithValue("@SessionID", Session.SessionID.ToString)
        commCART.Parameters.AddWithValue("@ProductNo", ProductNo)
        commCART.Parameters.AddWithValue("@ColorName", ColorName)
        rdCART = commCART.ExecuteReader()
        rdCART.Read()
        If rdCART.HasRows Then
            blnResult = True
        Else
            blnResult = False
        End If

        rdCART.Close()
        connTR.Close()

        Return blnResult
    End Function

    Private Function getSizeWholesale(ByVal strProductNo As String) As String
        Dim strSizes As String = ""
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commSize As Data.SqlClient.SqlCommand
        Dim rdSize As Data.SqlClient.SqlDataReader
        Dim sqlSize As String = ""
        Dim nCounter As Integer = 0

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlSize = "SELECT * FROM ProductSize WHERE ProductNo=@ProductNo Order by SerialNo "

        commSize = New Data.SqlClient.SqlCommand
        commSize.CommandText = sqlSize
        commSize.Connection = connTR
        commSize.Parameters.AddWithValue("@ProductNo", ProductNo)
        rdSize = commSize.ExecuteReader()
        Do While rdSize.Read()
            If nCounter > 0 Then
                strSizes += "/"
            End If
            strSizes += rdSize("SizeName").ToString
            nCounter += 1
        Loop

        rdSize.Close()
        connTR.Close()

        Return strSizes
    End Function

    Private Function chkInCart(ByVal ColorName As String, ByVal SizeName As String) As Integer
        Dim intQty As Integer = 1
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commCART As Data.SqlClient.SqlCommand
        Dim rdCART As Data.SqlClient.SqlDataReader
        Dim sqlCART As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlCART = "SELECT Qty FROM CART WHERE (SessionID=@SessionID) And (ProductNo=@ProductNo) And (ColorName=@ColorName) And (SizeName=@SizeName) "

        commCART = New Data.SqlClient.SqlCommand
        commCART.CommandText = sqlCART
        commCART.Connection = connTR
        commCART.Parameters.AddWithValue("@SessionID", Session.SessionID)
        commCART.Parameters.AddWithValue("@ProductNo", ProductNo)
        commCART.Parameters.AddWithValue("@ColorName", ColorName)
        commCART.Parameters.AddWithValue("@SizeName", SizeName)
        rdCART = commCART.ExecuteReader()
        rdCART.Read()
        If rdCART.HasRows Then
            intQty = rdCART("Qty") + 1
        Else
            intQty = 1
        End If

        rdCART.Close()
        connTR.Close()

        Return intQty
    End Function

    Private Sub MessageBox(ByVal msg As String)
        ' define a javascript alertbox containing
        ' the string passed in as argument

        ' create a new label
        Dim lbl As New Label()

        ' add the javascript to fire an alertbox to the label and
        ' add the string argument passed to the subroutine as the
        ' message payload for the alertbox
        lbl.Text = "<script language='javascript'>" & Environment.NewLine & _
                   "window.alert('" + msg + "')</script>"

        ' add the label to the page to display the alertbox
        Page.Controls.Add(lbl)

    End Sub

End Class
