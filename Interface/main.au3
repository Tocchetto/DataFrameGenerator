#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=C:\Users\guilherme.tocchetto\Documents\source\ZelpTools\scripts\DataFrameGenerator\Forms\Form1.kxf
$Form1 = GUICreate("Form1", 297, 150, 692, 249)
$btnGenerate = GUICtrlCreateButton("Generate!", 216, 120, 75, 25)
$edtRules = GUICtrlCreateEdit("", 8, 8, 281, 105)
GUICtrlSetData(-1, "edtRules")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

GUICtrlSetData($edtRules, "")
