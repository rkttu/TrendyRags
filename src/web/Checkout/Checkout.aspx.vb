
Partial Class Checkout_Checkout
    Inherits System.Web.UI.Page

    Dim SSLRoot As String = ConfigurationManager.AppSettings("SSLRoot")
    Dim NSRoot As String = ConfigurationManager.AppSettings("NONSSLRoot")
    Dim ReturnCode As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ReturnCode = Request("RC")
        If ReturnCode = "Error" Then
            MessageBox("Invalid Card Information...\nPlease confirm your card information again.")
        End If

        Me.chkSame.Attributes.Add("onclick", "ChkboxPressed();")
        Me.ddlPaymentMethod.Attributes.Add("onclick", "changedPayMethod();")

        If IsPostBack() Then

        Else
            If Session.Item("Class") = "WHOLESALE" Then
                Me.lblPaymentMethod.Visible = True
                Me.ddlPaymentMethod.Visible = True
                Me.ddlPaymentMethod.SelectedIndex = 0
            Else
                Me.lblPaymentMethod.Visible = False
                Me.ddlPaymentMethod.Visible = False
                Me.ddlPaymentMethod.SelectedIndex = 0
            End If

            Call initDDLShippingMethod()
            Call getBillingInfo()
        End If

        Me.txtNameBilling.Focus()

    End Sub

    Private Sub initDDLShippingMethod()

        Me.ddlShippingMethod.Items.Clear()

        If Session.Item("Class") = "WHOLESALE" Then
            Me.ddlShippingMethod.Items.Add("UPS Ground")
        Else
            Me.ddlShippingMethod.Items.Add("UPS Ground")
            Me.ddlShippingMethod.Items.Add("UPS 2 Days")
            Me.ddlShippingMethod.Items.Add("UPS Next Day")
        End If
        Me.ddlShippingMethod.Text = "UPS Ground"

    End Sub

    Private Sub getBillingInfo()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commLogin As Data.SqlClient.SqlCommand
        Dim rdLogin As Data.SqlClient.SqlDataReader
        Dim sqlLogin As String = ""
        Dim strUserID, strMessage As String

        strUserID = Session.Item("UserID")

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlLogin = "SELECT Top 1 * FROM ClientMaster WHERE (Email=@Email)  "

        commLogin = New Data.SqlClient.SqlCommand
        commLogin.CommandText = sqlLogin
        commLogin.Connection = connTR
        commLogin.Parameters.AddWithValue("@Email", strUserID)
        rdLogin = commLogin.ExecuteReader()
        rdLogin.Read()
        If rdLogin.HasRows Then
            Me.txtNameBilling.Text = Session.Item("UserName")
            Me.txtAddress1Billing.Text = rdLogin("Street1")
            Me.txtAddress2Billing.Text = rdLogin("Street2")
            Me.txtCityBilling.Text = rdLogin("City")
            Me.ddlStateBilling.Text = rdLogin("State")
            Me.txtZipBilling.Text = rdLogin("Zip")
            Me.ddlCountryBilling.Text = rdLogin("Country")
            Me.txtPhoneBilling.Text = rdLogin("Phone")

            Me.txtNameShipping.Text = Session.Item("UserName")
            Me.txtAddress1Shipping.Text = rdLogin("Street1")
            Me.txtAddress2Shipping.Text = rdLogin("Street2")
            Me.txtCityShipping.Text = rdLogin("City")
            Me.ddlStateShipping.Text = rdLogin("State")
            Me.txtZipShipping.Text = rdLogin("Zip")
            Me.ddlCountryShipping.Text = rdLogin("Country")
            Me.txtPhoneShipping.Text = rdLogin("Phone")
        Else
            strMessage = "Maybe session time is expired.\n"
            strMessage += "Please login again !!"
            MessageBox(strMessage)
            Response.Redirect("ViewCart.aspx")
        End If

        rdLogin.Close()
        connTR.Close()

    End Sub

    Private Sub MessageBox(ByVal msg As String)
        Dim lbl As New Label()

        lbl.Text = "<script language='javascript'>" & Environment.NewLine & _
                   "window.alert('" + msg + "')</script>"

        Page.Controls.Add(lbl)

    End Sub

    Protected Sub btnNextStep_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNextStep.Click

        If HasBeenSaved() Then
            Call updateTempOrder()
        Else
            Call insertTempOrder()
        End If
        Response.Redirect(SSLRoot + "CheckOut/ReviewOrder.aspx")

    End Sub

    Private Function HasBeenSaved() As Boolean
        Dim blnResult As Boolean = False

        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commLogin As Data.SqlClient.SqlCommand
        Dim rdLogin As Data.SqlClient.SqlDataReader
        Dim sqlLogin As String = ""
        Dim strSessionID As String

        strSessionID = Session.SessionID

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlLogin = "SELECT Top 1 * FROM OrderTemp WHERE (SessionID=@SessionID)  "

        commLogin = New Data.SqlClient.SqlCommand
        commLogin.CommandText = sqlLogin
        commLogin.Connection = connTR
        commLogin.Parameters.AddWithValue("@SessionID", strSessionID)
        rdLogin = commLogin.ExecuteReader()
        rdLogin.Read()
        If rdLogin.HasRows Then
            blnResult = True
        Else
            blnResult = False
        End If

        rdLogin.Close()
        connTR.Close()

        Return blnResult
    End Function

    Private Sub updateTempOrder()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commTemp As Data.SqlClient.SqlCommand
        Dim sqlTemp As String = ""
        Dim strSessionID As String

        strSessionID = Session.SessionID

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlTemp = "UPDATE OrderTemp SET  "
        sqlTemp += "CardType=@CardType, "
        sqlTemp += "CardNumber=@CardNumber,"
        sqlTemp += "CardExpires=@CardExpires, "
        sqlTemp += "CardCVV=@CardCVV, "
        sqlTemp += "BillName=@BillName, "
        sqlTemp += "BillAddress1=@BillAddress1, "
        sqlTemp += "BillAddress2=@BillAddress2, "
        sqlTemp += "BillCity=@BillCity, "
        sqlTemp += "BillState=@BillState, "
        sqlTemp += "BillZip=@BillZip,"
        sqlTemp += "BillCountry=@BillCountry, "
        sqlTemp += "BillPhone=@BillPhone, "
        sqlTemp += "ShipName=@ShipName, "
        sqlTemp += "ShipAddress1=@ShipAddress1, "
        sqlTemp += "ShipAddress2=@ShipAddress2, "
        sqlTemp += "ShipCity=@ShipCity, "
        sqlTemp += "ShipState=@ShipState, "
        sqlTemp += "ShipZip=@ShipZip, "
        sqlTemp += "ShipCountry=@ShipCountry, "
        sqlTemp += "ShipPhone=@ShipPhone, "
        sqlTemp += "PaymentMethod=@PaymentMethod, "
        sqlTemp += "ShippingMethod=@ShippingMethod, "
        sqlTemp += "CouponCode=@CouponCode, "
        sqlTemp += "CouponDCRate=@CouponDCRate "
        sqlTemp += " WHERE SessionID=@SessionID "

        commTemp = New Data.SqlClient.SqlCommand
        commTemp.CommandText = sqlTemp
        commTemp.Connection = connTR
        commTemp.Parameters.AddWithValue("@SessionID", strSessionID)
        commTemp.Parameters.AddWithValue("@CardType", Me.ddlCardType.SelectedItem.Text)
        commTemp.Parameters.AddWithValue("@CardNumber", Me.txtCardNumber.Text)
        commTemp.Parameters.AddWithValue("@CardExpires", Me.txtExpiresMonth.Text.Trim + Me.txtExpiresYear.Text.Trim)
        commTemp.Parameters.AddWithValue("@CardCVV", Me.txtCVV.Text)
        commTemp.Parameters.AddWithValue("@BillName", Me.txtNameBilling.Text)
        commTemp.Parameters.AddWithValue("@BillAddress1", Me.txtAddress1Billing.Text)
        commTemp.Parameters.AddWithValue("@BillAddress2", Me.txtAddress2Billing.Text)
        commTemp.Parameters.AddWithValue("@BillCity", Me.txtCityBilling.Text)
        commTemp.Parameters.AddWithValue("@BillState", Me.ddlStateBilling.Text)
        commTemp.Parameters.AddWithValue("@BillZip", Me.txtZipBilling.Text)
        commTemp.Parameters.AddWithValue("@BillCountry", Me.ddlCountryBilling.SelectedItem.Text)
        commTemp.Parameters.AddWithValue("@BillPhone", Me.txtPhoneBilling.Text)
        commTemp.Parameters.AddWithValue("@ShipName", Me.txtNameShipping.Text)
        commTemp.Parameters.AddWithValue("@ShipAddress1", Me.txtAddress1Shipping.Text)
        commTemp.Parameters.AddWithValue("@ShipAddress2", Me.txtAddress2Shipping.Text)
        commTemp.Parameters.AddWithValue("@ShipCity", Me.txtCityShipping.Text)
        commTemp.Parameters.AddWithValue("@ShipState", Me.ddlStateShipping.Text)
        commTemp.Parameters.AddWithValue("@ShipZip", Me.txtZipShipping.Text)
        commTemp.Parameters.AddWithValue("@ShipCountry", Me.ddlCountryShipping.SelectedItem.Text)
        commTemp.Parameters.AddWithValue("@ShipPhone", Me.txtPhoneShipping.Text)
        commTemp.Parameters.AddWithValue("@PaymentMethod", Me.ddlPaymentMethod.SelectedValue)
        commTemp.Parameters.AddWithValue("@ShippingMethod", Me.ddlShippingMethod.Text)
        commTemp.Parameters.AddWithValue("@CouponCode", Session.Item("CouponCode"))
        commTemp.Parameters.AddWithValue("@CouponDCRate", CInt(Session.Item("DCRate")))

        commTemp.ExecuteNonQuery()
        connTR.Close()

    End Sub

    Private Sub insertTempOrder()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commTemp As Data.SqlClient.SqlCommand
        'Dim rdTemp As Data.SqlClient.SqlDataReader
        Dim sqlTemp As String = ""
        Dim strSessionID As String

        strSessionID = Session.SessionID

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlTemp = "INSERT INTO OrderTemp ( "
        sqlTemp += "SessionID, CardType, CardNumber, CardExpires, CardCVV, BillName, BillAddress1, BillAddress2, "
        sqlTemp += "BillCity, BillState, BillZip, BillCountry, BillPhone, ShipName, ShipAddress1, ShipAddress2, "
        sqlTemp += "ShipCity, ShipState, ShipZip, ShipCountry, ShipPhone, PaymentMethod, ShippingMethod, CouponCode, CouponDCRate) Values ("
        sqlTemp += "@SessionID, @CardType, @CardNumber, @CardExpires, @CardCVV, @BillName, @BillAddress1, @BillAddress2, "
        sqlTemp += "@BillCity, @BillState, @BillZip, @BillCountry, @BillPhone, @ShipName, @ShipAddress1, @ShipAddress2, "
        sqlTemp += "@ShipCity, @ShipState, @ShipZip, @ShipCountry, @ShipPhone, @PaymentMethod, @ShippingMethod, @CouponCode, @CouponDCRate)"


        commTemp = New Data.SqlClient.SqlCommand
        commTemp.CommandText = sqlTemp
        commTemp.Connection = connTR
        commTemp.Parameters.AddWithValue("@SessionID", strSessionID)
        commTemp.Parameters.AddWithValue("@CardType", Me.ddlCardType.SelectedItem.Text)
        commTemp.Parameters.AddWithValue("@CardNumber", Me.txtCardNumber.Text)
        commTemp.Parameters.AddWithValue("@CardExpires", Me.txtExpiresMonth.Text.Trim + Me.txtExpiresYear.Text.Trim)
        commTemp.Parameters.AddWithValue("@CardCVV", Me.txtCVV.Text)
        commTemp.Parameters.AddWithValue("@BillName", Me.txtNameBilling.Text)
        commTemp.Parameters.AddWithValue("@BillAddress1", Me.txtAddress1Billing.Text)
        commTemp.Parameters.AddWithValue("@BillAddress2", Me.txtAddress2Billing.Text)
        commTemp.Parameters.AddWithValue("@BillCity", Me.txtCityBilling.Text)
        commTemp.Parameters.AddWithValue("@BillState", Me.ddlStateBilling.Text)
        commTemp.Parameters.AddWithValue("@BillZip", Me.txtZipBilling.Text)
        commTemp.Parameters.AddWithValue("@BillCountry", Me.ddlCountryBilling.SelectedItem.Text)
        commTemp.Parameters.AddWithValue("@BillPhone", Me.txtPhoneBilling.Text)
        commTemp.Parameters.AddWithValue("@ShipName", Me.txtNameShipping.Text)
        commTemp.Parameters.AddWithValue("@ShipAddress1", Me.txtAddress1Shipping.Text)
        commTemp.Parameters.AddWithValue("@ShipAddress2", Me.txtAddress2Shipping.Text)
        commTemp.Parameters.AddWithValue("@ShipCity", Me.txtCityShipping.Text)
        commTemp.Parameters.AddWithValue("@ShipState", Me.ddlStateShipping.Text)
        commTemp.Parameters.AddWithValue("@ShipZip", Me.txtZipShipping.Text)
        commTemp.Parameters.AddWithValue("@ShipCountry", Me.ddlCountryShipping.SelectedItem.Text)
        commTemp.Parameters.AddWithValue("@ShipPhone", Me.txtPhoneShipping.Text)
        commTemp.Parameters.AddWithValue("@PaymentMethod", Me.ddlPaymentMethod.SelectedValue)
        commTemp.Parameters.AddWithValue("@ShippingMethod", Me.ddlShippingMethod.SelectedItem.Text)
        commTemp.Parameters.AddWithValue("@CouponCode", Session.Item("CouponCode"))
        commTemp.Parameters.AddWithValue("@CouponDCRate", CInt(Session.Item("DCRate")))

        commTemp.ExecuteNonQuery()
        connTR.Close()

    End Sub

    Protected Sub txtExpiresMonth_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtExpiresMonth.TextChanged
        Dim strMonth As String = ""

        strMonth = Right("00" + Me.txtExpiresMonth.Text.Trim, 2)
        Me.txtExpiresMonth.Text = strMonth

    End Sub

    Protected Sub txtExpiresYear_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtExpiresYear.TextChanged
        Dim strYear As String = ""
        Dim intYear As Integer = Val(Me.txtExpiresYear.Text.Trim)

        If intYear < 100 Then
            intYear += 2000
        End If

        strYear = Trim(Str(intYear))
        Me.txtExpiresYear.Text = strYear

    End Sub

End Class
