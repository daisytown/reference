VERSION 5.00
Begin VB.Form FormUpdateDirector 
   Caption         =   "�޸ĵ�ʦ��Ϣ"
   ClientHeight    =   6270
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8295
   LinkTopic       =   "Form1"
   ScaleHeight     =   6270
   ScaleWidth      =   8295
   StartUpPosition =   2  '��Ļ����
   Begin VB.Frame Frame1 
      Caption         =   "�鿴��ʦ��Ϣ"
      BeginProperty Font 
         Name            =   "����"
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
         Caption         =   "�׼�¼"
         BeginProperty Font 
            Name            =   "����"
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
         Caption         =   "�ϼ�¼"
         BeginProperty Font 
            Name            =   "����"
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
         Caption         =   "�¼�¼"
         BeginProperty Font 
            Name            =   "����"
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
         Caption         =   "ĩ��¼"
         BeginProperty Font 
            Name            =   "����"
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
      Caption         =   "�˳��޸�"
      BeginProperty Font 
         Name            =   "����"
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
      Caption         =   "�޸ĵ�ʦ��Ϣ"
      BeginProperty Font 
         Name            =   "����"
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
         Caption         =   "�޸ļ�¼"
         BeginProperty Font 
            Name            =   "����"
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
         Caption         =   "��������"
         BeginProperty Font 
            Name            =   "����"
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
         Caption         =   "ȡ���޸�"
         BeginProperty Font 
            Name            =   "����"
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
         Caption         =   "ɾ����¼"
         BeginProperty Font 
            Name            =   "����"
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
      Caption         =   "���"
      Height          =   255
      Left            =   360
      TabIndex        =   16
      Top             =   120
      Width           =   1095
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "����"
      Height          =   15
      Left            =   480
      TabIndex        =   15
      Top             =   840
      Width           =   855
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "�Ա�"
      Height          =   255
      Left            =   360
      TabIndex        =   14
      Top             =   1440
      Width           =   1095
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Caption         =   "ְ��"
      Height          =   255
      Left            =   360
      TabIndex        =   13
      Top             =   2040
      Width           =   1095
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      Caption         =   "ְ��"
      Height          =   375
      Left            =   360
      TabIndex        =   12
      Top             =   3360
      Width           =   1095
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      Caption         =   "רҵ"
      Height          =   255
      Left            =   360
      TabIndex        =   11
      Top             =   2760
      Width           =   1095
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      Caption         =   "����"
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
        MsgBox "û�н����޸ģ�", vbOKOnly + vbExclamation, "����"
    End If
        
End Sub

Private Sub CmdDelete_Click()
    TempBookmark = TempRecordset.Bookmark
    str2$ = MsgBox("�Ƿ�ɾ����ǰ��¼��", vbOKCancel, "ɾ����ǰ��¼")
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
        MsgBox "����ѡ���޸ĵ�ʦ��Ϣ", vbOKOnly + vbExclamation, "����"
        Exit Sub
    End If
    
    If Not Checktxt(txtID.Text) Then
        MsgBox "�������ţ�", vbOKOnly + vbExclamation, "����"
        txtID.SetFocus
        Exit Sub
    End If
    
    If Not IsNumeric(Trim(txtID.Text)) Then
        MsgBox "������������֣�", vbOKOnly + vbExclamation, "����"
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
    
    If Not Checktxt(ComboZhicheng.Text) Then
        MsgBox "��ѡ��ְ�ƣ�", vbOKOnly + vbExclamation, "����"
        comboType.SetFocus
        Exit Sub
    End If
    
    If Not Checktxt(txtZhiwu.Text) Then
        MsgBox "������������ڣ�", vbOKOnly + vbExclamation, "����"
        txtBirthday.SetFocus
        Exit Sub
    End If
    
        
    If Not Checktxt(ComboMajor.Text) Then
        MsgBox "������רҵ��", vbOKOnly + vbExclamation, "����"
        ComboMajor.SetFocus
        Exit Sub
    End If
    
        
    TempRecordset.Delete
    txtSQL = "select * from director_Info where ID = '" & Trim(txtID.Text) & "'"
    Set TempRecordsetc = ExecuteSQL(txtSQL, MsgText)
    If TempRecordsetc.EOF = False Then
        MsgBox "����ظ������������룡", vbOKOnly + vbExclamation, "����"
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
                MsgBox "�޸ĵ�ʦ��Ϣ�ɹ���", vbOKOnly + vbExclamation, "�޸ĵ�ʦ��Ϣ"
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


