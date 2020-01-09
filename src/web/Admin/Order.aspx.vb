Imports System.Net
Imports System.IO
Imports System.Net.Mail

Partial Class Admin_Order
    Inherits System.Web.UI.Page

    Dim smtpServer As String = ConfigurationManager.AppSettings("SMTPServer")

    Dim textPackaging As String = ConfigurationManager.AppSettings("Text.Packaging")
    Dim textCancelled As String = ConfigurationManager.AppSettings("Text.Cancelled")
    Dim textRefunded As String = ConfigurationManager.AppSettings("Text.Refunded")
    Dim textError As String = ConfigurationManager.AppSettings("Text.Error")
    Dim textShipped As String = ConfigurationManager.AppSettings("Text.Shipped")
    Dim textReturned As String = ConfigurationManager.AppSettings("Text.Returned")

    Dim dblTAXAmount As Double
    Dim dblShippingFee As Double
    Dim dblTotalAmount As Double
    Dim dblTotalPrice As Double
    Dim dblDCRate As Double
    Dim dblDCAmount As Double

    Dim strCouponCode As String
    Dim strOrderNo As String
    Dim strPayResponseCode As String
    Dim strPayReasonCode As String

    Const statusPrePayment As String = "09"
    Const statusTransfered As String = "10"
    Const statusGotPayment As String = "20"
    Const CATaxRate As Long = 0.085

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender

        ViewState("TAXAmount") = dblTAXAmount
        ViewState("ShippingFee") = dblShippingFee
        ViewState("TotalPrice") = dblTotalPrice
        ViewState("TotalAmount") = dblTotalAmount
        ViewState("OrderNo") = strOrderNo
        ViewState("DCRate") = dblDCRate
        ViewState("DCAmount") = dblDCAmount
        ViewState("CouponCode") = strCouponCode

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If UCase(Session.Item("Class")) <> "ADMIN" Then
            Response.Redirect("~/Admin/Default.aspx")
        End If

        Page.Title = "Admin for TrendyRags.com"

        If IsPostBack() Then
            dblTAXAmount = ViewState("TAXAmount")
            dblShippingFee = ViewState("ShippingFee")
            dblTotalPrice = ViewState("TotalPrice")
            dblTotalAmount = ViewState("TotalAmount")
            strOrderNo = ViewState("OrderNo")
            dblDCRate = ViewState("DCRate")
            dblDCAmount = ViewState("DCAmount")
            strCouponCode = ViewState("CouponCode")
        Else
            strOrderNo = Request("ON")
            Call readOrderMaster()
            Call readOrderDetail()
        End If


    End Sub

    Private Sub refreshStatus()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commOrder As Data.SqlClient.SqlCommand
        Dim rdOrder As Data.SqlClient.SqlDataReader
        Dim sqlOrder As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlOrder = "SELECT TOP 1 * FROM OrderMaster WHERE (OrderNo=@OrderNo)  "

        commOrder = New Data.SqlClient.SqlCommand
        commOrder.CommandText = sqlOrder
        commOrder.Connection = connTR
        commOrder.Parameters.AddWithValue("@OrderNo", Me.lblOrderNo.Text)
        rdOrder = commOrder.ExecuteReader()
        rdOrder.Read()

        Me.rdoOrderStatus.SelectedValue = rdOrder("OrderStatus")

        rdOrder.Close()
        connTR.Close()

    End Sub

    Private Sub readOrderDetail()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commOrder As Data.SqlClient.SqlCommand
        Dim rdOrder As Data.SqlClient.SqlDataReader
        Dim sqlOrder As String = ""
        Dim nRow As Integer

        Dim row As TableRow
        Dim cell As TableCell
        Dim strLiteral, strProductNo As String
        Dim dblUnitPrice, dblSubTotal As Double
        Dim intQty As Integer

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlOrder = "SELECT * FROM OrderDetail WHERE (OrderNo=@OrderNo) Order by SerialNo "

        commOrder = New Data.SqlClient.SqlCommand
        commOrder.CommandText = sqlOrder
        commOrder.Connection = connTR
        commOrder.Parameters.AddWithValue("@OrderNo", strOrderNo)
        rdOrder = commOrder.ExecuteReader()
        dblTotalPrice = 0
        nRow = 0
        Do While rdOrder.Read()

            nRow += 1
            dblSubTotal = 0
            strProductNo = rdOrder("ProductNo")

            row = New TableRow

            cell = New TableCell
            strLiteral = "<a href=""../ShowWindow/Goods.aspx?PN=" + strProductNo + """ target=""_blank""><span style=""font-size:12px"">" + strProductNo + "</span></a><br>" + _
                           rdOrder("ColorName") + " / " + rdOrder("SizeName")
            cell.Controls.Add(New LiteralControl(strLiteral))
            cell.HorizontalAlign = HorizontalAlign.Left
            cell.VerticalAlign = VerticalAlign.Top
            cell.Style.Add("padding-left", "5px")
            cell.Style.Add("padding-top", "7px")
            cell.Style.Add("padding-bottom", "7px")
            row.Cells.Add(cell)

            cell = New TableCell
            dblUnitPrice = rdOrder("UnitPrice")
            strLiteral = Format(dblUnitPrice, "$#,##0.00")
            cell.Controls.Add(New LiteralControl(strLiteral))
            cell.HorizontalAlign = HorizontalAlign.Center
            cell.VerticalAlign = VerticalAlign.Middle
            cell.Style.Add("padding-left", "5px")
            cell.Style.Add("padding-top", "7px")
            cell.Style.Add("padding-bottom", "7px")
            row.Cells.Add(cell)

            cell = New TableCell
            intQty = rdOrder("Qty")
            strLiteral = Format(intQty, "#,##0")
            cell.Controls.Add(New LiteralControl(strLiteral))
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

            dblTotalPrice += dblSubTotal

            cell = New TableCell
            strLiteral = ""
            cell.Controls.Add(New LiteralControl(strLiteral))
            cell.HorizontalAlign = HorizontalAlign.Center
            cell.VerticalAlign = VerticalAlign.Middle
            cell.Style.Add("padding-left", "5px")
            cell.Style.Add("padding-top", "7px")
            cell.Style.Add("padding-bottom", "7px")
            row.Cells.Add(cell)

            Me.tblOrder.Rows.Add(row)
        Loop

        rdOrder.Close()
        connTR.Close()

        Call printTotalAmount()

    End Sub

    Private Sub readOrderMaster()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commOrder As Data.SqlClient.SqlCommand
        Dim rdOrder As Data.SqlClient.SqlDataReader
        Dim sqlOrder As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlOrder = "SELECT TOP 1 * FROM OrderMaster WHERE (OrderNo=@OrderNo)  "

        commOrder = New Data.SqlClient.SqlCommand
        commOrder.CommandText = sqlOrder
        commOrder.Connection = connTR
        commOrder.Parameters.AddWithValue("@OrderNo", strOrderNo)
        rdOrder = commOrder.ExecuteReader()
        rdOrder.Read()

        dblTAXAmount = rdOrder("TaxAmount")
        dblShippingFee = rdOrder("ShippingAmount")
        dblTotalAmount = rdOrder("TotalAmount")
        dblDCAmount = rdOrder("DCAmount")
        dblDCRate = rdOrder("CouponDCRate")
        strCouponCode = rdOrder("CouponCode")

        Me.lblOrderNo.Text = rdOrder("OrderNo")
        Me.lblOrderDate.Text = rdOrder("OrderDate")
        Me.ltrOrderNo2.Text = Me.lblOrderNo.Text
        Me.ltrOrderDate2.Text = Me.lblOrderDate.Text
        Me.rdoOrderStatus.SelectedValue = rdOrder("OrderStatus")
        Me.hdnOriginalOrderStatusCode.Value = rdOrder("OrderStatus")
        Me.txtCommentToClient.Text = rdOrder("CommentToClient")

        displayClientInfo(rdOrder("ClientNo"))
        Me.ltrBillEmail.Text = rdOrder("Email")
        Me.ltrBillAddress.Text = rdOrder("Street1") + " " + rdOrder("Street2") + "<br>" + _
                                        rdOrder("City") + ", " + rdOrder("State") + " " + rdOrder("Zip") + "<br>" + _
                                        rdOrder("Country")
        Me.ltrPayMethod.Text = rdOrder("PayMethod")
        Me.ltrPayStatus.Text = rdOrder("PayStatus")
        Me.ltrShipName.Text = rdOrder("RecipientName")
        Me.ltrShipAddress.Text = rdOrder("RecipientStreet1") + " " + rdOrder("RecipientStreet2") + "<br>" + _
                                        rdOrder("RecipientCity") + ", " + rdOrder("RecipientState") + " " + rdOrder("RecipientZip") + "<br>" + _
                                        rdOrder("RecipientCountry")
        Me.ltrShipPhone.Text = rdOrder("RecipientPhone")
        Me.ltrShippingMethod.Text = rdOrder("ShipMethod")
        Me.ltrShippingFee.Text = " (" + Format(dblShippingFee, "$#,##0.00") + ")"
        Me.ltrCommentFromClient.Text = Replace(rdOrder("CommentFromClient").ToString, vbCrLf, "<br>")

        rdOrder.Close()
        connTR.Close()

    End Sub

    Private Sub displayClientInfo(ByVal lngClientNo As Long)
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commClient As Data.SqlClient.SqlCommand
        Dim rdClient As Data.SqlClient.SqlDataReader
        Dim sqlClient As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlClient = "SELECT TOP 1 * FROM ClientMaster WHERE (SerialNo=@SerialNo)  "

        commClient = New Data.SqlClient.SqlCommand
        commClient.CommandText = sqlClient
        commClient.Connection = connTR
        commClient.Parameters.AddWithValue("@SerialNo", lngClientNo)
        rdClient = commClient.ExecuteReader()
        rdClient.Read()

        Me.ltrBillName.Text = rdClient("ClientNameF") + " " + rdClient("ClientNameL")
        Me.ltrBillPhone.Text = rdClient("Phone")

        rdClient.Close()
        connTR.Close()

    End Sub

    Private Sub printTotalAmount()
        Dim row As TableRow
        Dim cell As TableCell
        Dim strLiteral As String

        dblTotalAmount = dblTotalPrice - dblDCAmount + dblTAXAmount + dblShippingFee

        '//
        '// Print Total
        '//
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
        strLiteral = Format(dblTotalPrice, "$#,##0.00")
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

        Me.tblOrder.Rows.Add(row)

        '//
        '// Coupon/DC Information
        '//
        row = New TableRow

        cell = New TableCell
        strLiteral = "Coupon Code: " + strCouponCode + " (" + dblDCRate.ToString + "%)"
        cell.Controls.Add(New LiteralControl(strLiteral))
        cell.HorizontalAlign = HorizontalAlign.Right
        cell.VerticalAlign = VerticalAlign.Middle
        cell.Style.Add("padding-left", "5px")
        cell.Style.Add("padding-right", "10px")
        cell.Style.Add("padding-top", "7px")
        cell.Style.Add("padding-bottom", "7px")
        row.Cells.Add(cell)

        cell = New TableCell
        strLiteral = "D/C Amount"
        cell.Controls.Add(New LiteralControl(strLiteral))
        cell.HorizontalAlign = HorizontalAlign.Right
        cell.VerticalAlign = VerticalAlign.Middle
        cell.ColumnSpan = 2
        cell.Style.Add("padding-left", "5px")
        cell.Style.Add("padding-right", "10px")
        cell.Style.Add("padding-top", "7px")
        cell.Style.Add("padding-bottom", "7px")
        row.Cells.Add(cell)

        cell = New TableCell
        strLiteral = Format(dblDCAmount, "$#,##0.00")
        cell.Controls.Add(New LiteralControl(strLiteral))
        cell.HorizontalAlign = HorizontalAlign.Center
        cell.VerticalAlign = VerticalAlign.Middle
        cell.Style.Add("padding-left", "5px")
        cell.Style.Add("padding-right", "10px")
        cell.Style.Add("padding-top", "7px")
        cell.Style.Add("padding-bottom", "7px")
        row.Cells.Add(cell)

        cell = New TableCell
        strLiteral = ""
        cell.Controls.Add(New LiteralControl(strLiteral))
        cell.HorizontalAlign = HorizontalAlign.Center
        cell.VerticalAlign = VerticalAlign.Middle
        cell.Style.Add("padding-left", "5px")
        cell.Style.Add("padding-right", "10px")
        cell.Style.Add("padding-top", "7px")
        cell.Style.Add("padding-bottom", "7px")
        row.Cells.Add(cell)

        Me.tblOrder.Rows.Add(row)

        '//
        '// Print TAX
        '//
        row = New TableRow

        cell = New TableCell
        strLiteral = "TAX Amount"
        cell.Controls.Add(New LiteralControl(strLiteral))
        cell.HorizontalAlign = HorizontalAlign.Right
        cell.VerticalAlign = VerticalAlign.Middle
        cell.ColumnSpan = 3
        cell.Style.Add("padding-left", "5px")
        cell.Style.Add("padding-right", "10px")
        cell.Style.Add("padding-top", "7px")
        cell.Style.Add("padding-bottom", "7px")
        row.Cells.Add(cell)

        cell = New TableCell
        strLiteral = Format(dblTAXAmount, "$#,##0.00")
        cell.Controls.Add(New LiteralControl(strLiteral))
        cell.HorizontalAlign = HorizontalAlign.Center
        cell.VerticalAlign = VerticalAlign.Middle
        cell.Style.Add("padding-left", "5px")
        cell.Style.Add("padding-top", "7px")
        cell.Style.Add("padding-bottom", "7px")
        row.Cells.Add(cell)

        cell = New TableCell
        strLiteral = ""
        cell.Controls.Add(New LiteralControl(strLiteral))
        cell.HorizontalAlign = HorizontalAlign.Center
        cell.VerticalAlign = VerticalAlign.Middle
        cell.Style.Add("padding-left", "5px")
        cell.Style.Add("padding-top", "7px")
        cell.Style.Add("padding-bottom", "7px")
        row.Cells.Add(cell)

        Me.tblOrder.Rows.Add(row)

        '//
        '// Print Shipping Fee
        '//
        row = New TableRow

        cell = New TableCell
        strLiteral = "Shipping Charge"
        cell.Controls.Add(New LiteralControl(strLiteral))
        cell.HorizontalAlign = HorizontalAlign.Right
        cell.VerticalAlign = VerticalAlign.Middle
        cell.ColumnSpan = 3
        cell.Style.Add("padding-left", "5px")
        cell.Style.Add("padding-right", "10px")
        cell.Style.Add("padding-top", "7px")
        cell.Style.Add("padding-bottom", "7px")
        row.Cells.Add(cell)

        cell = New TableCell
        strLiteral = Format(dblShippingFee, "$#,##0.00")
        cell.Controls.Add(New LiteralControl(strLiteral))
        cell.HorizontalAlign = HorizontalAlign.Center
        cell.VerticalAlign = VerticalAlign.Middle
        cell.Style.Add("padding-left", "5px")
        cell.Style.Add("padding-top", "7px")
        cell.Style.Add("padding-bottom", "7px")
        row.Cells.Add(cell)

        cell = New TableCell
        strLiteral = ""
        cell.Controls.Add(New LiteralControl(strLiteral))
        cell.HorizontalAlign = HorizontalAlign.Center
        cell.VerticalAlign = VerticalAlign.Middle
        cell.Style.Add("padding-left", "5px")
        cell.Style.Add("padding-top", "7px")
        cell.Style.Add("padding-bottom", "7px")
        row.Cells.Add(cell)

        Me.tblOrder.Rows.Add(row)

        '//
        '// Print Grand Total
        '//
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
        row.Cells.Add(cell)

        cell = New TableCell
        strLiteral = Format(dblTotalAmount, "$#,##0.00")
        cell.Controls.Add(New LiteralControl(strLiteral))
        cell.HorizontalAlign = HorizontalAlign.Center
        cell.VerticalAlign = VerticalAlign.Middle
        cell.Style.Add("padding-left", "5px")
        cell.Style.Add("padding-top", "7px")
        cell.Style.Add("padding-bottom", "7px")
        row.Cells.Add(cell)

        cell = New TableCell
        strLiteral = ""
        cell.Controls.Add(New LiteralControl(strLiteral))
        cell.HorizontalAlign = HorizontalAlign.Center
        cell.VerticalAlign = VerticalAlign.Middle
        cell.Style.Add("padding-left", "5px")
        cell.Style.Add("padding-top", "7px")
        cell.Style.Add("padding-bottom", "7px")
        row.Cells.Add(cell)

        Me.tblOrder.Rows.Add(row)

    End Sub

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

    Protected Sub btnPrint_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrint.Click

        If Me.chkChangeOrderStatus.Checked Then
            Call changeStatus()
        End If

        If Me.chkSendMail.Checked Then
            Call sendMail()
        End If

    End Sub

    Private Sub changeStatus()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commOrder As Data.SqlClient.SqlCommand
        Dim sqlOrder As String = ""
        Dim newStatus As String = "30"

        'If (CInt(Me.hdnOriginalOrderStatusCode.Value) Mod 10) = 0 Then
        '        newStatus = Str(CInt(Me.hdnOriginalOrderStatusCode.Value) + 10).Trim
        'Else
        '        newStatus = Me.hdnOriginalOrderStatusCode.Value
        'End If

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlOrder = "UPDATE OrderMaster SET OrderStatus=@OrderStatus WHERE (OrderNo=@OrderNo)  "

        commOrder = New Data.SqlClient.SqlCommand
        commOrder.CommandText = sqlOrder
        commOrder.Connection = connTR
        commOrder.Parameters.AddWithValue("@OrderNo", Me.lblOrderNo.Text.Trim)
        commOrder.Parameters.AddWithValue("@OrderStatus", newStatus)
        commOrder.ExecuteNonQuery()
        connTR.Close()

        Me.rdoOrderStatus.SelectedValue = newStatus

    End Sub

    Private Sub sendMail()
        Dim strStatus As String = Me.rdoOrderStatus.SelectedValue.ToString
        Dim Msg As MailMessage = New MailMessage
        Dim MailObj As New SmtpClient(smtpServer)
        Dim strMyEmail As String = "support@trendyrags.com"
        Dim strMyName As String = "TrendyRags.com"
        Dim strClientEmail As String = Me.ltrBillEmail.Text

        Msg.From = New MailAddress(strMyEmail, strMyName)
        Msg.IsBodyHtml = "True"
        Msg.Body = makeMailBody()

        Select Case strStatus
            Case "30", "Packaging Order"
                Msg.Subject = "[TrendyRags] We are preparing to ship Your order [#" & strOrderNo & "].."

            Case "40", "Shipped"
                Msg.Subject = "[TrendyRags] Thank you, we shippied your order [#" & strOrderNo & "].."

            Case "90", "Cancelled"
                Msg.Subject = "[TrendyRags] Thank you, your order [#" & strOrderNo & "] has been cancelled.."

            Case "50", "Returned"
                Msg.Subject = "[TrendyRags] Thank you,  We have received your your returned item."

            Case "60", "Refunded"
                Msg.Subject = "[TrendyRags] We have processed your refund."

            Case "09", "Error"
                Msg.Subject = "[TrendyRags] There is an error processing your order.."

        End Select

        Msg.To.Clear()
        Msg.Bcc.Clear()

        Msg.To.Add(New MailAddress(strClientEmail))
        Msg.Bcc.Add(New MailAddress("support@trendyrags.com"))
        Msg.Bcc.Add(New MailAddress("Wally@trendyrags.com"))
        Msg.Bcc.Add(New MailAddress("sicho77@live.com"))
        MailObj.Send(Msg)

    End Sub

    Private Function makeMailBody() As String
        Dim strBody As String = ""
        Dim strPhoneRep As String = ConfigurationManager.AppSettings("PhoneRep")
        Dim strStatus As String = Me.rdoOrderStatus.Text

        strBody = getBody(strStatus)
        strBody = Replace(strBody, "%%ClientName%%", Me.ltrBillName.Text)
        strBody = Replace(strBody, "%%OrderNumber%%", Me.lblOrderNo.Text)
        strBody = Replace(strBody, "%%TrackingNumber%%", Me.txtTrackingNo.Text)

        Return strBody
    End Function

    Private Function getBody(ByVal strStatus As String) As String
        Dim objStreamReader As StreamReader
        Dim contents As String = ""

        Select Case strStatus
            Case "Packaging Order", "30"
                objStreamReader = File.OpenText(textPackaging)
                contents = objStreamReader.ReadToEnd()
                objStreamReader.Close()

            Case "Shipped", "40"
                objStreamReader = File.OpenText(textShipped)
                contents = objStreamReader.ReadToEnd()
                objStreamReader.Close()

            Case "Returned", "50"
                objStreamReader = File.OpenText(textReturned)
                contents = objStreamReader.ReadToEnd()
                objStreamReader.Close()

            Case "Refunded", "60"
                objStreamReader = File.OpenText(textRefunded)
                contents = objStreamReader.ReadToEnd()
                objStreamReader.Close()

            Case "Cancelled", "90"
                objStreamReader = File.OpenText(textCancelled)
                contents = objStreamReader.ReadToEnd()
                objStreamReader.Close()

            Case "Error", "09"
                objStreamReader = File.OpenText(textError)
                contents = objStreamReader.ReadToEnd()
                objStreamReader.Close()

        End Select


        Return contents
    End Function

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click

        Response.Redirect("OrderList.aspx")

    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commOrder As Data.SqlClient.SqlCommand
        Dim sqlOrder As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlOrder = "UPDATE OrderMaster SET OrderStatus=@OrderStatus, TrackingNo=@TrackingNo, CommentToClient=@CommentToClient WHERE (OrderNo=@OrderNo)  "

        commOrder = New Data.SqlClient.SqlCommand
        commOrder.CommandText = sqlOrder
        commOrder.Connection = connTR
        commOrder.Parameters.AddWithValue("@OrderNo", Me.lblOrderNo.Text.Trim)
        commOrder.Parameters.AddWithValue("@OrderStatus", Me.rdoOrderStatus.SelectedValue)
        commOrder.Parameters.AddWithValue("@TrackingNo", Me.txtTrackingNo.Text)
        commOrder.Parameters.AddWithValue("@CommentToClient", Me.txtCommentToClient.Text)
        commOrder.ExecuteNonQuery()
        connTR.Close()

    End Sub

    Protected Sub btnPrintOrderInfo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrintOrderInfo.Click

    End Sub

End Class
