
Partial Class Admin_Coupon
    Inherits System.Web.UI.Page
    Dim SerialNo As String
    Dim TASK As String
    Dim PreviousURL As String

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click

        Response.Redirect("CouponList.aspx")

    End Sub

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

            Select Case TASK
                Case "ADD"
                    Call clearAllField()
                    Me.btnRemove.Visible = False
                Case "EDIT"
                    Call initScreen()
                    Me.btnRemove.Visible = True
            End Select

        End If

    End Sub

    Private Sub clearAllField()

        Me.txtSerialNo.Text = ""
        Me.txtCouponCode.Text = ""
        Me.txtSalesRep.Text = ""
        Me.dateBegin.Value = Today
        Me.txtTimeBegin.Text = "00:00:00"
        Me.dateFinish.Value = Today
        Me.txtTimeFinish.Text = "23:59:59"
        Me.txtDCRate.Text = ""
        Me.txtProductCodes.Text = ""

    End Sub

    Private Sub initScreen()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commCoupon As Data.SqlClient.SqlCommand
        Dim rdData As Data.SqlClient.SqlDataReader
        Dim sql As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sql = "SELECT TOP 1 * FROM Coupon WHERE (SerialNo=@SerialNo)  "

        commCoupon = New Data.SqlClient.SqlCommand
        commCoupon.CommandText = sql
        commCoupon.Connection = connTR
        commCoupon.Parameters.AddWithValue("@SerialNo", SerialNo)
        rdData = commCoupon.ExecuteReader()
        rdData.Read()

        '// Me.lblClientNo.Text = SerialNo.ToString
        Me.txtSerialNo.Text = rdData("SerialNo")
        Me.txtCouponCode.Text = rdData("CouponCode").ToString
        Me.txtSalesRep.Text = rdData("SalesMan").ToString
        Me.dateBegin.Value = rdData("StartDate")
        Me.txtTimeBegin.Text = "00:00:00"
        Me.dateFinish.Value = rdData("EndDate")
        Me.txtTimeFinish.Text = "23:59:59"
        Me.txtDCRate.Text = rdData("DCRate").ToString
        Me.txtProductCodes.Text = rdData("Products").ToString

        rdData.Close()
        connTR.Close()
        connTR.Dispose()

    End Sub

    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOK.Click

        Select Case TASK
            Case "ADD"
                Call saveCoupon()
            Case "EDIT"
                Call updateCoupon()
        End Select

    End Sub

    Private Sub saveCoupon()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commCoupon As Data.SqlClient.SqlCommand
        'Dim rdData As Data.SqlClient.SqlDataReader
        Dim sql As String = ""

        Dim strCouponCode As String = Me.txtCouponCode.Text
        Dim strSalesRep As String = Me.txtSalesRep.Text
        Dim dateBegin As String = Me.dateBegin.Value.ToString
        Dim dateFinish As String = Me.dateFinish.Value.ToString
        Dim strBeginDate As String
        Dim strFinishDate As String
        Dim intDCRate As Integer = Convert.ToInt16(Me.txtDCRate.Text)
        Dim strProductCodes As String = Me.txtProductCodes.Text

        If InStr(dateBegin, "M") > 0 Then
            strBeginDate = Left(dateBegin, dateBegin.Length - 11) + " " + Me.txtTimeBegin.Text.ToString
        Else
            strBeginDate = dateBegin + " " + Me.txtTimeBegin.Text.ToString
        End If
        If InStr(dateFinish, "M") > 0 Then
            strFinishDate = Left(dateFinish, dateFinish.Length - 11) + " " + Me.txtTimeFinish.Text.ToString
        Else
            strFinishDate = dateFinish + " " + Me.txtTimeFinish.Text.ToString
        End If

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sql = "INSERT INTO Coupon ("
        sql += " CouponCode, Salesman, StartDate, EndDate, DCRate, Products "
        sql += " ) Values ( "
        sql += " @CouponCode, @Salesman, @StartDate, @EndDate, @DCRate, @Products "
        sql += " )"
        commCoupon = New Data.SqlClient.SqlCommand
        commCoupon.CommandText = sql
        commCoupon.Connection = connTR
        commCoupon.Parameters.AddWithValue("@CouponCode", strCouponCode)
        commCoupon.Parameters.AddWithValue("@Salesman", strSalesRep)
        commCoupon.Parameters.AddWithValue("@StartDate", strBeginDate)
        commCoupon.Parameters.AddWithValue("@EndDate", strFinishDate)
        commCoupon.Parameters.AddWithValue("@DCRate", intDCRate)
        commCoupon.Parameters.AddWithValue("@Products", strProductCodes)
        commCoupon.ExecuteNonQuery()

        connTR.Close()

        Response.Redirect("CouponList.aspx")

    End Sub

    Private Sub updateCoupon()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commCoupon As Data.SqlClient.SqlCommand
        'Dim rdData As Data.SqlClient.SqlDataReader
        Dim sql As String = ""

        Dim strCouponCode As String = Me.txtCouponCode.Text
        Dim strSalesRep As String = Me.txtSalesRep.Text
        Dim dateBegin As String = Me.dateBegin.Value.ToString
        Dim dateFinish As String = Me.dateFinish.Value.ToString
        Dim strBeginDate As String
        Dim strFinishDate As String
        Dim intDCRate As Integer = Convert.ToInt16(Me.txtDCRate.Text)
        Dim strProductCodes As String = Me.txtProductCodes.Text

        If InStr(dateBegin, "M") > 0 Then
            strBeginDate = Left(dateBegin, dateBegin.Length - 11) + " " + Me.txtTimeBegin.Text.ToString
        Else
            strBeginDate = dateBegin + " " + Me.txtTimeBegin.Text.ToString
        End If
        If InStr(dateFinish, "M") > 0 Then
            strFinishDate = Left(dateFinish, dateFinish.Length - 11) + " " + Me.txtTimeFinish.Text.ToString
        Else
            strFinishDate = dateFinish + " " + Me.txtTimeFinish.Text.ToString
        End If


        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sql = "UPDATE Coupon SET "
        sql += " CouponCode=@CouponCode, "
        sql += " Salesman=@Salesman, "
        sql += " StartDate=@StartDate, "
        sql += " EndDate=@EndDate, "
        sql += " DCRate=@DCRate, "
        sql += " Products=@Products "
        sql += "     WHERE SerialNo=@SerialNo "

        commCoupon = New Data.SqlClient.SqlCommand
        commCoupon.CommandText = sql
        commCoupon.Connection = connTR
        commCoupon.Parameters.AddWithValue("@SerialNo", SerialNo)
        commCoupon.Parameters.AddWithValue("@CouponCode", strCouponCode)
        commCoupon.Parameters.AddWithValue("@Salesman", strSalesRep)
        commCoupon.Parameters.AddWithValue("@StartDate", strBeginDate)
        commCoupon.Parameters.AddWithValue("@EndDate", strFinishDate)
        commCoupon.Parameters.AddWithValue("@DCRate", intDCRate)
        commCoupon.Parameters.AddWithValue("@Products", strProductCodes)

        commCoupon.ExecuteNonQuery()

        connTR.Close()

        Response.Redirect("CouponList.aspx")


    End Sub

    Protected Sub btnRemove_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRemove.Click

        Call removeCoupon()

    End Sub

    Private Sub removeCoupon()

        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commCoupon As Data.SqlClient.SqlCommand
        'Dim rdData As Data.SqlClient.SqlDataReader
        Dim sql As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sql = "DELETE Coupon  "
        sql += "     WHERE SerialNo=@SerialNo "

        commCoupon = New Data.SqlClient.SqlCommand
        commCoupon.CommandText = sql
        commCoupon.Connection = connTR
        commCoupon.Parameters.AddWithValue("@SerialNo", SerialNo)
        commCoupon.ExecuteNonQuery()

        connTR.Close()

        Response.Redirect("CouponList.aspx")

    End Sub
End Class
