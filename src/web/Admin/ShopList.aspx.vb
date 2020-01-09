Imports Infragistics.WebUI.UltraWebGrid

Partial Class Admin_ShopList
    Inherits System.Web.UI.Page

    Protected Sub ugShoplist_DblClick(ByVal sender As Object, ByVal e As Infragistics.WebUI.UltraWebGrid.ClickEventArgs) Handles ugShoplist.DblClick

        If e.Cell.Value <> Nothing Then
            If e.Cell.Column.Key = "SerialNo" Then
                Dim strSerialNo As String = e.Cell.Value.ToString
                Response.Redirect("Shop.aspx?TASK=EDIT&SN=" + strSerialNo + "&PU=ShopList.aspx")
            End If
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If UCase(Session.Item("Class")) <> "ADMIN" Then
            Response.Redirect("~/Admin/Default.aspx")
        End If

        Page.Title = "Admin for TrendyRags.com"
        Me.ugShoplist.DisplayLayout.RowSelectorsDefault = RowSelectors.No

    End Sub

    Protected Sub btnAddNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddNew.Click

        Response.Redirect("Shop.aspx?TASK=ADD&PU=ShopList.aspx")

    End Sub
End Class
