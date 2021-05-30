Attribute VB_Name = "forCode"
Sub LastRowSelect()
    Cells(LastRow, ActiveCell.column).Select
End Sub

Private Function LastRow() As Long
    LastRow = ActiveSheet.UsedRange.row + _
        ActiveSheet.UsedRange.Rows.Count - 1
End Function

Sub FillTillLastRow()
    Range(Cells(ActiveCell.row, ActiveCell.column), _
            Cells(LastRow, ActiveCell.column)).FillDown
End Sub

Sub CopyColumnAndPasteAsValues()
    Selection.Columns.Copy
    Cells(1, Selection.column).PasteSpecial xlPasteValues
    Application.CutCopyMode = False
End Sub

Public Function isThereTable(wb As Workbook) As Boolean
    Dim lo As ListObject
    Dim ws As Worksheet
    On Error GoTo 0

    For Each ws In wb.Sheets
        For Each lo In ws.ListObjects
            isThereTable = True
        Next lo
    Next ws
    
catch:
    isThereTable = False
End Function





