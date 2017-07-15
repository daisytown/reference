VERSION 5.00
Begin VB.Form FormUpdateMajor 
   Caption         =   "修改专业信息"
   ClientHeight    =   4950
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9375
   LinkTopic       =   "Form1"
   ScaleHeight     =   4950
   ScaleWidth      =   9375
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
      Left            =   7320
      TabIndex        =   0
      Top             =   3840
      Width           =   1455
   End
   Begin VB.Frame Frame2 
      Caption         =   "修改专业信息"
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
      Left            =   960
      TabIndex        =   8
      Top             =   3480
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
         TabIndex        =   12
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
         TabIndex        =   11
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
         TabIndex        =   10
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
         TabIndex        =   9
         Top             =   360
         Width           =   1452
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "查看专业信息"
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
      Left            =   960
      TabIndex        =   3
      Top             =   2040
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
         TabIndex        =   7
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
         TabIndex        =   6
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
         TabIndex        =   5
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
         TabIndex        =   4
         Top             =   360
         Width           =   1815
      End
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
      Left            =   1680
      TabIndex        =   2
      Top             =   360
      Width           =   615
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
      Left            =   1680
      TabIndex        =   1
      Top             =   1080
      Width           =   3615
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "编号"
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
      Left            =   720
      TabIndex        =   14
      Top             =   480
      Width           =   1095
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "名称"
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
      Left            =   720
      TabIndex        =   13
      Top             =   1200
      Width           =   1095
   End
End
Attribute VB_Name = "FormUpdateMajor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim TempRecordset As ADODB.Recordset
Dim TempBookmark As Variant
Dim Tempclean As Boolean

Private Sub CmdExit_Click()
  Unload Me
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
    TempBookmark = TempRecordset.Bookmark
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

Private Sub Form_Load()
    
    Dim txtSQL As String
    Dim MsgText As String
    
    txtSQL = "select * from major_Info order by id"
    Set TempRecordset = ExecuteSQL(txtSQL, MsgText)
    
    TempRecordset.MoveFirst
    Call DisplayData
    mcbookmark = TempRecordset.Bookmark
    Tempclean = True
   
End Sub

Public Sub DisplayData()
    txtID.Text = TempRecordset.Fields(0)
    txtName.Text = TempRecordset.Fields(1)
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
        MsgBox "请先选择修改专业信息", vbOKOnly + vbExclamation, "警告"
        Exit Sub
    End If
    
    If Not Checktxt(txtID.Text) Then
        MsgBox "请输入编号！", vbOKOnly + vbExclamation, "警告"
        txtID.SetFocus
        Exit Sub
    End If
    
    If Not IsNumeric(Trim(txtID.Text)) Then
        MsgBox "编号请输入数字编号！", vbOKOnly + vbExclamation, "警告"
        txtID.SetFocus
        Exit Sub
        
    End If
    
    
    If Not Checktxt(txtName.Text) Then
        MsgBox "请输入名称！", vbOKOnly + vbExclamation, "警告"
        txtName.SetFocus
        Exit Sub
    End If
    
   
        
    TempRecordset.Delete
    txtSQL = "select * from major_Info where ID = '" & Trim(txtID.Text) & "'"
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
                TempRecordset.Update
                MsgBox "修改专业信息成功！", vbOKOnly + vbExclamation, "修改专业信息"
                
                Call DisplayData
                Frame1.Enabled = True
                CmdFirst.Enabled = True
                CmdPrevious.Enabled = True
                CmdNext.Enabled = True
                CmdLast.Enabled = True
        
                txtID.Enabled = False
                txtName.Enabled = False
                
                
                Tempclean = True
                
            
    End If
    
End Sub


