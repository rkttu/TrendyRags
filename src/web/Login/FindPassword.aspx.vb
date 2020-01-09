Imports System.net.Mail

Partial Class Login_FindPassword
        Inherits System.Web.UI.Page

        Dim smtpServer As String = "TRENDYRAGS1"
        Dim SSLRoot As String = ConfigurationManager.AppSettings("SSLRoot")
        Dim NSRoot As String = ConfigurationManager.AppSettings("NONSSLRoot")

        Protected Sub btnFind_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFind.Click
                Dim strReturnURL As String = Request("RU")
                Dim strPassword As String = getPassword()

                If strPassword = "%%Error%%" Then
                        MessageBox("The login ID. you entered does not exist, please check again..")
                Else
                        If strReturnURL = "" Then
                                strReturnURL = SSLRoot + "Login/Default.aspx"
                        End If
                        Call sendPassword(strPassword)
                        Response.Redirect(strReturnURL)
                End If

        End Sub

        Private Function getPassword() As String
                Dim strPassword As String = ""
                Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
                Dim connTR As Data.SqlClient.SqlConnection
                Dim commLogin As Data.SqlClient.SqlCommand
                Dim rdLogin As Data.SqlClient.SqlDataReader
                Dim sqlLogin As String = ""
                Dim strUserID As String

                strUserID = Me.txtEmail.Text.Trim

                connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
                connTR.Open()

                sqlLogin = "SELECT Top 1 * FROM ClientMaster WHERE (Email=@Email) Order by SerialNo "


                commLogin = New Data.SqlClient.SqlCommand
                commLogin.CommandText = sqlLogin
                commLogin.Connection = connTR
                commLogin.Parameters.AddWithValue("@Email", strUserID)
                rdLogin = commLogin.ExecuteReader()
                rdLogin.Read()
                If rdLogin.HasRows Then
                        strPassword = rdLogin("Password")
                Else
                        strPassword = "%%Error%%"
                End If

                rdLogin.Close()
                connTR.Close()

                Return strPassword
        End Function

        Private Sub sendPassword(ByVal strPassword As String)
                Dim Msg As MailMessage = New MailMessage
                Dim MailObj As New SmtpClient(smtpServer)
                Dim strMyEmail As String = "support@trendyrags.com"
                Dim strMyName As String = "TrendyRags.com"

                Msg.From = New MailAddress(strMyEmail, strMyName)
                Msg.IsBodyHtml = "True"
                Msg.Body = makeMailBody(strPassword)
                Msg.Subject = "[TrendyRags] Customer support.."

                Msg.To.Add(New MailAddress(Me.txtEmail.Text))
                MailObj.Send(Msg)

        End Sub

        Private Function makeMailBody(ByVal strPassword As String) As String
                Dim Msg As String = ""

                Msg += "<Font Color=Blue Size=+1>Customer Support E-mail</font><br>"
                Msg += "<hr><br>"
                Msg += "TrendyRags.com Password<br><br>"
                Msg += "Your password is [" & strPassword & "].<br>"
                Msg += "Your login ID. is your E-mail.<br>"
                Msg += "Please change your password to ensure the security of your account.<br><br><br>"
                Msg += "Thank you,<br>"
                Msg += "Customer Support<br>TrendyRags.com<br>"
                Msg += "<a href=""mailto:support@TrendyRags.com"">support@TrendyRags.com</a><br /><br />"

                Return Msg
        End Function

        Private Sub MessageBox(ByVal msg As String)
                Dim lbl As New Label()

                lbl.Text = "<script language='javascript'>" & Environment.NewLine & _
                           "window.alert('" + msg + "')</script>"

                Page.Controls.Add(lbl)
        End Sub


End Class
