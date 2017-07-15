VERSION 5.00
Begin VB.Form Form3 
   BackColor       =   &H8000000A&
   Caption         =   "使用ADODB访问数据库"
   ClientHeight    =   2685
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5160
   LinkTopic       =   "Form1"
   ScaleHeight     =   2685
   ScaleWidth      =   5160
   StartUpPosition =   3  '窗口缺省
   Begin VB.CommandButton CmdExit 
      Caption         =   "退  出"
      Height          =   315
      Left            =   3480
      TabIndex        =   7
      Top             =   2040
      Width           =   1170
   End
   Begin VB.CommandButton CmdLast 
      Caption         =   "末记录"
      Height          =   315
      Left            =   3480
      TabIndex        =   6
      Top             =   1530
      Width           =   1170
   End
   Begin VB.CommandButton CmdNext 
      Caption         =   "下记录"
      Height          =   315
      Left            =   3480
      TabIndex        =   5
      Top             =   1080
      Width           =   1170
   End
   Begin VB.CommandButton CmdPrevious 
      Caption         =   "上记录"
      Height          =   315
      Left            =   3480
      TabIndex        =   4
      Top             =   600
      Width           =   1170
   End
   Begin VB.CommandButton CmdFirst 
      Caption         =   "首记录"
      Height          =   315
      Left            =   3480
      TabIndex        =   3
      Top             =   120
      Width           =   1170
   End
   Begin VB.TextBox Text3 
      Height          =   270
      Left            =   720
      TabIndex        =   2
      Text            =   "Text3"
      Top             =   1800
      Width           =   1695
   End
   Begin VB.TextBox Text2 
      Height          =   270
      Left            =   720
      TabIndex        =   1
      Text            =   "Text2"
      Top             =   840
      Width           =   1695
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   720
      TabIndex        =   0
      Text            =   "Text1"
      Top             =   120
      Width           =   1725
   End
End
Attribute VB_Name = "Form3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim Rs As New ADODB.Recordset
Private conn As ADODB.Connection
Private Sub Form_Load()
  Dim ConnStr As String
  Dim Cmd As New ADODB.Command
Set conn = New ADODB.Connection
ConnStr = "DSN=graduateDB;uid=scott;pwd=tiger;"
conn.ConnectionString = ConnStr
conn.Open

With Cmd
 .ActiveConnection = conn
 .CommandType = adCmdTable
 .CommandText = "dept"
End With

With Rs
 .CursorLocation = adUseClient
 .CursorType = adOpenStatic
 .LockType = adLockPessimistic
 .Open Cmd
End With

Set Text1.DataSource = Rs
Set Text2.DataSource = Rs
Set Text3.DataSource = Rs

Text1.DataField = "DEPTNO"
Text2.DataField = "DNAME"
Text3.DataField = "LOC"
End Sub
Private Sub CmdFirst_Click()
   Rs.MoveFirst
   Rs.Update
End Sub

Private Sub CmdPrevious_Click()
  Rs.MovePrevious
  If Rs.BOF Then
    Rs.MoveFirst
    Rs.Update
  End If
End Sub

Private Sub CmdNext_Click()
   Rs.MoveNext
   If Rs.EOF Then
    Rs.MoveLast
    Rs.Update
  End If
End Sub
Private Sub CmdLast_Click()
  Rs.MoveLast
  Rs.Update
End Sub
Private Sub CmdExit_Click()
  conn.Close
  Set conn = Nothing
  Unload Me
End Sub




