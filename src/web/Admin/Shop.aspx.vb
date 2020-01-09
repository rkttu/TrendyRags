
Partial Class Admin_Shop
    Inherits System.Web.UI.Page
    '// javascript:window.open('StoreMap.aspx?SC=" + rdData("SerialNo").ToString + "','StoreMap','width=800,height=720,left=100,scrollbars=yes,resizable=yes');
    Dim SerialNo As String
    Dim TASK As String
    Dim PreviousURL As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        TASK = Request("TASK")

        If IsPostBack() Then

            TASK = Request("TASK").ToUpper
            SerialNo = Request("SN")
            PreviousURL = Request("PU")

        Else

            If Request("TASK") = "" Then
                TASK = "ADD"
            Else
                TASK = Request("TASK").ToUpper
            End If

            SerialNo = Request("SN")
            PreviousURL = Request("PU")

            Call initDDLClass()
            Select Case TASK
                Case "ADD"
                    Call clearAllField()
                    Me.btnRemove.Visible = False
                    Me.txtDisplayOrder.Focus()
                Case "EDIT"
                    Call initScreen()
                    Me.btnRemove.Visible = True
                    Me.txtDisplayOrder.Focus()
            End Select

        End If

    End Sub

    Private Sub clearAllField()

        Me.txtAddressLine1.Text = ""
        Me.txtAddressLine2.Text = ""
        Me.txtClass.Text = ""
        Me.txtCompanyName.Text = ""
        Me.txtDisplayOrder.Text = ""
        Me.txtEmail.Text = ""
        Me.txtFax.Text = ""
        Me.txtPhone.Text = ""
        Me.txtSuiteNo.Text = ""
        Me.txtWebsite.Text = ""

    End Sub

    Private Sub initDDLClass()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commDDL As Data.SqlClient.SqlCommand
        Dim rdDDL As Data.SqlClient.SqlDataReader
        Dim sqlDDL As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        Me.ddlClass.Items.Clear()
        Me.ddlClass.Items.Add("Select one..")
        '--- Read Shop by Category Menu
        sqlDDL = "SELECT Distinct Class FROM ShopList  ORDER By Class "
        commDDL = New Data.SqlClient.SqlCommand
        commDDL.CommandText = sqlDDL
        commDDL.Connection = connTR
        rdDDL = commDDL.ExecuteReader()
        Do While rdDDL.Read
            Me.ddlClass.Items.Add(rdDDL("Class"))
        Loop
        rdDDL.Close()
        connTR.Close()

    End Sub

    Private Sub initScreen()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commShop As Data.SqlClient.SqlCommand
        Dim rdData As Data.SqlClient.SqlDataReader
        Dim sql As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sql = "SELECT TOP 1 * FROM ShopList WHERE (SerialNo=@SerialNo)  "

        commShop = New Data.SqlClient.SqlCommand
        commShop.CommandText = sql
        commShop.Connection = connTR
        commShop.Parameters.AddWithValue("@SerialNo", SerialNo)
        rdData = commShop.ExecuteReader()
        rdData.Read()

        '// Me.lblClientNo.Text = SerialNo.ToString
        Me.txtDisplayOrder.Text = rdData("DisplayOrder").ToString
        Me.txtClass.Text = rdData("Class").ToString
        Me.txtCompanyName.Text = Replace(rdData("CompanyName").ToString, "<br>", vbCrLf)
        Me.txtAddressLine1.Text = rdData("AddressLine1").ToString
        Me.txtSuiteNo.Text = rdData("SuiteNo").ToString
        Me.txtAddressLine2.Text = rdData("AddressLine2").ToString
        Me.txtPhone.Text = rdData("Phone").ToString
        Me.txtFax.Text = rdData("Fax").ToString
        Me.txtEmail.Text = rdData("Email").ToString
        Me.txtWebsite.Text = rdData("Website").ToString

        rdData.Close()
        connTR.Close()

    End Sub

    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOK.Click

        Select Case TASK
            Case "ADD"
                Call saveShopList()
            Case "EDIT"
                Call updateShopList()
        End Select

    End Sub

    Private Sub saveShopList()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commClient As Data.SqlClient.SqlCommand
        'Dim rdData As Data.SqlClient.SqlDataReader
        Dim sql As String = ""

        Dim lngDisplayOrder As Long = CLng(Me.txtDisplayOrder.Text)
        Dim strClass As String = Me.txtClass.Text
        Dim strCompanyName As String = Replace(Me.txtCompanyName.Text, vbCrLf, "<br>")
        Dim strAddressLine1 As String = Me.txtAddressLine1.Text
        Dim strSuiteNo As String = Me.txtSuiteNo.Text
        Dim strAddressLine2 As String = Me.txtAddressLine2.Text
        Dim strPhone As String = Me.txtPhone.Text
        Dim strFax As String = Me.txtFax.Text
        Dim strEmail As String = Me.txtEmail.Text
        Dim strWebsite As String = Me.txtWebsite.Text

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sql = "INSERT INTO ShopList ("
        sql += " DisplayOrder, Class, CompanyName, AddressLine1, SuiteNo, AddressLine2, Phone, Fax, Email, Website "
        sql += " ) Values ( "
        sql += " @DisplayOrder, @Class, @CompanyName, @AddressLine1, @SuiteNo, @AddressLine2, @Phone, @Fax, @Email, @Website "
        sql += " )"
        commClient = New Data.SqlClient.SqlCommand
        commClient.CommandText = sql
        commClient.Connection = connTR
        commClient.Parameters.AddWithValue("@DisplayOrder", lngDisplayOrder)
        commClient.Parameters.AddWithValue("@Class", strClass)
        commClient.Parameters.AddWithValue("@CompanyName", strCompanyName)
        commClient.Parameters.AddWithValue("@AddressLine1", strAddressLine1)
        commClient.Parameters.AddWithValue("@SuiteNo", strSuiteNo)
        commClient.Parameters.AddWithValue("@AddressLine2", strAddressLine2)
        commClient.Parameters.AddWithValue("@Phone", strPhone)
        commClient.Parameters.AddWithValue("@Fax", strFax)
        commClient.Parameters.AddWithValue("@Email", strEmail)
        commClient.Parameters.AddWithValue("@Website", strWebsite)
        commClient.ExecuteNonQuery()

        connTR.Close()

        Response.Redirect("ShopList.aspx")
    End Sub

    Private Sub updateShopList()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commClient As Data.SqlClient.SqlCommand
        'Dim rdData As Data.SqlClient.SqlDataReader
        Dim sql As String = ""

        Dim lngDisplayOrder As Long = CLng(Me.txtDisplayOrder.Text)
        Dim strClass As String = Me.txtClass.Text
        Dim strCompanyName As String = Replace(Me.txtCompanyName.Text, vbCrLf, "<br>")
        Dim strAddressLine1 As String = Me.txtAddressLine1.Text
        Dim strSuiteNo As String = Me.txtSuiteNo.Text
        Dim strAddressLine2 As String = Me.txtAddressLine2.Text
        Dim strPhone As String = Me.txtPhone.Text
        Dim strFax As String = Me.txtFax.Text
        Dim strEmail As String = Me.txtEmail.Text
        Dim strWebsite As String = Me.txtWebsite.Text

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sql = "UPDATE ShopList SET "
        sql += " DisplayOrder=@DisplayOrder, "
        sql += " Class=@Class, "
        sql += " CompanyName=@CompanyName, "
        sql += " AddressLine1=@AddressLine1, "
        sql += " SuiteNo=@SuiteNo, "
        sql += " AddressLine2=@AddressLine2, "
        sql += " Phone=@Phone, "
        sql += " Fax=@Fax, "
        sql += " Email=@Email, "
        sql += " Website=@Website "
        sql += "     WHERE SerialNo=@SerialNo "

        commClient = New Data.SqlClient.SqlCommand
        commClient.CommandText = sql
        commClient.Connection = connTR
        commClient.Parameters.AddWithValue("@SerialNo", SerialNo)
        commClient.Parameters.AddWithValue("@DisplayOrder", lngDisplayOrder)
        commClient.Parameters.AddWithValue("@Class", strClass)
        commClient.Parameters.AddWithValue("@CompanyName", strCompanyName)
        commClient.Parameters.AddWithValue("@AddressLine1", strAddressLine1)
        commClient.Parameters.AddWithValue("@SuiteNo", strSuiteNo)
        commClient.Parameters.AddWithValue("@AddressLine2", strAddressLine2)
        commClient.Parameters.AddWithValue("@Phone", strPhone)
        commClient.Parameters.AddWithValue("@Fax", strFax)
        commClient.Parameters.AddWithValue("@Email", strEmail)
        commClient.Parameters.AddWithValue("@Website", strWebsite)
        commClient.ExecuteNonQuery()

        connTR.Close()

        Response.Redirect("ShopList.aspx")

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click

        Response.Redirect("ShopList.aspx")

    End Sub

    Protected Sub btnRemove_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRemove.Click

        Call removeShop()

    End Sub

    Private Sub removeShop()

        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commClient As Data.SqlClient.SqlCommand
        'Dim rdData As Data.SqlClient.SqlDataReader
        Dim sql As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sql = "DELETE ShopList  "
        sql += "     WHERE SerialNo=@SerialNo "

        commClient = New Data.SqlClient.SqlCommand
        commClient.CommandText = sql
        commClient.Connection = connTR
        commClient.Parameters.AddWithValue("@SerialNo", SerialNo)
        commClient.ExecuteNonQuery()

        connTR.Close()

        Response.Redirect("ShopList.aspx")

    End Sub

    Protected Sub ddlClass_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlClass.TextChanged
        Me.txtClass.Text = Me.ddlClass.Text
    End Sub

End Class
