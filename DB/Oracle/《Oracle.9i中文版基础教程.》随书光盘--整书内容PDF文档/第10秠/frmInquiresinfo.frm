VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Begin VB.Form frmInquiresinfo 
   Caption         =   "��ѯѧ����Ϣ"
   ClientHeight    =   5400
   ClientLeft      =   48
   ClientTop       =   348
   ClientWidth     =   10272
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   5400
   ScaleWidth      =   10272
   Begin VB.Frame Frame1 
      Caption         =   "��ѯ"
      BeginProperty Font 
         Name            =   "����"
         Size            =   10.8
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1932
      Left            =   120
      TabIndex        =   1
      Top             =   3240
      Width           =   9252
      Begin VB.TextBox txtClassno 
         BeginProperty Font 
            Name            =   "����"
            Size            =   10.8
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   372
         Left            =   7080
         TabIndex        =   9
         Top             =   360
         Width           =   1092
      End
      Begin VB.TextBox txtName 
         BeginProperty Font 
            Name            =   "����"
            Size            =   10.8
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   372
         Left            =   4440
         TabIndex        =   8
         Top             =   360
         Width           =   1092
      End
      Begin VB.TextBox txtSID 
         BeginProperty Font 
            Name            =   "����"
            Size            =   10.8
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   372
         Left            =   1560
         TabIndex        =   7
         Top             =   360
         Width           =   1092
      End
      Begin VB.CommandButton cmdExit 
         Caption         =   "�˳���ѯ"
         BeginProperty Font 
            Name            =   "����"
            Size            =   10.8
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   492
         Left            =   3960
         TabIndex        =   6
         Top             =   1080
         Width           =   1212
      End
      Begin VB.CommandButton cmdInquire 
         Caption         =   "��ѯ"
         BeginProperty Font 
            Name            =   "����"
            Size            =   10.8
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   492
         Left            =   1680
         TabIndex        =   5
         Top             =   1080
         Width           =   1212
      End
      Begin VB.CheckBox Check1 
         Caption         =   "����ţ�"
         BeginProperty Font 
            Name            =   "����"
            Size            =   10.8
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   2
         Left            =   6000
         TabIndex        =   4
         Top             =   360
         Width           =   1212
      End
      Begin VB.CheckBox Check1 
         Caption         =   "��������"
         BeginProperty Font 
            Name            =   "����"
            Size            =   10.8
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   1
         Left            =   3240
         TabIndex        =   3
         Top             =   360
         Width           =   1212
      End
      Begin VB.CheckBox Check1 
         Caption         =   "��ѧ�ţ�"
         BeginProperty Font 
            Name            =   "����"
            Size            =   10.8
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   0
         Left            =   360
         TabIndex        =   2
         Top             =   360
         Width           =   1212
      End
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid myflexgrid 
      Height          =   3012
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   10092
      _ExtentX        =   17801
      _ExtentY        =   5313
      _Version        =   393216
      Cols            =   8
      FixedCols       =   0
      AllowBigSelection=   0   'False
      MergeCells      =   1
      AllowUserResizing=   1
      BandDisplay     =   1
      RowSizingMode   =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "����"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _NumberOfBands  =   1
      _Band(0).Cols   =   8
      _Band(0).GridLinesBand=   2
      _Band(0).TextStyleBand=   0
      _Band(0).TextStyleHeader=   0
   End
End
Attribute VB_Name = "frmInquiresinfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub cmdInquire_Click()
    Dim txtSQL As String
    Dim MsgText As String
    Dim dd(4) As Boolean
    Dim mrc As ADODB.Recordset
    
       
    txtSQL = "select * from student_Info where "
    If Check1(0).Value Then
        If Trim(txtSID.Text) = "" Then
            sMeg = "ѧ�Ų���Ϊ��"
            MsgBox sMeg, vbOKOnly + vbExclamation, "����"
            txtSID.SetFocus
            Exit Sub
        Else
            If Not IsNumeric(Trim(txtSID.Text)) Then
                MsgBox "���������֣�", vbOKOnly + vbExclamation, "����"
                Exit Sub
                txtSID.SetFocus
            End If
            dd(0) = True
            txtSQL = txtSQL & "student_ID = '" & Trim(txtSID.Text) & "'"
        End If
    End If
    
    If Check1(1).Value Then
        If Trim(txtName.Text) = "" Then
            sMeg = "��������Ϊ��"
            MsgBox sMeg, vbOKOnly + vbExclamation, "����"
            txtName.SetFocus
            Exit Sub
        Else
            dd(1) = True
            If dd(0) Then
                txtSQL = txtSQL & "and student_Name = '" & txtName.Text & "'"
            Else
                txtSQL = txtSQL & "student_Name = '" & txtName.Text & "'"
            End If
        End If
    End If
    
    If Check1(2).Value Then
        If Trim(txtClassno.Text) = "" Then
            sMeg = "��Ų���Ϊ��"
            MsgBox sMeg, vbOKOnly + vbExclamation, "����"
            txtClassno.SetFocus
            Exit Sub
        Else
            dd(2) = True
            If dd(0) Or dd(1) Then
                txtSQL = txtSQL & "and class_No = '" & txtClassno.Text & "'"
            Else
                txtSQL = txtSQL & "class_No = '" & txtClassno.Text & "'"
            End If
        End If
    End If
    
    If Not (dd(0) Or dd(1) Or dd(2) Or dd(3)) Then
        MsgBox "�����ò�ѯ��ʽ��", vbOKOnly + vbExclamation, "����"
        Exit Sub
    End If
    
    txtSQL = txtSQL & " order by student_ID "
    Set mrc = ExecuteSQL(txtSQL, MsgText)
    
    With myflexgrid
        .Rows = 2
        .CellAlignment = 4
        .TextMatrix(1, 0) = "ѧ��"
        .TextMatrix(1, 1) = "����"
        .TextMatrix(1, 2) = "�Ա�"
        .TextMatrix(1, 3) = "��������"
        .TextMatrix(1, 4) = "���"
        .TextMatrix(1, 5) = "��ϵ�绰"
        .TextMatrix(1, 6) = "��У����"
        .TextMatrix(1, 7) = "��ͥסַ"
        
        Do While Not mrc.EOF
            .Rows = .Rows + 1
            .CellAlignment = 4
            .TextMatrix(.Rows - 1, 0) = mrc.Fields(0)
            .TextMatrix(.Rows - 1, 1) = mrc.Fields(1)
            .TextMatrix(.Rows - 1, 2) = mrc.Fields(2)
            .TextMatrix(.Rows - 1, 3) = Format(mrc.Fields(3), "yyyy-mm-dd")
            .TextMatrix(.Rows - 1, 4) = mrc.Fields(4)
            .TextMatrix(.Rows - 1, 5) = mrc.Fields(5)
            .TextMatrix(.Rows - 1, 6) = Format(mrc.Fields(6), "yyyy-mm-dd")
            .TextMatrix(.Rows - 1, 7) = mrc.Fields(7)
            mrc.MoveNext
        Loop
        
    End With
    
    mrc.Close
    
    
End Sub

Private Sub Form_Load()
    With myflexgrid
        .CellAlignment = 4
        .TextMatrix(1, 0) = "ѧ��"
        .TextMatrix(1, 1) = "����"
        .TextMatrix(1, 2) = "�Ա�"
        .TextMatrix(1, 3) = "��������"
        .TextMatrix(1, 4) = "���"
        .TextMatrix(1, 5) = "��ϵ�绰"
        .TextMatrix(1, 6) = "��У����"
        .TextMatrix(1, 7) = "��ͥסַ"
    End With
End Sub
