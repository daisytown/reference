VERSION 5.00
Begin VB.Form FormInsertDirector 
   Caption         =   "��ӵ�ʦ��Ϣ"
   ClientHeight    =   5205
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5925
   LinkTopic       =   "Form1"
   ScaleHeight     =   5205
   ScaleWidth      =   5925
   StartUpPosition =   2  '��Ļ����
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
      Text            =   "��ѡ��ְ��"
      Top             =   2280
      Width           =   2055
   End
   Begin VB.CommandButton CmdCancel 
      Caption         =   "ȡ�����"
      BeginProperty Font 
         Name            =   "����"
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
      Caption         =   "ȷ�����"
      BeginProperty Font 
         Name            =   "����"
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
      Text            =   "��ѡ���Ա�"
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
      Text            =   "��ѡ��רҵ"
      Top             =   2880
      Width           =   2055
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      Caption         =   "����"
      Height          =   255
      Left            =   360
      TabIndex        =   14
      Top             =   1080
      Width           =   1095
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      Caption         =   "רҵ"
      Height          =   255
      Left            =   360
      TabIndex        =   13
      Top             =   3000
      Width           =   1095
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      Caption         =   "ְ��"
      Height          =   375
      Left            =   360
      TabIndex        =   12
      Top             =   3600
      Width           =   1095
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Caption         =   "ְ��"
      Height          =   255
      Left            =   360
      TabIndex        =   11
      Top             =   2280
      Width           =   1095
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "�Ա�"
      Height          =   255
      Left            =   360
      TabIndex        =   10
      Top             =   1680
      Width           =   1095
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "����"
      Height          =   15
      Left            =   480
      TabIndex        =   9
      Top             =   1080
      Width           =   855
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "���"
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
        MsgBox "�������ţ�", vbOKOnly + vbExclamation, "����"
        txtID.SetFocus
        Exit Sub
    End If
    
    If Not Checktxt(txtName.Text) Then
        MsgBox "������������", vbOKOnly + vbExclamation, "����"
        txtName.SetFocus
        Exit Sub
    End If
    
    If Not Checktxt(ComboZhicheng.Text) Then
        MsgBox "��ѡ��ְ�ƣ�", vbOKOnly + vbExclamation, "����"
        comboSex.SetFocus
        Exit Sub
    End If
    
    If Not Checktxt(txtZhiwu.Text) Then
        MsgBox "������ְ��", vbOKOnly + vbExclamation, "����"
        comboType.SetFocus
        Exit Sub
    End If
    
    If Not Checktxt(ComboMajor.Text) Then
        MsgBox "������רҵ��", vbOKOnly + vbExclamation, "����"
        ComboMajor.SetFocus
        Exit Sub
    End If
    
   
    If Not IsNumeric(Trim(txtID.Text)) Then
        MsgBox "���������ֱ�ţ�", vbOKOnly + vbExclamation, "����"
        Exit Sub
        txtID.SetFocus
    End If
    
    
    
    txtSQL = "select * from director_Info where ID = '" & Trim(txtID.Text) & "'"
    Set TempRecordset = ExecuteSQL(txtSQL, MsgText)
    If TempRecordset.EOF = False Then
        MsgBox "����ظ������������룡", vbOKOnly + vbExclamation, "����"
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
                MsgBox "��ӵ�ʦ��Ϣ�ɹ���", vbOKOnly + vbExclamation, "����"
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
    
    comboSex.AddItem "��"
    comboSex.AddItem "Ů"
    
    ComboZhicheng.AddItem "����"
    ComboZhicheng.AddItem "��ʦ"
    ComboZhicheng.AddItem "������"
    ComboZhicheng.AddItem "����"
    ComboZhicheng.AddItem "��������"
    ComboZhicheng.AddItem "����"
    ComboZhicheng.AddItem "����ʦ"
    ComboZhicheng.AddItem "�߼�����ʦ"
    ComboZhicheng.AddItem "���о�Ա"
    ComboZhicheng.AddItem "�о�Ա"
    ComboZhicheng.AddItem "��ѧԺԺʿ"
    ComboZhicheng.AddItem "����ԺԺʿ"
    ComboZhicheng.AddItem "��ԺԺʿ"
    
   
    txtSQL = "select name from view_major"
    Set TempRecordset = ExecuteSQL(txtSQL, MsgText)
    For i = 1 To TempRecordset.RecordCount
       ComboMajor.AddItem TempRecordset.Fields(0)
       TempRecordset.MoveNext
    Next i
    TempRecordset.Close


End Sub


