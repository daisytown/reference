VERSION 5.00
Begin VB.Form FormUpdateDirector 
   Caption         =   "修改导师信息"
   ClientHeight    =   6270
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8295
   LinkTopic       =   "Form1"
   ScaleHeight     =   6270
   ScaleWidth      =   8295
   StartUpPosition =   2  '屏幕中心
   Begin VB.Frame Frame1 
      Caption         =   "查看导师信息"
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
      TabIndex        =   18
      Top             =   3960
      Width           =   8055
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
         TabIndex        =   6
         Top             =   360
         Width           =   1695
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
         TabIndex        =   7
         Top             =   360
         Width           =   1695
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
         TabIndex        =   8
         Top             =   360
         Width           =   1815
      End
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
         TabIndex        =   9
         Top             =   360
         Width           =   1815
      End
   End
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
      TabIndex        =   17
      Top             =   5520
      Width           =   1455
   End
   Begin VB.ComboBox ComboMajor 
      Height          =   300
      Left            =   1680
      TabIndex        =   4
      Top             =   2640
      Width           =   2055
   End
   Begin VB.TextBox txtID 
      Height          =   372
      Left            =   1680
      TabIndex        =   0
      Top             =   120
      Width           =   2055
   End
   Begin VB.ComboBox comboSex 
      Height          =   300
      Left            =   1680
      TabIndex        =   2
      Top             =   1440
      Width           =   2055
   End
   Begin VB.TextBox txtName 
      Height          =   372
      Left            =   1680
      TabIndex        =   1
      Top             =   720
      Width           =   2055
   End
   Begin VB.ComboBox ComboZhicheng 
      Height          =   300
      Left            =   1680
      TabIndex        =   3
      Top             =   2040
      Width           =   2055
   End
   Begin VB.TextBox txtZhiwu 
      Height          =   615
      Left            =   1680
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   5
      Top             =   3120
      Width           =   3975
   End
   Begin VB.Frame Frame2 
      Caption         =   "修改导师信息"
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
      TabIndex        =   19
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
         TabIndex        =   23
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
         TabIndex        =   22
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
         TabIndex        =   21
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
         TabIndex        =   20
         Top             =   360
         Width           =   1452
      End
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "编号"
      Height          =   255
      Left            =   360
      TabIndex        =   16
      Top             =   120
      Width           =   1095
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "姓名"
      Height          =   15
      Left            =   480
      TabIndex        =   15
      Top             =   840
      Width           =   855
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "性别"
      Height          =   255
      Left            =   360
      TabIndex        =   14
      Top             =   1440
      Width           =   1095
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Caption         =   "职称"
      Height          =   255
      Left            =   360
      TabIndex        =   13
      Top             =   2040
      Width           =   1095
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      Caption         =   "职务"
      Height          =   375
      Left            =   360
      TabIndex        =   12
      Top             =   3360
      Width           =   1095
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      Caption         =   "专业"
      Height          =   255
      Left            =   360
      TabIndex        =   11
      Top             =   2760
      Width           =   1095
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      Caption         =   "姓名"
      Height          =   255
      Left            =   360
      TabIndex        =   10
      Top             =   840
      Width           =   1095
   End
End
Attribute VB_Name = "FormUpdateDirector"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim TempRecordset As ADODB.Recordset
Dim TempBookmark As Variant
Dim Tempclean As Boolean
Private Sub Form_Load()
    Dim txtSQL As String
    Dim MsgText As String
    txtSQL = "select * from director_Info order by id"
    Set TempRecordset = ExecuteSQL(txtSQL, MsgText)
    TempRecordset.MoveFirst
    Call DisplayData
    mcbookmark = TempRecordset.Bookmark
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
    ComboZhicheng.Enabled = True
    txtZhiwu.Enabled = True
    ComboMajor.Enabled = True
    TempBookmark = TempRecordset.Bookmark
End Sub

Private Sub CmdCancel_Click()
    If Not Tempclean Then
        Frame1.Enabled = True
        CmdFirst.Enabled = True
        CmdPrevious.Enabled = True
        CmdNext.Enabled = True
        CmdLast.Enabled = True
            
        txtID.Enabled = True
        txtName.Enabled = True
        comboSex.Enabled = True
        ComboZhicheng.Enabled = True
        txtZhiwu.Enabled = True
        ComboMajor.Enabled = True
    
       
        TempRecordset.Bookmark = TempBookmark
        Call DisplayData
    Else
        MsgBox "没有进行修改！", vbOKOnly + vbExclamation, "警告"
    End If
        
End Sub

Private Sub CmdDelete_Click()
    TempBookmark = TempRecordset.Bookmark
    str2$ = MsgBox("是否删除当前记录？", vbOKCancel, "删除当前记录")
    If str2$ = vbOK Then
            TempRecordset.MoveNext
            If TempRecordset.EOF Then
                TempRecordset.MoveFirst
                TempBookmark = TempRecordset.Bookmark
                TempRecordset.MoveLast
                TempRecordset.Delete
                TempRecordset.Bookmark = TempBookmark
                Call DisplayData
            Else
                TempBookmark = TempRecordset.Bookmark
                TempRecordset.MovePrevious
                TempRecordset.Delete
                TempRecordset.Bookmark = TempBookmark
                Call DisplayData
            End If
    Else
        TempRecordset.Bookmark = TempBookmark
        Call DisplayData
    End If
End Sub
Private Sub CmdFirst_Click()
    TempRecordset.MoveFirst
    Call DisplayData
End Sub
Public Sub DisplayData()
    txtID.Text = TempRecordset.Fields(0)
    txtName.Text = TempRecordset.Fields(1)
    comboSex.Text = TempRecordset.Fields(2)
    ComboZhicheng.Text = TempRecordset.Fields(3)
    txtZhiwu.Text = TempRecordset.Fields(4)
    ComboMajor.Text = TempRecordset.Fields(5)
End Sub
Private Sub CmdLast_Click()
    TempRecordset.MoveLast
    Call DisplayData
End Sub

Private Sub CmdNext_Click()
    TempRecordset.MoveNext
    If TempRecordset.EOF Then
        TempRecordset.MoveFirst
    End If
    Call DisplayData
End Sub
Private Sub CmdExit_Click()
  Unload Me
End Sub
Private Sub CmdPrevious_Click()
    TempRecordset.MovePrevious
    If TempRecordset.BOF Then
        TempRecordset.MoveLast
    End If
    Call DisplayData
End Sub
Private Sub CmdUpdate_Click()
    Dim txtSQL As String
    Dim MsgText As String
    Dim TempRecordsetc As ADODB.Recordset
    
    If Tempclean Then
        MsgBox "请先选择修改导师信息", vbOKOnly + vbExclamation, "警告"
        Exit Sub
    End If
    
    If Not Checktxt(txtID.Text) Then
        MsgBox "请输入编号！", vbOKOnly + vbExclamation, "警告"
        txtID.SetFocus
        Exit Sub
    End If
    
    If Not IsNumeric(Trim(txtID.Text)) Then
        MsgBox "编号请输入数字！", vbOKOnly + vbExclamation, "警告"
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
    
    If Not Checktxt(ComboZhicheng.Text) Then
        MsgBox "请选择职称！", vbOKOnly + vbExclamation, "警告"
        comboType.SetFocus
        Exit Sub
    End If
    
    If Not Checktxt(txtZhiwu.Text) Then
        MsgBox "请输入出生日期！", vbOKOnly + vbExclamation, "警告"
        txtBirthday.SetFocus
        Exit Sub
    End If
    
        
    If Not Checktxt(ComboMajor.Text) Then
        MsgBox "请输入专业！", vbOKOnly + vbExclamation, "警告"
        ComboMajor.SetFocus
        Exit Sub
    End If
    
        
    TempRecordset.Delete
    txtSQL = "select * from director_Info where ID = '" & Trim(txtID.Text) & "'"
    Set TempRecordsetc = ExecuteSQL(txtSQL, MsgText)
    If TempRecordsetc.EOF = False Then
        MsgBox "编号重复，请重新输入！", vbOKOnly + vbExclamation, "警告"
        TempRecordsetc.Close
        txtID.SetFocus
    Else
        TempRecordsetc.Close
                                
                TempRecordset.AddNew
                TempRecordset.Fields(0) = Trim(txtID.Text)
                TempRecordset.Fields(1) = Trim(txtName.Text)
                TempRecordset.Fields(2) = Trim(comboSex.Text)
                TempRecordset.Fields(3) = Trim(ComboZhicheng.Text)
                TempRecordset.Fields(4) = Trim(txtZhiwu.Text)
                TempRecordset.Fields(5) = Trim(ComboMajor.Text)
                TempRecordset.Update
                MsgBox "修改导师信息成功！", vbOKOnly + vbExclamation, "修改导师信息"
                Call DisplayData
                
                Frame1.Enabled = True
                CmdFirst.Enabled = True
                CmdPrevious.Enabled = True
                CmdNext.Enabled = True
                CmdLast.Enabled = True
        
                txtID.Enabled = False
                txtName.Enabled = False
                comboSex.Enabled = False
                ComboZhicheng.Enabled = False
                txtZhiwu.Enabled = False
                ComboMajor.Enabled = False
                
                Tempclean = True
            
    End If
    
End Sub


