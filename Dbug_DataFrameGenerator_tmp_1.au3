#Include-Once
EnvSet("___SrcFullPath", "C:\Users\guilherme.tocchetto\Documents\source\ZelpTools\scripts\DataFrameGenerator\DataFrameGenerator_tmp.au3")
#Include <C:\Program Files (x86)\ISN AutoIt Studio\Data\Dbug\Dbug.au3>
#include "Interface/main.au3"
#include <GuiEdit.au3>

DBG_GetExtErr()
Execute(Dbug(5))
SetError($DBG_Error, $DBG_Extended)
HotKeySet("{ESC}", "Terminate")

Func Terminate()
DBG_GetExtErr()
Execute(Dbug(8))
SetError($DBG_Error, $DBG_Extended)
	Exit 1
DBG_GetExtErr()
Execute(Dbug(9))
SetError($DBG_Error, $DBG_Extended)
EndFunc

Func Print($strText)
DBG_GetExtErr()
Execute(Dbug(12))
SetError($DBG_Error, $DBG_Extended)
	DBG_ConsoleWrite($strText & @CRLF)
DBG_GetExtErr()
Execute(Dbug(13))
SetError($DBG_Error, $DBG_Extended)
EndFunc

Func GetRangeFromLine($arLine)
DBG_GetExtErr()
Execute(Dbug(16))
SetError($DBG_Error, $DBG_Extended)
	Local $strLeftSide = ""
DBG_GetExtErr()
Execute(Dbug(17))
SetError($DBG_Error, $DBG_Extended)
	Local $strRightSide = ""
DBG_GetExtErr()
Execute(Dbug(18))
SetError($DBG_Error, $DBG_Extended)
	Local $bLeftSide = False
DBG_GetExtErr()
Execute(Dbug(19))
SetError($DBG_Error, $DBG_Extended)
	Local $bRightSide = False

DBG_GetExtErr()
Execute(Dbug(21))
SetError($DBG_Error, $DBG_Extended)
	For $i = 1 to UBound($arLine)-1
DBG_GetExtErr()
Execute(Dbug(22))
SetError($DBG_Error, $DBG_Extended)
		$strLineChar = $arLine[$i]
DBG_GetExtErr()
Execute(Dbug(23))
SetError($DBG_Error, $DBG_Extended)
		If $strLineChar == ']' Then
DBG_GetExtErr()
Execute(Dbug(24))
SetError($DBG_Error, $DBG_Extended)
			ExitLoop
DBG_GetExtErr()
Execute(Dbug(25))
SetError($DBG_Error, $DBG_Extended)
		ElseIf $strLineChar == '-' Then
DBG_GetExtErr()
Execute(Dbug(26))
SetError($DBG_Error, $DBG_Extended)
			$bLeftSide = False
DBG_GetExtErr()
Execute(Dbug(27))
SetError($DBG_Error, $DBG_Extended)
			$bRightSide = True
DBG_GetExtErr()
Execute(Dbug(28))
SetError($DBG_Error, $DBG_Extended)
		ElseIf $strLineChar == '[' Then
DBG_GetExtErr()
Execute(Dbug(29))
SetError($DBG_Error, $DBG_Extended)
			$bLeftSide = True
DBG_GetExtErr()
Execute(Dbug(30))
SetError($DBG_Error, $DBG_Extended)
		ElseIf $bLeftSide Then
DBG_GetExtErr()
Execute(Dbug(31))
SetError($DBG_Error, $DBG_Extended)
			$strLeftSide = $strLeftSide & $strLineChar
DBG_GetExtErr()
Execute(Dbug(32))
SetError($DBG_Error, $DBG_Extended)
		ElseIf $bRightSide Then
DBG_GetExtErr()
Execute(Dbug(33))
SetError($DBG_Error, $DBG_Extended)
			$strRightSide = $strRightSide & $strLineChar
DBG_GetExtErr()
Execute(Dbug(34))
SetError($DBG_Error, $DBG_Extended)
		EndIf
DBG_GetExtErr()
Execute(Dbug(35))
SetError($DBG_Error, $DBG_Extended)
	Next

DBG_GetExtErr()
Execute(Dbug(37))
SetError($DBG_Error, $DBG_Extended)
	Local $arRange[2] = [$strLeftSide, $strRightSide]
DBG_GetExtErr()
Execute(Dbug(38))
SetError($DBG_Error, $DBG_Extended)
	Return $arRange
DBG_GetExtErr()
Execute(Dbug(39))
SetError($DBG_Error, $DBG_Extended)
EndFunc

Func HandleBtnGenerate($strRules)













DBG_GetExtErr()
Execute(Dbug(55))
SetError($DBG_Error, $DBG_Extended)
	Print($strRules)
DBG_GetExtErr()
Execute(Dbug(56))
SetError($DBG_Error, $DBG_Extended)
	$nLines = _GUICtrlEdit_GetLine($edtRules, 2)
DBG_GetExtErr()
Execute(Dbug(57))
SetError($DBG_Error, $DBG_Extended)
	$strResult = _GUICtrlEdit_GetLine($edtRules, 1)
DBG_GetExtErr()
Execute(Dbug(58))
SetError($DBG_Error, $DBG_Extended)
	For $nCurrentLine = 2 To _GUICtrlEdit_GetLineCount($edtRules)
DBG_GetExtErr()
Execute(Dbug(59))
SetError($DBG_Error, $DBG_Extended)
		$strLine = _GUICtrlEdit_GetLine($edtRules, $nCurrentLine)
DBG_GetExtErr()
Execute(Dbug(60))
SetError($DBG_Error, $DBG_Extended)
		$arLine = StringSplit($strLine, "")
DBG_GetExtErr()
Execute(Dbug(61))
SetError($DBG_Error, $DBG_Extended)
		Print("Range: " & GetRangeFromLine($arLine))




DBG_GetExtErr()
Execute(Dbug(66))
SetError($DBG_Error, $DBG_Extended)
	Next
DBG_GetExtErr()
Execute(Dbug(67))
SetError($DBG_Error, $DBG_Extended)
EndFunc

DBG_GetExtErr()
Execute(Dbug(69))
SetError($DBG_Error, $DBG_Extended)
While 1
DBG_GetExtErr()
Execute(Dbug(70))
SetError($DBG_Error, $DBG_Extended)
	Sleep(20)
DBG_GetExtErr()
Execute(Dbug(71))
SetError($DBG_Error, $DBG_Extended)
	$nMsg = GUIGetMsg()
DBG_GetExtErr()
Execute(Dbug(72))
SetError($DBG_Error, $DBG_Extended)
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
DBG_GetExtErr()
Execute(Dbug(74))
SetError($DBG_Error, $DBG_Extended)
			Exit
		Case $btnGenerate
DBG_GetExtErr()
Execute(Dbug(76))
SetError($DBG_Error, $DBG_Extended)
			HandleBtnGenerate(GUICtrlRead($edtRules))
DBG_GetExtErr()
Execute(Dbug(77))
SetError($DBG_Error, $DBG_Extended)
	EndSwitch
DBG_GetExtErr()
Execute(Dbug(78))
SetError($DBG_Error, $DBG_Extended)
WEnd


Func DBG_PreSet()
	Local $tmp
	$DBG_ExistLines = " 5 8 9 12 13 16 17 18 19 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 37 38 39 55 56 57 58 59 60 61 66 67 69 70 71 72 74 76 77 78 "
	Dim $DBG_FunVars[5][2]
	$DBG_FunVars[0][0] = "Global"
	$DBG_FunVars[0][1] = "$btnGenerate¦$edtRules¦$GUI_EVENT_CLOSE¦$nMsg"
	$DBG_FunVars[1][0] = "Terminate"
	$DBG_FunVars[1][1] = ""
	$DBG_FunVars[2][0] = "Print"
	$DBG_FunVars[2][1] = "$strText"
	$DBG_FunVars[3][0] = "GetRangeFromLine"
	$DBG_FunVars[3][1] = "$arLine¦$arRange¦$bLeftSide¦$bRightSide¦$i¦$strLeftSide¦$strLineChar¦$strRightSide"
	$DBG_FunVars[4][0] = "HandleBtnGenerate"
	$DBG_FunVars[4][1] = "$arLine¦$edtRules¦$nCurrentLine¦$nLines¦$strLine¦$strResult¦$strRules"
	$tmp = "Global Global Global Global Global Global Global Terminate Terminate Terminate Global Print Print Print Global GetRangeFromLine GetRangeFromLine GetRangeFromLine GetRangeFromLine GetRangeFromLine"
	$tmp &= " GetRangeFromLine GetRangeFromLine GetRangeFromLine GetRangeFromLine GetRangeFromLine GetRangeFromLine GetRangeFromLine GetRangeFromLine GetRangeFromLine GetRangeFromLine GetRangeFromLine"
	$tmp &= " GetRangeFromLine GetRangeFromLine GetRangeFromLine GetRangeFromLine GetRangeFromLine GetRangeFromLine GetRangeFromLine GetRangeFromLine GetRangeFromLine Global HandleBtnGenerate HandleBtnGenerate"
	$tmp &= " HandleBtnGenerate HandleBtnGenerate HandleBtnGenerate HandleBtnGenerate HandleBtnGenerate HandleBtnGenerate HandleBtnGenerate HandleBtnGenerate HandleBtnGenerate HandleBtnGenerate HandleBtnGenerate"
	$tmp &= " HandleBtnGenerate HandleBtnGenerate HandleBtnGenerate HandleBtnGenerate HandleBtnGenerate HandleBtnGenerate HandleBtnGenerate HandleBtnGenerate HandleBtnGenerate HandleBtnGenerate HandleBtnGenerate"
	$tmp &= " HandleBtnGenerate HandleBtnGenerate HandleBtnGenerate Global Global Global Global Global Global Global Global Global Global Global Global "
	$DBG_LineFun = StringRegExp($tmp, "(\S+)", 3)
	$DBG_LineFun[0] = 0
	$DBG_FunVarsOrg = $DBG_FunVars
	Return 1
EndFunc
