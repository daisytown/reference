VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Begin VB.Form FormSelectDirector 
   Caption         =   "��ѯ��ʦ��Ϣ"
   ClientHeight    =   4815
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7905
   LinkTopic       =   "Form1"
   ScaleHeight     =   4815
   ScaleWidth      =   7905
   StartUpPosition =   2  '��Ļ����
   Begin VB.Frame Frame1 
      Caption         =   "��ѯ��ʽѡ��"
      BeginProperty Font 
         Name            =   "����"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1932
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   7695
      Begin VB.ComboBox ComboMajor 
         Height          =   300
         Left            =   3600
         TabIndex        =   9
         Text            =   "��ѡ���ѯרҵ"
         Top             =   1320
         Width           =   1695
      End
      Begin VB.TextBox txtName 
         BeginProperty Font 
            Name            =   "����"
            Size            =   10.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   372
         Left            =   3600
         TabIndex        =   7
         Top             =   720
         Width           =   1695
      End
      Begin VB.TextBox txtID 
         BeginProperty Font 
            Name            =   "����"
            Size            =   10.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   372
         Left            =   3600
         TabIndex        =   6
         Top             =   240
         Width           =   1695
      End
      Begin VB.CommandButton cmdExit 
         Caption         =   "�˳���ѯ"
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
         Left            =   6360
         TabIndex        =   5
         Top             =   1080
         Width           =   1212
      End
      Begin VB.CommandButton CmdSelect 
         Caption         =   "ִ�в�ѯ"
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
         Left            =   6360
         TabIndex        =   4
         Top             =   240
         Width           =   1212
      End
      Begin VB.CheckBox Check1 
         Caption         =   "����רҵ���в�ѯ"
         BeginProperty Font 
            Name            =   "����"
            Size            =   10.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   2
         Left            =   240
         TabIndex        =   3
         Top             =   1320
         Width           =   2295
      End
      Begin VB.CheckBox Check1 
         Caption         =   "���յ�ʦ�������в�ѯ"
         BeginProperty Font 
            Name            =   "����"
            Size            =   10.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   1
         Left            =   240
         TabIndex        =   2
         Top             =   840
         Width           =   2775
      End
      Begin VB.CheckBox Check1 
         Caption         =   "���յ�ʦ��Ž��в�ѯ"
         BeginProperty Font 
            Name            =   "����"
            Size            =   10.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   0
         Left            =   240
         TabIndex        =   1
         Top             =   360
         Width           =   2655
      End
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid myflexgrid 
      Height          =   2535
      Left            =   120
      TabIndex        =   8
      Top             =   2160
      Width           =   7695
      _ExtentX        =   13573
      _ExtentY        =   4471
      _Version        =   393216
      Cols            =   6
      FixedCols       =   0
      MergeCells      =   1
      AllowUserResizing=   1
      BandDisplay     =   1
      RowSizingMode   =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "����"
         Size            =   9.75
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _NumberOfBands  =   1
      _Band(0).Cols   =   6
      _Band(0).GridLinesBand=   2
      _Band(0).TextStyleBand=   0
      _Band(0).TextStyleHeader=   0
   End
End
Attribute VB_Name = "FormSelectDirector"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CmdExit_Click()
    Unload Me
End Sub

Private Sub CmdSelect_Click()
    Dim txtSQL As String
    Dim MsgText As String
    Dim Condition(3) As Boolean
    Dim TempRecordset As ADODB.Recordset
    
       
    txtSQL = "select * from view_director where "
    If Check1(0).Value Then
        If Trim(txtID.Text) = "" Then
            sMeg = "��Ų���Ϊ��"
            MsgBox sMeg, vbOKOnly + vbExclamation, "����"
            txtID.SetFocus
            Exit Sub
        Else
            If Not IsNumeric(Trim(txtID.Text)) Then
                MsgBox "���������ֱ�ţ�", vbOKOnly + vbExclamation, "����"
                Exit Sub
                txtID.SetFocus
            End If
            Condition(0) = True
            txtSQL = txtSQL & "ID ='" & Trim(txtID.Text) & "'"
        End If
    End If
    
    If Check1(1).Value Then
        If Trim(txtName.Text) = "" Then
            sMeg = "��������Ϊ��"
            MsgBox sMeg, vbOKOnly + vbExclamation, "����"
            txtName.SetFocus
            Exit Sub
        Else
            Condition(1) = True
            If Condition(0) Then
                txtSQL = txtSQL & "and Name ='" & txtName.Text & "'"
            Else
                txtSQL = txtSQL & "Name ='" & txtName.Text & "'"
            End If
        End If
    End If
    
    If Check1(2).Value Then
        If Trim(ComboMajor.Text) = "" Then
            sMeg = "רҵ����Ϊ��"
            MsgBox sMeg, vbOKOnly + vbExclamation, "����"
            ComboMajor.SetFocus
            Exit Sub
        Else
            Condition(2) = True
            If Condition(0) Or Condition(1) Then
                txtSQL = txtSQL & "and Major = '" & ComboMajor.Text & "'"
            Else
                txtSQL = txtSQL & "Major = '" & ComboMajor.Text & "'"
            End If
        End If
    End If
    
    If Not (Condition(0) Or Condition(1) Or Condition(2)) Then
        MsgBox "�����ò�ѯ��ʽ��", vbOKOnly + vbExclamation, "����"
        Exit Sub
    End If
    
    txtSQL = txtSQL & " order by ID "
    Set TempRecordset = ExecuteSQL(txtSQL, MsgText)
    
    With myflexgrid
        .Rows = 2
        .CellAlignment = 4
        .TextMatrix(1, 0) = "���"
        .TextMatrix(1, 1) = "����"
        .TextMatrix(1, 2) = "�Ա�"
        .TextMatrix(1, 3) = "ְ��"
        .TextMatrix(1, 4) = "ְ��"
        .TextMatrix(1, 5) = "רҵ"
        
        Do While Not TempRecordset.EOF
            .Rows = .Rows + 1
            .CellAlignment = 4
            .TextMatrix(.Rows - 1, 0) = TempRecordset.Fields(0)
            .TextMatrix(.Rows - 1, 1) = TempRecordset.Fields(1)
            .TextMatrix(.Rows - 1, 2) = TempRecordset.Fields(2)
            .TextMatrix(.Rows - 1, 3) = TempRecordset.Fields(3)
            .TextMatrix(.Rows - 1, 4) = TempRecordset.Fields(4)
            .TextMatrix(.Rows - 1, 5) = TempRecordset.Fields(5)
            TempRecordset.MoveNext
        Loop
        
    End With
    
    TempRecordset.Close
    
    
End Sub

Private Sub Form_Load()
    With myflexgrid
        .CellAlignment = 4
        .TextMatrix(1, 0) = "ѧ��"
        .TextMatrix(1, 1) = "����"
        .TextMatrix(1, 2) = "�Ա�"
        .TextMatrix(1, 3) = "ְ��"
        .TextMatrix(1, 4) = "ְ��"
        .TextMatrix(1, 5) = "רҵ"
    End With
    
    Dim TempRecordset As ADODB.Recordset
    Dim txtSQL As String
    Dim MsgText As String
    Dim i As Integer
    
    txtSQL = "select name from view_major"
    Set TempRecordset = ExecuteSQL(txtSQL, MsgText)
    For i = 1 To TempRecordset.RecordCount
       ComboMajor.AddItem TempRecordset.Fields(0)
       TempRecordset.MoveNext
    Next i
    TempRecordset.Close
    
End Sub


