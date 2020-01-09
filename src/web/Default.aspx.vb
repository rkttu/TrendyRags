
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Page.Title = "Welcome to TrendyRags.com"

        Call initImage()

    End Sub

    Private Sub initImage()
        Dim strLiteral As String = ""
        Dim aPicture(10) As String

        aPicture(1) = "HomeImage/HOME_804_01.jpg"
        aPicture(2) = "HomeImage/HOME_804_02.jpg"
        aPicture(3) = "HomeImage/HOME_804_03.jpg"
        aPicture(4) = "HomeImage/HOME_804_04.jpg"
        aPicture(5) = "HomeImage/HOME_804_05.jpg"
        aPicture(6) = "HomeImage/HOME_804_06.jpg"
        aPicture(7) = "HomeImage/HOME_804_07.jpg"
        aPicture(8) = "HomeImage/HOME_804_08.jpg"
        aPicture(9) = "HomeImage/HOME_804_09.jpg"
        aPicture(10) = "HomeImage/HOME_804_10.jpg"

        Dim nRnd As New Random()
        Dim nIndex As Integer = 0

        nIndex = Int(nRnd.Next(10))
        If nIndex = 0 Then
            nIndex = 10
        End If

        strLiteral = "<Img Src=""" + aPicture(nIndex) + """ border=""0"">"
        Me.ltrHome00.Text = strLiteral

    End Sub

End Class
