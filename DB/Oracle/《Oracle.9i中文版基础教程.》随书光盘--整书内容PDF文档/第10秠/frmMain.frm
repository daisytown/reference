VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.MDIForm frmMain 
   BackColor       =   &H8000000C&
   Caption         =   "�о���������Ϣϵͳ"
   ClientHeight    =   4950
   ClientLeft      =   135
   ClientTop       =   435
   ClientWidth     =   7275
   LinkTopic       =   "MDIForm1"
   LockControls    =   -1  'True
   StartUpPosition =   2  '��Ļ����
   WindowState     =   2  'Maximized
   Begin MSComctlLib.StatusBar sbStatusBar 
      Align           =   2  'Align Bottom
      Height          =   270
      Left            =   0
      TabIndex        =   0
      Top             =   4680
      Width           =   7275
      _ExtentX        =   12832
      _ExtentY        =   476
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   3
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   7197
            Text            =   "[״̬]"
            TextSave        =   "[״̬]"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   6
            AutoSize        =   2
            TextSave        =   "2003-09-20"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            AutoSize        =   2
            TextSave        =   "21:08"
         EndProperty
      EndProperty
   End
   Begin VB.Menu GraduateMenu 
      Caption         =   "�о�������"
      Begin VB.Menu GraduateInsertMenu 
         Caption         =   "����о�����Ϣ"
      End
      Begin VB.Menu GraduateUpdateMenu 
         Caption         =   "�޸��о�����Ϣ"
      End
      Begin VB.Menu GraduateSelectMenu 
         Caption         =   "��ѯ�о�����Ϣ"
      End
   End
   Begin VB.Menu DirectorMenu 
      Caption         =   "��ʦ����"
      Begin VB.Menu DirectorInsertMenu 
         Caption         =   "��ӵ�ʦ��Ϣ"
      End
      Begin VB.Menu DirectorUpdateMenu 
         Caption         =   "�޸ĵ�ʦ��Ϣ"
      End
      Begin VB.Menu DirectorSelectMenu 
         Caption         =   "��ѯ��ʦ��Ϣ"
      End
   End
   Begin VB.Menu MajorMenu 
      Caption         =   "רҵ����"
      Begin VB.Menu MajorInsertMenu 
         Caption         =   "���רҵ��Ϣ"
      End
      Begin VB.Menu MajorUpdateMenu 
         Caption         =   "�޸�רҵ��Ϣ"
      End
   End
   Begin VB.Menu ExitMenu 
      Caption         =   "�˳�ϵͳ"
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub DirectorInsertMenu_Click()
     FormInsertDirector.Show
End Sub

Private Sub DirectorSelectMenu_Click()
   FormSelectDirector.Show
End Sub

Private Sub DirectorUpdateMenu_Click()
   FormUpdateDirector.Show
End Sub

Private Sub GraduateInsertMenu_Click()
    FormInsertGraduate.Show
End Sub
Private Sub ExitMenu_Click()
    End
End Sub

Private Sub GraduateSelectMenu_Click()
   FormSelectGraduate.Show
End Sub

Private Sub GraduateUpdateMenu_Click()
  FormUpdateGraduate.Show
End Sub

Private Sub MajorInsertMenu_Click()
   FormInsertMajor.Show
End Sub

Private Sub MajorUpdateMenu_Click()
   FormUpdateMajor.Show
End Sub

Private Sub MDIForm_Load()

   Me.Left = GetSetting(App.Title, "Settings", "MainLeft", 1000)
   Me.Top = GetSetting(App.Title, "Settings", "MainTop", 1000)
   Me.Width = GetSetting(App.Title, "Settings", "MainWidth", 6500)
   Me.Height = GetSetting(App.Title, "Settings", "MainHeight", 6500)
    
End Sub

