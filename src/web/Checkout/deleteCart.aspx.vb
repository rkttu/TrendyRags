
Partial Class Checkout_deleteCart
    Inherits System.Web.UI.Page

    Dim ProductNo As String
    Dim SizeName As String
    Dim ColorName As String
    Dim SessionID As String
    Dim PreviousURL As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim ReturnURL As String

        ProductNo = Request("PN")
        SizeName = Request("SN")
        ColorName = Request("CN")
        PreviousURL = Request("PU")
        SessionID = Session.SessionID
        ReturnURL = "ViewCart.aspx?PU=" & PreviousURL
        Call deleteProduct()
        Response.Redirect(ReturnURL)

    End Sub

    Private Sub deleteProduct()

        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commOrder As Data.SqlClient.SqlCommand
        'Dim rdTemp As Data.SqlClient.SqlDataReader
        Dim sqlOrder As String = ""
        Dim strSessionID As String

        strSessionID = Session.SessionID

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        If Session.Item("Class") = "WHOLESALE" Then
            sqlOrder = "DELETE CART WHERE (SessionID=@SessionID) And (ProductNo=@ProductNo)  "

            commOrder = New Data.SqlClient.SqlCommand
            commOrder.CommandText = sqlOrder
            commOrder.Connection = connTR
            commOrder.Parameters.AddWithValue("@SessionID", SessionID)
            commOrder.Parameters.AddWithValue("@ProductNo", ProductNo)
        Else
            sqlOrder = "DELETE CART WHERE (SessionID=@SessionID) And (ProductNo=@ProductNo) And (SizeName=@SizeName) And (ColorName=@ColorName) "

            commOrder = New Data.SqlClient.SqlCommand
            commOrder.CommandText = sqlOrder
            commOrder.Connection = connTR
            commOrder.Parameters.AddWithValue("@SessionID", SessionID)
            commOrder.Parameters.AddWithValue("@ProductNo", ProductNo)
            commOrder.Parameters.AddWithValue("@SizeName", SizeName)
            commOrder.Parameters.AddWithValue("@ColorName", ColorName)
        End If

        commOrder.ExecuteNonQuery()
        connTR.Close()

    End Sub

End Class
