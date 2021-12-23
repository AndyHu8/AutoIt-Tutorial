#comments-start
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
#comments-start
Hallo
#comments-end
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
#comments-end

;TEIL 5 ARRAYS












