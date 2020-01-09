
Partial Class MyAccount_MyAccount
    Inherits System.Web.UI.Page

    Const NotLogged As String = "Not-LoggedIn"

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click

        Response.Redirect("~/Default.aspx")

    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Page.Title = "TrendyRags.com"
        If IsPostBack() Then
        Else
            Call initScreen()
        End If

    End Sub

    Private Sub initScreen()

        If Session.Item("UserID") = NotLogged Then
            MessageBox("Please login first..")
            Response.Redirect("../Login/Default.aspx?PU=../MyAccount/MyAccount.aspx")
        Else
            Call displayInformation()
        End If

    End Sub

    Private Sub displayInformation()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commLogin As Data.SqlClient.SqlCommand
        Dim rdLogin As Data.SqlClient.SqlDataReader
        Dim sqlLogin As String = ""
        Dim strUserID As String

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
            Me.txtCity.Text = rdLogin("City")
            Me.txtFirstName.Text = rdLogin("ClientNameF")
            Me.txtLastName.Text = rdLogin("ClientNameL")
            Me.txtPhone.Text = rdLogin("Phone")
            Me.txtStreet1.Text = rdLogin("Street1")
            Me.txtStreet2.Text = rdLogin("Street2")
            Me.txtZip.Text = rdLogin("Zip")
            Me.ddlCountry.Text = rdLogin("Country")
            Me.ddlState.Text = rdLogin("State")
            Me.ltrLoginID.Text = strUserID
        Else
            Me.txtCity.Text = ""
            Me.txtFirstName.Text = ""
            Me.txtLastName.Text = ""
            Me.txtPhone.Text = ""
            Me.txtStreet1.Text = ""
            Me.txtStreet2.Text = ""
            Me.txtZip.Text = ""
            Me.ddlCountry.Text = ""
            Me.ddlState.Text = ""
            Me.ltrLoginID.Text = "Error"
        End If
        rdLogin.Close()
        connTR.Close()

    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commClient As Data.SqlClient.SqlCommand
        'Dim rdTemp As Data.SqlClient.SqlDataReader
        Dim sqlClient As String = ""
        Dim strUserID As String
        Dim strPassword As String = Me.txtNewPassword.Text.Trim

        If Me.txtNewPassword.Text.Length > 0 Then
            If Me.txtNewPassword.Text.Length < 6 Then
                MessageBox("Please enter your password longer than 6 characters.")
                Me.txtNewPassword.Focus()
                Exit Sub
            End If
        End If

        strUserID = Session.Item("UserID")

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlClient = "UPDATE ClientMaster SET  "
        sqlClient += "ClientNameF=@ClientNameF, "
        sqlClient += "ClientNameL=@ClientNameL, "
        sqlClient += "Phone=@Phone, "
        sqlClient += "Street1=@Street1, "
        sqlClient += "Street2=@Street2, "
        sqlClient += "City=@City, "
        sqlClient += "State=@State, "
        sqlClient += "Zip=@Zip, "
        If strPassword.Length > 0 Then
            sqlClient += "Password=@Password, "
        End If
        sqlClient += "Country=@Country "
        sqlClient += " WHERE Email=@Email "

        commClient = New Data.SqlClient.SqlCommand
        commClient.CommandText = sqlClient
        commClient.Connection = connTR
        commClient.Parameters.AddWithValue("@Email", strUserID)
        If strPassword.Length > 0 Then
            commClient.Parameters.AddWithValue("@Password", strPassword)
        End If
        commClient.Parameters.AddWithValue("@ClientNameF", Me.txtFirstName.Text.Trim)
        commClient.Parameters.AddWithValue("@ClientNameL", Me.txtLastName.Text.Trim)
        commClient.Parameters.AddWithValue("@Phone", Me.txtPhone.Text.Trim)
        commClient.Parameters.AddWithValue("@Street1", Me.txtStreet1.Text.Trim)
        commClient.Parameters.AddWithValue("@Street2", Me.txtStreet2.Text.Trim)
        commClient.Parameters.AddWithValue("@City", Me.txtCity.Text.Trim)
        commClient.Parameters.AddWithValue("@State", Me.ddlState.SelectedValue)
        commClient.Parameters.AddWithValue("@Zip", Me.txtZip.Text.Trim)
        commClient.Parameters.AddWithValue("@Country", Me.ddlCountry.SelectedValue)

        commClient.ExecuteNonQuery()
        connTR.Close()

        Response.Redirect("~/Default.aspx")

    End Sub

    Protected Sub btnChangePassword_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnChangePassword.Click

        If Me.txtNewPassword.Visible = False Then
            Me.btnChangePassword.Text = "Hide change password"
            Me.txtNewPassword.Visible = True
            Me.txtNewPassword2.Visible = True
            Me.lblNewPassword1.Visible = True
            Me.lblNewPassword2.Visible = True
            Me.lblLongPassword.Visible = True
            Me.txtNewPassword.Focus()
        Else
            Me.btnChangePassword.Text = "Show change Password"
            Me.txtNewPassword.Visible = False
            Me.txtNewPassword2.Visible = False
            Me.lblNewPassword1.Visible = False
            Me.lblNewPassword2.Visible = False
            Me.lblLongPassword.Visible = False
        End If
    End Sub

    Private Sub MessageBox(ByVal msg As String)
        Dim lbl As New Label()

        lbl.Text = "<script language='javascript'>" & Environment.NewLine & _
                        "window.alert('" + msg + "')</script>"

        Page.Controls.Add(lbl)

    End Sub

End Class
