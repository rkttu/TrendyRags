
Partial Class Checkout_ViewCART
    Inherits System.Web.UI.Page

    Dim nRow As Integer = 0
    Dim PreviousURL As String
    Const NotLogged As String = "Not-LoggedIn"
    Dim SSLRoot As String = ConfigurationManager.AppSettings("SSLRoot")
    Dim NSRoot As String = ConfigurationManager.AppSettings("NONSSLRoot")

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender

        ViewState("nRow") = nRow
        ViewState("PU") = PreviousURL

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim strUserClass As String = Session.Item("Class").ToString

        Page.Title = "TrendyRags.com"
        If IsPostBack() Then
            nRow = ViewState("nRow")
            PreviousURL = ViewState("PU")
        Else
            PreviousURL = Request("PU")
        End If

        If strUserClass.ToUpper = "WHOLESALE" Then
            Me.lblCoupon.Visible = False
            Me.txtCouponCode.Visible = False
            Me.btnCoupon.Visible = False
        Else
            Me.lblCoupon.Visible = True
            Me.txtCouponCode.Visible = True
            Me.btnCoupon.Visible = True
        End If

        Call initPage()

    End Sub

    Private Sub initPage()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commCart As Data.SqlClient.SqlCommand
        Dim rdCart As Data.SqlClient.SqlDataReader
        Dim sqlCart As String = ""

        Dim row As TableRow
        Dim cell As TableCell
        Dim strLiteral, strProductNo, strColor, strSize As String
        Dim dblUnitPrice, dblSubTotal, dblTotalAmount As Double
        Dim intQty As Integer

        Call initTable()

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlCart = "SELECT * FROM CART WHERE (SessionID=@SessionID) And (Qty > 0) Order by CartNo "

        commCart = New Data.SqlClient.SqlCommand
        commCart.CommandText = sqlCart
        commCart.Connection = connTR
        commCart.Parameters.AddWithValue("@SessionID", Session.SessionID)
        rdCart = commCart.ExecuteReader()
        dblTotalAmount = 0
        nRow = 0
        Do While rdCart.Read()

            nRow += 1
            dblSubTotal = 0
            strProductNo = rdCart("ProductNo")
            strColor = rdCart("ColorName")
            strSize = rdCart("SizeName")

            row = New TableRow
            ' <a href="strURL+Detail/aImageDetail(ni)" class="highslide" onclick="return hs.expand(this)">
            ' <Img border=0 width=60 src="Thumb/aImageThumb(ni)"  oncontextmenu="return false"></a>
            cell = New TableCell
            strLiteral = "<table border=""0"" cellpadding=""0"" cellspacing=""0""><tr>"
            strLiteral += "<td style=""padding-right:10px;""><a href=""" + getThumbPath(strProductNo) + """ class=""highslide"" onclick=""return hs.expand(this)"">"
            strLiteral += "<img src=""" + getThumbPath(strProductNo) + """ border=""0"" height=""80""></a></td>"
            strLiteral += "<td><a href=""../ShowWindow/Goods.aspx?PN=" + strProductNo + """ target=""_blank"">" + strProductNo + "<br>" + _
                           rdCart("ColorName") + " / " + rdCart("SizeName") + "</a></td>"
            strLiteral += "</tr></table>"
            cell.Controls.Add(New LiteralControl(strLiteral))
            cell.HorizontalAlign = HorizontalAlign.Left
            cell.VerticalAlign = VerticalAlign.Top
            cell.Style.Add("padding-left", "5px")
            cell.Style.Add("padding-top", "7px")
            cell.Style.Add("padding-bottom", "7px")
            row.Cells.Add(cell)

            cell = New TableCell
            dblUnitPrice = rdCart("UnitPrice")
            strLiteral = Format(dblUnitPrice, "$#,##0.00")
            cell.Controls.Add(New LiteralControl(strLiteral))
            cell.HorizontalAlign = HorizontalAlign.Center
            cell.VerticalAlign = VerticalAlign.Middle
            cell.Style.Add("padding-left", "5px")
            cell.Style.Add("padding-top", "7px")
            cell.Style.Add("padding-bottom", "7px")
            row.Cells.Add(cell)

            cell = New TableCell
            intQty = rdCart("Qty")

            Dim txtQty As TextBox
            txtQty = New TextBox
            txtQty.ID = "txtQty" + Str(nRow).Trim
            txtQty.Text = Str(intQty).Trim
            txtQty.Width = 30
            txtQty.BackColor = Drawing.Color.Transparent
            txtQty.BorderColor = Drawing.Color.SaddleBrown
            txtQty.BorderWidth = 1
            txtQty.ForeColor = Drawing.Color.White
            txtQty.Style.Add("text-align", "center")
            txtQty.EnableViewState = True

            cell.Controls.Add(txtQty)
            cell.HorizontalAlign = HorizontalAlign.Center
            cell.VerticalAlign = VerticalAlign.Middle
            cell.Style.Add("padding-left", "5px")
            cell.Style.Add("padding-top", "7px")
            cell.Style.Add("padding-bottom", "7px")
            row.Cells.Add(cell)

            cell = New TableCell
            dblSubTotal = dblUnitPrice * intQty
            strLiteral = Format(dblSubTotal, "$#,##0.00")
            cell.Controls.Add(New LiteralControl(strLiteral))
            cell.HorizontalAlign = HorizontalAlign.Center
            cell.VerticalAlign = VerticalAlign.Middle
            cell.Style.Add("padding-left", "5px")
            cell.Style.Add("padding-top", "7px")
            cell.Style.Add("padding-bottom", "7px")
            row.Cells.Add(cell)

            dblTotalAmount += dblSubTotal

            cell = New TableCell
            strLiteral = "<a href=""deleteCart.aspx?PN=" & strProductNo & "&CN=" & strColor & "&SN=" & strSize & "&PU=" & PreviousURL & """>Remove</a>"
            cell.Controls.Add(New LiteralControl(strLiteral))
            cell.HorizontalAlign = HorizontalAlign.Center
            cell.VerticalAlign = VerticalAlign.Middle
            cell.Style.Add("padding-left", "5px")
            cell.Style.Add("padding-top", "7px")
            cell.Style.Add("padding-bottom", "7px")
            row.Cells.Add(cell)

            Me.tblCART.Rows.Add(row)
        Loop

        rdCart.Close()
        connTR.Close()

        Call printTotalAmount(dblTotalAmount)
        If Me.txtCouponCode.Text.Length > 0 Then
            Call printCouponAppliedTotal(dblTotalAmount)
        Else
            Session.Item("CouponCode") = ""
            Session.Item("DCRate") = "0"
        End If

    End Sub

    Private Function getThumbPath(ByVal ProductNo As String) As String
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commPicture As Data.SqlClient.SqlCommand
        Dim rdPicture As Data.SqlClient.SqlDataReader
        Dim sqlPicture As String = ""
        Dim strFileName, strRootURL, strURL As String

        strRootURL = "../Pictures/" + Left(ProductNo, 2) + "/" + ProductNo + "/Rep/"

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlPicture = "SELECT TOP 1 * FROM Pictures WHERE (ProductNo=@ProductNo) And (Usage='Rep') Order by DisplayOrder "

        commPicture = New Data.SqlClient.SqlCommand
        commPicture.CommandText = sqlPicture
        commPicture.Connection = connTR
        commPicture.Parameters.AddWithValue("@ProductNo", ProductNo)
        rdPicture = commPicture.ExecuteReader()
        rdPicture.Read()

        strFileName = rdPicture("FileName")
        strURL = strRootURL + strFileName

        rdPicture.Close()
        connTR.Close()
        connTR.Dispose()

        Return strURL
    End Function

    Private Sub initTable()
        Dim row As TableRow
        Dim cell As TableCell
        Dim strLiteral As String

        Me.tblCART.Rows.Clear()
        row = New TableRow

        cell = New TableCell
        strLiteral = "I T E M S"
        cell.Controls.Add(New LiteralControl(strLiteral))
        cell.HorizontalAlign = HorizontalAlign.Center
        cell.VerticalAlign = VerticalAlign.Middle
        cell.Style.Add("width", "320px")
        cell.Style.Add("border-style", "solid")
        cell.Style.Add("border-width", "1px")
        cell.Style.Add("border-color", "saddlebrown")
        cell.Style.Add("padding-left", "5px")
        cell.Style.Add("padding-top", "7px")
        cell.Style.Add("padding-bottom", "7px")
        row.Cells.Add(cell)

        cell = New TableCell
        strLiteral = "Unit Price"
        cell.Controls.Add(New LiteralControl(strLiteral))
        cell.HorizontalAlign = HorizontalAlign.Center
        cell.VerticalAlign = VerticalAlign.Middle
        cell.Style.Add("width", "130px")
        cell.Style.Add("border-style", "solid")
        cell.Style.Add("border-width", "1px")
        cell.Style.Add("border-color", "saddlebrown")
        cell.Style.Add("padding-left", "5px")
        cell.Style.Add("padding-top", "7px")
        cell.Style.Add("padding-bottom", "7px")
        row.Cells.Add(cell)

        Dim txtQty As String = "Quantity"
        cell = New TableCell
        cell.Controls.Add(New LiteralControl(txtQty))
        cell.HorizontalAlign = HorizontalAlign.Center
        cell.VerticalAlign = VerticalAlign.Middle
        cell.Style.Add("width", "100px")
        cell.Style.Add("border-style", "solid")
        cell.Style.Add("border-width", "1px")
        cell.Style.Add("border-color", "saddlebrown")
        cell.Style.Add("padding-left", "5px")
        cell.Style.Add("padding-top", "7px")
        cell.Style.Add("padding-bottom", "7px")
        row.Cells.Add(cell)

        cell = New TableCell
        strLiteral = "Sub Total"
        cell.Controls.Add(New LiteralControl(strLiteral))
        cell.HorizontalAlign = HorizontalAlign.Center
        cell.VerticalAlign = VerticalAlign.Middle
        cell.Style.Add("width", "130px")
        cell.Style.Add("border-style", "solid")
        cell.Style.Add("border-width", "1px")
        cell.Style.Add("border-color", "saddlebrown")
        cell.Style.Add("padding-left", "5px")
        cell.Style.Add("padding-top", "7px")
        cell.Style.Add("padding-bottom", "7px")
        row.Cells.Add(cell)

        cell = New TableCell
        strLiteral = "Remove"
        cell.Controls.Add(New LiteralControl(strLiteral))
        cell.HorizontalAlign = HorizontalAlign.Center
        cell.VerticalAlign = VerticalAlign.Middle
        cell.Style.Add("width", "100px")
        cell.Style.Add("border-style", "solid")
        cell.Style.Add("border-width", "1px")
        cell.Style.Add("border-color", "saddlebrown")
        cell.Style.Add("padding-left", "5px")
        cell.Style.Add("padding-top", "7px")
        cell.Style.Add("padding-bottom", "7px")
        row.Cells.Add(cell)

        Me.tblCART.Rows.Add(row)

    End Sub

    Private Sub printTotalAmount(ByVal TotalAmount As Double)
        Dim row As TableRow
        Dim cell As TableCell
        Dim strLiteral As String

        row = New TableRow

        cell = New TableCell
        strLiteral = "Total Amount"
        cell.Controls.Add(New LiteralControl(strLiteral))
        cell.HorizontalAlign = HorizontalAlign.Right
        cell.VerticalAlign = VerticalAlign.Middle
        cell.ColumnSpan = 3
        cell.Style.Add("padding-left", "5px")
        cell.Style.Add("padding-right", "10px")
        cell.Style.Add("padding-top", "7px")
        cell.Style.Add("padding-bottom", "7px")
        cell.Style.Add("border-top-style", "solid")
        cell.Style.Add("border-top-width", "1px")
        cell.Style.Add("border-top-color", "#8B4513")
        row.Cells.Add(cell)

        cell = New TableCell
        strLiteral = Format(TotalAmount, "$#,##0.00")
        cell.Controls.Add(New LiteralControl(strLiteral))
        cell.HorizontalAlign = HorizontalAlign.Center
        cell.VerticalAlign = VerticalAlign.Middle
        cell.Style.Add("padding-left", "5px")
        cell.Style.Add("padding-top", "7px")
        cell.Style.Add("padding-bottom", "7px")
        cell.Style.Add("border-top-style", "solid")
        cell.Style.Add("border-top-width", "1px")
        cell.Style.Add("border-top-color", "#8B4513")
        row.Cells.Add(cell)

        cell = New TableCell
        strLiteral = ""
        cell.Controls.Add(New LiteralControl(strLiteral))
        cell.HorizontalAlign = HorizontalAlign.Center
        cell.VerticalAlign = VerticalAlign.Middle
        cell.Style.Add("padding-left", "5px")
        cell.Style.Add("padding-top", "7px")
        cell.Style.Add("padding-bottom", "7px")
        cell.Style.Add("border-top-style", "solid")
        cell.Style.Add("border-top-width", "1px")
        cell.Style.Add("border-top-color", "#8B4513")
        row.Cells.Add(cell)

        Me.tblCART.Rows.Add(row)

    End Sub

    Private Sub printCouponAppliedTotal(ByVal dblTotalAmount As Double)
        Dim intDCRate As Integer = getDCRate()
        Dim dblDCAmount As Double
        Dim row As TableRow
        Dim cell As TableCell
        Dim strLiteral As String

        If intDCRate < 0 Then
            Exit Sub
        End If
        '//
        '// DC Amount
        '//
        row = New TableRow

        cell = New TableCell
        strLiteral = "Discount (" + intDCRate.ToString + "%)"
        cell.Controls.Add(New LiteralControl(strLiteral))
        cell.HorizontalAlign = HorizontalAlign.Right
        cell.VerticalAlign = VerticalAlign.Middle
        cell.ColumnSpan = 3
        cell.Style.Add("padding-left", "5px")
        cell.Style.Add("padding-right", "10px")
        cell.Style.Add("padding-top", "7px")
        cell.Style.Add("padding-bottom", "7px")
        'cell.Style.Add("border-top-style", "solid")
        'cell.Style.Add("border-top-width", "1px")
        'cell.Style.Add("border-top-color", "#8B4513")
        row.Cells.Add(cell)

        cell = New TableCell
        dblDCAmount = dblTotalAmount * (intDCRate / 100)
        strLiteral = Format(dblDCAmount, "$#,##0.00")
        cell.Controls.Add(New LiteralControl(strLiteral))
        cell.HorizontalAlign = HorizontalAlign.Center
        cell.VerticalAlign = VerticalAlign.Middle
        cell.Style.Add("padding-left", "5px")
        cell.Style.Add("padding-top", "7px")
        cell.Style.Add("padding-bottom", "7px")
        cell.Style.Add("color", "#DB0008")
        'cell.Style.Add("border-top-style", "solid")
        'cell.Style.Add("border-top-width", "1px")
        'cell.Style.Add("border-top-color", "#8B4513")
        row.Cells.Add(cell)

        cell = New TableCell
        strLiteral = ""
        cell.Controls.Add(New LiteralControl(strLiteral))
        cell.HorizontalAlign = HorizontalAlign.Center
        cell.VerticalAlign = VerticalAlign.Middle
        cell.Style.Add("padding-left", "5px")
        cell.Style.Add("padding-top", "7px")
        cell.Style.Add("padding-bottom", "7px")
        'cell.Style.Add("border-top-style", "solid")
        'cell.Style.Add("border-top-width", "1px")
        'cell.Style.Add("border-top-color", "#8B4513")
        row.Cells.Add(cell)

        Me.tblCART.Rows.Add(row)


        '//
        '// Discounted Total Amount
        '//
        row = New TableRow

        cell = New TableCell
        strLiteral = "Discounted Total Amount"
        cell.Controls.Add(New LiteralControl(strLiteral))
        cell.HorizontalAlign = HorizontalAlign.Right
        cell.VerticalAlign = VerticalAlign.Middle
        cell.ColumnSpan = 3
        cell.Style.Add("padding-left", "5px")
        cell.Style.Add("padding-right", "10px")
        cell.Style.Add("padding-top", "7px")
        cell.Style.Add("padding-bottom", "7px")
        'cell.Style.Add("border-top-style", "solid")
        'cell.Style.Add("border-top-width", "1px")
        'cell.Style.Add("border-top-color", "#8B4513")
        row.Cells.Add(cell)

        cell = New TableCell
        strLiteral = Format((dblTotalAmount - dblDCAmount), "$#,##0.00")
        cell.Controls.Add(New LiteralControl(strLiteral))
        cell.HorizontalAlign = HorizontalAlign.Center
        cell.VerticalAlign = VerticalAlign.Middle
        cell.Style.Add("padding-left", "5px")
        cell.Style.Add("padding-top", "7px")
        cell.Style.Add("padding-bottom", "7px")
        'cell.Style.Add("border-top-style", "solid")
        'cell.Style.Add("border-top-width", "1px")
        'cell.Style.Add("border-top-color", "#8B4513")
        row.Cells.Add(cell)

        cell = New TableCell
        strLiteral = ""
        cell.Controls.Add(New LiteralControl(strLiteral))
        cell.HorizontalAlign = HorizontalAlign.Center
        cell.VerticalAlign = VerticalAlign.Middle
        cell.Style.Add("padding-left", "5px")
        cell.Style.Add("padding-top", "7px")
        cell.Style.Add("padding-bottom", "7px")
        'cell.Style.Add("border-top-style", "solid")
        'cell.Style.Add("border-top-width", "1px")
        'cell.Style.Add("border-top-color", "#8B4513")
        row.Cells.Add(cell)

        Me.tblCART.Rows.Add(row)

    End Sub

    Private Function getDCRate() As Integer
        Dim intDCRate As Integer
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commCart As Data.SqlClient.SqlCommand
        Dim rdCart As Data.SqlClient.SqlDataReader
        Dim sqlCart As String = ""
        Dim dtmBeginDate, dtmEndDate As DateTime

        Session.Item("CouponCode") = ""
        Session.Item("DCRate") = "0"
        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlCart = "SELECT TOP 1 * FROM Coupon WHERE (CouponCode=@CouponCode) "

        commCart = New Data.SqlClient.SqlCommand
        commCart.CommandText = sqlCart
        commCart.Connection = connTR
        commCart.Parameters.AddWithValue("@CouponCode", Me.txtCouponCode.Text.Trim)
        rdCart = commCart.ExecuteReader()
        rdCart.Read()
        If rdCart.HasRows Then
            intDCRate = rdCart("DCRate")
            dtmBeginDate = rdCart("StartDate")
            dtmEndDate = rdCart("EndDate")
            If dtmBeginDate > Now Then
                Session.Item("CouponCode") = ""
                Session.Item("DCRate") = ""
                intDCRate = -1
                MessageBox("Sorry, this Promotion code is not valid yet..")
            ElseIf dtmEndDate < Now Then
                Session.Item("CouponCode") = ""
                Session.Item("DCRate") = ""
                intDCRate = -1
                MessageBox("Sorry, this Promotion code is out of date..")
            Else
                Session.Item("CouponCode") = Me.txtCouponCode.Text.Trim
                Session.Item("DCRate") = intDCRate
            End If
        Else
            intDCRate = -1
            MessageBox("Sorry, there is no Promotion code like this..")
        End If

        rdCart.Close()
        connTR.Close()

        Return intDCRate
    End Function

    Protected Sub btnCoupon_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCoupon.Click
        Dim ni As Integer
        Dim aQty(nRow) As Long
        Dim strControl As String

        For ni = 1 To nRow
            strControl = "ctl00$ContentPlaceHolder1$txtQty" + Str(ni).Trim
            aQty(ni) = CLng(CType(Me.FindControl(strControl), TextBox).Text)
        Next

        Call ReadnUpdateCART(aQty)
        Call initPage()

    End Sub

    Protected Sub btnUpdateQty_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateQty.Click
        Dim ni As Integer
        Dim aQty(nRow) As Long
        Dim strControl As String
        Dim strClass As String = Session.Item("Class").ToString
        Dim strMinQty As String = ConfigurationManager.AppSettings("Wholesale.Minimum.Order")
        Dim intMinQty As Integer = CInt(strMinQty)

        For ni = 1 To nRow
            strControl = "ctl00$ContentPlaceHolder1$txtQty" + Str(ni).Trim
            aQty(ni) = CLng(CType(Me.FindControl(strControl), TextBox).Text)
            If strClass.ToUpper = "WHOLESALE" Then
                If aQty(ni) < intMinQty Then
                    aQty(ni) = intMinQty
                End If
            End If
        Next

        Call ReadnUpdateCART(aQty)
        Call initPage()

    End Sub

    Private Sub ReadnUpdateCART(ByVal aQty() As Long)
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commCart As Data.SqlClient.SqlCommand
        Dim rdCart As Data.SqlClient.SqlDataReader
        Dim sqlCart As String = ""
        Dim lngCartNo, lngQty As Long


        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlCart = "SELECT * FROM CART WHERE (SessionID=@SessionID) And (Qty > 0) Order by CartNo "

        commCart = New Data.SqlClient.SqlCommand
        commCart.CommandText = sqlCart
        commCart.Connection = connTR
        commCart.Parameters.AddWithValue("@SessionID", Session.SessionID)
        rdCart = commCart.ExecuteReader()
        nRow = 0
        Do While rdCart.Read()
            nRow += 1
            lngCartNo = rdCart("CartNo")
            lngQty = aQty(nRow)

            Call updateCART(lngCartNo, lngQty)
        Loop

        rdCart.Close()
        connTR.Close()
        connTR.Dispose()

    End Sub

    Private Sub updateCART(ByVal CartNo As Long, ByVal Qty As Long)
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commCart As Data.SqlClient.SqlCommand
        Dim sqlCart As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlCart = "UPDATE CART SET Qty=@Qty WHERE CartNo=@CartNo "

        commCart = New Data.SqlClient.SqlCommand
        commCart.CommandText = sqlCart
        commCart.Connection = connTR
        commCart.Parameters.AddWithValue("@Qty", Qty)
        commCart.Parameters.AddWithValue("@CartNo", CartNo)

        commCart.ExecuteNonQuery()

        connTR.Close()
        connTR.Dispose()

    End Sub

    Private Sub MessageBox(ByVal msg As String)
        Dim lbl As New Label()

        lbl.Text = "<script language='javascript'>" & Environment.NewLine & _
                   "window.alert('" + msg + "')</script>"

        Page.Controls.Add(lbl)

    End Sub

    Protected Sub btnContinue_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        Response.Redirect(PreviousURL)

    End Sub

    Protected Sub btnCheckOut_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCheckOut.Click
        Dim strReturnURL As String = ""

        If nRow > 0 Then
            If Session.Item("UserID") = NotLogged Then
                strReturnURL = SSLRoot + "Checkout/Checkout.aspx"
                Response.Redirect(SSLRoot + "Login/Default.aspx?PU=" & Server.UrlEncode(strReturnURL))
            Else
                Response.Redirect(SSLRoot + "Checkout/Checkout.aspx")
            End If
        End If

    End Sub

End Class
