
Partial Class Policies_StoreMap
    Inherits System.Web.UI.Page

        Dim SerialNo As String
        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        End Sub

        Protected Sub Page_PreLoad(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreLoad

                SerialNo = Request("SC")
                Call initData()

        End Sub

        Private Sub initData()
                Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
                Dim connTR As Data.SqlClient.SqlConnection
                Dim commClient As Data.SqlClient.SqlCommand
                Dim rdData As Data.SqlClient.SqlDataReader
                Dim sql As String = ""
                Dim Ltr As String = ""
                Dim strCompanyName As String = ""

                connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
                connTR.Open()

                sql = "SELECT * FROM ShopList WHERE (SerialNo=@SerialNo) "

                commClient = New Data.SqlClient.SqlCommand
                commClient.CommandText = sql
                commClient.Connection = connTR
                commClient.Parameters.AddWithValue("@SerialNo", CLng(SerialNo))
                rdData = commClient.ExecuteReader()

                rdData.Read()
                Me.lblTitle.Text = rdData("CompanyName").ToString
                Me.lblShopName.Text = rdData("CompanyName").ToString
                Me.lblAddr1.Text = rdData("AddressLine1").ToString
                Me.lblSuiteNo.Text = rdData("SuiteNo").ToString
                Me.lblAddr2.Text = rdData("AddressLine2").ToString()
                Me.lblPhone.Text = rdData("Phone").ToString

                rdData.Close()
                connTR.Close()

        End Sub


End Class
