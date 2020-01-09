Imports System.IO
Imports Microsoft.VisualBasic

Partial Class Admin_Product
    Inherits System.Web.UI.Page

    Dim TASK As String
    Dim PictureFolder As String
    Dim PN As String
    Dim PreviousURL As String

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        ViewState("TASK") = TASK
        ViewState("PN") = PN
        ViewState("PreviousURL") = PreviousURL
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Me.ddlBrandName.Attributes.Add("onChange", "doBrandName()")
        Me.ddlCategory.Attributes.Add("onChange", "doCategory()")
        Me.ddlRawType.Attributes.Add("onChange", "doRawType()")

        If UCase(Session.Item("Class")) <> "ADMIN" Then
            Response.Redirect("~/Admin/Default.aspx")
        End If

        Page.Title = "Admin for TrendyRags.com"
        PictureFolder = ConfigurationManager.AppSettings("PictureFolder")
        If IsPostBack() Then
            TASK = ViewState("TASK")
            PN = ViewState("PN")
            PreviousURL = ViewState("PreviousURL")
        Else
            If Request("TASK") = "" Then
                TASK = "ADD"
            Else
                TASK = Request("TASK").ToUpper
            End If
            PN = Request("PN")
            PreviousURL = Request("PU")

            Call initDDLBrand()
            Call initDDLCategory()
            Call initDDLRawType()
            Select Case TASK
                Case "ADD"
                    Me.ltrTitle.Text = "<Font Size=+1><I>Add new product</I></Font>"
                    Call clearAllField()
                    Me.txtProductNo.Focus()
                Case "EDIT"
                    Me.ltrTitle.Text = "<Font Size=+1><I>Edit product information</I></Font>"
                    Call setAllFieldForEdit()
                    If PN <> "" Then
                        Call getProductInfo(PN)
                        Me.txtProductNo.Focus()
                    End If
            End Select
        End If

    End Sub

    Private Sub MessageBox(ByVal msg As String)

        System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=""JavaScript"">" & vbCrLf)
        System.Web.HttpContext.Current.Response.Write("alert(""" & msg & """)" & vbCrLf)
        System.Web.HttpContext.Current.Response.Write("</SCRIPT>")

    End Sub

    Private Sub initDDLBrand()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commDDL As Data.SqlClient.SqlCommand
        Dim rdDDL As Data.SqlClient.SqlDataReader
        Dim sqlDDL As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        Me.ddlBrandName.Items.Clear()
        Me.ddlBrandName.Items.Add("Select one..")
        '--- Read Shop by Category Menu
        sqlDDL = "SELECT Distinct BrandName FROM ProductMaster  ORDER By BrandName "
        commDDL = New Data.SqlClient.SqlCommand
        commDDL.CommandText = sqlDDL
        commDDL.Connection = connTR
        rdDDL = commDDL.ExecuteReader()
        Do While rdDDL.Read
            Me.ddlBrandName.Items.Add(rdDDL("BrandName"))
        Loop
        rdDDL.Close()
        connTR.Close()

    End Sub

    Private Sub initDDLCategory()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commDDL As Data.SqlClient.SqlCommand
        Dim rdDDL As Data.SqlClient.SqlDataReader
        Dim sqlDDL As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        Me.ddlCategory.Items.Clear()
        Me.ddlCategory.Items.Add("Select one..")
        '--- Read Shop by Category Menu
        sqlDDL = "SELECT Distinct Category FROM ProductMaster  ORDER By Category "
        commDDL = New Data.SqlClient.SqlCommand
        commDDL.CommandText = sqlDDL
        commDDL.Connection = connTR
        rdDDL = commDDL.ExecuteReader()
        Do While rdDDL.Read
            Me.ddlCategory.Items.Add(rdDDL("Category"))
        Loop
        rdDDL.Close()
        connTR.Close()

    End Sub

    Private Sub initDDLRawType()
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commDDL As Data.SqlClient.SqlCommand
        Dim rdDDL As Data.SqlClient.SqlDataReader
        Dim sqlDDL As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        Me.ddlRawType.Items.Clear()
        Me.ddlRawType.Items.Add("Select one..")
        '--- Read Shop by Category Menu
        sqlDDL = "SELECT Distinct RawTypeName FROM CodeRawType  ORDER By RawTypeName "
        commDDL = New Data.SqlClient.SqlCommand
        commDDL.CommandText = sqlDDL
        commDDL.Connection = connTR
        rdDDL = commDDL.ExecuteReader()
        Do While rdDDL.Read
            Me.ddlRawType.Items.Add(rdDDL("RawTypeName"))
        Loop
        rdDDL.Close()
        connTR.Close()


    End Sub

    Private Sub clearAllField()

        Me.btnSearch.Visible = False
        Me.txtBrandName.Text = ""
        Me.txtBriefDescription.Text = ""
        Me.txtCategory.Text = ""
        Me.txtColors.Text = ""
        Me.txtFullDescription.Text = ""
        Me.txtImagesDetail.Text = ""
        Me.txtImagesRep.Text = ""
        Me.txtImagesThumb.Text = ""
        Me.txtModelName.Text = ""
        Me.txtPriceRetail.Text = ""
        Me.txtPriceRetailEvent1.Text = ""
        Me.txtPriceRetailEvent2.Text = ""
        Me.txtPriceWholesale1.Text = ""
        Me.txtPriceWholesale2.Text = ""
        Me.txtPriceWholesale3.Text = ""
        Me.txtPriceWholesale4.Text = ""
        Me.txtPriceWholesale5.Text = ""

        Me.txtLineSheet1.Text = ""
        Me.lblLinesheet1.Text = ""
        Me.txtLineSheet2.Text = ""
        Me.lblLinesheet2.Text = ""
        Me.txtLineSheet3.Text = ""
        Me.lblLinesheet3.Text = ""

        Me.txtProductName.Text = ""
        Me.txtProductNo.Text = ""
        Me.txtSizes.Text = ""
        Me.txtWeightLBS.Text = ""
        Me.txtDisplayOrder.Text = "0"
        Me.rdoGender.Items(0).Selected = True
        Me.rdoExclusiveSales.Items(0).Selected = True
        Me.chkNewItem.Checked = True
        Me.rdoDisplayYes.Checked = True
        Me.rdoPending.Checked = True

        Me.lblThumb1.Text = ""
        Me.lblThumb2.Text = ""
        Me.lblThumb3.Text = ""
        Me.lblThumb4.Text = ""
        Me.lblThumb5.Text = ""
        Me.lblThumb6.Text = ""
        Me.lblThumb7.Text = ""
        Me.lblThumb8.Text = ""
        Me.lblThumb9.Text = ""
        Me.lblThumb10.Text = ""

        Me.lblDetail1.Text = ""
        Me.lblDetail2.Text = ""
        Me.lblDetail3.Text = ""
        Me.lblDetail4.Text = ""
        Me.lblDetail5.Text = ""
        Me.lblDetail6.Text = ""
        Me.lblDetail7.Text = ""
        Me.lblDetail8.Text = ""
        Me.lblDetail9.Text = ""
        Me.lblDetail10.Text = ""

        Me.lblRep.Text = ""

    End Sub

    Private Sub setAllFieldForEdit()

        Me.btnSearch.Visible = True
        Me.txtBrandName.Text = ""
        Me.txtBriefDescription.Text = ""
        Me.txtCategory.Text = ""
        Me.txtColors.Text = ""
        Me.txtFullDescription.Text = ""
        Me.txtImagesDetail.Text = ""
        Me.txtImagesRep.Text = ""
        Me.txtImagesThumb.Text = ""
        Me.txtModelName.Text = ""
        Me.txtPriceRetail.Text = ""
        Me.txtPriceRetailEvent1.Text = ""
        Me.txtPriceRetailEvent2.Text = ""
        Me.txtPriceWholesale1.Text = ""
        Me.txtPriceWholesale2.Text = ""
        Me.txtPriceWholesale3.Text = ""
        Me.txtPriceWholesale4.Text = ""
        Me.txtPriceWholesale5.Text = ""

        Me.txtLineSheet1.Text = ""
        Me.lblLinesheet1.Text = ""
        Me.txtLineSheet2.Text = ""
        Me.lblLinesheet2.Text = ""
        Me.txtLineSheet3.Text = ""
        Me.lblLinesheet3.Text = ""

        Me.txtProductName.Text = ""
        Me.txtProductNo.Text = ""
        Me.txtSizes.Text = ""
        Me.txtWeightLBS.Text = ""
        Me.txtDisplayOrder.Text = "0"
        Me.rdoGender.Items(0).Selected = True
        Me.rdoExclusiveSales.Items(0).Selected = True
        Me.chkNewItem.Checked = True
        Me.rdoDisplayYes.Checked = True
        Me.rdoPending.Checked = True
        Me.txtProductNo.Focus()

        Me.lblThumb1.Text = ""
        Me.lblThumb2.Text = ""
        Me.lblThumb3.Text = ""
        Me.lblThumb4.Text = ""
        Me.lblThumb5.Text = ""
        Me.lblThumb6.Text = ""
        Me.lblThumb7.Text = ""
        Me.lblThumb8.Text = ""
        Me.lblThumb9.Text = ""
        Me.lblThumb10.Text = ""

        Me.lblDetail1.Text = ""
        Me.lblDetail2.Text = ""
        Me.lblDetail3.Text = ""
        Me.lblDetail4.Text = ""
        Me.lblDetail5.Text = ""
        Me.lblDetail6.Text = ""
        Me.lblDetail7.Text = ""
        Me.lblDetail8.Text = ""
        Me.lblDetail9.Text = ""
        Me.lblDetail10.Text = ""

        Me.lblRep.Text = ""

    End Sub

    'Protected Sub ddlBrandName_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlBrandName.SelectedIndexChanged

    '    If Me.ddlBrandName.Text = "Select one.." Then
    '        Me.txtBrandName.Text = ""
    '    Else
    '        Me.txtBrandName.Text = Me.ddlBrandName.Text
    '    End If

    'End Sub

    'Protected Sub ddlCategory_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlCategory.SelectedIndexChanged

    '    If Me.ddlCategory.Text = "Select one.." Then
    '        Me.txtCategory.Text = ""
    '    Else
    '        Me.txtCategory.Text = Me.ddlCategory.Text
    '    End If

    'End Sub

    'Protected Sub ddlBrandName_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlBrandName.TextChanged
    '    If Me.ddlBrandName.Text = "Select one.." Then
    '        Me.txtBrandName.Text = ""
    '    Else
    '        Me.txtBrandName.Text = Me.ddlBrandName.Text
    '    End If
    'End Sub

    Protected Sub btnFUImageRepOK_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFUImageRepOK.Click

        Dim strFileRep, strExtension As String
        Dim strProductNo, strProductFolder, strFolderRep As String

        strProductNo = Me.txtProductNo.Text.Trim
        strProductFolder = Left(strProductNo, 2) + "\" + strProductNo + "\"
        strFolderRep = PictureFolder + strProductFolder + "Rep"

        If Me.fuImageRep.HasFile Then
            checkFolder()
            strFileRep = strFolderRep + "\" + Me.fuImageRep.FileName
            strExtension = IO.Path.GetExtension(strFileRep)
            Me.fuImageRep.SaveAs(strFileRep)
            Me.txtImagesRep.Text = IO.Path.GetFileName(strFileRep)
        Else
            If Me.lblRep.Text.Length > 0 Then
                Me.txtImagesRep.Text = Me.lblRep.Text
            End If
        End If

    End Sub

    Protected Sub btnFUImageDetailOK_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFUImageDetailOK.Click

        Dim strFileDetail, strExtension As String
        Dim strProductNo, strProductFolder, strFolderDetail As String

        strProductNo = Me.txtProductNo.Text.Trim
        strProductFolder = Left(strProductNo, 2) + "\" + strProductNo + "\"
        strFolderDetail = PictureFolder + strProductFolder + "Detail"
        Me.txtImagesDetail.Text = ""

        If Me.fuDetail1.HasFile Then
            strFileDetail = strFolderDetail + "\" + Me.fuDetail1.FileName
            Me.fuDetail1.SaveAs(strFileDetail)
            Me.txtImagesDetail.Text += IO.Path.GetFileName(strFileDetail) & Constants.vbCrLf
        Else
            If Me.lblDetail1.Text.Length > 0 Then
                Me.txtImagesDetail.Text += Me.lblDetail1.Text.Trim & Constants.vbCrLf
            End If
        End If

        If Me.fuDetail2.HasFile Then
            strFileDetail = strFolderDetail + "\" + Me.fuDetail2.FileName
            Me.fuDetail2.SaveAs(strFileDetail)
            Me.txtImagesDetail.Text += IO.Path.GetFileName(strFileDetail) & Constants.vbCrLf
        Else
            If Me.lblDetail2.Text.Length > 0 Then
                Me.txtImagesDetail.Text += Me.lblDetail2.Text.Trim & Constants.vbCrLf
            End If
        End If

        If Me.fuDetail3.HasFile Then
            strFileDetail = strFolderDetail + "\" + Me.fuDetail3.FileName
            Me.fuDetail3.SaveAs(strFileDetail)
            Me.txtImagesDetail.Text += IO.Path.GetFileName(strFileDetail) & Constants.vbCrLf
        Else
            If Me.lblDetail3.Text.Length > 0 Then
                Me.txtImagesDetail.Text += Me.lblDetail3.Text.Trim & Constants.vbCrLf
            End If
        End If

        If Me.fuDetail4.HasFile Then
            strFileDetail = strFolderDetail + "\" + Me.fuDetail4.FileName
            Me.fuDetail4.SaveAs(strFileDetail)
            Me.txtImagesDetail.Text += IO.Path.GetFileName(strFileDetail) & Constants.vbCrLf
        Else
            If Me.lblDetail4.Text.Length > 0 Then
                Me.txtImagesDetail.Text += Me.lblDetail4.Text.Trim & Constants.vbCrLf
            End If
        End If

        If Me.fuDetail5.HasFile Then
            strFileDetail = strFolderDetail + "\" + Me.fuDetail5.FileName
            Me.fuDetail5.SaveAs(strFileDetail)
            Me.txtImagesDetail.Text += IO.Path.GetFileName(strFileDetail) & Constants.vbCrLf
        Else
            If Me.lblDetail5.Text.Length > 0 Then
                Me.txtImagesDetail.Text += Me.lblDetail5.Text.Trim & Constants.vbCrLf
            End If
        End If

        If Me.fuDetail6.HasFile Then
            strFileDetail = strFolderDetail + "\" + Me.fuDetail6.FileName
            Me.fuDetail6.SaveAs(strFileDetail)
            Me.txtImagesDetail.Text += IO.Path.GetFileName(strFileDetail) & Constants.vbCrLf
        Else
            If Me.lblDetail6.Text.Length > 0 Then
                Me.txtImagesDetail.Text += Me.lblDetail6.Text.Trim & Constants.vbCrLf
            End If
        End If

        If Me.fuDetail7.HasFile Then
            strFileDetail = strFolderDetail + "\" + Me.fuDetail7.FileName
            Me.fuDetail7.SaveAs(strFileDetail)
            Me.txtImagesDetail.Text += IO.Path.GetFileName(strFileDetail) & Constants.vbCrLf
        Else
            If Me.lblDetail7.Text.Length > 0 Then
                Me.txtImagesDetail.Text += Me.lblDetail7.Text.Trim & Constants.vbCrLf
            End If
        End If

        If Me.fuDetail8.HasFile Then
            strFileDetail = strFolderDetail + "\" + Me.fuDetail8.FileName
            strExtension = IO.Path.GetExtension(strFileDetail)
            Me.fuDetail8.SaveAs(strFileDetail)
            Me.txtImagesDetail.Text += IO.Path.GetFileName(strFileDetail) & Constants.vbCrLf
        Else
            If Me.lblDetail8.Text.Length > 0 Then
                Me.txtImagesDetail.Text += Me.lblDetail8.Text.Trim & Constants.vbCrLf
            End If
        End If

        If Me.fuDetail9.HasFile Then
            strFileDetail = strFolderDetail + "\" + Me.fuDetail9.FileName
            Me.fuDetail9.SaveAs(strFileDetail)
            Me.txtImagesDetail.Text += IO.Path.GetFileName(strFileDetail) & Constants.vbCrLf
        Else
            If Me.lblDetail9.Text.Length > 0 Then
                Me.txtImagesDetail.Text += Me.lblDetail9.Text.Trim & Constants.vbCrLf
            End If
        End If

        If Me.fuDetail10.HasFile Then
            strFileDetail = strFolderDetail + "\" + Me.fuDetail10.FileName
            Me.fuDetail10.SaveAs(strFileDetail)
            Me.txtImagesDetail.Text += IO.Path.GetFileName(strFileDetail) & Constants.vbCrLf
        Else
            If Me.lblDetail10.Text.Length > 0 Then
                Me.txtImagesDetail.Text += Me.lblDetail10.Text.Trim & Constants.vbCrLf
            End If
        End If

        Dim lngImageDetail As Long = Me.txtImagesDetail.Text.Length
        Dim strImageDetail As String = Me.txtImagesDetail.Text.Trim

        strImageDetail = Left(strImageDetail, (lngImageDetail - 2))
        Me.txtImagesDetail.Text = strImageDetail

    End Sub

    Protected Sub btnFUImageThumbOK_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFUImageThumbOK.Click

        Dim strFileThumb As String
        Dim strProductNo, strProductFolder, strFolderThumb As String

        strProductNo = Me.txtProductNo.Text.Trim
        strProductFolder = Left(strProductNo, 2) + "\" + strProductNo + "\"
        strFolderThumb = PictureFolder + strProductFolder + "Thumb"
        Me.txtImagesThumb.Text = ""

        If Me.fuThumb1.HasFile Then
            strFileThumb = strFolderThumb + "\" + Me.fuThumb1.FileName
            Me.fuThumb1.SaveAs(strFileThumb)
            Me.txtImagesThumb.Text += IO.Path.GetFileName(strFileThumb) & Constants.vbCrLf
        Else
            If Me.lblThumb1.Text.Length > 0 Then
                Me.txtImagesThumb.Text += Me.lblThumb1.Text.Trim & Constants.vbCrLf
            End If
        End If

        If Me.fuThumb2.HasFile Then
            strFileThumb = strFolderThumb + "\" + Me.fuThumb2.FileName
            Me.fuThumb2.SaveAs(strFileThumb)
            Me.txtImagesThumb.Text += IO.Path.GetFileName(strFileThumb) & Constants.vbCrLf
        Else
            If Me.lblThumb2.Text.Length > 0 Then
                Me.txtImagesThumb.Text += Me.lblThumb2.Text.Trim & Constants.vbCrLf
            End If
        End If

        If Me.fuThumb3.HasFile Then
            strFileThumb = strFolderThumb + "\" + Me.fuThumb3.FileName
            Me.fuThumb3.SaveAs(strFileThumb)
            Me.txtImagesThumb.Text += IO.Path.GetFileName(strFileThumb) & Constants.vbCrLf
        Else
            If Me.lblThumb3.Text.Length > 0 Then
                Me.txtImagesThumb.Text += Me.lblThumb3.Text.Trim & Constants.vbCrLf
            End If
        End If

        If Me.fuThumb4.HasFile Then
            strFileThumb = strFolderThumb + "\" + Me.fuThumb4.FileName
            Me.fuThumb4.SaveAs(strFileThumb)
            Me.txtImagesThumb.Text += IO.Path.GetFileName(strFileThumb) & Constants.vbCrLf
        Else
            If Me.lblThumb4.Text.Length > 0 Then
                Me.txtImagesThumb.Text += Me.lblThumb4.Text.Trim & Constants.vbCrLf
            End If
        End If

        If Me.fuThumb5.HasFile Then
            strFileThumb = strFolderThumb + "\" + Me.fuThumb5.FileName
            Me.fuThumb5.SaveAs(strFileThumb)
            Me.txtImagesThumb.Text += IO.Path.GetFileName(strFileThumb) & Constants.vbCrLf
        Else
            If Me.lblThumb5.Text.Length > 0 Then
                Me.txtImagesThumb.Text += Me.lblThumb5.Text.Trim & Constants.vbCrLf
            End If
        End If

        If Me.fuThumb6.HasFile Then
            strFileThumb = strFolderThumb + "\" + Me.fuThumb6.FileName
            Me.fuThumb6.SaveAs(strFileThumb)
            Me.txtImagesThumb.Text += IO.Path.GetFileName(strFileThumb) & Constants.vbCrLf
        Else
            If Me.lblThumb6.Text.Length > 0 Then
                Me.txtImagesThumb.Text += Me.lblThumb6.Text.Trim & Constants.vbCrLf
            End If
        End If

        If Me.fuThumb7.HasFile Then
            strFileThumb = strFolderThumb + "\" + Me.fuThumb7.FileName
            Me.fuThumb7.SaveAs(strFileThumb)
            Me.txtImagesThumb.Text += IO.Path.GetFileName(strFileThumb) & Constants.vbCrLf
        Else
            If Me.lblThumb7.Text.Length > 0 Then
                Me.txtImagesThumb.Text += Me.lblThumb7.Text.Trim & Constants.vbCrLf
            End If
        End If

        If Me.fuThumb8.HasFile Then
            strFileThumb = strFolderThumb + "\" + Me.fuThumb8.FileName
            Me.fuThumb8.SaveAs(strFileThumb)
            Me.txtImagesThumb.Text += IO.Path.GetFileName(strFileThumb) & Constants.vbCrLf
        Else
            If Me.lblThumb8.Text.Length > 0 Then
                Me.txtImagesThumb.Text += Me.lblThumb8.Text.Trim & Constants.vbCrLf
            End If
        End If

        If Me.fuThumb9.HasFile Then
            strFileThumb = strFolderThumb + "\" + Me.fuThumb9.FileName
            Me.fuThumb9.SaveAs(strFileThumb)
            Me.txtImagesThumb.Text += IO.Path.GetFileName(strFileThumb) & Constants.vbCrLf
        Else
            If Me.lblThumb9.Text.Length > 0 Then
                Me.txtImagesThumb.Text += Me.lblThumb9.Text.Trim & Constants.vbCrLf
            End If
        End If

        If Me.fuThumb10.HasFile Then
            strFileThumb = strFolderThumb + "\" + Me.fuThumb10.FileName
            Me.fuThumb10.SaveAs(strFileThumb)
            Me.txtImagesThumb.Text += IO.Path.GetFileName(strFileThumb) & Constants.vbCrLf
        Else
            If Me.lblThumb10.Text.Length > 0 Then
                Me.txtImagesThumb.Text += Me.lblThumb10.Text.Trim & Constants.vbCrLf
            End If
        End If

        Dim lngImageThumb As Long = Me.txtImagesThumb.Text.Length
        Dim strImageThumb As String = Me.txtImagesThumb.Text.Trim

        strImageThumb = Left(strImageThumb, (lngImageThumb - 2))
        Me.txtImagesThumb.Text = strImageThumb

    End Sub

    Private Function makeNewFileName(ByVal strFileName As String) As String
        Dim strPath, strFile, strExt, strOldVer, strVer As String
        Dim intVer As Integer
        Static strNewFile As String

        strPath = IO.Path.GetDirectoryName(strFileName)
        strExt = IO.Path.GetExtension(strFileName)
        strFile = IO.Path.GetFileNameWithoutExtension(strFileName)
        strOldVer = Right(strFile, 3)
        intVer = Val(Right(strFile, 3)) + 1
        strVer = Right(("000" + Trim(Str(intVer))), 3)
        If intVer = 1 Then
            strNewFile = strPath + "\" + strFile + "_" + strVer + strExt
        Else
            strNewFile = strPath + "\" + Replace(strFile, "_" + strOldVer, "_" + strVer) + strExt
        End If

        If IO.File.Exists(strNewFile) Then
            Call makeNewFileName(strNewFile)
        End If


        Return strNewFile
    End Function

    Private Sub checkFolder()
        Dim strProductNo, strProductFolder, strFolderRep, strFolderThumb, strFolderDetail As String

        strProductNo = Me.txtProductNo.Text.Trim
        strProductFolder = Left(strProductNo, 2) + "\" + strProductNo + "\"
        strFolderRep = PictureFolder + strProductFolder + "Rep"
        strFolderThumb = PictureFolder + strProductFolder + "Thumb"
        strFolderDetail = PictureFolder + strProductFolder + "Detail"

        If Not IO.Directory.Exists(strFolderRep) Then
            IO.Directory.CreateDirectory(strFolderRep)
        End If


        If Not IO.Directory.Exists(strFolderThumb) Then
            IO.Directory.CreateDirectory(strFolderThumb)
        End If

        If Not IO.Directory.Exists(strFolderDetail) Then
            IO.Directory.CreateDirectory(strFolderDetail)
        End If

    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click

        Select Case TASK
            Case "ADD"
                If isThere(Me.txtProductNo.Text) Then
                    Response.Write("<script language='javascript'>alert('This product no. is already exist... ')</script>")
                    Me.txtProductNo.Focus()
                    Exit Sub
                Else
                    Call insertProduct()
                End If

            Case "EDIT"
                Call updateProduct()

        End Select
        Response.Redirect("ProductList.aspx")

    End Sub

    Private Sub insertProduct()
        Dim strProductNo, strBrandName, strCategory, strProductName, strModelName, strBriefDescription As String
        Dim strGender, strDescription, strStatus, strWebDisplay, strExclusiveSales, strNewItem, strLinesheet1, strLinesheet2, strLinesheet3 As String
        Dim dblPriceRetail, dblPriceRetailEvent1, dblPriceRetailEvent2, dblPriceWholesale1, dblPriceWholesale2 As Double
        Dim dblPriceWholesale3, dblPriceWholesale4, dblPriceWholesale5 As Double
        Dim lngStock, lngDisplayOrder As Long
        Dim strRawType As String

        Call insertProductColor()
        Call insertProductSize()
        Call insertImages()

        strProductNo = Me.txtProductNo.Text.Trim
        strBrandName = Me.txtBrandName.Text.Trim
        strCategory = Me.txtCategory.Text.Trim
        strGender = Me.rdoGender.SelectedValue
        strExclusiveSales = Me.rdoExclusiveSales.SelectedValue
        If Me.chkNewItem.Checked Then
            strNewItem = "YES"
        Else
            strNewItem = "NO"
        End If
        strProductName = Me.txtProductName.Text.Trim
        strModelName = Me.txtModelName.Text.Trim
        strBriefDescription = Me.txtBriefDescription.Text.Trim
        strDescription = Me.txtFullDescription.Text.Trim
        strStatus = "Pending"
        If Me.rdoPending.Checked Then
            strStatus = "Pending"
        ElseIf Me.rdoLive.Checked Then
            strStatus = "Live"
        ElseIf Me.rdoRetire.Checked Then
            strStatus = "Retired"
        End If

        If Me.rdoDisplayYes.Checked Then
            strWebDisplay = "YES"
        Else
            strWebDisplay = "NO"
        End If

        lngDisplayOrder = CLng(Me.txtDisplayOrder.Text.ToString)

        If Me.txtPriceRetail.Text.Length = 0 Then
            dblPriceRetail = 0
        Else
            dblPriceRetail = CDbl(Me.txtPriceRetail.Text)
        End If

        If Me.txtPriceRetailEvent1.Text.Length = 0 Then
            dblPriceRetailEvent1 = 0
        Else
            dblPriceRetailEvent1 = CDbl(Me.txtPriceRetailEvent1.Text)
        End If

        If Me.txtPriceRetailEvent2.Text.Length = 0 Then
            dblPriceRetailEvent2 = 0
        Else
            dblPriceRetailEvent2 = CDbl(Me.txtPriceRetailEvent2.Text)
        End If

        If Me.txtPriceWholesale1.Text.Length = 0 Then
            dblPriceWholesale1 = 0
        Else
            dblPriceWholesale1 = CDbl(Me.txtPriceWholesale1.Text)
        End If

        If Me.txtPriceWholesale2.Text.Length = 0 Then
            dblPriceWholesale2 = 0
        Else
            dblPriceWholesale2 = CDbl(Me.txtPriceWholesale2.Text)
        End If

        If Me.txtPriceWholesale3.Text.Length = 0 Then
            dblPriceWholesale3 = 0
        Else
            dblPriceWholesale3 = CDbl(Me.txtPriceWholesale3.Text)
        End If

        If Me.txtPriceWholesale4.Text.Length = 0 Then
            dblPriceWholesale4 = 0
        Else
            dblPriceWholesale4 = CDbl(Me.txtPriceWholesale4.Text)
        End If

        If Me.txtPriceWholesale5.Text.Length = 0 Then
            dblPriceWholesale5 = 0
        Else
            dblPriceWholesale5 = CDbl(Me.txtPriceWholesale5.Text)
        End If

        If Me.txtStock.Text.Length = 0 Then
            lngStock = 0
        Else
            lngStock = CLng(Me.txtStock.Text)
        End If

        If Me.txtLineSheet1.Text.Length > 0 Then
            strLinesheet1 = Me.txtLineSheet1.Text.ToString
        Else
            strLinesheet1 = ""
        End If

        If Me.txtLineSheet2.Text.Length > 0 Then
            strLinesheet2 = Me.txtLineSheet2.Text.ToString
        Else
            strLinesheet2 = ""
        End If

        If Me.txtLineSheet3.Text.Length > 0 Then
            strLinesheet3 = Me.txtLineSheet3.Text.ToString
        Else
            strLinesheet3 = ""
        End If

        strRawType = Me.txtRawType.Text.ToCharArray

        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commProduct As Data.SqlClient.SqlCommand
        Dim sqlProduct As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlProduct = "INSERT Into ProductMaster (ProductNo, BrandName, Category, ProductName, ModelName, BriefDescription, Description, "
        sqlProduct += "PriceRetail, PriceWholesale1, PriceWholesale2, PriceWholesale3, PriceWholesale4, PriceWholesale5, Linesheet1, Linesheet2, Linesheet3, Stock, Status, "
        sqlProduct += "WebDisplay, Gender, NewItem, ExclusiveSales, PriceRetailEvent1, PriceRetailEvent2, DisplayOrder, RawType) "
        sqlProduct += "Values (@ProductNo, @BrandName, @Category, @ProductName, @ModelName, @BriefDescription, @Description, "
        sqlProduct += "@PriceRetail, @PriceWholesale1, @PriceWholesale2, @PriceWholesale3, @PriceWholesale4, @PriceWholesale5,  @Linesheet1, @Linesheet2, @Linesheet3, "
        sqlProduct += "@Stock, @Status, @WebDisplay, @Gender, @NewItem, @ExclusiveSales, @PriceRetailEvent1, @PriceRetailEvent2, @DisplayOrder, @RawType)  "
        commProduct = New Data.SqlClient.SqlCommand
        commProduct.CommandText = sqlProduct
        commProduct.Connection = connTR
        commProduct.Parameters.AddWithValue("@ProductNo", strProductNo)
        commProduct.Parameters.AddWithValue("@BrandName", strBrandName)
        commProduct.Parameters.AddWithValue("@Category", strCategory)
        commProduct.Parameters.AddWithValue("@ProductName", strProductName)
        commProduct.Parameters.AddWithValue("@ModelName", strModelName)
        commProduct.Parameters.AddWithValue("@BriefDescription", strBriefDescription)
        commProduct.Parameters.AddWithValue("@Description", strDescription)
        commProduct.Parameters.AddWithValue("@PriceRetail", dblPriceRetail)
        commProduct.Parameters.AddWithValue("@PriceWholesale1", dblPriceWholesale1)
        commProduct.Parameters.AddWithValue("@PriceWholesale2", dblPriceWholesale2)
        commProduct.Parameters.AddWithValue("@PriceWholesale3", dblPriceWholesale3)
        commProduct.Parameters.AddWithValue("@PriceWholesale4", dblPriceWholesale4)
        commProduct.Parameters.AddWithValue("@PriceWholesale5", dblPriceWholesale5)
        commProduct.Parameters.AddWithValue("@Linesheet1", strLinesheet1)
        commProduct.Parameters.AddWithValue("@Linesheet2", strLinesheet2)
        commProduct.Parameters.AddWithValue("@Linesheet3", strLinesheet3)
        commProduct.Parameters.AddWithValue("@Stock", lngStock)
        commProduct.Parameters.AddWithValue("@Status", strStatus)
        commProduct.Parameters.AddWithValue("@WebDisplay", strWebDisplay)
        commProduct.Parameters.AddWithValue("@Gender", strGender)
        commProduct.Parameters.AddWithValue("@NewItem", strNewItem)
        commProduct.Parameters.AddWithValue("@ExclusiveSales", strExclusiveSales)
        commProduct.Parameters.AddWithValue("@PriceRetailEvent1", dblPriceRetailEvent1)
        commProduct.Parameters.AddWithValue("@PriceRetailEvent2", dblPriceRetailEvent2)
        commProduct.Parameters.AddWithValue("@DisplayOrder", lngDisplayOrder)
        commProduct.Parameters.AddWithValue("@RawType", strRawType)

        commProduct.ExecuteNonQuery()
        connTR.Close()


    End Sub

    Private Sub insertProductColor()

        Dim strTextBox As String = Me.txtColors.Text.Trim
        Dim strProductNo As String = Me.txtProductNo.Text.Trim
        Dim aColors() As String
        Dim strColor As String

        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commColors As Data.SqlClient.SqlCommand
        'Dim rdDDL As Data.SqlClient.SqlDataReader
        Dim sqlColors As String = ""

        strTextBox = Replace(strTextBox, ",", "/")
        strTextBox = Replace(strTextBox, ";", "/")
        aColors = Split(strTextBox, "/")

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()
        For Each strColor In aColors
            sqlColors = "INSERT Into ProductColor (ProductNo, ColorName, ColorStock, ColorStatus) Values (@ProductNo, @ColorName, 0, 'YES')  "
            commColors = New Data.SqlClient.SqlCommand
            commColors.CommandText = sqlColors
            commColors.Connection = connTR
            commColors.Parameters.AddWithValue("@ProductNo", strProductNo)
            commColors.Parameters.AddWithValue("@ColorName", strColor.Trim)

            commColors.ExecuteNonQuery()
        Next
        connTR.Close()

    End Sub

    Private Sub insertProductSize()

        Dim strTextBox As String = Me.txtSizes.Text.Trim
        Dim strProductNo As String = Me.txtProductNo.Text.Trim
        Dim aSizes() As String
        Dim aWeight() As String
        Dim strSizeName As String
        Dim strWeight As String
        Dim sglWeight As Single
        Dim nIndex As Integer = 0

        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commSizes As Data.SqlClient.SqlCommand
        'Dim rdDDL As Data.SqlClient.SqlDataReader
        Dim sqlSizes As String = ""
        Dim ni As Integer = 0

        strTextBox = Replace(strTextBox, ",", "/")
        strTextBox = Replace(strTextBox, ";", "/")
        aSizes = Split(strTextBox, "/")

        strWeight = Me.txtWeightLBS.Text.ToString
        Array.Resize(aWeight, aSizes.Length)
        If strWeight.Length = 0 Then
            For ni = 0 To aSizes.Length - 1
                aWeight(ni) = "1"
            Next
        Else
            strWeight = Replace(strWeight, ",", "/")
            strWeight = Replace(strWeight, ";", "/")
            aWeight = Split(strWeight, "/")
        End If

        If aSizes.Length <> aWeight.Length Then
            MessageBox("Please check the  again, it must be match with SIZE..")
            Me.txtWeightLBS.Focus()
            Exit Sub
        End If

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        For nIndex = 0 To aSizes.Length - 1
            strSizeName = aSizes(nIndex)
            sglWeight = Convert.ToSingle(aWeight(nIndex))
            sqlSizes = "INSERT Into ProductSize (ProductNo, SizeName, SizeStock, SizeStatus, WeightLBS) Values (@ProductNo, @SizeName, 0, 'YES', @WeightLBS)  "
            commSizes = New Data.SqlClient.SqlCommand
            commSizes.CommandText = sqlSizes
            commSizes.Connection = connTR
            commSizes.Parameters.AddWithValue("@ProductNo", strProductNo)
            commSizes.Parameters.AddWithValue("@SizeName", strSizeName.Trim)
            commSizes.Parameters.AddWithValue("@WeightLBS", sglWeight)

            commSizes.ExecuteNonQuery()
        Next

        For Each strSizeName In aSizes
        Next

        connTR.Close()

    End Sub

    Private Sub insertImages()
        Dim strTextRep As String = Me.txtImagesRep.Text.Trim
        Dim strTextThumb As String = Me.txtImagesThumb.Text.Trim
        Dim strTextDetail As String = Me.txtImagesDetail.Text.Trim
        Dim strProductNo As String = Me.txtProductNo.Text.Trim
        Dim aThumb(), strThumb As String
        Dim aDetail(), strDetail As String
        Dim nRow As Integer = 0

        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commPictures As Data.SqlClient.SqlCommand
        Dim sqlPictures As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        '//
        '// Add new picture of representative
        '//
        sqlPictures = "INSERT Into Pictures (ProductNo, Usage, ColorName, FileName, DisplayOrder, Status) "
        sqlPictures += " Values (@ProductNo,  'Rep', 'All', @FileName, 1, 'YES')  "
        commPictures = New Data.SqlClient.SqlCommand
        commPictures.CommandText = sqlPictures
        commPictures.Connection = connTR
        commPictures.Parameters.AddWithValue("@ProductNo", strProductNo)
        commPictures.Parameters.AddWithValue("@FileName", strTextRep)

        commPictures.ExecuteNonQuery()

        '//
        '// Add new pictures of thumb nail
        '//
        aThumb = Split(strTextThumb, Constants.vbCrLf)
        nRow = 0
        For Each strThumb In aThumb
            nRow += 1
            sqlPictures = "INSERT Into Pictures (ProductNo, Usage, ColorName, FileName, DisplayOrder, Status) "
            sqlPictures += " Values (@ProductNo,  'Thumb', 'All', @FileName, @DisplayOrder, 'YES')  "
            commPictures = New Data.SqlClient.SqlCommand
            commPictures.CommandText = sqlPictures
            commPictures.Connection = connTR
            commPictures.Parameters.AddWithValue("@ProductNo", strProductNo)
            commPictures.Parameters.AddWithValue("@FileName", strThumb)
            commPictures.Parameters.AddWithValue("@DisplayOrder", nRow)

            commPictures.ExecuteNonQuery()
        Next

        '//
        '// Add new pictures of detail
        '//
        aDetail = Split(strTextDetail, Constants.vbCrLf)
        nRow = 0
        For Each strDetail In aDetail
            nRow += 1
            sqlPictures = "INSERT Into Pictures (ProductNo, Usage, ColorName, FileName, DisplayOrder, Status) "
            sqlPictures += " Values (@ProductNo,  'Detail', 'All', @FileName, @DisplayOrder, 'YES')  "
            commPictures = New Data.SqlClient.SqlCommand
            commPictures.CommandText = sqlPictures
            commPictures.Connection = connTR
            commPictures.Parameters.AddWithValue("@ProductNo", strProductNo)
            commPictures.Parameters.AddWithValue("@FileName", strDetail)
            commPictures.Parameters.AddWithValue("@DisplayOrder", nRow)

            commPictures.ExecuteNonQuery()
        Next

        connTR.Close()

    End Sub

    Private Sub updateProduct()

        Call updateProductColors()
        Call updateProductSizes()
        Call updatePictures()

        Dim strProductNo, strBrandName, strCategory, strProductName, strModelName, strBriefDescription, strDescription As String
        Dim strStatus, strWebDisplay, strLinesheet1, strLinesheet2, strLinesheet3 As String
        Dim strGender As String = "Men"
        Dim strExclusiveSales As String = "Ordinary"
        Dim strNewItem As String = "YES"
        Dim dblPriceRetail, dblPriceRetailEvent1, dblPriceRetailEvent2, dblPriceWholesale1, dblPriceWholesale2 As Double
        Dim dblPriceWholesale3, dblPriceWholesale4, dblPriceWholesale5 As Double
        Dim lngStock, lngDisplayOrder As Long
        Dim strRawType As String

        strProductNo = Me.txtProductNo.Text.Trim
        strBrandName = Me.txtBrandName.Text.Trim
        strCategory = Me.txtCategory.Text.Trim
        strGender = Me.rdoGender.SelectedValue
        strExclusiveSales = Me.rdoExclusiveSales.SelectedValue
        If Me.chkNewItem.Checked Then
            strNewItem = "YES"
        Else
            strNewItem = "NO"
        End If
        strProductName = Me.txtProductName.Text.Trim
        strModelName = Me.txtModelName.Text.Trim
        strBriefDescription = Me.txtBriefDescription.Text.Trim
        strDescription = Me.txtFullDescription.Text.Trim
        strLinesheet1 = Me.txtLineSheet1.Text.Trim
        strLinesheet2 = Me.txtLineSheet2.Text.Trim
        strLinesheet3 = Me.txtLineSheet3.Text.Trim
        strStatus = "Pending"
        If Me.rdoPending.Checked Then
            strStatus = "Pending"
        ElseIf Me.rdoLive.Checked Then
            strStatus = "Live"
        ElseIf Me.rdoRetire.Checked Then
            strStatus = "Retired"
        End If

        If Me.rdoDisplayYes.Checked Then
            strWebDisplay = "YES"
        Else
            strWebDisplay = "NO"
        End If

        lngDisplayOrder = CLng(Me.txtDisplayOrder.Text.ToString)

        If Me.txtPriceRetail.Text.Length = 0 Then
            dblPriceRetail = 0
        Else
            dblPriceRetail = CDbl(Me.txtPriceRetail.Text)
        End If

        If Me.txtPriceRetailEvent1.Text.Length = 0 Then
            dblPriceRetailEvent1 = 0
        Else
            dblPriceRetailEvent1 = CDbl(Me.txtPriceRetailEvent1.Text)
        End If

        If Me.txtPriceRetailEvent2.Text.Length = 0 Then
            dblPriceRetailEvent2 = 0
        Else
            dblPriceRetailEvent2 = CDbl(Me.txtPriceRetailEvent2.Text)
        End If

        If Me.txtPriceWholesale1.Text.Length = 0 Then
            dblPriceWholesale1 = 0
        Else
            dblPriceWholesale1 = CDbl(Me.txtPriceWholesale1.Text)
        End If

        If Me.txtPriceWholesale2.Text.Length = 0 Then
            dblPriceWholesale2 = 0
        Else
            dblPriceWholesale2 = CDbl(Me.txtPriceWholesale2.Text)
        End If

        If Me.txtPriceWholesale3.Text.Length = 0 Then
            dblPriceWholesale3 = 0
        Else
            dblPriceWholesale3 = CDbl(Me.txtPriceWholesale3.Text)
        End If

        If Me.txtPriceWholesale4.Text.Length = 0 Then
            dblPriceWholesale4 = 0
        Else
            dblPriceWholesale4 = CDbl(Me.txtPriceWholesale4.Text)
        End If

        If Me.txtPriceWholesale5.Text.Length = 0 Then
            dblPriceWholesale5 = 0
        Else
            dblPriceWholesale5 = CDbl(Me.txtPriceWholesale5.Text)
        End If

        If Me.txtStock.Text.Length = 0 Then
            lngStock = 0
        Else
            lngStock = CLng(Me.txtStock.Text)
        End If

        strRawType = Me.txtRawType.Text

        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commProduct As Data.SqlClient.SqlCommand
        Dim sqlProduct As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlProduct = "UPDATE ProductMaster SET BrandName=@BrandName, Category=@Category, ProductName=@ProductName,  "
        sqlProduct += "ModelName=@ModelName, BriefDescription=@BriefDescription, Description=@Description,  "
        sqlProduct += "PriceRetail=@PriceRetail, PriceWholesale1=@PriceWholesale1, PriceWholesale2=@PriceWholesale2,   "
        sqlProduct += "PriceWholesale3=@PriceWholesale3, PriceWholesale4=@PriceWholesale4, PriceWholesale5=@PriceWholesale5, "
        sqlProduct += "Linesheet1=@Linesheet1, Linesheet2=@Linesheet2, Linesheet3=@Linesheet3, "
        sqlProduct += "PriceRetailEvent1=@PriceRetailEvent1, PriceRetailEvent2=@PriceRetailEvent2, Gender=@Gender, "
        sqlProduct += "ExclusiveSales=@ExclusiveSales, NewItem=@NewItem, DisplayOrder=@DisplayOrder,  "
        sqlProduct += "Stock=@Stock, Status=@Status, WebDisplay=@WebDisplay, RawType=@RawType WHERE ProductNo=@ProductNo "
        commProduct = New Data.SqlClient.SqlCommand
        commProduct.CommandText = sqlProduct
        commProduct.Connection = connTR
        commProduct.Parameters.AddWithValue("@ProductNo", strProductNo)
        commProduct.Parameters.AddWithValue("@BrandName", strBrandName)
        commProduct.Parameters.AddWithValue("@Category", strCategory)
        commProduct.Parameters.AddWithValue("@ProductName", strProductName)
        commProduct.Parameters.AddWithValue("@ModelName", strModelName)
        commProduct.Parameters.AddWithValue("@BriefDescription", strBriefDescription)
        commProduct.Parameters.AddWithValue("@Description", strDescription)
        commProduct.Parameters.AddWithValue("@PriceRetail", dblPriceRetail)
        commProduct.Parameters.AddWithValue("@PriceWholesale1", dblPriceWholesale1)
        commProduct.Parameters.AddWithValue("@PriceWholesale2", dblPriceWholesale2)
        commProduct.Parameters.AddWithValue("@PriceWholesale3", dblPriceWholesale3)
        commProduct.Parameters.AddWithValue("@PriceWholesale4", dblPriceWholesale4)
        commProduct.Parameters.AddWithValue("@PriceWholesale5", dblPriceWholesale5)
        commProduct.Parameters.AddWithValue("@Linesheet1", strLinesheet1)
        commProduct.Parameters.AddWithValue("@Linesheet2", strLinesheet2)
        commProduct.Parameters.AddWithValue("@Linesheet3", strLinesheet3)
        commProduct.Parameters.AddWithValue("@Stock", lngStock)
        commProduct.Parameters.AddWithValue("@Status", strStatus)
        commProduct.Parameters.AddWithValue("@WebDisplay", strWebDisplay)
        commProduct.Parameters.AddWithValue("@Gender", strGender)
        commProduct.Parameters.AddWithValue("@NewItem", strNewItem)
        commProduct.Parameters.AddWithValue("@ExclusiveSales", strExclusiveSales)
        commProduct.Parameters.AddWithValue("@PriceRetailEvent1", dblPriceRetailEvent1)
        commProduct.Parameters.AddWithValue("@PriceRetailEvent2", dblPriceRetailEvent2)
        commProduct.Parameters.AddWithValue("@DisplayOrder", lngDisplayOrder)
        commProduct.Parameters.AddWithValue("@RawType", strRawType)

        commProduct.ExecuteNonQuery()
        connTR.Close()


    End Sub

    Private Sub updateProductColors()

        Dim strTextBox As String = Me.txtColors.Text.Trim
        Dim strProductNo As String = Me.txtProductNo.Text.Trim
        Dim aColors() As String
        Dim strColor As String

        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commColors As Data.SqlClient.SqlCommand
        Dim sqlColors As String = ""

        strTextBox = Replace(strTextBox, ",", "/")
        strTextBox = Replace(strTextBox, ";", "/")
        aColors = Split(strTextBox, "/")

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        '//
        '// delete old color data first and then insert again
        '//
        sqlColors = "DELETE ProductColor Where ProductNo=@ProductNo  "
        commColors = New Data.SqlClient.SqlCommand
        commColors.CommandText = sqlColors
        commColors.Connection = connTR
        commColors.Parameters.AddWithValue("@ProductNo", strProductNo)
        commColors.ExecuteNonQuery()

        For Each strColor In aColors
            sqlColors = "INSERT Into ProductColor (ProductNo, ColorName, ColorStock, ColorStatus) Values (@ProductNo, @ColorName, 0, 'YES')  "
            commColors = New Data.SqlClient.SqlCommand
            commColors.CommandText = sqlColors
            commColors.Connection = connTR
            commColors.Parameters.AddWithValue("@ProductNo", strProductNo)
            commColors.Parameters.AddWithValue("@ColorName", strColor.Trim)

            commColors.ExecuteNonQuery()
        Next
        connTR.Close()

    End Sub

    Private Sub updateProductSizes()

        Dim strTextBox As String = Me.txtSizes.Text.Trim
        Dim strProductNo As String = Me.txtProductNo.Text.Trim

        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commSizes As Data.SqlClient.SqlCommand
        Dim sqlSizes As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        '//
        '// delete old size data first and then insert again
        '//
        sqlSizes = "DELETE ProductSize Where ProductNo=@ProductNo  "
        commSizes = New Data.SqlClient.SqlCommand
        commSizes.CommandText = sqlSizes
        commSizes.Connection = connTR
        commSizes.Parameters.AddWithValue("@ProductNo", strProductNo)
        commSizes.ExecuteNonQuery()

        connTR.Close()

        Call insertProductSize()

    End Sub

    Private Sub updatePictures()
        Dim strTextRep As String = Me.txtImagesRep.Text.Trim
        Dim strTextThumb As String = Me.txtImagesThumb.Text.Trim
        Dim strTextDetail As String = Me.txtImagesDetail.Text.Trim
        Dim strProductNo As String = Me.txtProductNo.Text.Trim
        Dim aThumb(), strThumb As String
        Dim aDetail(), strDetail As String
        Dim nRow As Integer = 0

        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commPictures As Data.SqlClient.SqlCommand
        Dim sqlPictures As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        '//
        '// Delete all of old pictures, representative, Thumbnails, Details
        '//
        sqlPictures = "DELETE Pictures Where ProductNo=@ProductNo  "
        commPictures = New Data.SqlClient.SqlCommand
        commPictures.CommandText = sqlPictures
        commPictures.Connection = connTR
        commPictures.Parameters.AddWithValue("@ProductNo", strProductNo)
        commPictures.ExecuteNonQuery()

        '//
        '// Add new picture of representative again
        '//
        sqlPictures = "INSERT Into Pictures (ProductNo, Usage, ColorName, FileName, DisplayOrder, Status) "
        sqlPictures += " Values (@ProductNo,  'Rep', 'All', @FileName, 1, 'YES')  "
        commPictures = New Data.SqlClient.SqlCommand
        commPictures.CommandText = sqlPictures
        commPictures.Connection = connTR
        commPictures.Parameters.AddWithValue("@ProductNo", strProductNo)
        commPictures.Parameters.AddWithValue("@FileName", strTextRep)

        commPictures.ExecuteNonQuery()

        '//
        '// Add new pictures of thumb nail again
        '//
        aThumb = Split(strTextThumb, Constants.vbCrLf)
        nRow = 0
        For Each strThumb In aThumb
            nRow += 1
            sqlPictures = "INSERT Into Pictures (ProductNo, Usage, ColorName, FileName, DisplayOrder, Status) "
            sqlPictures += " Values (@ProductNo,  'Thumb', 'All', @FileName, @DisplayOrder, 'YES')  "
            commPictures = New Data.SqlClient.SqlCommand
            commPictures.CommandText = sqlPictures
            commPictures.Connection = connTR
            commPictures.Parameters.AddWithValue("@ProductNo", strProductNo)
            commPictures.Parameters.AddWithValue("@FileName", strThumb)
            commPictures.Parameters.AddWithValue("@DisplayOrder", nRow)

            commPictures.ExecuteNonQuery()
        Next

        '//
        '// Add new pictures of detail
        '//
        aDetail = Split(strTextDetail, Constants.vbCrLf)
        nRow = 0
        For Each strDetail In aDetail
            nRow += 1
            sqlPictures = "INSERT Into Pictures (ProductNo, Usage, ColorName, FileName, DisplayOrder, Status) "
            sqlPictures += " Values (@ProductNo,  'Detail', 'All', @FileName, @DisplayOrder, 'YES')  "
            commPictures = New Data.SqlClient.SqlCommand
            commPictures.CommandText = sqlPictures
            commPictures.Connection = connTR
            commPictures.Parameters.AddWithValue("@ProductNo", strProductNo)
            commPictures.Parameters.AddWithValue("@FileName", strDetail)
            commPictures.Parameters.AddWithValue("@DisplayOrder", nRow)

            commPictures.ExecuteNonQuery()
        Next

        connTR.Close()

    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        Dim strProductNo As String = Me.txtProductNo.Text.Trim

        If isThere(strProductNo) Then
            Call getProductInfo(strProductNo)
        Else
            MessageBox("Wrong product no. is entered, please check it again..")
            Me.txtProductNo.Text = ""
            Me.txtProductNo.Focus()
        End If


    End Sub

    Private Function isThere(ByVal ProductNo As String) As Boolean
        Dim blnResult As Boolean
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commProduct As Data.SqlClient.SqlCommand
        Dim rdProduct As Data.SqlClient.SqlDataReader
        Dim sqlProduct As String = ""

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlProduct = "SELECT ProductNo FROM ProductMaster Where ProductNo = @ProductNo "
        commProduct = New Data.SqlClient.SqlCommand
        commProduct.CommandText = sqlProduct
        commProduct.Connection = connTR
        commProduct.Parameters.AddWithValue("@ProductNo", ProductNo)
        rdProduct = commProduct.ExecuteReader()
        If rdProduct.HasRows Then
            blnResult = True
        Else
            blnResult = False
        End If
        rdProduct.Close()
        connTR.Close()

        Return blnResult
    End Function

    Private Sub getProductInfo(ByVal ProductNo As String)
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
        Me.txtProductNo.Text = ProductNo.ToUpper
        Me.txtBrandName.Text = rdProduct("BrandName").ToString
        Me.ddlBrandName.Text = rdProduct("BrandName").ToString
        Me.txtBriefDescription.Text = rdProduct("BriefDescription").ToString
        Me.txtRawType.Text = rdProduct("RawType").ToString
        Me.ddlRawType.Text = rdProduct("RawType").ToString

        Me.txtCategory.Text = rdProduct("Category").ToString
        Me.ddlCategory.Text = rdProduct("Category").ToString
        If rdProduct("Gender").ToString = "" Then
            Me.rdoGender.Items(0).Selected = True
        Else
            Me.rdoGender.Text = rdProduct("Gender").ToString
        End If
        If rdProduct("ExclusiveSales").ToString = "" Then
            Me.rdoExclusiveSales.Items(0).Selected = True
        Else
            Me.rdoExclusiveSales.Text = rdProduct("ExclusiveSales").ToString
        End If
        If rdProduct("NewItem").ToString = "YES" Then
            Me.chkNewItem.Checked = True
        Else
            Me.chkNewItem.Checked = False
        End If
        Me.txtDisplayOrder.Text = rdProduct("DisplayOrder").ToString
        Me.txtColors.Text = getColors(ProductNo).ToString
        Me.txtFullDescription.Text = rdProduct("Description").ToString
        Call setPictures(ProductNo)
        Me.txtModelName.Text = rdProduct("ModelName").ToString
        Me.txtPriceRetail.Text = rdProduct("PriceRetail").ToString
        Me.txtPriceRetailEvent1.Text = rdProduct("PriceRetailEvent1").ToString
        Me.txtPriceRetailEvent2.Text = rdProduct("PriceRetailEvent2").ToString
        Me.txtPriceWholesale1.Text = rdProduct("PriceWholesale1").ToString
        Me.txtPriceWholesale2.Text = rdProduct("PriceWholesale2").ToString
        Me.txtPriceWholesale3.Text = rdProduct("PriceWholesale3").ToString
        Me.txtPriceWholesale4.Text = rdProduct("PriceWholesale4").ToString
        Me.txtPriceWholesale5.Text = rdProduct("PriceWholesale5").ToString

        Me.txtLineSheet1.Text = rdProduct("Linesheet1").ToString
        Me.lblLinesheet1.Text = rdProduct("Linesheet1").ToString
        Me.txtLineSheet2.Text = rdProduct("Linesheet2").ToString
        Me.lblLinesheet2.Text = rdProduct("Linesheet2").ToString
        Me.txtLineSheet3.Text = rdProduct("Linesheet3").ToString
        Me.lblLinesheet3.Text = rdProduct("Linesheet3").ToString

        Me.txtProductName.Text = rdProduct("ProductName").ToString
        Call displaySizes(ProductNo.ToString)
        Me.txtStock.Text = rdProduct("Stock").ToString
        Select Case rdProduct("Status").ToString
            Case "Pending"
                Me.rdoPending.Checked = True
            Case "Live"
                Me.rdoLive.Checked = True
            Case "Retired"
                Me.rdoRetire.Checked = True
        End Select
        If rdProduct("WebDisplay").ToString = "YES" Then
            Me.rdoDisplayYes.Checked = True
        Else
            Me.rdoDisplayNo.Checked = True
        End If

        rdProduct.Close()
        connTR.Close()

    End Sub

    Private Function getColors(ByVal ProductNo As String) As String
        Dim strResult As String = ""
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

        strResult = ""
        Do While rdProduct.Read
            strResult += rdProduct("ColorName") + " / "
        Loop
        strResult = Left(strResult, strResult.Length - 3)

        rdProduct.Close()
        connTR.Close()

        Return strResult
    End Function

    Private Sub displaySizes(ByVal ProductNo As String)
        Dim strSize, strWeight As String
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
        strWeight = ""
        Do While rdProduct.Read
            strSize += rdProduct("SizeName") + " / "
            strWeight += rdProduct("WeightLBS").ToString + " / "
        Loop
        If strSize.Length > 3 Then
            strSize = Left(strSize, strSize.Length - 3)
            strWeight = Left(strWeight, strWeight.Length - 3)
        End If

        Me.txtSizes.Text = strSize
        Me.txtWeightLBS.Text = strWeight

        rdProduct.Close()
        connTR.Close()

    End Sub

    Private Sub setPictures(ByVal ProductNo As String)
        Dim strRep, strThumb, strDetail As String
        Dim cs As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("TrendyRags")
        Dim connTR As Data.SqlClient.SqlConnection
        Dim commProduct As Data.SqlClient.SqlCommand
        Dim rdProduct As Data.SqlClient.SqlDataReader
        Dim sqlProduct As String = ""
        Dim intThumb As Integer = 0
        Dim intDetail As Integer = 0

        strRep = ""
        strThumb = ""
        strDetail = ""
        intThumb = 0
        intDetail = 0

        connTR = New Data.SqlClient.SqlConnection(cs.ConnectionString)
        connTR.Open()

        sqlProduct = "SELECT * FROM Pictures Where ProductNo = @ProductNo And Status = 'YES'  Order By Usage, DisplayOrder "
        commProduct = New Data.SqlClient.SqlCommand
        commProduct.CommandText = sqlProduct
        commProduct.Connection = connTR
        commProduct.Parameters.AddWithValue("@ProductNo", ProductNo)
        rdProduct = commProduct.ExecuteReader()

        Do While rdProduct.Read
            Select Case rdProduct("Usage")
                Case "Rep"
                    strRep = rdProduct("FileName").ToString
                    Me.lblRep.Text = strRep
                Case "Thumb"
                    strThumb += rdProduct("FileName") + Constants.vbCrLf
                    intThumb += 1
                    Select Case intThumb
                        Case 1
                            Me.lblThumb1.Text = rdProduct("FileName").ToString
                        Case 2
                            Me.lblThumb2.Text = rdProduct("FileName").ToString
                        Case 3
                            Me.lblThumb3.Text = rdProduct("FileName").ToString
                        Case 4
                            Me.lblThumb4.Text = rdProduct("FileName").ToString
                        Case 5
                            Me.lblThumb5.Text = rdProduct("FileName").ToString
                        Case 6
                            Me.lblThumb6.Text = rdProduct("FileName").ToString
                        Case 7
                            Me.lblThumb7.Text = rdProduct("FileName").ToString
                        Case 8
                            Me.lblThumb8.Text = rdProduct("FileName").ToString
                        Case 9
                            Me.lblThumb9.Text = rdProduct("FileName").ToString
                        Case Else
                            Me.lblThumb10.Text = rdProduct("FileName").ToString
                    End Select

                Case "Detail"
                    strDetail += rdProduct("FileName") + Constants.vbCrLf

                    intDetail += 1
                    Select Case intDetail
                        Case 1
                            Me.lblDetail1.Text = rdProduct("FileName").ToString
                        Case 2
                            Me.lblDetail2.Text = rdProduct("FileName").ToString
                        Case 3
                            Me.lblDetail3.Text = rdProduct("FileName").ToString
                        Case 4
                            Me.lblDetail4.Text = rdProduct("FileName").ToString
                        Case 5
                            Me.lblDetail5.Text = rdProduct("FileName").ToString
                        Case 6
                            Me.lblDetail6.Text = rdProduct("FileName").ToString
                        Case 7
                            Me.lblDetail7.Text = rdProduct("FileName").ToString
                        Case 8
                            Me.lblDetail8.Text = rdProduct("FileName").ToString
                        Case 9
                            Me.lblDetail9.Text = rdProduct("FileName").ToString
                        Case Else
                            Me.lblDetail10.Text = rdProduct("FileName").ToString
                    End Select

            End Select

        Loop
        strThumb = Left(strThumb, strThumb.Length - 2)
        strDetail = Left(strDetail, strDetail.Length - 2)

        rdProduct.Close()
        connTR.Close()

        Me.txtImagesRep.Text = strRep
        Me.txtImagesThumb.Text = strThumb
        Me.txtImagesDetail.Text = strDetail

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click

        If PreviousURL <> "" Then
            Response.Redirect(PreviousURL)
        End If

    End Sub

    Protected Sub btnFULineshee1OK_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFULineshee1OK.Click
        Dim strFileLS, strExtension As String
        Dim strProductNo, strProductFolder, strFolderLS As String

        strProductNo = Me.txtProductNo.Text.Trim
        strProductFolder = Left(strProductNo, 2) + "\" + strProductNo + "\"
        strFolderLS = PictureFolder + strProductFolder       '// 이 문자열 맨 끝문자는 "\" 임..

        If Me.fuLinesheet1.HasFile Then
            checkFolder()
            strFileLS = strFolderLS + Me.fuLinesheet1.FileName
            strExtension = IO.Path.GetExtension(strFileLS)
            Me.fuLinesheet1.SaveAs(strFileLS)
            Me.txtLineSheet1.Text = IO.Path.GetFileName(strFileLS)
        Else
            If Me.lblLinesheet1.Text.Length > 0 Then
                Me.txtLineSheet1.Text = Me.lblLinesheet1.Text
            End If
        End If

    End Sub

    Protected Sub btnFULineshee2OK_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFULineshee2OK.Click
        Dim strFileLS, strExtension As String
        Dim strProductNo, strProductFolder, strFolderLS As String

        strProductNo = Me.txtProductNo.Text.Trim
        strProductFolder = Left(strProductNo, 2) + "\" + strProductNo + "\"
        strFolderLS = PictureFolder + strProductFolder       '// 이 문자열 맨 끝문자는 "\" 임..

        If Me.fuLinesheet2.HasFile Then
            checkFolder()
            strFileLS = strFolderLS + Me.fuLinesheet2.FileName
            strExtension = IO.Path.GetExtension(strFileLS)
            Me.fuLinesheet2.SaveAs(strFileLS)
            Me.txtLineSheet2.Text = IO.Path.GetFileName(strFileLS)
        Else
            If Me.lblLinesheet2.Text.Length > 0 Then
                Me.txtLineSheet2.Text = Me.lblLinesheet2.Text
            End If
        End If

    End Sub

    Protected Sub btnFULineshee3OK_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFULineshee3OK.Click
        Dim strFileLS, strExtension As String
        Dim strProductNo, strProductFolder, strFolderLS As String

        strProductNo = Me.txtProductNo.Text.Trim
        strProductFolder = Left(strProductNo, 2) + "\" + strProductNo + "\"
        strFolderLS = PictureFolder + strProductFolder       '// 이 문자열 맨 끝문자는 "\" 임..

        If Me.fuLinesheet3.HasFile Then
            checkFolder()
            strFileLS = strFolderLS + Me.fuLinesheet3.FileName
            strExtension = IO.Path.GetExtension(strFileLS)
            Me.fuLinesheet3.SaveAs(strFileLS)
            Me.txtLineSheet3.Text = IO.Path.GetFileName(strFileLS)
        Else
            If Me.lblLinesheet3.Text.Length > 0 Then
                Me.txtLineSheet3.Text = Me.lblLinesheet3.Text
            End If
        End If

    End Sub

End Class
