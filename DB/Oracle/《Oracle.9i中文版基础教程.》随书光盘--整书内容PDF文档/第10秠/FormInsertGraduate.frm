VERSION 5.00
Begin VB.Form FormInsertGraduate 
   Caption         =   "����о�����Ϣ"
   ClientHeight    =   4950
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8205
   LinkTopic       =   "Form1"
   ScaleHeight     =   4950
   ScaleWidth      =   8205
   StartUpPosition =   2  '��Ļ����
   Begin VB.ComboBox ComboMajor 
      Height          =   300
      Left            =   1440
      TabIndex        =   6
      Text            =   "��ѡ��רҵ"
      Top             =   2520
      Width           =   1695
   End
   Begin VB.TextBox txtID 
      Height          =   372
      Left            =   1440
      TabIndex        =   0
      Top             =   120
      Width           =   1692
   End
   Begin VB.ComboBox comboSex 
      Height          =   300
      Left            =   1440
      TabIndex        =   2
      Text            =   "��ѡ���Ա�"
      Top             =   720
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      Height          =   372
      Left            =   5880
      TabIndex        =   1
      Top             =   120
      Width           =   1692
   End
   Begin VB.TextBox txtBirthday 
      Height          =   372
      Left            =   1440
      TabIndex        =   4
      Top             =   1200
      Width           =   1692
   End
   Begin VB.TextBox txtClassno 
      Height          =   372
      Left            =   1440
      TabIndex        =   5
      Top             =   1800
      Width           =   1692
   End
   Begin VB.TextBox txtSource 
      Height          =   735
      Left            =   1440
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   8
      Top             =   3120
      Width           =   6135
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
      Left            =   2280
      TabIndex        =   9
      Top             =   4320
      Width           =   1455
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
      Left            =   4680
      TabIndex        =   10
      Top             =   4320
      Width           =   1455
   End
   Begin VB.ComboBox ComboType 
      Height          =   300
      Left            =   5880
      TabIndex        =   3
      Text            =   "��ѡ�����"
      Top             =   720
      Width           =   1695
   End
   Begin VB.ComboBox comboDirector 
      Height          =   300
      Left            =   5880
      TabIndex        =   7
      Text            =   "��ѡ��ʦ����"
      Top             =   2400
      Width           =   1695
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "ѧ��"
      Height          =   255
      Left            =   0
      TabIndex        =   20
      Top             =   240
      Width           =   975
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "����"
      Height          =   255
      Left            =   4560
      TabIndex        =   19
      Top             =   240
      Width           =   1095
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "�Ա�"
      Height          =   255
      Left            =   0
      TabIndex        =   18
      Top             =   720
      Width           =   975
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Caption         =   "���"
      Height          =   255
      Left            =   4680
      TabIndex        =   17
      Top             =   720
      Width           =   855
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      Caption         =   "�༶���"
      Height          =   375
      Left            =   120
      TabIndex        =   16
      Top             =   1800
      Width           =   1095
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      Caption         =   "רҵ"
      Height          =   255
      Left            =   120
      TabIndex        =   15
      Top             =   2520
      Width           =   735
   End
   Begin VB.Label Label8 
      Alignment       =   2  'Center
      Caption         =   "��ʦ����"
      Height          =   375
      Left            =   4680
      TabIndex        =   14
      Top             =   2400
      Width           =   1095
   End
   Begin VB.Label Label9 
      Alignment       =   2  'Center
      Caption         =   "��Դ����"
      Height          =   375
      Left            =   120
      TabIndex        =   13
      Top             =   3120
      Width           =   1095
   End
   Begin VB.Label Label10 
      Alignment       =   2  'Center
      Caption         =   "��������"
      Height          =   255
      Left            =   120
      TabIndex        =   12
      Top             =   1320
      Width           =   1095
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      Caption         =   "������2002��09-10��"
      Height          =   255
      Left            =   3000
      TabIndex        =   11
      Top             =   1320
      Width           =   2655
   End
End
Attribute VB_Name = "FormInsertGraduate"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub CmdCommit_Click()
    Dim TempRecordset As ADODB.Recordset
    Dim txtSQL As String
    Dim MsgText As String
    
    If Not Checktxt(txtID.Text) Then
        MsgBox "������ѧ�ţ�", vbOKOnly + vbExclamation, "����"
        txtID.SetFocus
        Exit Sub
    End If
    
    If Not Checktxt(txtName.Text) Then
        MsgBox "������������", vbOKOnly + vbExclamation, "����"
        txtName.SetFocus
        Exit Sub
    End If
    
    If Not Checktxt(comboSex.Text) Then
        MsgBox "��ѡ���Ա�", vbOKOnly + vbExclamation, "����"
        comboSex.SetFocus
        Exit Sub
    End If
    
    If Not Checktxt(comboType.Text) Then
        MsgBox "�������о������", vbOKOnly + vbExclamation, "����"
        comboType.SetFocus
        Exit Sub
    End If
    
    
    If Not Checktxt(txtBirthday.Text) Then
        MsgBox "������������ڣ�", vbOKOnly + vbExclamation, "����"
        txtBirthday.SetFocus
        Exit Sub
    End If
    
    If Not Checktxt(txtClassno.Text) Then
        MsgBox "������༶��ţ�", vbOKOnly + vbExclamation, "����"
        txtClassno.SetFocus
        Exit Sub
    End If
    
  
    
    If Not Checktxt(ComboMajor.Text) Then
        MsgBox "������רҵ��", vbOKOnly + vbExclamation, "����"
        ComboMajor.SetFocus
        Exit Sub
    End If
    
    If Not Checktxt(comboDirector.Text) Then
        MsgBox "�����뵼ʦ������", vbOKOnly + vbExclamation, "����"
        comboDirector.SetFocus
        Exit Sub
    End If
    
    If Not IsNumeric(Trim(txtID.Text)) Then
        MsgBox "����������ѧ�ţ�", vbOKOnly + vbExclamation, "����"
        Exit Sub
        txtID.SetFocus
    End If
    
    
    
    txtSQL = "select * from graduate_Info where ID = '" & Trim(txtID.Text) & "'"
    Set TempRecordset = ExecuteSQL(txtSQL, MsgText)
    If TempRecordset.EOF = False Then
        MsgBox "ѧ���ظ������������룡", vbOKOnly + vbExclamation, "����"
        TempRecordset.Close
        txtID.SetFocus
    Else
        TempRecordset.Close
        If Not IsDate(txtBirthday.Text) Then
            MsgBox "��������Ӧ�������ڸ�ʽ��yyyy-mm-dd����", vbOKOnly + vbExclamation, "����"
            txtBirthday.SetFocus
        Else
            txtBirthday = Format(txtBirthday, "yyyy-mm-dd")
            If Not IsDate(txtBirthday.Text) Then
                MsgBox "��������Ӧ�������ڸ�ʽ��yyyy-mm-dd����", vbOKOnly + vbExclamation, "����"
                txtBirthday.SetFocus
            Else
                txtBirthday = Format(txtBirthday, "yyyy-mm-dd")
                txtSQL = "select * from graduate_Info"
                Set TempRecordset = ExecuteSQL(txtSQL, MsgText)
                TempRecordset.AddNew
                TempRecordset.Fields(0) = Trim(txtID.Text)
                TempRecordset.Fields(1) = Trim(txtName.Text)
                TempRecordset.Fields(2) = Trim(comboSex.Text)
                TempRecordset.Fields(3) = Trim(comboType.Text)
                TempRecordset.Fields(4) = Trim(txtBirthday.Text)
                TempRecordset.Fields(5) = Trim(txtClassno.Text)
                TempRecordset.Fields(6) = Trim(ComboMajor.Text)
                TempRecordset.Fields(7) = Trim(comboDirector.Text)
                TempRecordset.Fields(8) = Trim(txtSource.Text)
                TempRecordset.Update
                MsgBox "����о�����Ϣ�ɹ���", vbOKOnly + vbExclamation, "����"
                TempRecordset.Close
                Unload Me
            End If
        End If
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
    
    comboType.AddItem "˶ʿ"
    comboType.AddItem "��ʿ"
    comboType.AddItem "��ʿ��"
    
    txtSQL = "select name from view_director"
    Set TempRecordset = ExecuteSQL(txtSQL, MsgText)
    
    For i = 1 To TempRecordset.RecordCount
       comboDirector.AddItem TempRecordset.Fields(0)
       TempRecordset.MoveNext
    Next i
    TempRecordset.Close

    txtSQL = "select name from view_major"
    Set TempRecordset = ExecuteSQL(txtSQL, MsgText)
    For i = 1 To TempRecordset.RecordCount
       ComboMajor.AddItem TempRecordset.Fields(0)
       TempRecordset.MoveNext
    Next i
    TempRecordset.Close
End Sub

