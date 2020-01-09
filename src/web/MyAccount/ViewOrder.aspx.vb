Imports System.Net
Imports System.IO
Imports System.net.Mail

Partial Class MyAccount_ViewOrder
        Inherits System.Web.UI.Page

        Dim smtpServer As String = ConfigurationManager.AppSettings("SMTPServer")
        Dim dblTAXAmount As Double
        Dim dblShippingFee As Double
        Dim dblTotalAmount As Double
        Dim dblTotalPrice As Double
        Dim intDCRate As Integer
        Dim dblDiscount As Double
        Dim strOrderNo As String
        Dim strPayResponseCode As String
        Dim strPayReasonCode As String
        Const statusPrePayment = "09"
        Const statusTransfered = "10"
        Const statusGotPayment = "20"
        Const CATaxRate = 0.085
        Const UPSTrackURL = "http://wwwapps.ups.com/WebTracking/processInputRequest?HTMLVersion=5.0&loc=en_US&Requester=UPSHome&AgreeToTermsAndConditions=yes&tracknum="
        Dim SSLRoot As String = ConfigurationManager.AppSettings("SSLRoot")
        Dim NSRoot As String = ConfigurationManager.AppSettings("NONSSLRoot")
        Dim OrderNo As String

        Protected Sub lbtnTracking_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbtnTracking.Click
                '//
                '// http://wwwapps.ups.com/WebTracking/processInputRequest?HTMLVersion=5.0&loc=en_US&Requester=UPSHome&tracknum=1234567891&AgreeToTermsAndConditions=yes&ignore=&track.x=18&track.y=11
                '//
                Dim urlTracking As String
                urlTracking = "http://wwwapps.ups.com/WebTracking/processInputRequest?HTMLVersion=5.0&loc=en_US&Requester=UPSHome&AgreeToTermsAndConditions=yes&tracknum="

        End Sub

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

                OrderNo = Request("ON")

                If ValidOwner() Then
                        Call readOrderDetail()
                        Call readOrderMaster()
                Else
                        Response.Redirect("~/Default.aspx")
                End If

        End Sub

        Private Function ValidOwner() As Boolean
                Dim blnResult As Boolean = True
                Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
                Dim connTR As Data.SqlClient.SqlConnection
                Dim commOrder As Data.SqlClient.SqlCommand
                Dim rdOrder As Data.SqlClient.SqlDataReader
                Dim sqlOrder As String = ""

                connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
                connTR.Open()

                sqlOrder = "SELECT Top 1 Email FROM OrderMaster WHERE OrderNo=@OrderNo "

                commOrder = New Data.SqlClient.SqlCommand
                commOrder.CommandText = sqlOrder
                commOrder.Connection = connTR
                commOrder.Parameters.AddWithValue("@OrderNo", OrderNo)
                rdOrder = commOrder.ExecuteReader()

                rdOrder.Read()
                If rdOrder.HasRows Then
                        If rdOrder("Email") = Session.Item("UserID") Then
                                blnResult = True
                        Else
                                blnResult = False
                        End If
                Else
                        blnResult = False
                End If

                rdOrder.Close()
                connTR.Close()

                Return blnResult
        End Function

        Private Sub readOrderDetail()
                Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
                Dim connTR As Data.SqlClient.SqlConnection
                Dim commOrder As Data.SqlClient.SqlCommand
                Dim rdOrder As Data.SqlClient.SqlDataReader
                Dim sqlOrder As String = ""

                Dim strProductNo, strColorName, strSizeName, strLiteral As String
                Dim dblUnitPrice, dblSubTotal, dblAmount As Double
                Dim intQty As Integer
                Dim row As TableRow
                Dim cell As TableCell

                connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
                connTR.Open()

                sqlOrder = "SELECT * FROM OrderDetail WHERE OrderNo=@OrderNo Order by SerialNo "

                commOrder = New Data.SqlClient.SqlCommand
                commOrder.CommandText = sqlOrder
                commOrder.Connection = connTR
                commOrder.Parameters.AddWithValue("@OrderNo", OrderNo)
                rdOrder = commOrder.ExecuteReader()

                Do While rdOrder.Read()
                        strProductNo = rdOrder("ProductNo")
                        strColorName = rdOrder("ColorName")
                        strSizeName = rdOrder("SizeName")
                        dblUnitPrice = rdOrder("UnitPrice")
                        intQty = rdOrder("Qty")
                        dblAmount = dblUnitPrice * intQty

                        row = New TableRow

                        cell = New TableCell
                        strLiteral = strProductNo + "<br>" + _
                                       strColorName + " / " + strSizeName
                        cell.Controls.Add(New LiteralControl(strLiteral))
                        cell.HorizontalAlign = HorizontalAlign.Left
                        cell.VerticalAlign = VerticalAlign.Top
                        cell.Style.Add("padding-left", "5px")
                        cell.Style.Add("padding-top", "7px")
                        cell.Style.Add("padding-bottom", "7px")
                        row.Cells.Add(cell)

                        cell = New TableCell
                        strLiteral = Format(dblUnitPrice, "$#,##0.00")
                        cell.Controls.Add(New LiteralControl(strLiteral))
                        cell.HorizontalAlign = HorizontalAlign.Center
                        cell.VerticalAlign = VerticalAlign.Middle
                        cell.Style.Add("padding-left", "5px")
                        cell.Style.Add("padding-top", "7px")
                        cell.Style.Add("padding-bottom", "7px")
                        row.Cells.Add(cell)

                        cell = New TableCell
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

        End Sub

        Private Sub readOrderMaster()
                Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
                Dim connTR As Data.SqlClient.SqlConnection
                Dim commOrder As Data.SqlClient.SqlCommand
                Dim rdOrder As Data.SqlClient.SqlDataReader
                Dim sqlOrder As String = ""

                Dim strLiteral, strTrackingNo As String
                Dim dblOrderAmount, dblDCAmount, dblTAXAmount, dblShippingAmount, dblPaymentAmount As Double
                Dim row As TableRow
                Dim cell As TableCell

                connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
                connTR.Open()

                sqlOrder = "SELECT Top 1 * FROM OrderMaster WHERE OrderNo=@OrderNo Order by SerialNo "

                commOrder = New Data.SqlClient.SqlCommand
                commOrder.CommandText = sqlOrder
                commOrder.Connection = connTR
                commOrder.Parameters.AddWithValue("@OrderNo", OrderNo)
                rdOrder = commOrder.ExecuteReader()

                rdOrder.Read()

                dblOrderAmount = rdOrder("OrderAmount")
                dblDCAmount = rdOrder("DCAmount")
                dblTAXAmount = rdOrder("TaxAmount")
                dblShippingAmount = rdOrder("ShippingAmount")
                dblPaymentAmount = rdOrder("TotalAmount")

                '// Print Order Amount
                row = New TableRow
                cell = New TableCell
                strLiteral = "Order Amount"
                cell.Controls.Add(New LiteralControl(strLiteral))
                cell.HorizontalAlign = HorizontalAlign.Right
                cell.VerticalAlign = VerticalAlign.Top
                cell.ColumnSpan = 3
                cell.Style.Add("padding-left", "5px")
                cell.Style.Add("padding-top", "7px")
                cell.Style.Add("padding-bottom", "7px")
                cell.Style.Add("border-top-style", "solid")
                cell.Style.Add("border-top-width", "1px")
                cell.Style.Add("border-top-color", "#8B4513")
                row.Cells.Add(cell)

                cell = New TableCell
                strLiteral = Format(dblOrderAmount, "$#,##0.00")
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
                cell.HorizontalAlign = HorizontalAlign.Right
                cell.VerticalAlign = VerticalAlign.Top
                cell.Style.Add("padding-left", "5px")
                cell.Style.Add("padding-top", "7px")
                cell.Style.Add("padding-bottom", "7px")
                cell.Style.Add("border-top-style", "solid")
                cell.Style.Add("border-top-width", "1px")
                cell.Style.Add("border-top-color", "#8B4513")
                row.Cells.Add(cell)
                Me.tblOrder.Rows.Add(row)

                If dblDCAmount > 0 Then
                        '// Print DC Amount
                        row = New TableRow
                        cell = New TableCell
                        strLiteral = "Discount"
                        cell.Controls.Add(New LiteralControl(strLiteral))
                        cell.HorizontalAlign = HorizontalAlign.Right
                        cell.VerticalAlign = VerticalAlign.Top
                        cell.ColumnSpan = 3
                        cell.Style.Add("padding-left", "5px")
                        cell.Style.Add("padding-top", "7px")
                        cell.Style.Add("padding-bottom", "7px")
                        row.Cells.Add(cell)

                        cell = New TableCell
                        strLiteral = Format(dblDCAmount, "$#,##0.00")
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
                        cell.HorizontalAlign = HorizontalAlign.Right
                        cell.VerticalAlign = VerticalAlign.Top
                        cell.Style.Add("padding-left", "5px")
                        cell.Style.Add("padding-top", "7px")
                        cell.Style.Add("padding-bottom", "7px")
                        row.Cells.Add(cell)
                        Me.tblOrder.Rows.Add(row)
                End If

                '// Print TAX Amount
                row = New TableRow
                cell = New TableCell
                strLiteral = "TAX"
                cell.Controls.Add(New LiteralControl(strLiteral))
                cell.HorizontalAlign = HorizontalAlign.Right
                cell.VerticalAlign = VerticalAlign.Top
                cell.ColumnSpan = 3
                cell.Style.Add("padding-left", "5px")
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
                cell.HorizontalAlign = HorizontalAlign.Right
                cell.VerticalAlign = VerticalAlign.Top
                cell.Style.Add("padding-left", "5px")
                cell.Style.Add("padding-top", "7px")
                cell.Style.Add("padding-bottom", "7px")
                row.Cells.Add(cell)
                Me.tblOrder.Rows.Add(row)

                '// Print Shipping Charge Amount
                row = New TableRow
                cell = New TableCell
                strLiteral = "Shipping Charge"
                cell.Controls.Add(New LiteralControl(strLiteral))
                cell.HorizontalAlign = HorizontalAlign.Right
                cell.VerticalAlign = VerticalAlign.Top
                cell.ColumnSpan = 3
                cell.Style.Add("padding-left", "5px")
                cell.Style.Add("padding-top", "7px")
                cell.Style.Add("padding-bottom", "7px")
                row.Cells.Add(cell)

                cell = New TableCell
                strLiteral = Format(dblShippingAmount, "$#,##0.00")
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
                cell.HorizontalAlign = HorizontalAlign.Right
                cell.VerticalAlign = VerticalAlign.Top
                cell.Style.Add("padding-left", "5px")
                cell.Style.Add("padding-top", "7px")
                cell.Style.Add("padding-bottom", "7px")
                row.Cells.Add(cell)
                Me.tblOrder.Rows.Add(row)

                '// Print Total Payment
                row = New TableRow
                cell = New TableCell
                strLiteral = "Total Payment"
                cell.Controls.Add(New LiteralControl(strLiteral))
                cell.HorizontalAlign = HorizontalAlign.Right
                cell.VerticalAlign = VerticalAlign.Top
                cell.ColumnSpan = 3
                cell.Style.Add("padding-left", "5px")
                cell.Style.Add("padding-top", "7px")
                cell.Style.Add("padding-bottom", "7px")
                row.Cells.Add(cell)

                cell = New TableCell
                strLiteral = Format(dblPaymentAmount, "$#,##0.00")
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
                cell.HorizontalAlign = HorizontalAlign.Right
                cell.VerticalAlign = VerticalAlign.Top
                cell.Style.Add("padding-left", "5px")
                cell.Style.Add("padding-top", "7px")
                cell.Style.Add("padding-bottom", "7px")
                row.Cells.Add(cell)
                Me.tblOrder.Rows.Add(row)

                Me.ltrOrderNo.Text = OrderNo + " [" + rdOrder("OrderDate") + "]"
                Me.ltrCardType.Text = rdOrder("PayMethod")
                Me.ltrPayStatus.Text = rdOrder("PayStatus")
                Me.ltrOrderStatus.Text = getStatusName(rdOrder("OrderStatus"))
                Me.ltrShippingMethod.Text = rdOrder("ShipMethod")
                Me.ltrShippingFee.Text = " (" + Format(dblShippingAmount, "$#,##0.00") + ")"
                strTrackingNo = rdOrder("TrackingNo")
                If strTrackingNo.Length > 0 Then
                        Me.lbtnTracking.Text = strTrackingNo
                        Me.lbtnTracking.PostBackUrl = UPSTrackURL + strTrackingNo
                Else
                        Me.lbtnTracking.Text = "is not generated yet.."
                        Me.lbtnTracking.PostBackUrl = "#"
                End If

                Call displayBillingInfo(rdOrder("ClientNo"))
                Me.ltrBillAddress.Text = rdOrder("Street1") + " " + rdOrder("Street2") + "<br>" + _
                                                rdOrder("City") + ", " + rdOrder("State") + " " + rdOrder("Zip") + " " + rdOrder("Country")
                'Me.ltrBillPhone.Text = rdOrder("ClientNo")

                Me.ltrShipName.Text = rdOrder("RecipientName")
                Me.ltrShipAddress.Text = rdOrder("RecipientStreet1") + " " + rdOrder("RecipientStreet2") + _
                                                rdOrder("RecipientCity") + ", " + rdOrder("RecipientState") + " " + rdOrder("RecipientZip") + " " + rdOrder("RecipientCountry")
                Me.ltrShipPhone.Text = rdOrder("RecipientPhone")

                rdOrder.Close()
                connTR.Close()

        End Sub

        Private Function getStatusName(ByVal StatusCode As String) As String
                Dim strName As String = ""
                Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
                Dim connTR As Data.SqlClient.SqlConnection
                Dim commCode As Data.SqlClient.SqlCommand
                Dim rdCode As Data.SqlClient.SqlDataReader
                Dim sqlCode As String = ""

                connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
                connTR.Open()

                sqlCode = "SELECT Top 1 * FROM CodeOrderStatus WHERE StatusCode=@StatusCode "

                commCode = New Data.SqlClient.SqlCommand
                commCode.CommandText = sqlCode
                commCode.Connection = connTR
                commCode.Parameters.AddWithValue("@StatusCode", StatusCode)
                rdCode = commCode.ExecuteReader()

                rdCode.Read()
                If rdCode.HasRows Then
                        strName = rdCode("StatusName")
                Else
                        strName = StatusCode
                End If

                rdCode.Close()
                connTR.Close()

                Return strName
        End Function

        Private Sub displayBillingInfo(ByVal ClientNo As Long)
                Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
                Dim connTR As Data.SqlClient.SqlConnection
                Dim commCode As Data.SqlClient.SqlCommand
                Dim rdCode As Data.SqlClient.SqlDataReader
                Dim sqlCode As String = ""

                connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
                connTR.Open()

                sqlCode = "SELECT Top 1 * FROM ClientMaster WHERE SerialNo=@SerialNo "

                commCode = New Data.SqlClient.SqlCommand
                commCode.CommandText = sqlCode
                commCode.Connection = connTR
                commCode.Parameters.AddWithValue("@SerialNo", ClientNo)
                rdCode = commCode.ExecuteReader()

                rdCode.Read()
                If rdCode.HasRows Then
                        Me.ltrBillName.Text = rdCode("ClientNameF") + " " + rdCode("ClientNameL")
                        Me.ltrBillPhone.Text = rdCode("Phone")
                Else
                        Me.ltrBillName.Text = ClientNo.ToString
                        Me.ltrBillPhone.Text = ClientNo.ToString
                End If

                rdCode.Close()
                connTR.Close()

        End Sub

        Protected Sub btnBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBack.Click

                Response.Redirect("OrderHistory.aspx")

        End Sub
End Class
