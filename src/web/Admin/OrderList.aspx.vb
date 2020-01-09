Imports Infragistics.WebUI.UltraWebGrid

Partial Class Admin_OrderList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If UCase(Session.Item("Class")) <> "ADMIN" Then
            Response.Redirect("~/Admin/Default.aspx")
        End If

        Page.Title = "Admin for TrendyRags.com"
        Me.UltraWebGrid1.DisplayLayout.RowSelectorsDefault = RowSelectors.No

    End Sub

    Protected Sub UltraWebGrid1_DblClick(ByVal sender As Object, ByVal e As Infragistics.WebUI.UltraWebGrid.ClickEventArgs) Handles UltraWebGrid1.DblClick
        Dim strOrderNo As String = e.Cell.Value

        Select Case e.Cell.Column.Key
            Case "OrderNo"
                Response.Redirect("Order.aspx?ON=" + strOrderNo)
        End Select

    End Sub

    Protected Sub txtCondition_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtCondition.TextChanged

        Me.UltraWebGrid1.DataBind()

    End Sub

    Protected Sub chkStatus09_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkStatus09.CheckedChanged

        Call makeCondition()

    End Sub

    Protected Sub chkStatus10_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkStatus10.CheckedChanged

        Call makeCondition()

    End Sub

    Protected Sub chkStatus20_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkStatus20.CheckedChanged

        Call makeCondition()

    End Sub

    Protected Sub chkStatus30_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkStatus30.CheckedChanged

        Call makeCondition()

    End Sub

    Protected Sub chkStatus40_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkStatus40.CheckedChanged

        Call makeCondition()

    End Sub

    Protected Sub chkStatus50_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkStatus50.CheckedChanged

        Call makeCondition()

    End Sub

    Protected Sub chkStatus60_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkStatus60.CheckedChanged

        Call makeCondition()

    End Sub

    Protected Sub chkStatus80_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkStatus80.CheckedChanged

        Call makeCondition()

    End Sub

    Protected Sub chkStatus90_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkStatus90.CheckedChanged

        Call makeCondition()

    End Sub

    Private Sub makeCondition()
        Dim nCondition As Integer = 0
        Dim aCondition(10) As String
        Dim strCondition As String = ""

        If Me.chkStatus09.Checked = True Then
            nCondition += 1
            aCondition(nCondition) = " (OrderStatus = '09') "
        End If

        If Me.chkStatus10.Checked = True Then
            nCondition += 1
            aCondition(nCondition) = " (OrderStatus = '10') "
        End If

        If Me.chkStatus20.Checked = True Then
            nCondition += 1
            aCondition(nCondition) = " (OrderStatus = '20') "
        End If

        If Me.chkStatus30.Checked = True Then
            nCondition += 1
            aCondition(nCondition) = " (OrderStatus = '30') "
        End If

        If Me.chkStatus40.Checked = True Then
            nCondition += 1
            aCondition(nCondition) = " (OrderStatus = '40') "
        End If

        If Me.chkStatus50.Checked = True Then
            nCondition += 1
            aCondition(nCondition) = " (OrderStatus = '50') "
        End If

        If Me.chkStatus60.Checked = True Then
            nCondition += 1
            aCondition(nCondition) = " (OrderStatus = '60') "
        End If

        If Me.chkStatus80.Checked = True Then
            nCondition += 1
            aCondition(nCondition) = " (OrderStatus = '80') "
        End If

        If Me.chkStatus90.Checked = True Then
            nCondition += 1
            aCondition(nCondition) = " (OrderStatus = '90') "
        End If

        Dim ni As Integer = 0
        For ni = 1 To nCondition
            If ni > 1 Then
                strCondition += " OR "
            End If
            strCondition += aCondition(ni)
        Next

        If nCondition = 0 Then
            strCondition = " (1=1) "
        End If

        Me.txtCondition.Text = strCondition

    End Sub

End Class
