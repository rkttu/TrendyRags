
Partial Class Includes_MP1
    Inherits System.Web.UI.MasterPage

    Dim SSLRoot As String = ConfigurationManager.AppSettings("SSLRoot")
    Dim NSRoot As String = ConfigurationManager.AppSettings("NONSSLRoot")
    Const conStatusNotLogged As String = "Not-LoggedIn"

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender

        Dim intCART As Int16 = 0

        intCART = getCARTQty()
        If intCART > 0 Then
            Me.lbtnViewCart.Text = "View Cart / Checkout (" + Str(intCART).Trim + ")"
            'Me.lbtnViewCart.PostBackUrl = "~/Checkout/ViewCART.aspx"
        Else
            Me.lbtnViewCart.Text = "View Cart"
            'Me.lbtnViewCart.PostBackUrl = ""
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim menuTable As Data.DataTable = initMenuLinks()
        Me.SlideMenu1.DataSource = menuTable
        Me.SlideMenu1.DataFields = "Top|Sub1"

        Dim binding As New EO.Web.DataBinding()
        binding.DataField = "LinkURL"
        binding.Property = "NavigateUrl"

        Me.SlideMenu1.Bindings.Add(binding)
        Me.SlideMenu1.DataBind()
        'Me.SlideMenu1.Items(1).SubMenu.Bindings.Add(binding)
        'Me.SlideMenu1.Items(1).SubMenu.DataBind()

        Me.SlideMenu1.Items(0).Image.Url = "~/images/LeftMenu_BG.gif"
        Me.SlideMenu1.Items(0).HoverStyle.ForeColor = Drawing.Color.Yellow
        Me.SlideMenu1.Items(0).SelectedHoverStyle.ForeColor = Drawing.Color.Yellow
        Me.SlideMenu1.Items(0).SelectedExpandedStyle.ForeColor = Drawing.Color.Yellow
        Me.SlideMenu1.Items(1).Image.Url = "~/images/LeftMenu_BG.gif"
        Me.SlideMenu1.Items(1).HoverStyle.ForeColor = Drawing.Color.Yellow
        Me.SlideMenu1.Items(1).SelectedHoverStyle.ForeColor = Drawing.Color.Yellow
        Me.SlideMenu1.Items(1).SelectedExpandedStyle.ForeColor = Drawing.Color.Yellow

        Me.SlideMenu1.Items(0).Image.HoverUrl = "~/images/LeftMenu_BG.gif"
        Me.SlideMenu1.Items(1).Image.HoverUrl = "~/images/LeftMenu_BG.gif"

        Me.SlideMenu1.Items(0).Image.SelectedExpandedUrl = "~/images/LeftMenu_BG.gif"
        Me.SlideMenu1.Items(1).Image.SelectedExpandedUrl = "~/images/LeftMenu_BG.gif"

        Me.SlideMenu1.Items(0).Image.SelectedHoverUrl = "~/images/LeftMenu_BG.gif"
        Me.SlideMenu1.Items(1).Image.SelectedHoverUrl = "~/images/LeftMenu_BG.gif"

        Me.SlideMenu1.Items(0).Image.SelectedUrl = "~/images/LeftMenu_BG.gif"
        Me.SlideMenu1.Items(1).Image.SelectedUrl = "~/images/LeftMenu_BG.gif"

        Me.SlideMenu1.Items(0).Text.HorizontalAlign = HorizontalAlign.Center
        Me.SlideMenu1.Items(1).Text.HorizontalAlign = HorizontalAlign.Center

        If Session.Item("Class") = "Category" Then
            Me.SlideMenu1.Items(0).Selected = True
        Else
            Me.SlideMenu1.Items(1).Selected = True
        End If

        'Me.SlideMenu1.Items(1).Selected = True

        Me.SlideMenu1.Width = "179"
        Me.SlideMenu1.SlidePaneHeight = "477"
        Me.SlideMenu1.EnableScrolling = True
        If Session.Item("UserID") = conStatusNotLogged Then
            Me.lbtnLogin.Text = "Login"
            Me.lbtnWAccess.Text = "Wholesale Access"
            Me.lbtnWAccess.Visible = True
            'Me.lbtnRegister.PostBackUrl = SSLRoot + "Login/Signup.aspx"
        Else
            'Me.lbtnWAccess.Visible = False
            Me.lbtnLogin.Text = "Logout"
            Select Case Session.Item("Class").ToString.ToUpper
                Case "WHOLESALE"
                    Me.lbtnWAccess.Text = Session.Item("UserName") & " - Wholesale(" & Session.Item("WholesaleLevel").ToString.ToUpper & ")"
                Case "PREWHOLESALE"
                    Me.lbtnWAccess.Text = Session.Item("UserName") & " - Pre_Wholesale "
                Case "USER"
                    Me.lbtnWAccess.Text = "Welcome " & Session.Item("UserName")
                Case "ADMIN"
                    Me.lbtnWAccess.Text = "Welcome administrator " & Session.Item("UserName")
                Case Else
                    Me.lbtnWAccess.Text = "Welcome " & Session.Item("UserName") & "(?)"
            End Select
        End If

        'Me.lblContactPhone.Text = ConfigurationManager.AppSettings("PhoneRep")

    End Sub

    Private Function initMenuLinks() As Data.DataTable
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commMenu As Data.SqlClient.SqlCommand
        Dim rdMenu As Data.SqlClient.SqlDataReader
        Dim sqlMenu As String = ""

        Dim strTitle As String = ""
        Dim strURL As String = ""
        Dim strMenu As String = ""
        Dim strCategory As String = ""
        Dim strGender As String = ""

        If Session.Item("Gender") = "" Then
            strGender = "Women"
        Else
            strGender = Session.Item("Gender")
        End If

        Dim Cat As Data.DataTable

        Cat = New Data.DataTable()
        Cat.Columns.Add("Top", GetType(String))
        Cat.Columns.Add("Sub1", GetType(String))
        Cat.Columns.Add("LinkURL", GetType(String))

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        '--- Read Shop by Category Menu
        Cat.Rows.Add(New Object() {"SHOP by CATEGORY", Constants.vbNullString, ""})
        If strGender = "All" Then
            sqlMenu = "SELECT Distinct Category FROM ProductMaster Where (WebDisplay='YES') AND (Category <> '') ORDER By Category "
        Else
            sqlMenu = "SELECT Distinct Category FROM ProductMaster Where (WebDisplay='YES') And (Gender=@Gender) AND (Category <> '') ORDER By Category "
        End If
        commMenu = New Data.SqlClient.SqlCommand
        commMenu.CommandText = sqlMenu
        commMenu.Connection = connTR
        commMenu.Parameters.AddWithValue("@Gender", strGender)
        rdMenu = commMenu.ExecuteReader()
        Do While rdMenu.Read
            strTitle = rdMenu("Category")
            If strGender = "All" Then
                strURL = NSRoot + "ShowWindow/Default.aspx?CN=Category&CP=1&CV=" & Server.UrlEncode(strTitle)
            Else
                strURL = NSRoot + "ShowWindow/Default.aspx?CN=Category&CP=1&CV=" & Server.UrlEncode(strTitle) & "&GD=" & strGender
            End If

            '// CN:Class Name, CP:Current Page, CV:ClassValue, GD:Gender

            Cat.Rows.Add(New Object() {"SHOP by CATEGORY", strTitle, strURL})
        Loop
        rdMenu.Close()

        '--- Read Shop by Brand Menu
        Cat.Rows.Add(New Object() {"SHOP by BRAND", Constants.vbNullString, ""})
        If strGender = "All" Then
            sqlMenu = "SELECT Distinct BrandName FROM ProductMaster Where (WebDisplay='YES') AND (BrandName <> '') ORDER By BrandName "
        Else
            sqlMenu = "SELECT Distinct BrandName FROM ProductMaster Where (WebDisplay='YES') And (Gender=@Gender) AND (BrandName <> '') ORDER By BrandName "
        End If
        commMenu = New Data.SqlClient.SqlCommand
        commMenu.CommandText = sqlMenu
        commMenu.Connection = connTR
        commMenu.Parameters.AddWithValue("@Gender", strGender)
        rdMenu = commMenu.ExecuteReader()
        Do While rdMenu.Read
            strTitle = rdMenu("BrandName")
            If strGender = "All" Then
                strURL = NSRoot + "ShowWindow/Default.aspx?CN=Brand&CP=1&CV=" & Server.UrlEncode(strTitle)
            Else
                strURL = NSRoot + "ShowWindow/Default.aspx?CN=Brand&CP=1&CV=" & Server.UrlEncode(strTitle) & "&GD=" & strGender
            End If
            '// CN:Class Name, CP:Current Page, CV:ClassValue, GD:Gender

            Cat.Rows.Add(New Object() {"SHOP by BRAND", strTitle, strURL})
        Loop
        rdMenu.Close()

        Return Cat
    End Function

    Private Function getCARTQty() As String
        Dim strQty As String = "0"
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commCART As Data.SqlClient.SqlCommand
        Dim rdCART As Data.SqlClient.SqlDataReader
        Dim sqlCART As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlCART = "SELECT Count(ProductNo) as CARTQty FROM CART WHERE (SessionID=@SessionID) "

        commCART = New Data.SqlClient.SqlCommand
        commCART.CommandText = sqlCART
        commCART.Connection = connTR
        commCART.Parameters.AddWithValue("@SessionID", Session.SessionID)
        rdCART = commCART.ExecuteReader()
        rdCART.Read()
        If rdCART.HasRows Then
            strQty = Str(rdCART("CARTQty")).Trim
        End If

        rdCART.Close()
        connTR.Close()

        Return strQty
    End Function

    Protected Sub lbtnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbtnLogin.Click

        Dim strURL As String = GetCurrentPageName()

        If Session.Item("UserID") <> conStatusNotLogged Then
            Session.Item("UserID") = conStatusNotLogged
            Session.Item("UserName") = ""
            Session.Item("Class") = ""
            Me.lbtnLogin.Text = "Login"
            Me.lbtnWAccess.Text = "Wholesale Access"
            Response.Redirect(NSRoot + "Default.aspx")
        Else
            Response.Redirect(SSLRoot + "Login/Default.aspx?PU=" & Server.UrlEncode(strURL))
        End If

    End Sub

    Protected Sub lbtnViewCart_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbtnViewCart.Click

        Dim strURL As String = GetCurrentPageName()
        'Dim intCART As Int16 = 0

        'intCART = getCARTQty()

        'If intCART > 0 Then
        Response.Redirect(NSRoot + "Checkout/ViewCART.aspx?PU=" & Server.UrlEncode(strURL))
        'End If

    End Sub

    Private Function GetCurrentPageName() As String

        'Dim sPath As String = System.Web.HttpContext.Current.Request.Url.AbsolutePath
        Dim sPath As String = Session.Item("CurrentPage")

        If sPath = "" Then
            sPath = NSRoot + "Default.aspx"
        End If
        Return sPath

    End Function

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click

        Response.Redirect(NSRoot + "Default.aspx")

    End Sub

    'Protected Sub lbtnRegister_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbtnRegister.Click

    '    If Session.Item("UserID").ToString = conStatusNotLogged Then
    '        Response.Redirect(SSLRoot + "Login/Signup.aspx")
    '    End If

    'End Sub

    Protected Sub lbtnMyAccount_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbtnMyAccount.Click

        Response.Redirect(SSLRoot + "MyAccount/Default.aspx")

    End Sub

    Protected Sub lbtnWAccess_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbtnWAccess.Click

        Response.Redirect(SSLRoot + "Login/Default_W.aspx")

    End Sub
End Class

