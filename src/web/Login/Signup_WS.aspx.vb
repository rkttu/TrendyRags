Imports System.Net.Mail
Imports System.IO

Partial Class Login_Signup_WS
    Inherits System.Web.UI.Page
    Dim LandingPage As String
    Dim smtpServer As String = ConfigurationManager.AppSettings("SMTPServer")
    Dim SSLRoot As String = ConfigurationManager.AppSettings("SSLRoot")
    Dim NSRoot As String = ConfigurationManager.AppSettings("NONSSLRoot")
    Dim WelcomeLetterForWholesale As String = ConfigurationManager.AppSettings("WelcomeLetter_WS")

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Me.ddlCountry.Attributes.Add("onChange", "postSelectCountry()")
        Me.ddlCountry.Attributes.Add("onBlur", "postSelectCountry()")

        LandingPage = NSRoot + "Login/Landing_WS.aspx"
        Page.Title = "TrendyRags.com"
        If IsPostBack() Then
        Else
            Call initscreen()
        End If

    End Sub

    Private Sub initscreen()

        Me.ddlState.SelectedValue = "CA"
        Me.ddlCountry.SelectedValue = "USA"

        Me.txtCity.Text = ""
        Me.txtCompanyName.Text = ""
        Me.txtEmail.Text = ""
        Me.txtEmailConfirm.Text = ""
        Me.txtFax.Text = ""
        Me.txtJobTitle.Text = ""
        Me.txtNameFirst.Text = ""
        Me.txtNameLast.Text = ""
        Me.txtPassword.Text = ""
        Me.txtPasswordConfirm.Text = ""
        Me.txtPhone.Text = ""
        Me.txtSellerPermitNo.Text = ""
        Me.txtStreet1.Text = ""
        Me.txtStreet2.Text = ""
        Me.txtTaxID.Text = ""
        Me.txtZip.Text = ""

    End Sub

    Protected Sub btnRegister_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRegister.Click

        If Me.chkAgreewithPolicy.Checked Then
            If newUser() Then
                Call uploadSellerID()
                Call saveNewUser()
                Call sendMail()
                ' MessageBox("Thank you for joining us, confirmation email will be sent soon.\n")
                Call SubmitLogin()
                Response.Redirect(LandingPage)
                Exit Sub
            Else
                MessageBox("Your are the member of trendyRags.com already !!\nThank you..")
                Exit Sub
            End If
        Else
            MessageBox("Please agree with our [Privacy Policy] first..")
            Me.chkAgreewithPolicy.Focus()
            Exit Sub
        End If

    End Sub

    Private Sub SubmitLogin()

        Session.Item("UserID") = Me.txtEmail.Text.ToString
        Session.Item("UserName") = Me.txtNameFirst.Text.ToString & " " & Me.txtNameLast.Text.ToString
        Session.Item("Class") = "PREWHOLESALE"
        Session.Item("WholesaleLevel") = ""

    End Sub

    Private Sub uploadSellerID()
        Dim strFileLS, strExtension As String
        Dim strCompanyName, strSellerIDFolder, strFolderLS As String
        Dim SellerIDFolder As String = ConfigurationManager.AppSettings("SellerIDFolder")

        strCompanyName = Me.txtCompanyName.Text.Trim
        strSellerIDFolder = Replace(strCompanyName, " ", "_")
        strSellerIDFolder = Replace(strSellerIDFolder, ",", "")
        strSellerIDFolder = Replace(strSellerIDFolder, "-", "")
        strSellerIDFolder = Replace(strSellerIDFolder, ";", "")
        strSellerIDFolder = Replace(strSellerIDFolder, ":", "")
        strSellerIDFolder = Replace(strSellerIDFolder, "/", "")
        strSellerIDFolder = Replace(strSellerIDFolder, "\", "")
        strSellerIDFolder = Replace(strSellerIDFolder, "'", "")
        strSellerIDFolder = Replace(strSellerIDFolder, ".", "_")
        strSellerIDFolder = Replace(strSellerIDFolder, Chr(34), "")
        strSellerIDFolder = strSellerIDFolder.Trim
        strFolderLS = SellerIDFolder + strSellerIDFolder       '// 이 문자열 맨 끝문자는 "\" 임..

        If Me.fuResellerPermit.HasFile Then
            If Not IO.Directory.Exists(strFolderLS) Then
                IO.Directory.CreateDirectory(strFolderLS)
            End If

            strFileLS = strFolderLS + "\" + Me.fuResellerPermit.FileName
            strExtension = IO.Path.GetExtension(strFileLS)
            Me.fuResellerPermit.SaveAs(strFileLS)
        End If

    End Sub

    Private Function newUser() As Boolean
        Dim blnIsNew As Boolean = True
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commUser As Data.SqlClient.SqlCommand
        Dim rdUser As Data.SqlClient.SqlDataReader
        Dim sqlUser As String = ""
        Dim strEmail As String = Me.txtEmail.Text.Trim

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlUser = "SELECT SerialNo FROM ClientMaster Where Email = @Email "
        commUser = New Data.SqlClient.SqlCommand
        commUser.CommandText = sqlUser
        commUser.Connection = connTR
        commUser.Parameters.AddWithValue("@Email", strEmail)
        rdUser = commUser.ExecuteReader()
        If rdUser.HasRows Then
            blnIsNew = False
        Else
            blnIsNew = True
        End If
        rdUser.Close()
        connTR.Close()

        Return blnIsNew
    End Function

    Private Sub saveNewUser()
        Dim strClientNameF As String = Me.txtNameFirst.Text.ToString
        Dim strClientNameL As String = Me.txtNameLast.Text.ToString
        Dim strCompanyName As String = Me.txtCompanyName.Text.ToString
        Dim strEmail As String = Me.txtEmail.Text.ToString
        Dim strPhone As String = Me.txtPhone.Text.ToString
        Dim strFax As String = Me.txtFax.Text.ToString
        Dim strStreet1 As String = Me.txtStreet1.Text.ToString
        Dim strStreet2 As String = Me.txtStreet2.Text.ToString
        Dim strCity As String = Me.txtCity.Text.ToUpper
        Dim strState As String = Me.ddlState.SelectedValue
        Dim strZip As String = Me.txtZip.Text.ToString
        Dim strCountry As String = Me.ddlCountry.SelectedValue
        Dim strPassword As String = Me.txtPassword.Text.ToString
        Dim strResellerIDFile As String
        Dim strSellerPermitNo As String = Me.txtSellerPermitNo.Text.ToUpper
        Dim strTaxID As String = Me.txtTaxID.Text.ToString
        Dim strJobTitle As String = Me.txtJobTitle.Text.ToString
        Dim strSalesRep As String = Me.ddlSalesRep.SelectedValue

        If Me.fuResellerPermit.HasFile Then
            strResellerIDFile = Me.fuResellerPermit.FileName
        Else
            strResellerIDFile = ""
        End If

        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commClient As Data.SqlClient.SqlCommand
        Dim sqlClient As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlClient = "INSERT Into ClientMaster (ClientNameF, ClientNameM, ClientNameL, CompanyName, Email, Phone, Fax, Street1, Street2, City, State, Zip, Country, MailOPT, Password, Class, SellerPermitNo, SellerPermitFile, TaxID, JobTitle, SalesRep) Values  "
        sqlClient += "(@ClientNameF, '', @ClientNameL, @CompanyName, @Email, @Phone, @Fax, @Street1, @Street2, @City, @State, @Zip, @Country, 'YES', @Password, @Class,  @SellerPermitNo, @SellerPermitFile, @TaxID, @JobTitle, @SalesRep)"

        commClient = New Data.SqlClient.SqlCommand
        commClient.CommandText = sqlClient
        commClient.Connection = connTR
        commClient.Parameters.AddWithValue("@ClientNameF", strClientNameF)
        commClient.Parameters.AddWithValue("@ClientNameL", strClientNameL)
        commClient.Parameters.AddWithValue("@CompanyName", strCompanyName)
        commClient.Parameters.AddWithValue("@Email", strEmail)
        commClient.Parameters.AddWithValue("@Phone", strPhone)
        commClient.Parameters.AddWithValue("@Fax", strFax)
        commClient.Parameters.AddWithValue("@Street1", strStreet1)
        commClient.Parameters.AddWithValue("@Street2", strStreet2)
        commClient.Parameters.AddWithValue("@City", strCity)
        commClient.Parameters.AddWithValue("@State", strState)
        commClient.Parameters.AddWithValue("@Zip", strZip)
        commClient.Parameters.AddWithValue("@Country", strCountry)
        commClient.Parameters.AddWithValue("@Password", strPassword)
        commClient.Parameters.AddWithValue("@Class", "PREWHOLESALE")
        commClient.Parameters.AddWithValue("@SellerPermitNo", strSellerPermitNo)
        commClient.Parameters.AddWithValue("@SellerPermitFile", strResellerIDFile)
        commClient.Parameters.AddWithValue("@TaxID", strTaxID)
        commClient.Parameters.AddWithValue("@JobTitle", strJobTitle)
        commClient.Parameters.AddWithValue("@SalesRep", strSalesRep)

        commClient.ExecuteNonQuery()
        connTR.Close()

    End Sub

    Private Sub sendMail()
        Dim Msg As MailMessage = New MailMessage
        Dim MailObj As New SmtpClient(smtpServer)
        Dim strMyEmail As String = "support@trendyrags.com"
        Dim strMyName As String = "TrendyRags.com"

        Msg.From = New MailAddress(strMyEmail, strMyName)
        Msg.Bcc.Add(New MailAddress(strMyEmail))
        Msg.Bcc.Add(New MailAddress("JIMI@TrendyRags.com"))
        Msg.Bcc.Add(New MailAddress("Wally@TrendyRags.com"))
        Msg.Bcc.Add(New MailAddress("Derek@TrendyRags.com"))
        Msg.Bcc.Add(New MailAddress("sicho77@live.com"))
        Msg.IsBodyHtml = "True"
        Msg.Body = makeMailBody()
        Msg.Subject = "[TrendyRags] Thank you for applying to Wholesale Buyer."
        
        If Me.txtNameFirst.Text.Length > 0 Or Me.txtNameLast.Text.Length > 0 Then
            Msg.To.Add(New MailAddress(Me.txtEmail.Text, Me.txtNameFirst.Text.ToString + " " + Me.txtNameLast.Text.ToString))
        Else
            Msg.To.Add(New MailAddress(Me.txtEmail.Text))
        End If

        MailObj.Send(Msg)

    End Sub

    Private Function makeMailBody() As String
        Dim strBody As String = ""
        Dim objStreamReader As StreamReader
        objStreamReader = File.OpenText(WelcomeLetterForWholesale)
        Dim contents As String = objStreamReader.ReadToEnd()

        objStreamReader.Close()

        If Me.txtNameFirst.Text.Length > 0 Or Me.txtNameLast.Text.Length > 0 Then
            strBody = Replace(contents, "%%ClientName%%", Me.txtNameFirst.Text.ToString + " " + Me.txtNameLast.Text.ToString)
        Else
            strBody = Replace(contents, "%%ClientName%%", "")
        End If

        Return strBody
    End Function

    Private Sub MessageBox(ByVal msg As String)
        Dim lbl As New Label()

        lbl.Text = "<script language='javascript'>" & Environment.NewLine & _
                        "window.alert('" + msg + "')</script>"

        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click

        Call initscreen()

    End Sub

End Class
