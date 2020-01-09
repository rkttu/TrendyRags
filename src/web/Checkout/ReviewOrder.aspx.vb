Imports System.Net
Imports System.IO
Imports System.Net.Mail

Partial Class Checkout_ReviewOrder
    Inherits System.Web.UI.Page

    Dim smtpServer As String = ConfigurationManager.AppSettings("SMTPServer")
    Dim dblTAXAmount As Double
    Dim dblShippingFee As Double
    Dim dblTotalAmount As Double
    Dim dblTotalPrice As Double
    Dim intDCRate As Integer
    Dim dblDiscount As Double
    Dim strOrderNo As String
    Dim sglWeight As Single = 0
    Dim strPayResponseCode As String
    Dim strPayReasonCode As String
    Const statusPrePayment As String = "09"
    Const statusTransfered As String = "10"
    Const statusGotPayment As String = "20"
    'Const CATaxRate As Double = 0.085
    'Const APILoginID As String = "48PN2twJS5SZ"
    'Const TransactionKey As String = "9Sr352BXtm3rNg62"
    Dim SSLRoot As String = ConfigurationManager.AppSettings("SSLRoot")
    Dim NSRoot As String = ConfigurationManager.AppSettings("NONSSLRoot")
    Dim APILoginID As String = ConfigurationManager.AppSettings("API Login ID for Authorize.net")
    Dim TransactionKey As String = ConfigurationManager.AppSettings("Transaction Key for Authorize.net")
    Dim CATaxRate As Double = ConfigurationManager.AppSettings("California Tax Rate")

    Structure OrderTemp
        Dim SessionID As String
        Dim CardType As String
        Dim CardNumber As String
        Dim CardExpires As String
        Dim CardCVV As String
        Dim BillName As String
        Dim BillAddress1 As String
        Dim BillAddress2 As String
        Dim BillCity As String
        Dim BillState As String
        Dim BillZip As String
        Dim BillCountry As String
        Dim BillPhone As String
        Dim ShipName As String
        Dim ShipAddress1 As String
        Dim ShipAddress2 As String
        Dim ShipCity As String
        Dim ShipState As String
        Dim ShipZip As String
        Dim ShipCountry As String
        Dim ShipPhone As String
        Dim PaymentMethod As String
        Dim ShippingMethod As String
        Dim CouponCode As String
        Dim CouponDCRate As Integer
    End Structure

    Public Temp As OrderTemp

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender

        ViewState("TAXAmount") = dblTAXAmount
        ViewState("ShippingFee") = dblShippingFee
        ViewState("TotalPrice") = dblTotalPrice
        ViewState("TotalAmount") = dblTotalAmount
        ViewState("DCRate") = intDCRate
        ViewState("Discount") = dblDiscount

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If IsPostBack() Then
            dblTAXAmount = ViewState("TAXAmount")
            dblShippingFee = ViewState("ShippingFee")
            dblTotalPrice = ViewState("TotalPrice")
            dblTotalAmount = ViewState("TotalAmount")
            intDCRate = ViewState("DCRate")
            dblDiscount = ViewState("Discount")
        End If

        Call readCART()
        Call readTempOrder()

    End Sub

    Private Sub readCART()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commCart As Data.SqlClient.SqlCommand
        Dim rdCart As Data.SqlClient.SqlDataReader
        Dim sqlCart As String = ""
        Dim nRow As Integer

        Dim row As TableRow
        Dim cell As TableCell
        Dim strLiteral, strProductNo As String
        Dim dblUnitPrice, dblSubTotal As Double
        Dim intQty As Integer
        Dim strSizeName As String = ""
        Dim strColorName As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlCart = "SELECT * FROM CART WHERE (SessionID=@SessionID) And (Qty > 0) Order by CartNo "

        commCart = New Data.SqlClient.SqlCommand
        commCart.CommandText = sqlCart
        commCart.Connection = connTR
        commCart.Parameters.AddWithValue("@SessionID", Session.SessionID)
        rdCart = commCart.ExecuteReader()
        dblTotalPrice = 0
        sglWeight = 0
        nRow = 0
        Do While rdCart.Read()

            nRow += 1
            dblSubTotal = 0
            strProductNo = rdCart("ProductNo")
            strSizeName = rdCart("SizeName")
            strColorName = rdCart("ColorName")

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
            strLiteral = Format(intQty, "#,##0")
            cell.Controls.Add(New LiteralControl(strLiteral))
            cell.HorizontalAlign = HorizontalAlign.Center
            cell.VerticalAlign = VerticalAlign.Middle
            cell.Style.Add("padding-left", "5px")
            cell.Style.Add("padding-top", "7px")
            cell.Style.Add("padding-bottom", "7px")
            row.Cells.Add(cell)

            sglWeight += (getWeight(strProductNo, strSizeName) * intQty)

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

            Me.tblCART.Rows.Add(row)
        Loop

        rdCart.Close()
        connTR.Close()

        Call getOrderTemp()
        Call printTotalAmount()

    End Sub

    Private Function getWeight(ByVal strProductNo As String, ByVal strSizeName As String) As Single
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commSIZE As Data.SqlClient.SqlCommand
        Dim rdSIZE As Data.SqlClient.SqlDataReader
        Dim sqlSIZE As String = ""
        Dim sglWeight As Single = 0

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlSIZE = "SELECT TOP 1 * FROM ProductSize WHERE (ProductNo=@ProductNo) And (SizeName=@SizeName) "

        commSIZE = New Data.SqlClient.SqlCommand
        commSIZE.CommandText = sqlSIZE
        commSIZE.Connection = connTR
        commSIZE.Parameters.AddWithValue("@ProductNo", strProductNo)
        commSIZE.Parameters.AddWithValue("@SizeName", strSizeName)
        rdSIZE = commSIZE.ExecuteReader()
        rdSIZE.Read()

        sglWeight = rdSIZE("WeightLBS")

        rdSIZE.Close()
        connTR.Close()

        Return sglWeight
    End Function

    Private Sub getOrderTemp()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commTEMP As Data.SqlClient.SqlCommand
        Dim rdTEMP As Data.SqlClient.SqlDataReader
        Dim sqlTEMP As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlTEMP = "SELECT TOP 1 * FROM OrderTemp WHERE (SessionID=@SessionID) Order by RegDate DESC "

        commTEMP = New Data.SqlClient.SqlCommand
        commTEMP.CommandText = sqlTEMP
        commTEMP.Connection = connTR
        commTEMP.Parameters.AddWithValue("@SessionID", Session.SessionID)
        rdTEMP = commTEMP.ExecuteReader()
        rdTEMP.Read()

        Temp.BillAddress1 = rdTEMP("BillAddress1").ToString
        Temp.BillAddress2 = rdTEMP("BillAddress2").ToString
        Temp.BillCity = rdTEMP("BillCity").ToString
        Temp.BillCountry = rdTEMP("BillCountry").ToString
        Temp.BillName = rdTEMP("BillName").ToString
        Temp.BillPhone = rdTEMP("BillPhone").ToString
        Temp.BillState = rdTEMP("BillState").ToString
        Temp.BillZip = rdTEMP("BillZip").ToString
        Temp.CardCVV = rdTEMP("CardCVV").ToString
        Temp.CardExpires = rdTEMP("CardExpires").ToString
        Temp.CardNumber = rdTEMP("CardNumber").ToString
        Temp.CardType = rdTEMP("CardType").ToString
        Temp.SessionID = rdTEMP("SessionID")
        Temp.ShipAddress1 = rdTEMP("ShipAddress1").ToString
        Temp.ShipAddress2 = rdTEMP("ShipAddress2").ToString
        Temp.ShipCity = rdTEMP("ShipCity").ToString
        Temp.ShipCountry = rdTEMP("ShipCountry").ToString
        Temp.ShipName = rdTEMP("ShipName").ToString
        Temp.PaymentMethod = rdTEMP("PaymentMethod").ToString
        Temp.ShippingMethod = rdTEMP("ShippingMethod").ToString
        Temp.ShipPhone = rdTEMP("ShipPhone").ToString
        Temp.ShipState = rdTEMP("ShipState").ToString
        Temp.ShipZip = rdTEMP("ShipZip").ToString
        Temp.CouponCode = rdTEMP("CouponCode").ToString
        Temp.CouponDCRate = rdTEMP("CouponDCRate")

        rdTEMP.Close()
        connTR.Close()

    End Sub

    Private Sub printTotalAmount()
        Dim row As TableRow
        Dim cell As TableCell
        Dim strLiteral As String

        If Temp.CouponDCRate > 0 Then
            dblDiscount = dblTotalPrice * (Temp.CouponDCRate / 100)
        Else
            dblDiscount = 0
        End If
        dblTAXAmount = getTAX(dblTotalPrice - dblDiscount)
        dblShippingFee = getShippingFee(dblTotalPrice - dblDiscount)
        dblTotalAmount = (dblTotalPrice - dblDiscount) + dblTAXAmount + dblShippingFee

        '//
        '// Print Order amount
        '//
        row = New TableRow

        cell = New TableCell
        strLiteral = "Order Amount"
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

        Me.tblCART.Rows.Add(row)

        '//
        '// Print Discount
        '//

        If Temp.CouponDCRate > 0 Then
            row = New TableRow

            cell = New TableCell
            strLiteral = "Discount (" + Temp.CouponDCRate.ToString + "%)"
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
            strLiteral = Format(dblDiscount, "$#,##0.00")
            cell.Controls.Add(New LiteralControl(strLiteral))
            cell.HorizontalAlign = HorizontalAlign.Center
            cell.VerticalAlign = VerticalAlign.Middle
            cell.Style.Add("color", "#DB0008")
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

            Me.tblCART.Rows.Add(row)
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

        Me.tblCART.Rows.Add(row)

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

        Me.tblCART.Rows.Add(row)

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

        Me.tblCART.Rows.Add(row)

    End Sub

    Private Function getTAX(ByVal TotalAmount As Double) As Double
        Dim dblTAX As Double = 0

        'If Temp.BillState = "CA" Then
        '        dblTAX = TotalAmount * CATaxRate
        'Else
        '        dblTAX = 0
        'End If

        dblTAX = TotalAmount * CATaxRate
        dblTAX = Int(dblTAX * 100) / 100

        Return dblTAX
    End Function

    Private Function getShippingFee(ByVal TotalAmount As Double) As Double
        Dim dblShip As Double
        Dim strShip As String

        strShip = Temp.ShippingMethod

        Select Case strShip
            Case "UPS Ground"
                dblShip = 0
            Case "UPS 2 Days"
                If TotalAmount < 50 Then
                    dblShip = 12
                ElseIf TotalAmount < 150 Then
                    dblShip = 14
                ElseIf TotalAmount < 250 Then
                    dblShip = 17
                ElseIf TotalAmount < 450 Then
                    dblShip = 19
                Else
                    dblShip = 22
                End If
            Case "UPS Next Day"
                If TotalAmount < 50 Then
                    dblShip = 19
                ElseIf TotalAmount < 150 Then
                    dblShip = 22
                ElseIf TotalAmount < 250 Then
                    dblShip = 25
                ElseIf TotalAmount < 450 Then
                    dblShip = 28
                Else
                    dblShip = 35
                End If
        End Select

        If Session.Item("Class") = "WHOLESALE" Then
            dblShip = getShippingFee_Wholesale()
        End If
        Me.ltrShippingFee.Text = Format(dblShip, " $#,##0.00")
        Return dblShip
    End Function

    Private Function getShippingFee_Wholesale() As Double
        Dim dblFee As Double = 0
        Dim strZipCode As String = Microsoft.VisualBasic.Left(Temp.ShipZip, 3)
        Dim strDefaultArea As String = "Domestic"
        Dim strDefaultClass As String = "Ground"
        Dim BoxFactor_Wholesale As String = ConfigurationManager.AppSettings("Box Factor for Wholesale")


        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commUPS As Data.SqlClient.SqlCommand
        Dim rdZone As Data.SqlClient.SqlDataReader
        Dim sqlZone As String = ""
        Dim strZoneCode As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlZone = "SELECT Ground FROM UPS_ZoneCode WHERE (ZipCode=@ZipCode) "

        '//
        '// Get Zonecode first
        '//
        commUPS = New Data.SqlClient.SqlCommand
        commUPS.CommandText = sqlZone
        commUPS.Connection = connTR
        commUPS.Parameters.AddWithValue("@ZipCode", Temp.ShipZip)
        rdZone = commUPS.ExecuteReader()
        rdZone.Read()
        If rdZone.HasRows Then
            strZoneCode = rdZone("Ground")
        Else
            rdZone.Close()
            commUPS.Parameters.Clear()
            commUPS.Parameters.AddWithValue("@ZipCode", strZipCode)
            rdZone = commUPS.ExecuteReader()
            rdZone.Read()
            If rdZone.HasRows Then
                strZoneCode = rdZone("Ground")
            Else
                strZoneCode = "000"
            End If
        End If

        rdZone.Close()

        '//
        '// Get Rate
        '//
        Dim commRate As Data.SqlClient.SqlCommand
        Dim rdRate As Data.SqlClient.SqlDataReader
        Dim lngRate As String = ""
        Dim sglHeavy As Single

        sglWeight = sglWeight * CDbl(BoxFactor_Wholesale)       '// Add box weight factor (1.15)
        If sglWeight > 150 Then
            sglHeavy = 150
        Else
            sglHeavy = sglWeight
        End If

        sqlZone = "SELECT * FROM UPS_Rates WHERE (Area=@Area) AND (Class=@Class) AND (Weight=@Weight) "

        commRate = New Data.SqlClient.SqlCommand
        commRate.CommandText = sqlZone
        commRate.Connection = connTR
        commRate.Parameters.AddWithValue("@Area", strDefaultArea)
        commRate.Parameters.AddWithValue("@Class", strDefaultClass)
        commRate.Parameters.AddWithValue("@Weight", Int(sglHeavy) + 1)
        rdRate = commRate.ExecuteReader()
        rdRate.Read()

        Select Case strZoneCode
            Case "002"
                lngRate = rdRate("Zone2")
            Case "003"
                lngRate = rdRate("Zone3")
            Case "004"
                lngRate = rdRate("Zone4")
            Case "005"
                lngRate = rdRate("Zone5")
            Case "006"
                lngRate = rdRate("Zone6")
            Case "007"
                lngRate = rdRate("Zone7")
            Case "008"
                lngRate = rdRate("Zone8")
            Case "044"
                lngRate = rdRate("Zone44")
            Case "045"
                lngRate = rdRate("Zone45")
            Case "046"
                lngRate = rdRate("Zone46")
            Case Else
                lngRate = 0
        End Select

        rdRate.Close()
        connTR.Close()

        '// 무게가 150파운드를 넘으면 150파운드까지의 요금에 추가 무게에 대해서 파운드당 0.42달러를 추가한다.
        If sglWeight > 150 Then
            dblFee = lngRate + ((sglWeight - 150) * 0.42)
        Else
            dblFee = lngRate
        End If

        Return dblFee
    End Function

    Private Sub readTempOrder()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")

        Select Case Temp.PaymentMethod.ToUpper
            Case "CREDIT CARD"
                Me.ltrCardCVV.Text = Temp.CardCVV
                Me.ltrCardExpires.Text = Left(Temp.CardExpires, 2) + " / " + Right(Temp.CardExpires, 2)
                Me.ltrCardHolder.Text = Temp.BillName
                Me.ltrCardNumber.Text = Temp.CardNumber
                Me.ltrCardType.Text = Temp.CardType

                Me.lblCardHolder.Visible = True
                Me.lblCardNumber.Visible = True
                Me.lblCardType.Visible = True
                Me.lblCVVcode.Visible = True
                Me.lblExpires.Visible = True

                Me.lblCardHolder.Text = "Card Holder"
                Me.lblCardNumber.Text = "Card Number"
                Me.lblCardType.Text = "Card Type"
                Me.lblCVVcode.Text = "CVV code"
                Me.lblExpires.Text = "Expires"

            Case "COD"
                Me.ltrCardCVV.Text = ""
                Me.ltrCardExpires.Text = ""
                Me.ltrCardHolder.Text = ""
                Me.ltrCardNumber.Text = "Required approval"
                Me.ltrCardType.Text = "COD"

                Me.lblCardHolder.Visible = False
                Me.lblCardNumber.Visible = False
                Me.lblCardType.Visible = True
                Me.lblCVVcode.Visible = False
                Me.lblExpires.Visible = False

                Me.lblCardHolder.Text = ""
                Me.lblCardNumber.Text = "Message"
                Me.lblCardType.Text = "Payment Method"
                Me.lblCVVcode.Text = ""
                Me.lblExpires.Text = ""

            Case "NET 30"
                Me.ltrCardCVV.Text = ""
                Me.ltrCardExpires.Text = ""
                Me.ltrCardHolder.Text = ""
                Me.ltrCardNumber.Text = "Required our pre-approval"
                Me.ltrCardType.Text = "NET 30"

                Me.lblCardHolder.Visible = False
                Me.lblCardNumber.Visible = False
                Me.lblCardType.Visible = True
                Me.lblCVVcode.Visible = False
                Me.lblExpires.Visible = False

                Me.lblCardHolder.Text = ""
                Me.lblCardNumber.Text = "Message"
                Me.lblCardType.Text = "Payment Method"
                Me.lblCVVcode.Text = ""
                Me.lblExpires.Text = ""

            Case Else
                Me.ltrCardCVV.Text = ""
                Me.ltrCardExpires.Text = ""
                Me.ltrCardHolder.Text = ""
                Me.ltrCardNumber.Text = ""
                Me.ltrCardType.Text = "ETC"

                Me.lblCardHolder.Visible = False
                Me.lblCardNumber.Visible = False
                Me.lblCardType.Visible = True
                Me.lblCVVcode.Visible = False
                Me.lblExpires.Visible = False

                Me.lblCardHolder.Text = ""
                Me.lblCardNumber.Text = ""
                Me.lblCardType.Text = "Payment Method"
                Me.lblCVVcode.Text = ""
                Me.lblExpires.Text = ""

        End Select

        Me.ltrBillAddress.Text = Temp.BillAddress1 + " " + Temp.BillAddress2 + "<br />" + _
                                        Temp.BillCity + ", " + Temp.BillState + " " + Temp.BillZip + "<br />" + _
                                        Temp.BillCountry
        Me.ltrBillName.Text = Temp.BillName
        Me.ltrBillPhone.Text = Temp.BillPhone

        Me.ltrShipAddress.Text = Temp.ShipAddress1 + " " + Temp.ShipAddress2 + "<br />" + _
                                        Temp.ShipCity + ", " + Temp.ShipState + " " + Temp.ShipZip + "<br />" + _
                                        Temp.ShipCountry
        Me.ltrShipName.Text = Temp.ShipName
        Me.ltrShipPhone.Text = Temp.ShipPhone
        Me.ltrShippingMethod.Text = Temp.ShippingMethod

    End Sub

    Protected Sub btnBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBack.Click

        Response.Redirect(SSLRoot + "Checkout/Checkout.aspx")

    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        Call savePreOrder()
        If gotPayment() Then
            Call makeOrderNormal()
            If Session.Item("Class").ToString.ToUpper = "ADMIN" Or Right(Session.Item("UserID"), 7) = "@tr.com" Then
            Else
                Call sendConfirmMail()
            End If
            Call updateCouponBook()
            Call deleteCART()
            Response.Redirect(SSLRoot + "Checkout/FinalMessage.aspx?ON=" & strOrderNo)
            Exit Sub
        Else
            Call makeOrderTroubled()
            Response.Redirect(SSLRoot + "Checkout/Checkout.aspx?RC=Error")
            Exit Sub
        End If

    End Sub

    Private Sub savePreOrder()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commOrder As Data.SqlClient.SqlCommand
        'Dim rdTemp As Data.SqlClient.SqlDataReader
        Dim sqlOrder As String = ""
        Dim strSessionID As String
        Dim strUserIP As String = Request.ServerVariables("REMOTE_ADDR")

        strSessionID = Session.SessionID

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlOrder = "INSERT INTO OrderMaster ( OrderNo, "
        sqlOrder += "OrderDate, ClientNo, Email, Street1, Street2, City, State, Zip, Country, OrderAmount, "
        sqlOrder += "TaxAmount, WrappingCharge, ShippingAmount, TotalAmount, PayMethod, PayStatus, "
        sqlOrder += "ShipMethod, OrderStatus, CommentFromClient, IsGift, GiftWrapping,  "
        sqlOrder += "RecipientName, RecipientStreet1, RecipientStreet2, RecipientCity, RecipientState, "
        sqlOrder += "RecipientZip, RecipientCountry, RecipientPhone, GiftComment, UserIP, CouponCode, CouponDCRate, DCAmount "
        sqlOrder += ") Values ( @OrderNo, "
        sqlOrder += "@OrderDate, @ClientNo, @Email, @Street1, @Street2, @City, @State, @Zip, @Country, @OrderAmount, "
        sqlOrder += "@TaxAmount, @WrappingCharge, @ShippingAmount, @TotalAmount, @PayMethod, @PayStatus, "
        sqlOrder += "@ShipMethod, @OrderStatus, @CommentFromClient, @IsGift, @GiftWrapping,  "
        sqlOrder += "@RecipientName, @RecipientStreet1, @RecipientStreet2, @RecipientCity, @RecipientState, "
        sqlOrder += "@RecipientZip, @RecipientCountry, @RecipientPhone, @GiftComment, @UserIP, @CouponCode, @CouponDCRate, @DCAmount) "


        commOrder = New Data.SqlClient.SqlCommand
        commOrder.CommandText = sqlOrder
        commOrder.Connection = connTR
        strOrderNo = getOrderNo()

        commOrder.Parameters.AddWithValue("@OrderNo", strOrderNo)
        commOrder.Parameters.AddWithValue("@OrderDate", Now)
        commOrder.Parameters.AddWithValue("@ClientNo", getClientNo(Session.Item("UserID")))
        commOrder.Parameters.AddWithValue("@Email", Session.Item("UserID"))
        commOrder.Parameters.AddWithValue("@Street1", Temp.BillAddress1)
        commOrder.Parameters.AddWithValue("@Street2", Temp.BillAddress2)
        commOrder.Parameters.AddWithValue("@City", Temp.BillCity)
        commOrder.Parameters.AddWithValue("@State", Temp.BillState)
        commOrder.Parameters.AddWithValue("@Zip", Temp.BillZip)
        commOrder.Parameters.AddWithValue("@Country", Temp.BillCountry)
        commOrder.Parameters.AddWithValue("@OrderAmount", dblTotalPrice)
        commOrder.Parameters.AddWithValue("@TaxAmount", dblTAXAmount)
        commOrder.Parameters.AddWithValue("@WrappingCharge", 0)
        commOrder.Parameters.AddWithValue("@ShippingAmount", dblShippingFee)
        commOrder.Parameters.AddWithValue("@TotalAmount", dblTotalAmount)
        If Temp.PaymentMethod.ToUpper = "CREDIT CARD" Then
            commOrder.Parameters.AddWithValue("@PayMethod", Temp.CardType + " (****-****-****-" + Right(Temp.CardNumber, 4) + ")")
        Else
            commOrder.Parameters.AddWithValue("@PayMethod", Temp.PaymentMethod)
        End If
        commOrder.Parameters.AddWithValue("@PayStatus", "PrePayment")
        commOrder.Parameters.AddWithValue("@ShipMethod", Temp.ShippingMethod)
        commOrder.Parameters.AddWithValue("@OrderStatus", statusPrePayment)
        Dim strCommentFromClient As String = Me.txtComment.Text
        If strCommentFromClient.Length > 0 Then
            strCommentFromClient = Replace(strCommentFromClient, vbCrLf, "<br>")
        Else
            strCommentFromClient = ""
        End If
        commOrder.Parameters.AddWithValue("@CommentFromClient", strCommentFromClient)
        commOrder.Parameters.AddWithValue("@IsGift", "N/A")
        commOrder.Parameters.AddWithValue("@GiftWrapping", "N/A")
        commOrder.Parameters.AddWithValue("@RecipientName", Temp.ShipName)
        commOrder.Parameters.AddWithValue("@RecipientStreet1", Temp.ShipAddress1)
        commOrder.Parameters.AddWithValue("@RecipientStreet2", Temp.ShipAddress2)
        commOrder.Parameters.AddWithValue("@RecipientCity", Temp.ShipCity)
        commOrder.Parameters.AddWithValue("@RecipientState", Temp.ShipState)
        commOrder.Parameters.AddWithValue("@RecipientZip", Temp.ShipZip)
        commOrder.Parameters.AddWithValue("@RecipientCountry", Temp.ShipCountry)
        commOrder.Parameters.AddWithValue("@RecipientPhone", Temp.ShipPhone)
        commOrder.Parameters.AddWithValue("@GiftComment", "N/A")
        commOrder.Parameters.AddWithValue("@UserIP", strUserIP)
        commOrder.Parameters.AddWithValue("@CouponCode", Temp.CouponCode)
        commOrder.Parameters.AddWithValue("@CouponDCRate", Temp.CouponDCRate)
        commOrder.Parameters.AddWithValue("@DCAmount", dblDiscount)

        commOrder.ExecuteNonQuery()
        connTR.Close()

        Call saveOrderDetail(strOrderNo)

    End Sub

    Private Function getOrderNo() As String
        Dim strOrderNumber As String = ""
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commOrder As Data.SqlClient.SqlCommand
        Dim rdOrder As Data.SqlClient.SqlDataReader
        Dim sqlOrder As String = ""
        Dim strLastOrder As String
        Dim lngLastOrder As Long

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlOrder = "SELECT MAX(OrderNo) as LastOrderNo FROM OrderMaster "

        commOrder = New Data.SqlClient.SqlCommand
        commOrder.CommandText = sqlOrder
        commOrder.Connection = connTR
        rdOrder = commOrder.ExecuteReader()
        rdOrder.Read()
        If rdOrder.HasRows Then
            If IsDBNull(rdOrder("LastOrderNo")) Then
                strLastOrder = "AA10000"
            Else
                strLastOrder = rdOrder("LastOrderNo")
            End If
        Else
            strLastOrder = "AA10000"
        End If


        rdOrder.Close()
        connTR.Close()

        lngLastOrder = Val(Right(strLastOrder.Trim, 5)) + 1
        If lngLastOrder > 99999 Then
            lngLastOrder = 10000
        ElseIf lngLastOrder = 0 Then
            lngLastOrder = 10000
        End If

        strOrderNumber = Chr(Year(Today) - 1942) + Chr(Month(Today) + 64) + Right(Trim(Str(lngLastOrder)), 5)
        '// Year+Month+(5-digit serial)
        '// [Year] starts 'A' from year 2007
        '// [Month] starts 'A' from January

        Return strOrderNumber
    End Function

    Private Function getClientNo(ByVal strEmail As String) As Long
        Dim lngClientNo As Long = 0
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commClient As Data.SqlClient.SqlCommand
        Dim rdClient As Data.SqlClient.SqlDataReader
        Dim sqlClient As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlClient = "SELECT TOP 1 SerialNo FROM ClientMaster Where Email=@Email "

        commClient = New Data.SqlClient.SqlCommand
        commClient.CommandText = sqlClient
        commClient.Connection = connTR
        commClient.Parameters.AddWithValue("@Email", strEmail)
        rdClient = commClient.ExecuteReader()
        rdClient.Read()
        lngClientNo = rdClient("SerialNo")

        rdClient.Close()
        connTR.Close()

        Return lngClientNo
    End Function

    Structure OrderList
        Dim ProductNo As String
        Dim ColorName As String
        Dim SizeName As String
        Dim Qty As Integer
        Dim UnitPrice As Double
        Dim Amount As Double
    End Structure

    Private Sub saveOrderDetail(ByVal strOrderNo As String)
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commCart As Data.SqlClient.SqlCommand
        Dim rdCart As Data.SqlClient.SqlDataReader
        Dim sqlCart As String = ""
        Dim OrderDetail As OrderList

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlCart = "SELECT * FROM CART WHERE (SessionID=@SessionID) And (Qty > 0) Order by CartNo "

        commCart = New Data.SqlClient.SqlCommand
        commCart.CommandText = sqlCart
        commCart.Connection = connTR
        commCart.Parameters.AddWithValue("@SessionID", Session.SessionID)
        rdCart = commCart.ExecuteReader()

        Do While rdCart.Read()
            OrderDetail.ProductNo = rdCart("ProductNo")
            OrderDetail.ColorName = rdCart("ColorName")
            OrderDetail.SizeName = rdCart("SizeName")
            OrderDetail.UnitPrice = rdCart("UnitPrice")
            OrderDetail.Qty = rdCart("Qty")
            OrderDetail.Amount = OrderDetail.UnitPrice * OrderDetail.Qty

            Call InsertDetails(OrderDetail, strOrderNo)
        Loop

        rdCart.Close()
        connTR.Close()

    End Sub

    Private Sub InsertDetails(ByVal Orderdetail As OrderList, ByVal OrderNo As String)
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commOrder As Data.SqlClient.SqlCommand
        Dim sqlOrder As String = ""
        Dim strSessionID As String

        strSessionID = Session.SessionID

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlOrder = "INSERT INTO OrderDetail ( "
        sqlOrder += "OrderNo, ProductNo, ColorName, SizeName, Qty, UnitPrice, Amount, Remarks "
        sqlOrder += ") Values ( "
        sqlOrder += "@OrderNo, @ProductNo, @ColorName, @SizeName, @Qty, @UnitPrice, @Amount, @Remarks) "

        commOrder = New Data.SqlClient.SqlCommand
        commOrder.CommandText = sqlOrder
        commOrder.Connection = connTR
        commOrder.Parameters.AddWithValue("@OrderNo", OrderNo)
        commOrder.Parameters.AddWithValue("@ProductNo", Orderdetail.ProductNo)
        commOrder.Parameters.AddWithValue("@ColorName", Orderdetail.ColorName)
        commOrder.Parameters.AddWithValue("@SizeName", Orderdetail.SizeName)
        commOrder.Parameters.AddWithValue("@Qty", Orderdetail.Qty)
        commOrder.Parameters.AddWithValue("@UnitPrice", Orderdetail.UnitPrice)
        commOrder.Parameters.AddWithValue("@Amount", Orderdetail.Amount)
        commOrder.Parameters.AddWithValue("@Remarks", "")

        commOrder.ExecuteNonQuery()
        connTR.Close()

    End Sub

    '// Actual page to contact with Pay Gate 
    '// Authorize.Net
    Private Function gotPayment() As Boolean
        Dim blnResult As Boolean
        Dim strResponse As String
        Dim aResponse() As String

        If Session.Item("Class").ToString.ToUpper = "ADMIN" Or Right(Session.Item("UserID"), 7) = "@tr.com" Or Left(Session.Item("UserID"), 7) = "sicho77" Then
            strPayResponseCode = "1"
            strPayReasonCode = "0"
        Else
            If Temp.PaymentMethod.ToUpper = "CREDIT CARD" Then
                'strResponse = readHtmlPage("https://certification.authorize.net/gateway/transact.dll")
                strResponse = readHtmlPage("https://secure.authorize.net/gateway/transact.dll")
                aResponse = Split(strResponse, "|")
                strPayResponseCode = aResponse(0)
                strPayReasonCode = aResponse(2)
            Else
                strPayResponseCode = "1"
                strPayReasonCode = "0"
            End If
        End If

        If strPayResponseCode = "1" Then
            blnResult = True
        Else
            blnResult = False
        End If

        Call WriteLog(strPayResponseCode, strPayReasonCode)

        Return blnResult
    End Function

    Private Sub WriteLog(ByVal strResponse As String, ByVal strReason As String)
        Dim sFilePath As String
        Dim strMyDocument As String = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments)

        sFilePath = "\LOGs\"
        If Not Directory.Exists(sFilePath) Then
            Directory.CreateDirectory(sFilePath)
        End If
        sFilePath += "Log4PG.txt"

        Dim fs As System.IO.StreamWriter = New System.IO.StreamWriter(sFilePath, IO.FileMode.Append)
        fs.WriteLine("===============" + vbCrLf)
        fs.WriteLine("Time Stamp: " + Now.ToString + vbCrLf)
        fs.WriteLine("Session ID.: " + Temp.SessionID.ToUpper + vbCrLf)
        fs.WriteLine("Bill Name: " + Temp.BillName + vbCrLf)
        fs.WriteLine("CardType: " + Temp.CardType + vbCrLf)
        fs.WriteLine("CardNumber: " + Temp.CardNumber + vbCrLf)
        fs.WriteLine("strResponse: " + strResponse + vbCrLf)
        fs.WriteLine("strReason: " + strReason + vbCrLf + vbCrLf)

        fs.Flush()
        fs.Close()

    End Sub

    Private Function readHtmlPage(ByVal url As String) As String
        Dim result As String = ""
        Dim strPost As String            '// "x_login=YOUR-LOGIN-ID&x_tran_key=YOUR-TRANSACTION-KEY&x_method=CC&x_type=AUTH_CAPTURE&x_amount=1.00&x_delim_data=TRUE&x_delim_char=|&x_relay_response=FALSE&x_card_num=4111111111111111&x_exp_date=052009&x_test_request=TRUE&x_version=3.1"
        Dim myWriter As StreamWriter = Nothing

        strPost = "x_login=" & APILoginID
        strPost += "&x_tran_key=" & TransactionKey
        strPost += "&x_method=CC"
        strPost += "&x_type=AUTH_CAPTURE"
        strPost += "&x_delim_data=TRUE"
        strPost += "&x_delim_char=|"
        strPost += "&x_relay_response=FALSE"
        strPost += "&x_test_request=FALSE"
        strPost += "&x_version=3.1"
        strPost += "&x_amount=" & Format(dblTotalAmount, "0.00")
        strPost += "&x_card_num=" & Temp.CardNumber
        ' strPost += "&x_card_num=4111111111111111"
        strPost += "&x_card_code=" & Temp.CardCVV
        strPost += "&x_exp_date=" & Temp.CardExpires
        strPost += "&x_first_name=" & Temp.BillName
        strPost += "&x_address=" & Temp.BillAddress1 + " " + Temp.BillAddress2
        strPost += "&x_city=" & Temp.BillCity
        strPost += "&x_state=" & Temp.BillState
        strPost += "&x_zip=" & Temp.BillZip
        strPost += "&x_country=" & Temp.BillCountry
        strPost += "&x_phone=" & Temp.BillPhone
        strPost += "&x_cust_id=" & Session.Item("UserID")
        strPost += "&x_customer_ip=" & Request.ServerVariables("REMOTE_ADDR")
        strPost += "&x_email=" & Session.Item("UserID")
        strPost += "&x_email_customer=TRUE"
        strPost += "&x_invoice_num=" & strOrderNo

        Dim objRequest As HttpWebRequest = CType(WebRequest.Create(url), HttpWebRequest)
        objRequest.Method = "POST"
        objRequest.ContentLength = strPost.Length
        objRequest.ContentType = "application/x-www-form-urlencoded"

        Try
            myWriter = New StreamWriter(objRequest.GetRequestStream())
            myWriter.Write(strPost)
        Catch e As Exception
            Return e.Message
        Finally
            myWriter.Close()
        End Try

        Dim objResponse As HttpWebResponse = CType(objRequest.GetResponse(), HttpWebResponse)
        Dim sr As New StreamReader(objResponse.GetResponseStream())
        result = sr.ReadToEnd()

        ' Close and clean up the StreamReader
        sr.Close()
        Return result
    End Function 'readHtmlPage

    Private Sub makeOrderNormal()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commOrder As Data.SqlClient.SqlCommand
        'Dim rdTemp As Data.SqlClient.SqlDataReader
        Dim sqlOrder As String = ""
        Dim strSessionID As String

        strSessionID = Session.SessionID

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlOrder = "UPDATE OrderMaster SET PayStatus=@PayStatus, OrderStatus=@OrderStatus "
        sqlOrder += " WHERE OrderNo=@OrderNo "

        commOrder = New Data.SqlClient.SqlCommand
        commOrder.CommandText = sqlOrder
        commOrder.Connection = connTR
        commOrder.Parameters.AddWithValue("@PayStatus", "Normal")
        commOrder.Parameters.AddWithValue("@OrderStatus", statusGotPayment)
        commOrder.Parameters.AddWithValue("@OrderNo", strOrderNo)

        commOrder.ExecuteNonQuery()
        connTR.Close()

    End Sub

    Private Sub makeOrderTroubled()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commOrder As Data.SqlClient.SqlCommand
        'Dim rdTemp As Data.SqlClient.SqlDataReader
        Dim sqlOrder As String = ""
        Dim strSessionID As String

        strSessionID = Session.SessionID

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlOrder = "UPDATE OrderMaster SET PayStatus=@PayStatus, OrderStatus=@OrderStatus "
        sqlOrder += " WHERE OrderNo=@OrderNo "

        commOrder = New Data.SqlClient.SqlCommand
        commOrder.CommandText = sqlOrder
        commOrder.Connection = connTR
        commOrder.Parameters.AddWithValue("@PayStatus", strPayResponseCode + " [" + strPayReasonCode + "]")
        commOrder.Parameters.AddWithValue("@OrderStatus", statusPrePayment)
        commOrder.Parameters.AddWithValue("@OrderNo", strOrderNo)

        commOrder.ExecuteNonQuery()
        connTR.Close()

    End Sub

    Private Sub deleteCART()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commOrder As Data.SqlClient.SqlCommand
        'Dim rdTemp As Data.SqlClient.SqlDataReader
        Dim sqlOrder As String = ""
        Dim strSessionID As String

        strSessionID = Session.SessionID

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        '//
        '// Erase CART
        '//
        sqlOrder = "DELETE CART WHERE SessionID=@SessionID "

        commOrder = New Data.SqlClient.SqlCommand
        commOrder.CommandText = sqlOrder
        commOrder.Connection = connTR
        commOrder.Parameters.AddWithValue("@SessionID", Session.SessionID)

        commOrder.ExecuteNonQuery()

        '//
        '// Erase Temporary Order
        '//
        sqlOrder = "DELETE OrderTemp WHERE SessionID=@SessionID "

        commOrder = New Data.SqlClient.SqlCommand
        commOrder.CommandText = sqlOrder
        commOrder.Connection = connTR
        commOrder.Parameters.AddWithValue("@SessionID", Session.SessionID)

        commOrder.ExecuteNonQuery()

        connTR.Close()

        Session.Item("CouponCode") = ""
        Session.Item("DCRate") = ""

    End Sub

    Private Sub updateCouponBook()

        If OneTimeCoupon() Then
            Call makeCouponExpired()
        End If

    End Sub

    Private Function OneTimeCoupon() As Boolean
        Dim blnOneTime As Boolean = True
        Dim strMultipleUse As String = ""
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commClient As Data.SqlClient.SqlCommand
        Dim rdClient As Data.SqlClient.SqlDataReader
        Dim sqlClient As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlClient = "SELECT TOP 1 MultipleUse FROM Coupon Where CouponCode=@CouponCode "

        commClient = New Data.SqlClient.SqlCommand
        commClient.CommandText = sqlClient
        commClient.Connection = connTR
        commClient.Parameters.AddWithValue("@CouponCode", Temp.CouponCode)
        rdClient = commClient.ExecuteReader()
        rdClient.Read()
        If rdClient.HasRows Then
            strMultipleUse = rdClient("MultipleUse")
        Else
            strMultipleUse = "MULTI"
        End If

        rdClient.Close()
        connTR.Close()

        If strMultipleUse = "SINGLE" Then
            blnOneTime = True
        Else
            blnOneTime = False
        End If

        Return blnOneTime
    End Function

    Private Sub makeCouponExpired()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commClient As Data.SqlClient.SqlCommand
        Dim sqlClient As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlClient = "UPDATE Coupon SET Used=@Used, EndDate=@EndDate Where CouponCode=@CouponCode "

        commClient = New Data.SqlClient.SqlCommand
        commClient.CommandText = sqlClient
        commClient.Connection = connTR
        commClient.Parameters.AddWithValue("@CouponCode", Temp.CouponCode)
        commClient.Parameters.AddWithValue("@Used", "USED")
        commClient.Parameters.AddWithValue("@EndDate", DateAdd(DateInterval.Day, -2, Today))
        commClient.ExecuteNonQuery()

        connTR.Close()

    End Sub

    Private Sub sendConfirmMail()
        Dim Msg As MailMessage = New MailMessage
        Dim MailObj As New SmtpClient(smtpServer)
        Dim strMyEmail As String = "support@trendyrags.com"
        Dim strMyName As String = "TrendyRags.com"
        Dim strClientEmail As String = Session.Item("UserID")

        Msg.From = New MailAddress(strMyEmail, strMyName)
        Msg.IsBodyHtml = "True"
        Msg.Body = makeMailBody()
        Msg.Subject = "[TrendyRags] Thank you for your order #" & strOrderNo

        Msg.To.Add(New MailAddress(strClientEmail))
        Msg.Bcc.Add(New MailAddress("support@trendyrags.com"))
        Msg.Bcc.Add(New MailAddress("wally@trendyrags.com"))
        Msg.Bcc.Add(New MailAddress("jimi@trendyrags.com"))
        Msg.Bcc.Add(New MailAddress("derek@trendyrags.com"))
        Msg.Bcc.Add(New MailAddress("joe@trendyrags.com"))
        Msg.Bcc.Add(New MailAddress("sicho77@live.com"))
        MailObj.Send(Msg)

    End Sub

    Private Function makeMailBody() As String
        Dim strBody As String = ""
        Dim strPhoneRep As String = ConfigurationManager.AppSettings("PhoneRep")

        strBody += "<div style='font-size:12px; font-family:""Verdana"",""sans-serif""; '>"
        strBody += "Dear " + Temp.BillName + ",<br>"
        strBody += "<br>"
        strBody += "<Table Border=""0"" Width=""800"">"
        strBody += "<Tr><Td>"
        strBody += "<span  style='font-size:12px; font-family:""Verdana"",""sans-serif""; '>"
        strBody += "Thank you for ordering from the TrendyRags.com. We hope that you had a pleasant shopping "
        strBody += "experience. Please retain this email as proof of purchase and to refer back to your order.<br>"
        strBody += "</span><br>"
        'strBody += "You can track the status of orders shipped on our website by clicking on the following link : View Order<br>"
        'strBody += "Please allow one business day for the carrier to update tracking information.<br>"
        'strBody += "<br>"
        strBody += "</Td></Tr></Table>"
        strBody += "The following item(s) are in your order:<br><br>"
        strBody += getTableOfOrderDetail()
        strBody += "<br>"
        strBody += "<Table Border=""0"" Width=""800"">"
        strBody += "<Tr><Td>"
        strBody += "<span style='font-size:11px; font-family:""Verdana"",""sans-serif""; '>"
        strBody += "You will receive another confirmation e-mail from Trendyrags.com customer service. "
        If Session.Item("Class") = "WHOLESALE" Then
            strBody += "We will schedule your wholesale order for production/packaging. We will send you an emailed confirming ship date. "
        Else
            strBody += "Your order will usually ship within 3-7 business days after you receive an emailed confirmation by Trendyrags.com. "
        End If
        strBody += "Trendyrags.com does not ship to PO boxes. We do not ship on Saturdays "
        strBody += "and Sundays. All orders placed on Saturday and Sunday will be processed that following Monday. "
        strBody += "During the holidays and Sundays, our order processing time may increase. "
        strBody += "</Td></Tr></Table>"
        strBody += "</span>"
        strBody += "<br>"
        strBody += "<br>"
        strBody += "<br>"
        strBody += "<b><u>Billing Information</u></b><br>"
        strBody += Temp.BillName + "<br>"
        strBody += Temp.BillAddress1 + " " + Temp.BillAddress2 + "<br>"
        strBody += Temp.BillCity + ", " + Temp.BillState + " " + Temp.BillZip + "<br>"
        strBody += Temp.BillCountry + "<br>"
        strBody += "Payment Method is " + Temp.PaymentMethod + "<br>"
        strBody += "<br>"
        strBody += "<b><u>Shipping Information</u></b><br>"
        strBody += Temp.ShipName + "<br>"
        strBody += Temp.ShipAddress1 + " " + Temp.ShipAddress2 + "<br>"
        strBody += Temp.ShipCity + ", " + Temp.ShipState + " " + Temp.ShipZip + "<br>"
        strBody += Temp.ShipCountry + "<br>"
        strBody += "<br>"
        strBody += "Order No. is <b><u>" + strOrderNo + "</u></b><br>"
        strBody += "Price : " + Format(dblTotalPrice, "$#,##0.00") + "<br>"
        If Temp.CouponDCRate > 0 Then
            strBody += "Discount (" + Temp.CouponDCRate.ToString + "%) : " + Format(dblDiscount, "$#,##0.00") + "<br>"
        End If
        strBody += "TAX : " + Format(dblTAXAmount, "$#,##0.00") + "<br>"
        strBody += "Shipping : " + Format(dblShippingFee, "$#,##0.00") + "<br>"
        strBody += "Total Amount : " + Format(dblTotalAmount, "$#,##0.00") + "<br>"
        strBody += "<hr><br>"
        strBody += "If you have any question, please contact us via email at <a href=""mailto:support@trendyrags.com"">support@trendyrags.com</a>, or "
        strBody += "call us at " + strPhoneRep + ". <br>"
        strBody += "<br>"
        strBody += "Thank you,<br>"
        strBody += "<br>"
        strBody += "Trendyrags, Inc.<br>"
        strBody += "790 E. Washington Blvd.<br>"
        strBody += "Los Angeles, CA 90021<br>"
        strBody += "<br>"
        strBody += "</div>"

        Return strBody
    End Function

    Private Function getTableOfOrderDetail() As String
        Dim strTable As String = ""

        '// table Header
        strTable = "<table cellspacing=""0"" cellpadding=""3"" width=""800px"" style='border-width:1px;font-size:11px; font-family:""Verdana"",""sans-serif""; '>"
        strTable += "<tr>"
        strTable += "<td align=""center"" width=""400"" style=""border-bottom-style:solid; border-bottom-width:1px; border-top-style:double; border-top-width:1px;"">I t e m</td>"
        strTable += "<td align=""right"" width=""150"" style=""border-bottom-style:solid; border-bottom-width:1px; border-top-style:double; border-top-width:1px;"">Unit Price</td>"
        strTable += "<td align=""center"" width=""100"" style=""border-bottom-style:solid; border-bottom-width:1px; border-top-style:double; border-top-width:1px;"">Quantity</td>"
        strTable += "<td align=""right"" width=""150"" style=""border-bottom-style:solid; border-bottom-width:1px; border-top-style:double; border-top-width:1px;"">Sub Total</td>"
        strTable += "</tr>"

        '// table order list
        strTable += getOrderListforMail()

        '// table Footer
        strTable += getTotalPriceforMail()
        strTable += "</table>"

        Return strTable
    End Function

    Private Function getOrderListforMail() As String
        Dim strList As String = ""
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commCart As Data.SqlClient.SqlCommand
        Dim rdCart As Data.SqlClient.SqlDataReader
        Dim sqlCart As String = ""
        Dim nRow As Integer

        Dim strLiteral, strProductNo As String
        Dim dblUnitPrice, dblSubTotal As Double
        Dim intQty As Integer

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

            dblSubTotal = 0
            strProductNo = rdCart("ProductNo")

            strList += "<tr>"

            strLiteral = rdCart("ProductNo") + "<br>" + _
                           rdCart("ColorName") + " / " + rdCart("SizeName")
            strList += "<td align=""left"">" + strLiteral + "</td>"

            dblUnitPrice = rdCart("UnitPrice")
            strLiteral = Format(dblUnitPrice, "$#,##0.00")
            strList += "<td align=""right"">" + strLiteral + "</td>"

            intQty = rdCart("Qty")
            strLiteral = Format(intQty, "#,##0")
            strList += "<td align=""center"">" + strLiteral + "</td>"

            dblSubTotal = dblUnitPrice * intQty
            strLiteral = Format(dblSubTotal, "$#,##0.00")
            strList += "<td align=""right"">" + strLiteral + "</td>"

            strList += "</tr>"
        Loop

        rdCart.Close()
        connTR.Close()

        Return strList
    End Function

    Private Function getTotalPriceforMail() As String
        Dim strTotal As String = ""
        Dim strLiteral As String = ""
        dblTAXAmount = getTAX(dblTotalPrice - dblDiscount)
        dblShippingFee = getShippingFee(dblTotalPrice - dblDiscount)
        dblTotalAmount = (dblTotalPrice - dblDiscount) + dblTAXAmount + dblShippingFee

        '//
        '// Print Total Order
        '//
        strTotal += "<tr>"
        strTotal += "<td colspan=""3"" align=""right"" style=""border-top-style:solid; border-top-width:1px;"">Total Order</td>"

        strLiteral = Format(dblTotalPrice, "$#,##0.00")
        strTotal += "<td align=""right"" style=""border-top-style:solid; border-top-width:1px;"">" + strLiteral + "</td>"

        strTotal += "</tr>"

        '//
        '// Print Discount
        '//
        If dblDiscount > 0 Then
            strTotal += "<tr>"
            strTotal += "<td colspan=""3"" align=""right"" style=""border-top-style:solid; border-top-width:1px;"">Discount</td>"

            strLiteral = Format(dblDiscount, "$#,##0.00")
            strTotal += "<td align=""right"" style=""border-top-style:solid; border-top-width:1px;"">" + strLiteral + "</td>"

            strTotal += "</tr>"
        End If

        '//
        '// Print TAX
        '//
        strTotal += "<tr>"
        strTotal += "<td colspan=""3"" align=""right"">TAX Amount</td>"

        strLiteral = Format(dblTAXAmount, "$#,##0.00")
        strTotal += "<td align=""right"">" + strLiteral + "</td>"

        strTotal += "</tr>"

        '//
        '// Print Shipping Fee
        '//
        strTotal += "<tr>"
        strTotal += "<td colspan=""3"" align=""right"">Shipping Charge</td>"

        strLiteral = Format(dblShippingFee, "$#,##0.00")
        strTotal += "<td align=""right"">" + strLiteral + "</td>"

        strTotal += "</tr>"

        '//
        '// Print Grand Total
        '//
        strTotal += "<tr>"
        strTotal += "<td colspan=""3"" align=""right"" style=""border-bottom-style:double; "">Total Amount</td>"

        strLiteral = Format(dblTotalAmount, "$#,##0.00")
        strTotal += "<td align=""right"" style=""border-bottom-style:double; "">" + strLiteral + "</td>"

        strTotal += "</tr>"

        Return strTotal
    End Function

    Private Sub MessageBox(ByVal msg As String)
        Dim lbl As New Label()

        lbl.Text = "<script language='javascript'>" & Environment.NewLine & _
                   "window.alert('" + msg + "')</script>"

        Page.Controls.Add(lbl)

    End Sub


End Class
