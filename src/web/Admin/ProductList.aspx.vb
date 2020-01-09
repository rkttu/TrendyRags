
Imports Infragistics.WebUI.UltraWebGrid

Partial Class Admin_ProductList
    Inherits System.Web.UI.Page

    Protected Sub uwGridList_DblClick(ByVal sender As Object, ByVal e As Infragistics.WebUI.UltraWebGrid.ClickEventArgs) Handles uwGridList.DblClick
        Dim strProductNo As String = ""
        Dim strProductKey As String = ""

        'MsgBox(e.Cell.Value)

        If e.Cell.Value = Nothing Then
        Else
            strProductNo = e.Cell.Value.ToString
            Select Case e.Cell.Column.Key
                Case "ProductNo"
                    Response.Redirect("Product.aspx?TASK=EDIT&PN=" + strProductNo + "&PU=ProductList.aspx")

            End Select
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If UCase(Session.Item("Class")) <> "ADMIN" Then
            Response.Redirect("~/Admin/Default.aspx")
        End If

        Page.Title = "Admin for TrendyRags.com"
        Me.uwGridList.DisplayLayout.RowSelectorsDefault = RowSelectors.No

    End Sub

    Protected Sub uwGridList_InitializeLayout(ByVal sender As Object, ByVal e As Infragistics.WebUI.UltraWebGrid.LayoutEventArgs) Handles uwGridList.InitializeLayout

        Me.uwGridList.Columns(0).Header.Caption = "Gender"
        Me.uwGridList.Columns(1).Header.Caption = "Order"
        Me.uwGridList.Columns(2).Header.Caption = "Product No."

        Me.uwGridList.Columns(0).Header.Style.HorizontalAlign = HorizontalAlign.Center
        Me.uwGridList.Columns(1).Header.Style.HorizontalAlign = HorizontalAlign.Center
        Me.uwGridList.Columns(2).Header.Style.HorizontalAlign = HorizontalAlign.Center

    End Sub

End Class
