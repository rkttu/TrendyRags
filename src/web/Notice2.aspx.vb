
Partial Class Notice2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Me.chkCook.Attributes.Add("onClick", "doCook()")

    End Sub

End Class
