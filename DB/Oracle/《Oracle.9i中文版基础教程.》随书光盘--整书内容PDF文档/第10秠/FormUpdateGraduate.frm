VERSION 5.00
Begin VB.Form FormUpdateGraduate 
   Caption         =   "修改研究生信息"
   ClientHeight    =   6375
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8325
   LinkTopic       =   "Form1"
   ScaleHeight     =   6375
   ScaleWidth      =   8325
   StartUpPosition =   2  '屏幕中心
   Begin VB.CommandButton CmdExit 
      Caption         =   "退出修改"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6600
      TabIndex        =   13
      Top             =   5520
      Width           =   1455
   End
   Begin VB.Frame Frame2 
      Caption         =   "修改研究生信息"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1092
      Left            =   120
      TabIndex        =   24
      Top             =   5160
      Width           =   8055
      Begin VB.CommandButton CmdEdit 
         Caption         =   "修改记录"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   492
         Left            =   120
         TabIndex        =   28
         Top             =   360
         Width           =   1452
      End
      Begin VB.CommandButton CmdUpdate 
         Caption         =   "更新数据"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   492
         Left            =   1680
         TabIndex        =   27
         Top             =   360
         Width           =   1452
      End
      Begin VB.CommandButton CmdCancel 
         Caption         =   "取消修改"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   492
         Left            =   3240
         TabIndex        =   26
         Top             =   360
         Width           =   1455
      End
      Begin VB.CommandButton CmdDelete 
         Caption         =   "删除记录"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   492
         Left            =   4800
         TabIndex        =   25
         Top             =   360
         Width           =   1452
      End
   End
   Begin VB.ComboBox ComboMajor 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   1440
      TabIndex        =   7
      Top             =   2520
      Width           =   1695
   End
   Begin VB.TextBox txtSource 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   1440
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   8
      Top             =   3000
      Width           =   6015
   End
   Begin VB.TextBox txtBirthday 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   372
      Left            =   1440
      TabIndex        =   4
      Top             =   1320
      Width           =   1692
   End
   Begin VB.TextBox txtName 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   372
      Left            =   5760
      TabIndex        =   1
      Top             =   240
      Width           =   1692
   End
   Begin VB.ComboBox comboSex 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   1440
      TabIndex        =   2
      Top             =   840
      Width           =   612
   End
   Begin VB.TextBox txtID 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   372
      Left            =   1440
      TabIndex        =   0
      Top             =   240
      Width           =   1692
   End
   Begin VB.Frame Frame1 
      Caption         =   "查看研究生信息"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1092
      Left            =   120
      TabIndex        =   14
      Top             =   3960
      Width           =   8055
      Begin VB.CommandButton CmdLast 
         Caption         =   "末记录"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   492
         Left            =   6120
         TabIndex        =   12
         Top             =   360
         Width           =   1815
      End
      Begin VB.CommandButton CmdNext 
         Caption         =   "下记录"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   492
         Left            =   3960
         TabIndex        =   11
         Top             =   360
         Width           =   1815
      End
      Begin VB.CommandButton CmdPrevious 
         Caption         =   "上记录"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   492
         Left            =   2040
         TabIndex        =   10
         Top             =   360
         Width           =   1695
      End
      Begin VB.CommandButton CmdFirst 
         Caption         =   "首记录"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   492
         Left            =   120
         TabIndex        =   9
         Top             =   360
         Width           =   1695
      End
   End
   Begin VB.ComboBox comboType 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   5760
      TabIndex        =   3
      Top             =   840
      Width           =   1695
   End
   Begin VB.TextBox txtClassno 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   372
      Left            =   1440
      TabIndex        =   5
      Top             =   1920
      Width           =   1692
   End
   Begin VB.ComboBox comboDirector 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   5760
      TabIndex        =   6
      Top             =   1800
      Width           =   1695
   End
   Begin VB.Label Label9 
      Alignment       =   2  'Center
      Caption         =   "生源性质"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   23
      Top             =   3120
      Width           =   1095
   End
   Begin VB.Label Label8 
      Alignment       =   2  'Center
      Caption         =   "专业"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   0
      TabIndex        =   22
      Top             =   2520
      Width           =   1095
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      Caption         =   "班级编号"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   21
      Top             =   2040
      Width           =   1095
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      Caption         =   "出生日期"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   20
      Top             =   1440
      Width           =   1095
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Caption         =   "类别"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   4440
      TabIndex        =   19
      Top             =   960
      Width           =   1095
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "性别"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   0
      TabIndex        =   18
      Top             =   840
      Width           =   1095
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "姓名"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   4440
      TabIndex        =   17
      Top             =   360
      Width           =   1095
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "学号"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   0
      TabIndex        =   16
      Top             =   240
      Width           =   1095
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      Caption         =   "导师姓名"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   4560
      TabIndex        =   15
      Top             =   1920
      Width           =   1095
   End
End
Attribute VB_Name = "FormUpdateGraduate"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Temprecordset As ADODB.Recordset
Dim TempBookmark As Variant
Dim Tempclean As Boolean
Private Sub Form_Load()
    Dim txtSQL As String
    Dim MsgText As String
    txtSQL = "select * from graduate_Info order by id"
    Set Temprecordset = ExecuteSQL(txtSQL, MsgText)
    Temprecordset.MoveFirst
    Call DisplayData
    mcbookmark = Temprecordset.Bookmark
    Tempclean = True
End Sub
Private Sub CmdEdit_Click()
    Tempclean = False
    Frame1.Enabled = False
    CmdFirst.Enabled = False
    CmdPrevious.Enabled = False
    CmdNext.Enabled = False
    CmdLast.Enabled = False
        
    txtID.Enabled = False
    txtName.Enabled = True
    comboSex.Enabled = True
    comboType.Enabled = True
    txtBirthday.Enabled = True
    txtClassno.Enabled = True
    ComboMajor.Enabled = True
    comboDirector.Enabled = True
    txtSource.Enabled = True
    TempBookmark = Temprecordset.Bookmark
End Sub

Private Sub CmdCancel_Click()
    If Not Tempclean Then
        Frame1.Enabled = True
        CmdFirst.Enabled = True
        CmdPrevious.Enabled = True
        CmdNext.Enabled = True
        CmdLast.Enabled = True
            
        txtID.Enabled = False
        txtName.Enabled = False
        comboSex.Enabled = False
        comboType.Enabled = False
        txtBirthday.Enabled = False
        txtClassno.Enabled = False
        ComboMajor.Enabled = False
        comboDirector.Enabled = False
        txtSource.Enabled = False
       
        Temprecordset.Bookmark = TempBookmark
        Call DisplayData
    Else
        MsgBox "没有进行任何修改！", vbOKOnly + vbExclamation, "警告"
    End If
        
End Sub

Private Sub CmdDelete_Click()
    TempBookmark = Temprecordset.Bookmark
    str2$ = MsgBox("是否删除当前记录？", vbOKCancel, "删除当前记录")
    If str2$ = vbOK Then
            Temprecordset.MoveNext
            If Temprecordset.EOF Then
                Temprecordset.MoveFirst
                TempBookmark = Temprecordset.Bookmark
                Temprecordset.MoveLast
                Temprecordset.Delete
                Temprecordset.Bookmark = TempBookmark
                Call DisplayData
            Else
                TempBookmark = Temprecordset.Bookmark
                Temprecordset.MovePrevious
                Temprecordset.Delete
                Temprecordset.Bookmark = TempBookmark
                Call DisplayData
            End If
    Else
        Temprecordset.Bookmark = TempBookmark
        Call DisplayData
    End If
End Sub
Private Sub CmdFirst_Click()
    Temprecordset.MoveFirst
    Call DisplayData
End Sub
Public Sub DisplayData()
    txtID.Text = Temprecordset.Fields(0)
    txtName.Text = Temprecordset.Fields(1)
    comboSex.Text = Temprecordset.Fields(2)
    comboType.Text = Temprecordset.Fields(3)
    txtBirthday.Text = Format(Temprecordset.Fields(4), "yyyy-mm-dd")
    txtClassno.Text = Temprecordset.Fields(5)
    ComboMajor.Text = Temprecordset.Fields(6)
    comboDirector.Text = Temprecordset.Fields(7)
    txtSource.Text = Temprecordset.Fields(8)
End Sub
Private Sub CmdLast_Click()
    Temprecordset.MoveLast
    Call DisplayData
End Sub

Private Sub CmdNext_Click()
    Temprecordset.MoveNext
    If Temprecordset.EOF Then
        Temprecordset.MoveFirst
    End If
    Call DisplayData
End Sub
Private Sub CmdExit_Click()
  Unload Me
End Sub
Private Sub CmdPrevious_Click()
    Temprecordset.MovePrevious
    If Temprecordset.BOF Then
        Temprecordset.MoveLast
    End If
    Call DisplayData
End Sub
Private Sub CmdUpdate_Click()
    Dim txtSQL As String
    Dim MsgText As String
    Dim Temprecordsetc As ADODB.Recordset
    
    If Tempclean Then
        MsgBox "请先选择修改研究生信息", vbOKOnly + vbExclamation, "警告"
        Exit Sub
    End If
    
    If Not Checktxt(txtID.Text) Then
        MsgBox "请输入学号！", vbOKOnly + vbExclamation, "警告"
        txtID.SetFocus
        Exit Sub
    End If
    
    If Not IsNumeric(Trim(txtID.Text)) Then
        MsgBox "学号请输入数字！", vbOKOnly + vbExclamation, "警告"
        txtID.SetFocus
        Exit Sub
        
    End If
    
    
    If Not Checktxt(txtName.Text) Then
        MsgBox "请输入姓名！", vbOKOnly + vbExclamation, "警告"
        txtName.SetFocus
        Exit Sub
    End If
    
    If Not Checktxt(comboSex.Text) Then
        MsgBox "请选择性别！", vbOKOnly + vbExclamation, "警告"
        comboSex.SetFocus
        Exit Sub
    End If
    
    If Not Checktxt(comboType.Text) Then
        MsgBox "请选择类别！", vbOKOnly + vbExclamation, "警告"
        comboType.SetFocus
        Exit Sub
    End If
    
    If Not Checktxt(txtBirthday.Text) Then
        MsgBox "请输入出生日期！", vbOKOnly + vbExclamation, "警告"
        txtBirthday.SetFocus
        Exit Sub
    End If
    
    
    If Not Checktxt(txtClassno.Text) Then
        MsgBox "请选择班号！", vbOKOnly + vbExclamation, "警告"
        txtClassno.SetFocus
        Exit Sub
    End If
    
    If Not Checktxt(ComboMajor.Text) Then
        MsgBox "请输入专业！", vbOKOnly + vbExclamation, "警告"
        ComboMajor.SetFocus
        Exit Sub
    End If
    
    If Not Checktxt(comboDirector.Text) Then
        MsgBox "请输入导师姓名！", vbOKOnly + vbExclamation, "警告"
        comboDirector.SetFocus
        Exit Sub
    End If
    
    If Not Checktxt(txtSource.Text) Then
        MsgBox "请输入生源性质！", vbOKOnly + vbExclamation, "警告"
        txtSource.SetFocus
        Exit Sub
    End If
        
        
    Temprecordset.Delete
    txtSQL = "select * from graduate_Info where ID = '" & Trim(txtID.Text) & "'"
    Set Temprecordsetc = ExecuteSQL(txtSQL, MsgText)
    If Temprecordsetc.EOF = False Then
        MsgBox "学号重复，请重新输入！", vbOKOnly + vbExclamation, "警告"
        Temprecordsetc.Close
        txtID.SetFocus
    Else
        Temprecordsetc.Close
        If Not IsDate(txtBirthday.Text) Then
            MsgBox "出生时间应输入日期格式（yyyy-mm-dd）！", vbOKOnly + vbExclamation, "警告"
            txtBirthday.SetFocus
        Else
            txtBirthday = Format(txtBirthday, "yyyy-mm-dd")
            If Not IsDate(txtBirthday.Text) Then
                MsgBox "出生时间应输入日期格式（yyyy-mm-dd）！", vbOKOnly + vbExclamation, "警告"
                txtBirthday.SetFocus
            Else
                txtBirthday = Format(txtBirthday, "yyyy-mm-dd")
                                
                Temprecordset.AddNew
                
                Temprecordset.Fields(0) = Trim(txtID.Text)
                Temprecordset.Fields(1) = Trim(txtName.Text)
                Temprecordset.Fields(2) = Trim(comboSex.Text)
                Temprecordset.Fields(3) = Trim(comboType.Text)
                Temprecordset.Fields(4) = Trim(txtBirthday.Text)
                Temprecordset.Fields(5) = Trim(txtClassno.Text)
                Temprecordset.Fields(6) = Trim(ComboMajor.Text)
                Temprecordset.Fields(7) = Trim(comboDirector.Text)
                Temprecordset.Fields(8) = Trim(txtSource.Text)
                
                Temprecordset.Update
                MsgBox "修改研究生信息成功！", vbOKOnly + vbExclamation, "修改研究生信息"
                Call DisplayData
                Frame1.Enabled = True
                CmdFirst.Enabled = True
                CmdPrevious.Enabled = True
                CmdNext.Enabled = True
                CmdLast.Enabled = True
        
                txtID.Enabled = False
                txtName.Enabled = False
                comboSex.Enabled = False
                comboType.Enabled = False
                txtBirthday.Enabled = False
                txtClassno.Enabled = False
                ComboMajor.Enabled = False
                comboDirector.Enabled = False
                txtSource.Enabled = False
                
                Tempclean = True
                
            End If
        End If
    End If
    
End Sub

