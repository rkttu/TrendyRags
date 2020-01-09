
Partial Class MyAccount_OrderHistory
    Inherits System.Web.UI.Page

        Const NotLogged = "Not-LoggedIn"
        Dim UserID As String

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

                If Session.Item("UserID") = NotLogged Then
                        messagebox("Please login first..")
                        Response.Redirect("../Login/Default.aspx?PU=../MyAccount/OrderHistory.aspx")
                End If

                UserID = Session.Item("UserID")
                Call initTable()

        End Sub

        Private Sub initTable()
                Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
                Dim connTR As Data.SqlClient.SqlConnection
                Dim commOrder As Data.SqlClient.SqlCommand
                Dim rdOrder As Data.SqlClient.SqlDataReader
                Dim sqlOrder As String = ""
                Dim strLiteral, strOrderNo As String
                Dim row As TableRow
                Dim cell As TableCell

                connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
                connTR.Open()

                sqlOrder = "SELECT * FROM OrderMaster WHERE (Email=@Email) And (OrderStatus>'09') Order By OrderNo  "

                commOrder = New Data.SqlClient.SqlCommand
                commOrder.CommandText = sqlOrder
                commOrder.Connection = connTR
                commOrder.Parameters.AddWithValue("@Email", UserID)
                rdOrder = commOrder.ExecuteReader()
                Do While rdOrder.Read()
                        row = New TableRow

                        cell = New TableCell
                        strLiteral = rdOrder("OrderDate")
                        cell.Controls.Add(New LiteralControl(strLiteral))
                        cell.HorizontalAlign = HorizontalAlign.Left
                        cell.VerticalAlign = VerticalAlign.Top
                        cell.Style.Add("padding-left", "5px")
                        cell.Style.Add("padding-top", "7px")
                        cell.Style.Add("padding-bottom", "7px")
                        row.Cells.Add(cell)

                        cell = New TableCell
                        strOrderNo = rdOrder("OrderNo")
                        strLiteral = "<a href=ViewOrder.aspx?ON=" + strOrderNo + ">" + strOrderNo + "</a>"
                        cell.Controls.Add(New LiteralControl(strLiteral))
                        cell.HorizontalAlign = HorizontalAlign.Center
                        cell.VerticalAlign = VerticalAlign.Top
                        cell.Style.Add("padding-left", "5px")
                        cell.Style.Add("padding-top", "7px")
                        cell.Style.Add("padding-bottom", "7px")
                        row.Cells.Add(cell)

                        cell = New TableCell
                        strLiteral = getDetail(strOrderNo)
                        cell.Controls.Add(New LiteralControl(strLiteral))
                        cell.HorizontalAlign = HorizontalAlign.Left
                        cell.VerticalAlign = VerticalAlign.Top
                        cell.Style.Add("padding-left", "5px")
                        cell.Style.Add("padding-top", "7px")
                        cell.Style.Add("padding-bottom", "7px")
                        row.Cells.Add(cell)

                        cell = New TableCell
                        strLiteral = Format(rdOrder("TotalAmount"), "$#,##0.00")
                        cell.Controls.Add(New LiteralControl(strLiteral))
                        cell.HorizontalAlign = HorizontalAlign.Right
                        cell.VerticalAlign = VerticalAlign.Top
                        cell.Style.Add("padding-left", "5px")
                        cell.Style.Add("padding-right", "20px")
                        cell.Style.Add("padding-top", "7px")
                        cell.Style.Add("padding-bottom", "7px")
                        row.Cells.Add(cell)

                        cell = New TableCell
                        Select Case rdOrder("OrderStatus")
                                Case "20"
                                        strLiteral = "Processing order"
                                Case "30"
                                        strLiteral = "Packaging order"
                                Case "40"
                                        strLiteral = "Shipped"
                                Case "50"
                                        strLiteral = "Returned"
                                Case "60"
                                        strLiteral = "Refunded"
                                Case "70"
                                        strLiteral = "NA(70)"
                                Case "80"
                                        strLiteral = "NA(80)"
                                Case "90"
                                        strLiteral = "Cancelled"
                        End Select

                        cell.Controls.Add(New LiteralControl(strLiteral))
                        cell.HorizontalAlign = HorizontalAlign.Center
                        cell.VerticalAlign = VerticalAlign.Top
                        cell.Style.Add("padding-left", "5px")
                        cell.Style.Add("padding-top", "7px")
                        cell.Style.Add("padding-bottom", "7px")
                        row.Cells.Add(cell)

                        Me.tblHistory.Rows.Add(row)

                Loop

                rdOrder.Close()
                connTR.Close()

        End Sub

        Private Function getDetail(ByVal OrderNo As String) As String
                Dim strList As String = ""
                Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
                Dim connTR As Data.SqlClient.SqlConnection
                Dim commOrder As Data.SqlClient.SqlCommand
                Dim rdOrder As Data.SqlClient.SqlDataReader
                Dim sqlOrder As String = ""

                connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
                connTR.Open()

                sqlOrder = "SELECT * FROM OrderDetail WHERE (OrderNo=@OrderNo) Order by SerialNo  "

                commOrder = New Data.SqlClient.SqlCommand
                commOrder.CommandText = sqlOrder
                commOrder.Connection = connTR
                commOrder.Parameters.AddWithValue("@OrderNo", OrderNo)
                rdOrder = commOrder.ExecuteReader()
                Do While rdOrder.Read()

                        strList += "<a href=""../ShowWindow/Goods.aspx?PN=" + rdOrder("ProductNo") + """ target=""blank"">"
                        strList += rdOrder("ProductNo") + "<br>"
                        strList += rdOrder("ColorName") + " / " + rdOrder("SizeName") + " / " + rdOrder("Qty").ToString + "(e/a)</a><br>"

                Loop

                rdOrder.Close()
                connTR.Close()

                Return strList
        End Function

        Private Sub MessageBox(ByVal msg As String)
                Dim lbl As New Label()

                lbl.Text = "<script language='javascript'>" & Environment.NewLine & _
                           "window.alert('" + msg + "')</script>"

                Page.Controls.Add(lbl)

        End Sub


End Class
