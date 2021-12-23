;TEIL 1 EINLEITUNG
;Hello World
$Name = "Andy"
MsgBox(64, "Tutorial", $Name)
MsgBox(0, "Tutorial", "Hallo")

;EVA (Eingabe, Verarbeitung, Ausgabe)
Local $Answer = InputBox("Question", "Darf ich was fragen?") ;Answer ist die Eingabe vom User
MsgBox(64, "Answer", $Answer & " OK DU HUND") ;& = Conca

;TEIL 2 VARIABLEN
$sName = "Name"
$iAlter = 22
$bHatBrille = False
$iSumme = 12
$sVorname = "Andy"
$sNachname = '"Hu"'
$sVollerName = $sVorname & " " & $sNachname
ConsoleWrite(@CRLF & $sVollerName) ;@CRLF = leere Zeilen

$iJahr = 1990 + $iSumme
ConsoleWrite("Aktuelles Jahr: " & $iJahr)

;TEIL 3 SCHLEIFEN
$zBier = 10
while $zBier >= 1 ;while 1 (Endlos)
   ;nimm eine weg
   $zBier = $zBier - 1
   ConsoleWrite("Anzahl Bier: " & $zBier & " ")
WEnd

For $i = 5 To 1 Step -1
   ConsoleWrite("Anzahl Bier: " & $i & " ")
Next

;TEIL 4 FUNKTIONEN
Func berechne_summe($summand1, $summand2)
   $summe = $summand1 + $summand2
   Return $summe
EndFunc
Local $summe = berechne_summe(1, 2)
MsgBox(0, "", $summe)

;TEIL 5 ARRAYS
#include <array.au3> ;wie Biblio => gibt fkt.
$array[2]
$array[0] = "erster eintrag"
$array[1] = "zweiter eintrag"
$aArray_1[12] = [3, 7.5, "string"]
$aaArray_2[2][4] = [1, 2, 3, 4], [5, 6, 7, 8]
_ArrayDisplay($aArray)

;TEIL 6 GUI und Buttons
#include <GUIConstantsEx.au3>

Example()

Func Example()
    ; Create a GUI with various controls.
    Local $hGUI = GUICreate("Example")
    Local $idOK = GUICtrlCreateButton("OK", 310, 370, 85, 25)

    ; Display the GUI.
    GUISetState(@SW_SHOW, $hGUI)

    ; Loop until the user exits.
    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE, $idOK
                ExitLoop

        EndSwitch
    WEnd

    ; Delete the previous GUI and all controls.
    GUIDelete($hGUI)
 EndFunc   ;==>Example

 ;TEIL 7 Cordmode und Style von GUIControls













