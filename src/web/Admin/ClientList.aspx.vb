
Partial Class Admin_ClientList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If UCase(Session.Item("Class")) <> "ADMIN" Then
            Response.Redirect("~/Admin/Default.aspx")
        End If

        Page.Title = "Admin for TrendyRags.com"

    End Sub

    Protected Sub uwGridList_DblClick(ByVal sender As Object, ByVal e As Infragistics.WebUI.UltraWebGrid.ClickEventArgs) Handles uwGridList.DblClick
        Dim strCellValue As String = ""

        'MsgBox(e.Cell.Value)

        If e.Cell.Value = Nothing Then
        Else
            strCellValue = e.Cell.Value
            Select Case e.Cell.Column.Key
                Case "SerialNo"
                    Response.Redirect("Client.aspx?TASK=EDIT&SN=" + strCellValue + "&PU=ClientList.aspx")

                Case "Email"
                    Response.Redirect("mailto:" & strCellValue)

            End Select
        End If

    End Sub

End Class
