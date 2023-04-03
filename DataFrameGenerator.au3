#include "Interface/main.au3"
#include <GuiEdit.au3>
#include <Array.au3>

HotKeySet("{ESC}", "Terminate")

Func Terminate()
	Exit 1
EndFunc

Func Print($strText)
	ConsoleWrite($strText & @CRLF)
EndFunc

Func GetRandomValueFromNumRange($arRange, $bInteger)
	if $bInteger Then 
		$nRandomNumber = Random($arRange[0], $arRange[1], 1)
	Else 
		$nRandomNumber = Random($arRange[0], $arRange[1])
	EndIf

	Return Round($nRandomNumber, 6)
EndFunc

Func GetRandomValueFromStringRange($arRange)
	$nRandomIndex = Random(1, UBound($arRange) -1, 1)
	
	Return $arRange[$nRandomIndex]
EndFunc

Func GetRangeFromLine($arLine)
	Local $strLeftSide = ""
	Local $strRightSide = ""
	Local $bLeftSide = False
	Local $bRightSide = False

	For $i = 1 to UBound($arLine)-1
		$strLineChar = $arLine[$i]
		If $strLineChar == ']' Then
			ExitLoop
		ElseIf $strLineChar == '-' Then
			$bLeftSide = False
			$bRightSide = True
		ElseIf $strLineChar == '[' Then
			$bLeftSide = True
		ElseIf $bLeftSide Then
			$strLeftSide = $strLeftSide & $strLineChar
		ElseIf $bRightSide Then
			$strRightSide = $strRightSide & $strLineChar
		EndIf
	Next

	If Not $bRightSide Then 
		$arRange = StringSplit($strLeftSide,  ",")
		Return $arRange
	Else 
		Local $arRange[2] = [$strLeftSide, $strRightSide]
		Return $arRange 
	EndIf	
EndFunc

Func OccurencesInString($strString, $strCharToCheck)
	StringReplace($strString, $strCharToCheck, " ")
	Return @extended
EndFunc

Func HandleBtnGenerate($strRules)
	; Rules:
	; types: 'n' = Integer, 'f' = float, 'c' = char/string
	; range: n[1-10], f[1.0-10.0], c[sim,nao,talvez]
	;
	; Primeira linha deve informar as colunas
	; Segunda linha a quantidade de linhas
	; Demais linhas as especificações dos elementos das colunas
	; Exemplo:
	; aluno, nota, status
	; 10
	; c[Rogerio, Ricardo, Emanuela, Carla, Flavia, Guilherme]
	; f[0-10]
	; c["aprovado", "reprovado", "exame"]
	$nColumns = OccurencesInString(_GUICtrlEdit_GetLine($edtRules, 0), ",") + 1
	$nLines = _GUICtrlEdit_GetLine($edtRules, 1)
	
	Local $arResult[$nColumns]
	Local $nCurrentColumn = 0
	For $nCurrentLine = 2 To _GUICtrlEdit_GetLineCount($edtRules)
		$strLine = _GUICtrlEdit_GetLine($edtRules, $nCurrentLine)
		$arLine = StringSplit($strLine, "")
		If UBound($arLine) < 2 Then 
			ExitLoop 
		EndIf
		$arRange = GetRangeFromLine($arLine)
		
		For $nAux = 0 To $nLines - 1
			If $arLine[1] == 'c' Then
				$arResult[$nCurrentColumn] = $arResult[$nCurrentColumn] & GetRandomValueFromStringRange($arRange) &  ","
			ElseIf $arLine[1] == 'f' Then 
				$arResult[$nCurrentColumn] = $arResult[$nCurrentColumn] & GetRandomValueFromNumRange($arRange, False) &  ","
			ElseIf $arLine[1] == 'n' Then
				$arResult[$nCurrentColumn] = $arResult[$nCurrentColumn] & GetRandomValueFromNumRange($arRange, True) &  ","
			EndIf
		Next
		$arResult[$nCurrentColumn] = StringTrimRight($arResult[$nCurrentColumn], 1) ; Remove a vírgula que vai sobrar
		;$arResult[$nCurrentColumn] = $arResult[$nCurrentColumn] & @CRLF
		$nCurrentColumn =  $nCurrentColumn + 1
	Next
	
	Local $marResult[$nColumns]
	
	For $i = 0 To UBound($arResult) -1
		$strLinha = StringSplit($arResult[$i], ",")
		$marResult[$i] = $strLinha	
	Next	
	
	Print("Result : ")
	$strResult = _GUICtrlEdit_GetLine($edtRules, 0) & @CRLF
	For $i = 1 To $nLines
		For $j = 0 To UBound($marResult) -1
			$arColuna = $marResult[$j]
			$strResult = $strResult & $arColuna[$i] & "," 
		Next
		$strResult = StringTrimRight($strResult, 1) ; Remove a vírgula que vai sobrar
		$strResult = $strResult & @CRLF
	Next
	$strResult = StringReplace($strResult, " ", "")
	ConsoleWrite($strResult)
	$strArquivo = 'my_db.dataset_test_obter_cortes_otimos.csv'
	FileOpen($strArquivo, $FO_READ + $FO_OVERWRITE)
	FileWrite($strArquivo, $strResult)
EndFunc

While 1
	Sleep(20)
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $btnGenerate
			HandleBtnGenerate(GUICtrlRead($edtRules))
	EndSwitch
WEnd