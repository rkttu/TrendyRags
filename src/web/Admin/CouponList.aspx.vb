Imports Infragistics.WebUI.UltraWebGrid

Partial Class Admin_CouponList
    Inherits System.Web.UI.Page

    Protected Sub ugCoupon_DblClick(ByVal sender As Object, ByVal e As Infragistics.WebUI.UltraWebGrid.ClickEventArgs) Handles ugCoupon.DblClick

        If e.Cell.Value <> Nothing Then
            If e.Cell.Column.Key = "SerialNo" Then
                Dim strSerialNo As String = e.Cell.Value.ToString
                Response.Redirect("Coupon.aspx?TASK=EDIT&SN=" + strSerialNo + "&PU=CouponList.aspx")
            End If
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If UCase(Session.Item("Class")) <> "ADMIN" Then
            Response.Redirect("~/Admin/Default.aspx")
        End If

        Page.Title = "Admin for TrendyRags.com"
        Me.ugCoupon.DisplayLayout.RowSelectorsDefault = RowSelectors.No

    End Sub

    Protected Sub btnAddNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddNew.Click

        Response.Redirect("Coupon.aspx?TASK=ADD&PU=CouponList.aspx")

    End Sub
End Class
