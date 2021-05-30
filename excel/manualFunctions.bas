Attribute VB_Name = "manualFunctions"
Option Explicit

Public Declare PtrSafe Function SetCurrentDirectoryA Lib "kernel32" (ByVal lpPathName As String) As Long



Sub deleteAllNames()
    Dim bef As XlCalculation
    Dim n As Name
    On Error GoTo bladmanage
    
    bef = Application.Calculation
    Application.Calculation = xlCalculationManual
    
    On Error Resume Next
    For Each n In ActiveWorkbook.Names
        n.Delete
    Next n
    On Error GoTo 0
    
bladmanage:
    Application.Calculation = bef
    
    
End Sub

Sub ChangeIFNAtoIFERROR()
    Cells.Replace What:="_xlfn.IFNA", Replacement:="JE¯ELI.B£¥D", LookAt:= _
        xlPart, SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    ActiveSheet.Calculate
End Sub


Sub aaaZamienCaiNaTekst()
    Dim iCol As Integer
    Dim lEndRow As Long
    
    iCol = ActiveCell.column
    lEndRow = ActiveCell.End(xlDown).row
    
    Call ChngeIntToTxt(iCol, 6, lEndRow)
End Sub

Sub ZamienLiczbeNaTekst()
    Dim iCol As Integer
    Dim lEndRow As Long
    Dim iDlug As Integer
    Dim lFstRw As Long
    Const lRowBorder As Long = 65536
    
    
    iDlug = Application.InputBox("Jaka ma byc dlugosc ciagu cyfr?", "Wpisz wartosc", 6)
    If iDlug < 1 Or iDlug > 2147483647 Then MsgBox ("Wprowadzono nieprawidlowa liczbe. Koncze"): Exit Sub
    
    lFstRw = Application.InputBox("Od ktorego wiersza zaczac?", "Wpisz wartosc", 2)
    If lFstRw < 1 Or lFstRw > lRowBorder Then MsgBox ("Wprowadzono nieprawidlowa liczbe. Koncze"): Exit Sub

    iCol = ActiveCell.column
    'lEndRow = Cells(1, iCol).SpecialCells(xlLastCell).Row
    lEndRow = Cells(Rows.Count, iCol).End(xlUp).row
    
    Call ChngeIntToTxt(iCol, iDlug, lEndRow, lFstRw)
End Sub

Private Sub ChngeIntToTxt(iColNo As Integer, iDlug As Integer, _
            Optional lLastRow As Long, Optional lFirstRow As Long = 2)
    Dim cel As Range
    Dim b As Boolean
    'If IsMissing(lLastRow) Then lLastRow = 65536
    If lLastRow = 0 Then lLastRow = Cells(1, iColNo).SpecialCells(xlLastCell).row
    

'    If Application.CountIf(Range(Cells(lFirstRow, iColNo), Cells(lLastRow, iColNo)), ">10 ^ iDlug - 1") > 0 Then
'        MsgBox ("Niektore komorki maja dlugosc ciagu wieksza niz " & iDlug & _
'            " znakow. Przebieg makra spowodowalby uciecie czesci wartosci dla tych komorek. Koncze")
'        Exit Sub
'    End If

'''''''''''''''''''''''''''''''''''
' to be corrected:
    b = False
    For Each cel In ActiveSheet.Range(Cells(lFirstRow, iColNo), Cells(lLastRow, iColNo))
        If Len(cel.Value) > iDlug Then b = True
    Next cel
    If b = True Then MsgBox ("Niektore komorki maja dlugosc ciagu wieksza niz " & iDlug & _
            " znakow. Przebieg makra spowodowalby uciecie czesci wartosci dla tych komorek. Koncze"): Exit Sub
'''''''''''''''''''''''''''''''''''
    ActiveSheet.Columns(iColNo).NumberFormat = "@"
    For Each cel In ActiveSheet.Range(Cells(lFirstRow, iColNo), Cells(lLastRow, iColNo))
        If cel.Value <> "" Then cel.Value = Right(String(iDlug, "0") & cel.Value, iDlug)
    Next cel
End Sub


Sub TestNumericValue()
    Dim r As Range
    Dim sR As String
    
    sR = InputBox("Ktora komorke sprawdzic?")
    If sR = "" Then MsgBox "Nic nie wpisano. Koncze": Exit Sub
    Set r = ActiveSheet.Range("A2")
    
    If r.Value < 0 Then MsgBox "<0"
    If r.Value = 0 Then MsgBox "=0"
    If r.Value < 0 And r.Value < 1 Then MsgBox "(0,1)"
    If r.Value = 1 Then MsgBox "=1"
    If r.Value > 1 Then MsgBox ">1"
End Sub


Private Sub LargeFileImport()

      'Dimension Variables
      Dim ResultStr As String
      Dim FileName As String
      Dim FileNum As Integer
      Dim Counter As Double
      'Ask User for File's Name
      FileName = InputBox("Please enter the Text File's name, e.g. test.txt (must be in My Documents")
      'Check for no entry
      If FileName = "" Then End
      'Get Next Available File Handle Number
      FileNum = FreeFile()
      'Open Text File For Input
      Open FileName For Input As #FileNum
      'Turn Screen Updating Off
      Application.ScreenUpdating = False
      'Create A New WorkBook With One Worksheet In It
      Workbooks.Add TEMPLATE:=xlWorksheet
      'Set The Counter to 1
      Counter = 1
      'Loop Until the End Of File Is Reached
      Do While Seek(FileNum) <= LOF(FileNum)
         'Display Importing Row Number On Status Bar
          Application.StatusBar = "Importing Row " & _
             Counter & " of text file " & FileName
          'Store One Line Of Text From File To Variable
          Line Input #FileNum, ResultStr
          'Store Variable Data Into Active Cell
          If Left(ResultStr, 1) = "=" Then
             ActiveCell.Value = "'" & ResultStr
          Else
             ActiveCell.Value = ResultStr
          End If
          
          'For Excel versions before Excel 97, change 65536 to 16384
          If ActiveCell.row = 65536 Then
             'If On The Last Row Then Add A New Sheet
             ActiveWorkbook.Sheets.Add
          Else
             'If Not The Last Row Then Go One Cell Down
             ActiveCell.Offset(1, 0).Select
          End If
          'Increment the Counter By 1
          Counter = Counter + 1
      'Start Again At Top Of 'Do While' Statement
      Loop
      'Close The Open Text File
      Close
      'Remove Message From Status Bar
      Application.StatusBar = False

   End Sub



Sub ZmianaWierszyNaKolumny()
    Dim wiersz As Integer
    Dim Kolumna As Integer
    Dim i As Integer
    Dim j As Integer
    
    For i = 1 To 250
        For j = 1 To 250
            Cells(i, j).Select
            ActiveCell.Value = ActiveSheet.Cells(j, i).Value
        Next j
    Next i
        
        
End Sub



Sub CreateCSVsemicolon()

    Dim rCell As Range
    Dim rRow As Range
    Dim sOutput As String
    Dim sFname As String, lFnum As Long
        
    'Open a text file to write
    sFname = "C:\MyCsv.csv"
    lFnum = FreeFile
    
    Open sFname For Output As lFnum
    'Loop through the rows'
        For Each rRow In ActiveSheet.UsedRange.Rows
        'Loop through the cells in the rows'
        For Each rCell In rRow.Cells
            sOutput = sOutput & rCell.Value & ";"
        Next rCell
         'remove the last semicolon'
        sOutput = Left(sOutput, Len(sOutput) - 1)
        
        'write to the file and reinitialize the variables'
        Print #lFnum, sOutput
        sOutput = ""
     Next rRow
    
    'Close the file'
    Close lFnum
    
End Sub


Sub NoSumsPivot()
    Dim oPole As Object
    Dim bTablica(11) As Boolean
    Dim i As Integer
On Error GoTo bladmanage
Application.ScreenUpdating = False

    For i = LBound(bTablica) To UBound(bTablica)
        bTablica(i) = False
    Next i
    
    For Each oPole In ActiveSheet.PivotTables(1).PivotFields
        oPole.Subtotals = bTablica
    Next
    ActiveWorkbook.ShowPivotTableFieldList = False
    
    GoTo koniec
bladmanage:
        MsgBox "Wystapil blad:" & vbNewLine & "'" & Err.Description & "'"
koniec:
    Application.ScreenUpdating = True
End Sub


Sub ZnajdzZnakiPozaASCII()
'ActiveSheet.Cells.Replace Chr(141), Chr(163)
Dim i As Integer
Dim a
Dim c() As String
ReDim c(0)

For i = 0 To 31
    Set a = Selection.Cells.Find(Chr(i))
    If Not a Is Nothing Then
        ReDim Preserve c(UBound(c) + 1)
        c(UBound(c)) = i & " - " & Chr(i) & " - " & a.Text
    End If
Next i
For i = 127 To 255
    Set a = Selection.Cells.Find(Chr(i))
    If Not a Is Nothing Then
        ReDim Preserve c(UBound(c) + 1)
        c(UBound(c)) = i & " - " & Chr(i) & " - " & a.Text
    End If
Next i
Worksheets.Add
For i = 1 To UBound(c)
    ActiveSheet.Cells(i, 1).Value = c(i)
Next i
End Sub


Public Function myWypiszKodyAscii(r As Range)
    Dim i As Integer
    Dim s As String
    For i = 1 To Len(r.Text)
        Debug.Print Asc(Mid(r.Text, i, 1))
        s = s & Mid(r.Text, i, 1) & " - " & Asc(Mid(r.Text, i, 1)) & ", "
    Next i
    WypiszKodyAscii = s
End Function


Sub myChangeRefernceStyle()
    If Application.ReferenceStyle = xlR1C1 Then
        Application.ReferenceStyle = xlA1
    Else
        Application.ReferenceStyle = xlR1C1
    End If
End Sub




Private Function IsDriveAvailable(Drive As String) As Boolean
    Dim myDrive As String
    On Error Resume Next
    myDrive = Dir(Left(Drive, 1) & ":\", 21)
    If myDrive = "" Or IsError(myDrive) Then IsDriveAvailable = False Else IsDriveAvailable = True
    Err.Clear
End Function


Sub myUnProtectSelectedSheets()
    Dim a As Sheets
    Dim b As Worksheet
    Set a = ActiveWindow.SelectedSheets
    For Each b In a
        b.Select
        b.Unprotect
    Next b
End Sub



Sub myAddIfError()
    Dim cell As Range
    For Each cell In Selection
        If cell.FormulaR1C1 <> "" Then
            cell.FormulaR1C1Local = "=JE¯ELI.B£¥D(" & Right(cell.FormulaR1C1Local, Len(cell.FormulaR1C1Local) - 1) & ";0)"
        End If
    Next cell
End Sub


Sub pivotFieldsToSum()
    Dim pf As PivotField
    Dim pt As PivotTable
    Dim r As Range
    Dim s As String
    
    For Each pt In ActiveSheet.PivotTables
        Set r = ActiveSheet.Cells.Find("Liczba z")
        Do While Not r Is Nothing
            s = r.FormulaR1C1
            With pt.PivotFields(s)
                .Caption = "Suma z " & Right(s, Len(s) - 8)
                .Function = xlSum
            End With
            Set r = ActiveSheet.Cells.Find("Liczba z")
        Loop
    Next pt

                
' nie dziala, bo jak szukam po wszystkich pivotfields, jako nazwa jest nie licznik a sama nazwa kolumny
' i wedlug excela to jest jako hidden a nie w datafiled

'    For Each pt In ActiveSheet.PivotTables
'        Debug.Print pt.Name
'        With pt.PivotFields("Liczba z 2010M01")
'            Debug.Print .Orientation
'        End With
        'For Each pf In pt.PivotFields
        '    Debug.Print pf.Name & " - " & pf.Caption
        '    If pf.Caption = "Liczba z 2010M01" Then Debug.Print pf.Function
        '    If pf.Orientation = xlDataField Then pf.Function = xlSum
        'Next pf
'    Next pt
    
'    With ActiveSheet.PivotTables("Tabela przestawna1").PivotFields( _
'        "Liczba z 2010M01")
'        .Caption = "Suma z 2010M01"
'        .Function = xlSum
 '   End With
End Sub


Sub restrictChangePivotStructure()
    Dim wks As Worksheet
    Dim pvt As PivotTable
    Dim pf As PivotField
    Set wks = ActiveSheet
    For Each pvt In wks.PivotTables
        With pvt
            .PivotCache.EnableRefresh = True
            .EnableWizard = False
            .EnableFieldList = False
            .EnableFieldDialog = False
            .EnableDrilldown = False
            For Each pf In .PivotFields
                With pf
                    .DragToPage = False
                    .DragToRow = False
                    .DragToColumn = False
                    .DragToData = False
                    .DragToHide = False
                End With
            Next pf
        End With
    Next pvt
End Sub





Sub PurgeMissingPivotItems()
    Dim wks As Worksheet
    Dim pvt As PivotTable
    Set wks = ActiveSheet
    For Each pvt In wks.PivotTables
        Call DeleteMissingPivotItems(pvt, wks.Parent)
    Next pvt
End Sub

Sub DeleteMissingPivotItems(pt As PivotTable, wb As Workbook)
'prevents unused items in non-OLAP PivotTables
'pivot table tutorial by contextures.com
Dim pc As PivotCache

'change the settings
    pt.PivotCache.MissingItemsLimit = xlMissingItemsNone

'refresh all the pivot caches
For Each pc In wb.PivotCaches
  On Error Resume Next
  pc.Refresh
Next pc

On Error GoTo 0

End Sub


Sub pivotFieldsThousants()
    Dim pf As PivotField
    Dim pt As PivotTable
    
    For Each pt In ActiveSheet.PivotTables
        For Each pf In pt.DataFields
            If pf.Function = xlSum Then pf.NumberFormat = "#,##0;[Red]-#,##0;"""""
        Next pf
    Next pt
End Sub

Sub resetUsedRange()
    Application.ActiveSheet.UsedRange
    
End Sub

