
Partial Class Policies_WhereToBuy
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Call initList()

    End Sub

    Private Sub initList()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commClient As Data.SqlClient.SqlCommand
        Dim rdData As Data.SqlClient.SqlDataReader
        Dim sql As String = ""
        Dim Ltr As String = ""
        Dim strCompanyName As String = ""
        Dim strWebsite As String = ""
        Dim nRow As Integer = 0

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sql = "SELECT * FROM ShopList WHERE (Class='Retail Shop') Order By DisplayOrder  "

        commClient = New Data.SqlClient.SqlCommand
        commClient.CommandText = sql
        commClient.Connection = connTR
        rdData = commClient.ExecuteReader()

        nRow = 0
        Ltr = "<Table Border=""0"" Width=""100%"" Cellpadding=""0"" Cellspacing=""0"">"
        Do While rdData.Read()

            If (nRow Mod 2) = 0 Then
                Ltr += "<tr>"

                Ltr += "<td width=""50%"">"
                strCompanyName = rdData("CompanyName").ToString

                Ltr += "<a href=""javascript:void(0);"" onclick=""javascript:window.open('StoreMap.aspx?SC=" + rdData("SerialNo").ToString + "','StoreMap','width=800,height=720,left=100,scrollbars=yes,resizable=yes');""><font size=""2""><b>" + strCompanyName + "</b></font>&nbsp;&nbsp;<span style=""color:#DB0008;"">[Map]</span></a><br />" + vbCrLf
                Ltr += rdData("AddressLine1").ToString + " "
                If rdData("SuiteNo").ToString.Length > 0 Then
                    Ltr += rdData("SuiteNo").ToString
                End If
                Ltr += "<br />" + vbCrLf
                Ltr += rdData("AddressLine2").ToString + "<br />" + vbCrLf
                Ltr += rdData("Phone").ToString + "<br />" + vbCrLf
                If rdData("Website").ToString.Length > 0 Then
                    strWebsite = rdData("Website").ToString
                    Ltr += "<a href=""" + strWebsite + """><font size=""2""><b>" + strWebsite + "</b></font></a><br />" + vbCrLf
                End If
                Ltr += "<br /><br />" + vbCrLf
                Ltr += "</td>"

            Else

                Ltr += "<td style=""padding-left:15px; width:50%; "">"
                strCompanyName = rdData("CompanyName").ToString

                Ltr += "<a href=""javascript:void(0);"" onclick=""javascript:window.open('StoreMap.aspx?SC=" + rdData("SerialNo").ToString + "','StoreMap','width=800,height=720,left=100,scrollbars=yes,resizable=yes');""><font size=""2""><b>" + strCompanyName + "</b></font>&nbsp;&nbsp;<span style=""color:#DB0008;"">[Map]</span></a><br />" + vbCrLf
                Ltr += rdData("AddressLine1").ToString + " "
                If rdData("SuiteNo").ToString.Length > 0 Then
                    Ltr += rdData("SuiteNo").ToString
                End If
                Ltr += "<br />" + vbCrLf
                Ltr += rdData("AddressLine2").ToString + "<br />" + vbCrLf
                Ltr += rdData("Phone").ToString + "<br />" + vbCrLf
                If rdData("Website").ToString.Length > 0 Then
                    strWebsite = rdData("Website").ToString
                    Ltr += "<a href=""" + strWebsite + """><font size=""2""><b>" + strWebsite + "</b></font></a><br />" + vbCrLf
                End If
                Ltr += "<br /><br />" + vbCrLf
                Ltr += "</td>"

                Ltr += "</tr>"
            End If
            nRow += 1

        Loop
        Ltr += "</table>"

        rdData.Close()
        connTR.Close()

        Me.ltrStoreList.Text = Ltr

    End Sub

End Class
