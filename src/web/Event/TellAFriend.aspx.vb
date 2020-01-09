Imports System.Net
Imports System.IO
Imports System.Net.Mail

Partial Class Event_TellAFriend
    Inherits System.Web.UI.Page
    Dim smtpServer As String = ConfigurationManager.AppSettings("SMTPServer")

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim strStyleNo As String = ""

        If IsPostBack() Then

        Else
            If Request("SN") = Nothing OrElse Request("SN") = "" Then
                strStyleNo = "NOTHING"
            Else
                strStyleNo = Request("SN").ToCharArray
            End If
            Me.txtStyleNo.Text = strStyleNo
        End If

    End Sub

    Protected Sub btnSendEmail_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSendEmail.Click
        Dim lngSerialNo As Long = 0

        If NewEmail() Then
            Call TellAFriend()
            lngSerialNo = logTellAFriend()
            Call sendThankYouCoupon(lngSerialNo)
        Else
            Response.Write("<Script>alert(' Please enter other friend or start from other product page.. ');</script>")
            Me.txtToName.Focus()
        End If

    End Sub

    Private Function NewEmail() As Boolean
        Dim blnNew As Boolean = True
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commCoupon As Data.SqlClient.SqlCommand
        Dim rdData As Data.SqlClient.SqlDataReader
        Dim Sql As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        Sql = "SELECT TOP 1 * FROM Event_TellAFriend WHERE (FromEmail=@FromEmail) AND (ToEmail=@ToEmail) AND (ProductNo=@ProductNo) "
        commCoupon = New Data.SqlClient.SqlCommand
        commCoupon.CommandText = Sql
        commCoupon.Connection = connTR
        commCoupon.Parameters.AddWithValue("@FromEmail", Me.txtFromEmail.Text.Trim)
        commCoupon.Parameters.AddWithValue("@ToEmail", Me.txtToEmail.Text.Trim)
        commCoupon.Parameters.AddWithValue("@ProductNo", Me.txtStyleNo.Text.Trim)
        rdData = commCoupon.ExecuteReader()
        rdData.Read()
        If rdData.HasRows Then
            blnNew = False
        Else
            blnNew = True
        End If
        rdData.Close()
        connTR.Close()

        Return blnNew
    End Function

    Private Function logTellAFriend() As Long
        Dim lngSerialNo As Long = 0
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commOrder As Data.SqlClient.SqlCommand

        Dim sqlOrder As String = ""
        Dim strUserIP As String = Request.ServerVariables("REMOTE_ADDR")

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlOrder = "INSERT INTO Event_TellAFriend ( "
        sqlOrder += "FromName, FromEmail, ToName, ToEmail, ProductNo, DateEmail, Subject, Message, IPWritten, CouponIssued, CouponCode "
        sqlOrder += ") Values ( "
        sqlOrder += "@FromName, @FromEmail, @ToName, @ToEmail, @ProductNo, @DateEmail, @Subject, @Message, @IPWritten, @CouponIssued, @CouponCode "
        sqlOrder += "); SELECT @@IDENTITY AS lngSerialNo "

        commOrder = New Data.SqlClient.SqlCommand
        commOrder.CommandText = sqlOrder
        commOrder.Connection = connTR

        commOrder.Parameters.AddWithValue("@FromName", Me.txtFromName.Text.Trim)
        commOrder.Parameters.AddWithValue("@FromEmail", Me.txtFromEmail.Text.Trim)
        commOrder.Parameters.AddWithValue("@ToName", Me.txtToName.Text)
        commOrder.Parameters.AddWithValue("@ToEmail", Me.txtToEmail.Text.Trim)
        commOrder.Parameters.AddWithValue("@ProductNo", Me.txtStyleNo.Text.Trim)
        commOrder.Parameters.AddWithValue("@DateEmail", Now.ToString)
        commOrder.Parameters.AddWithValue("@Subject", Me.txtSubject.Text.Trim)
        commOrder.Parameters.AddWithValue("@Message", Me.txtMessage.Text.Trim)
        commOrder.Parameters.AddWithValue("@IPWritten", strUserIP)
        commOrder.Parameters.AddWithValue("@CouponIssued", "NO")
        commOrder.Parameters.AddWithValue("@CouponCode", "")

        lngSerialNo = commOrder.ExecuteScalar
        connTR.Close()

        Return lngSerialNo
    End Function

    Private Sub sendThankYouCoupon(ByVal lngSerialNo As Long)
        Dim strCouponCode As String = getCouponCode()

        Call saveCoupon(strCouponCode)
        Call sendThankYouMail(strCouponCode)
        Call updateLogTellAFriend(lngSerialNo, strCouponCode)
        Response.Write("<script>Thank you, we have sent a email to your friend!!</script>")
        Response.Redirect("../ShowWindow/Goods.aspx?PN=" + Me.txtStyleNo.Text)

    End Sub

    Private Function getCouponCode() As String
        Dim CouponCode As String = ""
        Dim strChar As String = ""
        Dim ni As Integer = 0
        Randomize()
        For ni = 1 To 16

            strChar = Chr(Int(Rnd() * 26) + 65)
            CouponCode += strChar
            If (ni Mod 4) = 0 Then
                If ni < 16 Then
                    CouponCode += "-"
                End If
            End If

        Next

        If Not NewCoupon(CouponCode) Then
            CouponCode = getCouponCode()
        End If

        Return CouponCode
    End Function

    Private Function NewCoupon(ByVal CouponCode As String) As Boolean
        Dim blnNewCoupon As Boolean = True
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commCoupon As Data.SqlClient.SqlCommand
        Dim rdData As Data.SqlClient.SqlDataReader
        Dim Sql As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        '//
        '// get Image-Thumbnail
        Sql = "SELECT TOP 1 * FROM Coupon WHERE CouponCode=@CouponCode "
        commCoupon = New Data.SqlClient.SqlCommand
        commCoupon.CommandText = Sql
        commCoupon.Connection = connTR
        commCoupon.Parameters.AddWithValue("@CouponCode", CouponCode)
        rdData = commCoupon.ExecuteReader()
        rdData.Read()
        If rdData.HasRows Then
            blnNewCoupon = False
        Else
            blnNewCoupon = True
        End If
        rdData.Close()
        connTR.Close()

        Return blnNewCoupon
    End Function

    Private Sub saveCoupon(ByVal CouponCode As String)
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commOrder As Data.SqlClient.SqlCommand

        Dim sqlOrder As String = ""
        Dim dtmExpiredDate As DateTime = DateAdd(DateInterval.Month, 2, Today)

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlOrder = "INSERT INTO Coupon ( "
        sqlOrder += " CouponCode, SalesMan, StartDate, EndDate, DCRate, Products, IssuedFor, MultipleUse, Used "
        sqlOrder += ") Values ( "
        sqlOrder += " @CouponCode, 'WEB Event', getDate(), @EndDate, @DCRate, @Products, @IssuedFor, @MultipleUse, 'NOT YET' "
        sqlOrder += ") "

        commOrder = New Data.SqlClient.SqlCommand
        commOrder.CommandText = sqlOrder
        commOrder.Connection = connTR

        commOrder.Parameters.AddWithValue("@CouponCode", CouponCode)
        commOrder.Parameters.AddWithValue("@EndDate", dtmExpiredDate)
        commOrder.Parameters.AddWithValue("@DCRate", 15)
        commOrder.Parameters.AddWithValue("@Products", "ALL")
        commOrder.Parameters.AddWithValue("@IssuedFor", " ")
        commOrder.Parameters.AddWithValue("@MultipleUse", "SINGLE")

        commOrder.ExecuteNonQuery()
        connTR.Close()

    End Sub

    Private Sub sendThankYouMail(ByVal CouponCode As String)
        'Hi %%SenderName%%,

        'Thank you for referring a friend to our products.  
        'In appreciation, please use the following gift code for a 15% discount at our website www.trendyrags.com.

        '***********************************
        '%%CouponCode%%
        '***********************************



        'Best Regards,

        'Customer Service
        'support@trendyrags.com
        Dim Msg As MailMessage = New MailMessage
        Dim MailObj As New SmtpClient(smtpServer)

        Dim strSenderName As String = Me.txtFromName.Text
        Dim strSenderEmail As String = Me.txtFromEmail.Text
        Dim strSupportName As String = "Customer Service"
        Dim strSupportEmail As String = "support@TrendyRags.com"
        Dim strExpiredDate As String = DateAdd(DateInterval.Month, 2, Today).ToString

        Dim strSubject As String = "Thank you for referring a friend - TrendyRags"
        Dim strMessage As String = ""

        strMessage += "Hello " + strSenderName + vbCrLf
        strMessage += vbCrLf
        strMessage += "Thank you for referring a friend to our products. " + vbCrLf
        strMessage += "In appreciation, please use the following gift code for a 15% discount at our website www.trendyrags.com." + vbCrLf
        strMessage += "" + vbCrLf
        strMessage += "***********************************" + vbCrLf
        strMessage += "" + vbCrLf
        strMessage += CouponCode + vbCrLf
        strMessage += "" + vbCrLf
        strMessage += "Expired : " + strExpiredDate + vbCrLf
        strMessage += "" + vbCrLf
        strMessage += "***********************************" + vbCrLf
        strMessage += "" + vbCrLf
        strMessage += "" + vbCrLf
        strMessage += "Best Regards," + vbCrLf
        strMessage += "" + vbCrLf
        strMessage += "Customer Service" + vbCrLf
        strMessage += "support@trendyrags.com" + vbCrLf
        strMessage += "" + vbCrLf
        strMessage += "" + vbCrLf
        strMessage += "" + vbCrLf


        Msg.From = New MailAddress(strSupportEmail, strSupportName)
        Msg.Subject = strSubject
        Msg.IsBodyHtml = False
        Msg.Body = strMessage

        Msg.To.Clear()
        Msg.Bcc.Clear()

        Msg.To.Add(New MailAddress(strSenderEmail, strSenderName))
        Msg.Bcc.Add(New MailAddress("support@trendyrags.com"))
        Msg.Bcc.Add(New MailAddress("Wally@trendyrags.com"))
        Msg.Bcc.Add(New MailAddress("sicho77@gmail.com"))
        MailObj.Send(Msg)

    End Sub

    Private Sub updateLogTellAFriend(ByVal SerialNo As Long, ByVal CouponCode As String)
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commOrder As Data.SqlClient.SqlCommand

        Dim sqlOrder As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlOrder = "UPDATE Event_TellAFriend  "
        sqlOrder += " SET CouponIssued='YES', CouponCode=@CouponCode "
        sqlOrder += "   WHERE SerialNo=@SerialNo "

        commOrder = New Data.SqlClient.SqlCommand
        commOrder.CommandText = sqlOrder
        commOrder.Connection = connTR

        commOrder.Parameters.AddWithValue("@SerialNo", SerialNo)
        commOrder.Parameters.AddWithValue("@CouponCode", CouponCode)

        commOrder.ExecuteNonQuery()
        connTR.Close()

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click

        Response.Redirect("../ShowWindow/Goods.aspx?PN=" + Me.txtStyleNo.Text)

    End Sub

    Private Sub TellAFriend()
        Dim Msg As MailMessage = New MailMessage
        Dim MailObj As New SmtpClient(smtpServer)
        Dim strSubject As String = Me.txtSubject.Text
        Dim strFromEmail As String = Me.txtFromEmail.Text
        Dim strFromName As String = Me.txtFromName.Text
        Dim strToEmail As String = Me.txtToEmail.Text
        Dim strToName As String = Me.txtToName.Text
        Dim strMessage As String = Replace(Me.txtMessage.Text, vbCrLf, "<br>")

        Msg.From = New MailAddress("support@trendyrags.com", "TrendyRags")
        Msg.Subject = strSubject + " - " + strFromName
        Msg.IsBodyHtml = "True"
        Msg.Body = "Your friend, " + strFromName + " recommended this TrendyRag for you.<br>" + _
                            strMessage + "<hr> " + _
                            makeMailBody()

        Msg.To.Clear()
        Msg.Bcc.Clear()

        Msg.To.Add(New MailAddress(strToEmail, strToName))
        Msg.Bcc.Add(New MailAddress("support@trendyrags.com"))
        Msg.Bcc.Add(New MailAddress("Wally@trendyrags.com"))
        Msg.Bcc.Add(New MailAddress("sicho77@gmail.com"))
        Msg.ReplyTo = New MailAddress(strFromEmail, strFromName)
        MailObj.Send(Msg)

    End Sub

    Private Function makeMailBody() As String
        Dim strBody As String = ""

        strBody = getBody()
        strBody = ReplacePicture(strBody)
        strBody = ReplaceColor(strBody)
        strBody = ReplaceSize(strBody)
        strBody = ReplaceDetail(strBody)

        Return strBody
    End Function

    Private Function getBody() As String
        Dim objStreamReader As StreamReader
        Dim contents As String = ""
        Dim textMailBody As String = "C:\WEBHOME\TrendyRags.com\Event\TellaFriend_MailBody.txt"

        objStreamReader = File.OpenText(textMailBody)
        contents = objStreamReader.ReadToEnd()
        objStreamReader.Close()

        Return contents
    End Function

    Private Function ReplacePicture(ByVal strText As String) As String
        Dim strBody As String = strText
        Dim ProductNo As String = Me.txtStyleNo.Text

        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commImages As Data.SqlClient.SqlCommand
        Dim rdImages As Data.SqlClient.SqlDataReader
        Dim sqlImagesThumb, sqlImagesDetail, sqlImagesRep As String
        Dim strImageRep As String = ""
        Dim aImageThumb(10), aImageDetail(10) As String
        Dim intIndex As Integer = 0
        Dim intThumb As Integer = 0

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        '//
        '// get Image-Thumbnail
        sqlImagesThumb = "SELECT TOP 7 * FROM Pictures WHERE ProductNo=@ProductNo And Usage='Thumb'  Order by DisplayOrder"
        commImages = New Data.SqlClient.SqlCommand
        commImages.CommandText = sqlImagesThumb
        commImages.Connection = connTR
        commImages.Parameters.AddWithValue("@ProductNo", ProductNo)
        rdImages = commImages.ExecuteReader()
        intIndex = 0
        Do While rdImages.Read()
            intIndex += 1
            aImageThumb(intIndex) = rdImages("FileName")
        Loop
        rdImages.Close()

        '//
        '// get Image-Detail
        sqlImagesDetail = "SELECT TOP 7 * FROM Pictures WHERE ProductNo=@ProductNo And Usage='Detail'   Order by DisplayOrder"
        commImages = New Data.SqlClient.SqlCommand
        commImages.CommandText = sqlImagesDetail
        commImages.Connection = connTR
        commImages.Parameters.AddWithValue("@ProductNo", ProductNo)
        rdImages = commImages.ExecuteReader()
        intIndex = 0
        Do While rdImages.Read()
            intIndex += 1
            aImageDetail(intIndex) = rdImages("FileName")
        Loop
        intThumb = intIndex
        rdImages.Close()

        '//
        '// get Image-Rep.
        sqlImagesRep = "SELECT TOP 1 * FROM Pictures WHERE ProductNo=@ProductNo And Usage='Rep' "
        commImages = New Data.SqlClient.SqlCommand
        commImages.CommandText = sqlImagesRep
        commImages.Connection = connTR
        commImages.Parameters.AddWithValue("@ProductNo", ProductNo)
        rdImages = commImages.ExecuteReader()
        rdImages.Read()
        strImageRep = rdImages("FileName")
        rdImages.Close()

        connTR.Close()

        Dim strURL As String = getImageURL(ProductNo)
        Dim strRepImage As String = ""
        strRepImage = "<Img border=0 width=300 src=" & strURL & "Rep/" & strImageRep & " oncontextmenu=""return false"" >"
        strBody = Replace(strBody, "%%PictureRep%%", strRepImage)

        Dim ni As Integer = 0
        Dim strThumb As String = ""
        For ni = 1 To intThumb
            strThumb += "<td>" + Constants.vbCrLf
            strThumb += "<a href=""" & strURL & "Detail/" & aImageDetail(ni) & """ >"
            strThumb += "<Img border=0 width=60 src=" + strURL + "Thumb/" + aImageThumb(ni) + "  oncontextmenu=""return false"" ></a>"
            strThumb += "</td>" + Constants.vbCrLf
        Next
        strBody = Replace(strBody, "%%ThumbANDDetail%%", strThumb)

        Return strBody
    End Function

    Private Function getImageURL(ByVal ProductNo As String) As String
        Dim strURL As String

        strURL = "http://www.TrendyRags.com/Pictures/" + Left(ProductNo, 2) + "/" + ProductNo + "/"

        Return strURL
    End Function

    Private Function ReplaceColor(ByVal strText As String) As String
        Dim strBody As String = strText
        Dim ProductNo As String = Me.txtStyleNo.Text
        Dim strColor As String = ""

        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commProduct As Data.SqlClient.SqlCommand
        Dim rdProduct As Data.SqlClient.SqlDataReader
        Dim sqlProduct As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlProduct = "SELECT * FROM ProductColor Where ProductNo = @ProductNo And ColorStatus = 'YES'  Order By SerialNo "
        commProduct = New Data.SqlClient.SqlCommand
        commProduct.CommandText = sqlProduct
        commProduct.Connection = connTR
        commProduct.Parameters.AddWithValue("@ProductNo", ProductNo)
        rdProduct = commProduct.ExecuteReader()

        strColor = ""
        Do While rdProduct.Read
            strColor += rdProduct("ColorName") + " / "
        Loop

        rdProduct.Close()
        connTR.Close()

        If strColor.Length > 3 Then
            strColor = Left(strColor, strColor.Length - 3)
        End If
        strBody = Replace(strBody, "%%ColorList%%", strColor)

        Return strBody
    End Function

    Private Function ReplaceSize(ByVal strText As String) As String
        Dim strBody As String = strText
        Dim ProductNo As String = Me.txtStyleNo.Text

        Dim strSize As String
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commProduct As Data.SqlClient.SqlCommand
        Dim rdProduct As Data.SqlClient.SqlDataReader
        Dim sqlProduct As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlProduct = "SELECT * FROM ProductSize Where ProductNo = @ProductNo And SizeStatus = 'YES'  Order By SerialNo "
        commProduct = New Data.SqlClient.SqlCommand
        commProduct.CommandText = sqlProduct
        commProduct.Connection = connTR
        commProduct.Parameters.AddWithValue("@ProductNo", ProductNo)
        rdProduct = commProduct.ExecuteReader()

        strSize = ""
        Do While rdProduct.Read
            strSize += rdProduct("SizeName") + " / "
        Loop
        rdProduct.Close()
        connTR.Close()

        If strSize.Length > 3 Then
            strSize = Left(strSize, strSize.Length - 3)
        End If
        strBody = Replace(strBody, "%%SizeList%%", strSize)

        Return strBody
    End Function

    Private Function ReplaceDetail(ByVal strText As String) As String
        Dim strBody As String = strText
        Dim ProductNo As String = Me.txtStyleNo.Text
        Dim strStyleNo, strBrandName, strFullDescription, strPriceRetail, strProductName As String

        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commProduct As Data.SqlClient.SqlCommand
        Dim rdProduct As Data.SqlClient.SqlDataReader
        Dim sqlProduct As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlProduct = "SELECT Top 1 * FROM ProductMaster Where ProductNo = @ProductNo "
        commProduct = New Data.SqlClient.SqlCommand
        commProduct.CommandText = sqlProduct
        commProduct.Connection = connTR
        commProduct.Parameters.AddWithValue("@ProductNo", ProductNo)
        rdProduct = commProduct.ExecuteReader()

        rdProduct.Read()
        strStyleNo = ProductNo.ToUpper
        strBrandName = rdProduct("BrandName").ToString
        strFullDescription = rdProduct("Description").ToString
        strPriceRetail = rdProduct("PriceRetail").ToString
        strProductName = rdProduct("ProductName").ToString

        rdProduct.Close()
        connTR.Close()

        strBody = Replace(strBody, "%%BrandName%%", strBrandName)
        strBody = Replace(strBody, "%%ProductName%%", strProductName)
        strBody = Replace(strBody, "%%ProductNo%%", ProductNo)
        strBody = Replace(strBody, "%%Description%%", strFullDescription)
        strBody = Replace(strBody, "%%PriceRetail%%", "$" + strPriceRetail)

        Return strBody
    End Function

End Class
