Imports System.Net.Mail
Imports System.IO

Partial Class Admin_Client
    Inherits System.Web.UI.Page

    Dim smtpServer As String = ConfigurationManager.AppSettings("SMTPServer")
    Dim ApprovalLetterForWholesale As String = ConfigurationManager.AppSettings("ApprovalLetter_WS")

    Dim SerialNo As String
    Dim TASK As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        SerialNo = Request("SN")
        TASK = Request("TASK")

        If Not IsPostBack() Then
            Call initScreen()
        End If


    End Sub

    Private Sub initScreen()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commClient As Data.SqlClient.SqlCommand
        Dim rdData As Data.SqlClient.SqlDataReader
        Dim sql As String = ""
        Dim SellerIDURL As String = ConfigurationManager.AppSettings("SellerIDURL")
        Dim strSellerPermitFile As String = ""
        Dim strSellerIDFolder As String = ""
        Dim strCompanyName As String = ""
        Dim strFolderLS As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sql = "SELECT TOP 1 * FROM ClientMaster WHERE (SerialNo=@SerialNo)  "

        commClient = New Data.SqlClient.SqlCommand
        commClient.CommandText = sql
        commClient.Connection = connTR
        commClient.Parameters.AddWithValue("@SerialNo", SerialNo)
        rdData = commClient.ExecuteReader()
        rdData.Read()

        Me.lblClientNo.Text = SerialNo.ToString
        Me.txtCompanyName.Text = rdData("CompanyName").ToString
        Me.txtClientNameF.Text = rdData("ClientNameF").ToString
        Me.txtClientNameL.Text = rdData("ClientNameL").ToString
        Me.txtEmail.Text = rdData("Email").ToString
        Me.txtPassword.Text = rdData("Password")
        Me.txtPhone.Text = rdData("Phone").ToString
        Me.txtFaxNo.Text = rdData("Fax").ToString
        Me.txtStreet1.Text = rdData("Street1").ToString
        Me.txtStreet2.Text = rdData("Street2").ToString
        Me.txtCity.Text = rdData("City").ToString
        Me.ddlState.SelectedValue = rdData("State").ToString
        Me.txtZip.Text = rdData("Zip").ToString
        Me.ddlCountry.SelectedValue = rdData("Country").ToString
        Me.rdoAcceptEmail.Text = rdData("MailOPT").ToString
        Me.rdoUserClass.SelectedValue = rdData("Class").ToString
        Me.rdoWholesaleLevel.SelectedValue = rdData("WholesaleLevel").ToString
        Me.txtSellerPermitNo.Text = rdData("SellerPermitNo").ToString
        strSellerPermitFile = rdData("SellerPermitFile").ToString

        Me.txtTaxID.Text = rdData("TaxID").ToString
        Me.txtJobTitle.Text = rdData("JobTitle").ToString
        Me.txtRegDate.Text = rdData("RegDate").ToString
        Me.txtSalesRep.Text = rdData("SalesRep").ToString

        rdData.Close()
        connTR.Close()

        If strSellerPermitFile.Length > 0 Then
            strcompanyname = Me.txtCompanyName.Text.Trim
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
            strFolderLS = SellerIDURL + strSellerIDFolder       '// 이 문자열 맨 끝문자는 "/" 임..
            Me.txtSellerPermitFile.Text = strFolderLS + "/" + strSellerPermitFile
            ltrSellerPermitFile.Text = "<a href=""" + strFolderLS + "/" + strSellerPermitFile + """ class=""highslide"" onclick=""return hs.expand(this)"" > view file</a>"
        Else
            Me.txtSellerPermitFile.Text = ""
            ltrSellerPermitFile.Text = ""
        End If

    End Sub

    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOK.Click

        Call sendApprovalLetter()
        Call makeLog()
        Call saveClient()

    End Sub

    Private Sub sendApprovalLetter()

        If Me.chkSendApprovalLetter.Checked Then
            If Me.rdoUserClass.SelectedValue = "WHOLESALE" Then

                Dim Msg As MailMessage = New MailMessage
                Dim MailObj As New SmtpClient(smtpServer)
                Dim strMyEmail As String = "support@trendyrags.com"
                Dim strMyName As String = "TrendyRags.com"

                Msg.From = New MailAddress(strMyEmail, strMyName)
                Msg.IsBodyHtml = "True"
                Msg.Body = makeMailBody()
                Msg.Subject = "[TrendyRags] Approval as Wholesale Buyer."

                If Me.txtCompanyName.Text.Length > 0 Then
                    Msg.To.Add(New MailAddress(Me.txtEmail.Text.ToString, Me.txtCompanyName.Text.ToString))
                Else
                    Msg.To.Add(New MailAddress(Me.txtEmail.Text))
                End If

                MailObj.Send(Msg)

            End If
        End If

    End Sub

    Private Function makeMailBody() As String
        Dim strBody As String = ""
        Dim objStreamReader As StreamReader
        objStreamReader = File.OpenText(ApprovalLetterForWholesale)
        Dim contents As String = objStreamReader.ReadToEnd()

        strBody = contents
        objStreamReader.Close()

        Return strBody
    End Function

    Private Sub makeLog()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commClient As Data.SqlClient.SqlCommand
        'Dim rdData As Data.SqlClient.SqlDataReader
        Dim sql As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sql = "INSERT INTO Log_ClientMaster ( "
        sql += " SerialNo, "
        sql += " ClientNameF,"
        sql += " ClientNameM,"
        sql += " ClientNameL,"
        sql += " CompanyName,"
        sql += " Email,"
        sql += " Phone,"
        sql += " Fax,"
        sql += " Street1,"
        sql += " Street2,"
        sql += " City,"
        sql += " State,"
        sql += " Zip,"
        sql += " Country,"
        sql += " MailOPT,"
        sql += " Password,"
        sql += " Class,"
        sql += " RegDate,"
        sql += " WholesaleLevel, "
        sql += " SellerPermitNo, "
        sql += "SellerPermitFile, "
        sql += "TaxID, "
        sql += "JobTitle, "
        sql += "SalesRep "
        sql += " )"
        sql += " SELECT * From ClientMaster WHERE SerialNo=@SerialNo "
        '        sql += " SELECT * From ClientMaster WHERE SerialNo=@SerialNo;  SELECT @@IDENTITY AS Ident"

        commClient = New Data.SqlClient.SqlCommand
        commClient.CommandText = sql
        commClient.Connection = connTR
        commClient.Parameters.AddWithValue("@SerialNo", SerialNo)
        commClient.ExecuteNonQuery()

        connTR.Close()

    End Sub

    Private Sub saveClient()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commClient As Data.SqlClient.SqlCommand
        'Dim rdData As Data.SqlClient.SqlDataReader
        Dim sql As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sql = "UPDATE ClientMaster SET "
        sql += " ClientNameF=@ClientNameF ,"
        sql += " ClientNameM=@ClientNameM ,"
        sql += " ClientNameL=@ClientNameL ,"
        sql += " CompanyName=@CompanyName, "
        sql += " Email=@Email ,"
        sql += " Phone=@Phone ,"
        sql += " Fax=@Fax, "
        sql += " Street1=@Street1 ,"
        sql += " Street2=@Street2 ,"
        sql += " City=@City ,"
        sql += " State=@State ,"
        sql += " Zip=@Zip ,"
        sql += " Country=@Country ,"
        sql += " MailOPT=@MailOPT ,"
        sql += " Password=@Password ,"
        sql += " Class=@Class ,"
        sql += " RegDate=@RegDate ,"
        sql += " WholesaleLevel=@WholesaleLevel,  "
        sql += " SellerPermitNo=@SellerPermitNo, "
        sql += " SellerPermitFile=@SellerPermitFile, "
        sql += " TaxID=@TaxID, "
        sql += "JobTitle=@JobTitle, "
        sql += "SalesRep=@SalesRep "
        sql += "     WHERE SerialNo=@SerialNo "

        commClient = New Data.SqlClient.SqlCommand
        commClient.CommandText = sql
        commClient.Connection = connTR
        commClient.Parameters.AddWithValue("@SerialNo", SerialNo)
        commClient.Parameters.AddWithValue("@ClientNameF", Me.txtClientNameF.Text.ToString)
        commClient.Parameters.AddWithValue("@ClientNameM", "")
        commClient.Parameters.AddWithValue("@ClientNameL", Me.txtClientNameL.Text.ToString)
        commClient.Parameters.AddWithValue("@CompanyName", Me.txtCompanyName.Text.ToString)
        commClient.Parameters.AddWithValue("@Email", Me.txtEmail.Text.ToString)
        commClient.Parameters.AddWithValue("@Phone", Me.txtPhone.Text.ToString)
        commClient.Parameters.AddWithValue("@Fax", Me.txtFaxNo.Text.ToString)
        commClient.Parameters.AddWithValue("@Street1", Me.txtStreet1.Text.ToString)
        commClient.Parameters.AddWithValue("@Street2", Me.txtStreet2.Text.ToString)
        commClient.Parameters.AddWithValue("@City", Me.txtCity.Text.ToString)
        commClient.Parameters.AddWithValue("@State", Me.ddlState.SelectedValue)
        commClient.Parameters.AddWithValue("@Zip", Me.txtZip.Text.ToString)
        commClient.Parameters.AddWithValue("@Country", Me.ddlCountry.SelectedValue)
        commClient.Parameters.AddWithValue("@MailOPT", Me.rdoAcceptEmail.SelectedValue)
        commClient.Parameters.AddWithValue("@Password", Me.txtPassword.Text)
        commClient.Parameters.AddWithValue("@Class", Me.rdoUserClass.SelectedValue)
        commClient.Parameters.AddWithValue("@RegDate", Now)
        commClient.Parameters.AddWithValue("@WholesaleLevel", Me.rdoWholesaleLevel.SelectedValue)
        commClient.Parameters.AddWithValue("@SellerPermitNo", Me.txtSellerPermitNo.Text.ToString)
        commClient.Parameters.AddWithValue("@SellerPermitFile", Me.txtSellerPermitFile.Text)
        commClient.Parameters.AddWithValue("@TaxID", Me.txtTaxID.Text.ToString)
        commClient.Parameters.AddWithValue("@JobTitle", Me.txtJobTitle.Text.ToString)
        commClient.Parameters.AddWithValue("@SalesRep", Me.txtSalesRep.Text.ToString)
        commClient.ExecuteNonQuery()

        connTR.Close()

        Response.Redirect("ClientList.aspx")

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click

        Response.Redirect("ClientList.aspx")

    End Sub

    Protected Sub btnRemove_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRemove.Click

        Call makeLog()
        Call removeClient()

    End Sub

    Private Sub removeClient()

        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commClient As Data.SqlClient.SqlCommand
        'Dim rdData As Data.SqlClient.SqlDataReader
        Dim sql As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sql = "UPDATE ClientMaster SET "
        sql += " ClientNameF='' ,"
        sql += " ClientNameM='' ,"
        sql += " ClientNameL='' ,"
        sql += " Phone='' ,"
        sql += " Street1='' ,"
        sql += " Street2='' ,"
        sql += " City='' ,"
        sql += " State='' ,"
        sql += " Zip='' ,"
        sql += " Country='' ,"
        sql += " MailOPT='' ,"
        sql += " Password=@Password ,"
        sql += " Class=@Class ,"
        sql += " RegDate=@RegDate "
        sql += "     WHERE SerialNo=@SerialNo "

        commClient = New Data.SqlClient.SqlCommand
        commClient.CommandText = sql
        commClient.Connection = connTR
        commClient.Parameters.AddWithValue("@SerialNo", SerialNo)
        commClient.Parameters.AddWithValue("@Password", "Retired_" + Me.txtPassword.Text.ToString)
        commClient.Parameters.AddWithValue("@Class", "__Retired")
        commClient.Parameters.AddWithValue("@RegDate", Now)
        commClient.ExecuteNonQuery()

        connTR.Close()

        Response.Redirect("ClientList.aspx")

    End Sub

End Class
