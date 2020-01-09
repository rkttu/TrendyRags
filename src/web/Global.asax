<%@ Application Language="VB" %>

<script RunAt="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application startup
    End Sub
    
    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown
    End Sub
        
    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when an unhandled error occurs
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a new session is started
        Session.Item("UserID") = "Not-LoggedIn"
        Session.Item("UserName") = "No Name"
        Session.Item("CouponCode") = ""
        Session.Item("DCRate") = "0"
        Session.Item("Class") = "USER"
        Session.Item("WholesaleLevel") = "NA"
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends. 
        ' Note: The Session_End event is raised only when the sessionstate mode
        ' is set to InProc in the Web.config file. If session mode is set to StateServer 
        ' or SQLServer, the event is not raised.
        Call deleteCART()
        
    End Sub
    
    Private Sub deleteCART()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commCART As Data.SqlClient.SqlCommand
        Dim sqlCART As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlCART = "DELETE CART WHERE (SessionID=@SessionID) "

        commCART = New Data.SqlClient.SqlCommand
        commCART.CommandText = sqlCART
        commCART.Connection = connTR
        commCART.Parameters.AddWithValue("@SessionID", Session.SessionID)
        commCART.ExecuteNonQuery()

        connTR.Close()
    End Sub
       
</script>

