VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  '窗口缺省
   Begin VB.TextBox Text3 
      DataField       =   "LOC"
      DataSource      =   "Data1"
      Height          =   375
      Left            =   480
      TabIndex        =   2
      Text            =   "Text3"
      Top             =   2280
      Width           =   2295
   End
   Begin VB.TextBox Text2 
      DataField       =   "DNAME"
      DataSource      =   "Data1"
      Height          =   375
      Left            =   480
      TabIndex        =   1
      Text            =   "Text2"
      Top             =   1680
      Width           =   2295
   End
   Begin VB.TextBox Text1 
      DataField       =   "DEPTNO"
      DataSource      =   "Data1"
      Height          =   375
      Left            =   480
      TabIndex        =   0
      Text            =   "Text1"
      Top             =   1080
      Width           =   2295
   End
   Begin VB.Data Data1 
      Caption         =   "Data1"
      Connect         =   "odbc;dsn=graduateDB;uid=scott;pwd=tiger;"
      DatabaseName    =   ""
      DefaultCursorType=   0  '缺省游标
      DefaultType     =   2  '使用 ODBC
      Exclusive       =   0   'False
      Height          =   495
      Left            =   480
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   "SCOTT.DEPT"
      Top             =   240
      Width           =   3735
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
