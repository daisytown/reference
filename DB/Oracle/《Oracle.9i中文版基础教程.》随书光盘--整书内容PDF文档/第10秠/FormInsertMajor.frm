VERSION 5.00
Begin VB.Form FormInsertMajor 
   Caption         =   "添加专业信息"
   ClientHeight    =   2940
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5265
   LinkTopic       =   "Form1"
   ScaleHeight     =   2940
   ScaleWidth      =   5265
   StartUpPosition =   2  '屏幕中心
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
      Left            =   960
      TabIndex        =   5
      Top             =   2280
      Width           =   1455
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
      Left            =   3120
      TabIndex        =   4
      Top             =   2280
      Width           =   1455
   End
   Begin VB.TextBox txtID 
      Height          =   372
      Left            =   1440
      TabIndex        =   0
      Top             =   480
      Width           =   615
   End
   Begin VB.TextBox txtName 
      Height          =   372
      Left            =   1440
      TabIndex        =   1
      Top             =   1080
      Width           =   3375
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "编号"
      Height          =   255
      Left            =   240
      TabIndex        =   3
      Top             =   480
      Width           =   1095
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "名称"
      Height          =   255
      Left            =   240
      TabIndex        =   2
      Top             =   1200
      Width           =   1095
   End
End
Attribute VB_Name = "FormInsertMajor"
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
        MsgBox "请输入名称！", vbOKOnly + vbExclamation, "警告"
        txtName.SetFocus
        Exit Sub
    End If
    
   
    If Not IsNumeric(Trim(txtID.Text)) Then
        MsgBox "请输入数字编号！", vbOKOnly + vbExclamation, "警告"
        Exit Sub
        txtID.SetFocus
    End If
    
    
    
    txtSQL = "select * from major_Info where ID = '" & Trim(txtID.Text) & "'"
    Set TempRecordset = ExecuteSQL(txtSQL, MsgText)
    If TempRecordset.EOF = False Then
        MsgBox "编号重复，请重新输入！", vbOKOnly + vbExclamation, "警告"
        TempRecordset.Close
        txtID.SetFocus
    Else
        TempRecordset.Close
               txtSQL = "select * from major_Info"
                Set TempRecordset = ExecuteSQL(txtSQL, MsgText)
                TempRecordset.AddNew
                TempRecordset.Fields(0) = Trim(txtID.Text)
                TempRecordset.Fields(1) = Trim(txtName.Text)
                TempRecordset.Update
                MsgBox "添加专业信息成功！", vbOKOnly + vbExclamation, "警告"
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
End Sub



