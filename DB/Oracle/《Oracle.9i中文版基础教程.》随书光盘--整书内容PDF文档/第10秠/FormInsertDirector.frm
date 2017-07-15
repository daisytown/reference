VERSION 5.00
Begin VB.Form FormInsertDirector 
   Caption         =   "添加导师信息"
   ClientHeight    =   5205
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5925
   LinkTopic       =   "Form1"
   ScaleHeight     =   5205
   ScaleWidth      =   5925
   StartUpPosition =   2  '屏幕中心
   Begin VB.TextBox txtZhiwu 
      Height          =   615
      Left            =   1680
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   5
      Top             =   3360
      Width           =   3975
   End
   Begin VB.ComboBox ComboZhicheng 
      Height          =   300
      Left            =   1680
      TabIndex        =   3
      Text            =   "请选择职称"
      Top             =   2280
      Width           =   2055
   End
   Begin VB.CommandButton CmdCancel 
      Caption         =   "取消添加"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   372
      Left            =   3600
      TabIndex        =   7
      Top             =   4440
      Width           =   1455
   End
   Begin VB.CommandButton CmdCommit 
      Caption         =   "确定添加"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   372
      Left            =   1080
      TabIndex        =   6
      Top             =   4440
      Width           =   1455
   End
   Begin VB.TextBox txtName 
      Height          =   372
      Left            =   1680
      TabIndex        =   1
      Top             =   960
      Width           =   2055
   End
   Begin VB.ComboBox comboSex 
      Height          =   300
      Left            =   1680
      TabIndex        =   2
      Text            =   "请选择性别"
      Top             =   1680
      Width           =   2055
   End
   Begin VB.TextBox txtID 
      Height          =   372
      Left            =   1680
      TabIndex        =   0
      Top             =   360
      Width           =   2055
   End
   Begin VB.ComboBox ComboMajor 
      Height          =   300
      Left            =   1680
      TabIndex        =   4
      Text            =   "请选择专业"
      Top             =   2880
      Width           =   2055
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      Caption         =   "姓名"
      Height          =   255
      Left            =   360
      TabIndex        =   14
      Top             =   1080
      Width           =   1095
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      Caption         =   "专业"
      Height          =   255
      Left            =   360
      TabIndex        =   13
      Top             =   3000
      Width           =   1095
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      Caption         =   "职务"
      Height          =   375
      Left            =   360
      TabIndex        =   12
      Top             =   3600
      Width           =   1095
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Caption         =   "职称"
      Height          =   255
      Left            =   360
      TabIndex        =   11
      Top             =   2280
      Width           =   1095
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "性别"
      Height          =   255
      Left            =   360
      TabIndex        =   10
      Top             =   1680
      Width           =   1095
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "姓名"
      Height          =   15
      Left            =   480
      TabIndex        =   9
      Top             =   1080
      Width           =   855
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "编号"
      Height          =   255
      Left            =   360
      TabIndex        =   8
      Top             =   360
      Width           =   1095
   End
End
Attribute VB_Name = "FormInsertDirector"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub CmdCommit_Click()
    Dim TempRecordset As ADODB.Recordset
    Dim txtSQL As String
    Dim MsgText As String
    
    If Not Checktxt(txtID.Text) Then
        MsgBox "请输入编号！", vbOKOnly + vbExclamation, "警告"
        txtID.SetFocus
        Exit Sub
    End If
    
    If Not Checktxt(txtName.Text) Then
        MsgBox "请输入姓名！", vbOKOnly + vbExclamation, "警告"
        txtName.SetFocus
        Exit Sub
    End If
    
    If Not Checktxt(ComboZhicheng.Text) Then
        MsgBox "请选择职称！", vbOKOnly + vbExclamation, "警告"
        comboSex.SetFocus
        Exit Sub
    End If
    
    If Not Checktxt(txtZhiwu.Text) Then
        MsgBox "请输入职务！", vbOKOnly + vbExclamation, "警告"
        comboType.SetFocus
        Exit Sub
    End If
    
    If Not Checktxt(ComboMajor.Text) Then
        MsgBox "请输入专业！", vbOKOnly + vbExclamation, "警告"
        ComboMajor.SetFocus
        Exit Sub
    End If
    
   
    If Not IsNumeric(Trim(txtID.Text)) Then
        MsgBox "请输入数字编号！", vbOKOnly + vbExclamation, "警告"
        Exit Sub
        txtID.SetFocus
    End If
    
    
    
    txtSQL = "select * from director_Info where ID = '" & Trim(txtID.Text) & "'"
    Set TempRecordset = ExecuteSQL(txtSQL, MsgText)
    If TempRecordset.EOF = False Then
        MsgBox "编号重复，请重新输入！", vbOKOnly + vbExclamation, "警告"
        TempRecordset.Close
        txtID.SetFocus
    Else
        TempRecordset.Close
               txtSQL = "select * from director_Info"
                Set TempRecordset = ExecuteSQL(txtSQL, MsgText)
                TempRecordset.AddNew
                TempRecordset.Fields(0) = Trim(txtID.Text)
                TempRecordset.Fields(1) = Trim(txtName.Text)
                TempRecordset.Fields(2) = Trim(comboSex.Text)
                TempRecordset.Fields(3) = Trim(ComboZhicheng.Text)
                TempRecordset.Fields(4) = Trim(txtZhiwu.Text)
                TempRecordset.Fields(5) = Trim(ComboMajor.Text)
                TempRecordset.Update
                MsgBox "添加导师信息成功！", vbOKOnly + vbExclamation, "警告"
                TempRecordset.Close
               Unload Me
    End If
    
End Sub

Private Sub CmdCancel_Click()
    Unload Me
End Sub

Private Sub Form_Load()
    Dim TempRecordset As ADODB.Recordset
    Dim txtSQL As String
    Dim MsgText As String
    Dim i As Integer
    
    comboSex.AddItem "男"
    comboSex.AddItem "女"
    
    ComboZhicheng.AddItem "助教"
    ComboZhicheng.AddItem "讲师"
    ComboZhicheng.AddItem "副教授"
    ComboZhicheng.AddItem "教授"
    ComboZhicheng.AddItem "客座教授"
    ComboZhicheng.AddItem "助工"
    ComboZhicheng.AddItem "工程师"
    ComboZhicheng.AddItem "高级工程师"
    ComboZhicheng.AddItem "副研究员"
    ComboZhicheng.AddItem "研究员"
    ComboZhicheng.AddItem "科学院院士"
    ComboZhicheng.AddItem "工程院院士"
    ComboZhicheng.AddItem "两院院士"
    
   
    txtSQL = "select name from view_major"
    Set TempRecordset = ExecuteSQL(txtSQL, MsgText)
    For i = 1 To TempRecordset.RecordCount
       ComboMajor.AddItem TempRecordset.Fields(0)
       TempRecordset.MoveNext
    Next i
    TempRecordset.Close


End Sub


