Attribute VB_Name = "Module1"
Public fMainForm As frmMain
Sub Main()
    Set fMainForm = New frmMain
    fMainForm.Show
End Sub
Public Function ConnectString() As String
   ConnectString = "DSN=graduateDB;UID=graduateuser;PWD=12345678"
End Function
Public Function ExecuteSQL(ByVal SQL As String, MsgString As String) As ADODB.Recordset
   Dim conn As ADODB.Connection
   Dim rest As ADODB.Recordset
   
   On Error GoTo ExecuteSQL_Error
   
   Set conn = New ADODB.Connection
   conn.Open ConnectString
   Set rest = New ADODB.Recordset
   rest.Open Trim$(SQL), conn, adOpenKeyset, adLockOptimistic
   Set ExecuteSQL = rest
   MsgString = "查询到" & rest.RecordCount & " 条记录 "

ExecuteSQL_Exit:
   Set rest = Nothing
   Set conn = Nothing
   Exit Function
   
ExecuteSQL_Error:
   MsgString = "查询错误: " & _
      Err.Description
   Resume ExecuteSQL_Exit
End Function

Public Function Checktxt(txt As String) As Boolean
    If Trim(txt) = "" Then
        Checktxt = False
    Else
        Checktxt = True
    End If
End Function

