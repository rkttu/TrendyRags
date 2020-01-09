
Partial Class Checkout_FinalMessage
    Inherits System.Web.UI.Page

        Dim OrderNo As String
        Dim SSLRoot As String = ConfigurationManager.AppSettings("SSLRoot")
        Dim NSRoot As String = ConfigurationManager.AppSettings("NONSSLRoot")

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

                OrderNo = Request("ON")

                Me.ltrOrderNo.Text = "<Font size=+1><b><i>" & OrderNo & "</i></b></font>"
                Call initTable()
                Call initOrderDetail(OrderNo)
                Call initOrderInfo(OrderNo)

        End Sub

        Structure Client
                Dim Name As String
                Dim Phone As String
        End Structure

        Private Sub initOrderInfo(ByVal OrderNo As String)
                Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
                Dim connTR As Data.SqlClient.SqlConnection
                Dim commOrder As Data.SqlClient.SqlCommand
                Dim rdOrder As Data.SqlClient.SqlDataReader
                Dim sqlOrder As String = ""
                Dim strLiteral As String
                Dim ClientInfo As Client
                Dim row As TableRow
                Dim cell As TableCell


                connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
                connTR.Open()

                sqlOrder = "SELECT * FROM OrderMaster WHERE (OrderNo=@OrderNo) And (Email=@Email)  "

                commOrder = New Data.SqlClient.SqlCommand
                commOrder.CommandText = sqlOrder
                commOrder.Connection = connTR
                commOrder.Parameters.AddWithValue("@OrderNo", OrderNo)
                commOrder.Parameters.AddWithValue("@Email", Session.Item("UserID"))
                rdOrder = commOrder.ExecuteReader()
                rdOrder.Read()

                If Not rdOrder.HasRows Then
                        MessageBox("Please login first!!")
                        Response.Redirect("~/default.aspx")
                Else
                        ClientInfo = getClientInfo(rdOrder("ClientNo"))
                        Me.ltrBillAddress.Text = rdOrder("Street1") + " " + rdOrder("Street2") + "<br>" + _
                                                        rdOrder("City") + ", " + rdOrder("State") + " " + rdOrder("Zip") + "<br>" + _
                                                        rdOrder("Country")
                        Me.ltrBillName.Text = ClientInfo.Name
                        Me.ltrBillPhone.Text = ClientInfo.Phone
                        Me.ltrCardHolder.Text = ClientInfo.Name
                        Me.ltrCardType.Text = rdOrder("PayMethod")
                        Me.ltrShipAddress.Text = rdOrder("RecipientStreet1") + " " + rdOrder("RecipientStreet2") + "<br>" + _
                                                        rdOrder("RecipientCity") + ", " + rdOrder("RecipientState") + " " + rdOrder("RecipientZip") + "<br>" + _
                                                        rdOrder("RecipientCountry")
                        Me.ltrShipName.Text = rdOrder("RecipientName")
                        Me.ltrShipPhone.Text = rdOrder("RecipientPhone")
                        Me.ltrShippingFee.Text = Format(rdOrder("ShippingAmount"), "$#,##0.00")
                        Me.ltrShippingMethod.Text = rdOrder("ShipMethod")



                        '//
                        '// Print Total
                        '//
                        row = New TableRow

                        cell = New TableCell
                        strLiteral = "Total Order"
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
                        strLiteral = Format(rdOrder("OrderAmount"), "$#,##0.00")
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

                        Me.tblOrders.Rows.Add(row)


                        '//
                        '// Print Discount
                        '//
                        If rdOrder("DCAmount") > 0 Then
                                row = New TableRow

                                cell = New TableCell
                                strLiteral = "Discount (" + rdOrder("CouponDCRate").ToString + "%)"
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
                                strLiteral = Format(rdOrder("DCAmount"), "$#,##0.00")
                                cell.Controls.Add(New LiteralControl(strLiteral))
                                cell.HorizontalAlign = HorizontalAlign.Center
                                cell.VerticalAlign = VerticalAlign.Middle
                                cell.Style.Add("padding-left", "5px")
                                cell.Style.Add("padding-top", "7px")
                                cell.Style.Add("padding-bottom", "7px")
                                cell.Style.Add("border-top-style", "solid")
                                cell.Style.Add("border-top-width", "1px")
                                cell.Style.Add("border-top-color", "#8B4513")
                                cell.Style.Add("color", "#DB0008")
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

                                Me.tblOrders.Rows.Add(row)

                        End If

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
                        strLiteral = Format(rdOrder("TaxAmount"), "$#,##0.00")
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

                        Me.tblOrders.Rows.Add(row)

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
                        strLiteral = Format(rdOrder("ShippingAmount"), "$#,##0.00")
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

                        Me.tblOrders.Rows.Add(row)

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
                        strLiteral = Format(rdOrder("TotalAmount"), "$#,##0.00")
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

                        Me.tblOrders.Rows.Add(row)

                End If

                rdOrder.Close()
                connTR.Close()

        End Sub

        Private Sub initTable()
                Dim row As TableRow
                Dim cell As TableCell
                Dim strLiteral As String

                Me.tblOrders.Rows.Clear()
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

                Me.tblOrders.Rows.Add(row)

        End Sub

        Private Sub initOrderDetail(ByVal OrderNo As String)
                Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
                Dim connTR As Data.SqlClient.SqlConnection
                Dim commOrder As Data.SqlClient.SqlCommand
                Dim rdOrder As Data.SqlClient.SqlDataReader
                Dim sqlOrder As String = ""
                Dim strLiteral As String
                Dim dblUnitPrice, dblAmount As Double
                Dim intQty As Integer
                Dim row As TableRow
                Dim cell As TableCell

                connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
                connTR.Open()

                sqlOrder = "SELECT * FROM OrderDetail WHERE (OrderNo=@OrderNo) Order by SerialNo  "

                commOrder = New Data.SqlClient.SqlCommand
                commOrder.CommandText = sqlOrder
                commOrder.Connection = connTR
                commOrder.Parameters.AddWithValue("@OrderNo", OrderNo)
                rdOrder = commOrder.ExecuteReader()
                Do While rdOrder.Read()
                        row = New TableRow

                        cell = New TableCell
                        strLiteral = rdOrder("ProductNo") + "<br>" + _
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
                        strLiteral = intQty
                        cell.Controls.Add(New LiteralControl(strLiteral))
                        cell.HorizontalAlign = HorizontalAlign.Center
                        cell.VerticalAlign = VerticalAlign.Middle
                        cell.Style.Add("padding-left", "5px")
                        cell.Style.Add("padding-top", "7px")
                        cell.Style.Add("padding-bottom", "7px")
                        row.Cells.Add(cell)

                        cell = New TableCell
                        dblAmount = rdOrder("UnitPrice")
                        strLiteral = Format(dblAmount, "$#,##0.00")
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

                        Me.tblOrders.Rows.Add(row)

                Loop

                rdOrder.Close()
                connTR.Close()

        End Sub

        Private Function getClientinfo(ByVal ClientNo As Long) As Client
                Dim ClientInfo As Client
                Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
                Dim connTR As Data.SqlClient.SqlConnection
                Dim commClient As Data.SqlClient.SqlCommand
                Dim rdClient As Data.SqlClient.SqlDataReader
                Dim sqlClient As String = ""

                connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
                connTR.Open()

                sqlClient = "SELECT * FROM ClientMaster WHERE (SerialNo=@ClientNo)  "

                commClient = New Data.SqlClient.SqlCommand
                commClient.CommandText = sqlClient
                commClient.Connection = connTR
                commClient.Parameters.AddWithValue("@ClientNo", ClientNo)
                rdClient = commClient.ExecuteReader()
                rdClient.Read()

                ClientInfo.Name = rdClient("ClientNameF") + " " + rdClient("ClientNameM") + " " + rdClient("ClientNameL")
                ClientInfo.Phone = rdClient("Phone")

                rdClient.Close()
                connTR.Close()

                Return ClientInfo
        End Function

        Private Sub MessageBox(ByVal msg As String)

                Dim lbl As New Label()

                lbl.Text = "<script language='javascript'>" & Environment.NewLine & _
                           "window.alert('" + msg + "')</script>"

                Page.Controls.Add(lbl)

        End Sub

        Protected Sub btnContinue_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContinue.Click

                Response.Redirect(NSRoot + "Default.aspx")

        End Sub

End Class
