Attribute VB_Name = "aOutlookMail"

Option Explicit

Sub Mail_workbook_Outlook_1()
'Working in 2000-2010
'This example send the last saved version of the Activeworkbook
    Dim OutApp As Object
    Dim OutMail As Object

    Set OutApp = CreateObject("Outlook.Application")
    Set OutMail = OutApp.CreateItem(0)

    On Error Resume Next
    With OutMail
        .To = "binkowski_hankook@hotmail.com"
        .CC = ""
        .BCC = ""
        .Subject = "This is the Subject line"
        .Body = "Hi there"
        .Attachments.Add ActiveWorkbook.FullName
        'You can add other files also like this
        '.Attachments.Add ("C:\test.txt")
        .Send   'or use .Display
    End With
    On Error GoTo 0

    Set OutMail = Nothing
    Set OutApp = Nothing
End Sub


Public Function fSendThunderbird(strTo As String, strSubject As String, strBody As String)

'This function can be used to send an e-mail from Mozilla Thunderbird.
'The syntax for calling Thunderbird from a command line (DOS prompt) is:
'
'thunderbird -compose "mailto:somebody@somewhere?cc=address@provider&subject=hi&body=something"
'
Dim strCommand As String

strCommand = "C:\Program Files (x86)\Mozilla Thunderbird\thunderbird"

strCommand = strCommand & " -compose " & Chr$(34) & "mailto:" & strTo & "?"
strCommand = strCommand & "subject=" & Chr$(34) & strSubject & Chr$(34) & "&"
strCommand = strCommand & "body=" & Chr$(34) & strBody & Chr$(34)

Call Shell(strCommand, vbNormalFocus)

End Function


Sub aadfsa()
    fSendThunderbird "binkowski_hankook@hotmail.com", "adfad", "asdfdasf"
End Sub

