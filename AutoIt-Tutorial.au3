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
			 Case $idOK
				MsgBox(0, "Hinweis", "Btn was pressed")

        EndSwitch
    WEnd

    ; Delete the previous GUI and all controls.
    GUIDelete($hGUI)
 EndFunc   ;==>Example

 ;TEIL 7 Cordmode und Style von GUIControls
 #include <GUIConstantsEx.au3>

Example()

Func Example()
    GUICreate("My GUI") ; will create a dialog box that when displayed is centered

    GUISetHelp("notepad.exe") ; will run notepad if F1 is typed
    Local $iOldOpt = Opt("GUICoordMode", 2)

    Local $iWidthCell = 70
    GUICtrlCreateLabel("Line 1 Cell 1", 10, 30, $iWidthCell) ; first cell 70 width
    GUICtrlCreateLabel("Line 2 Cell 1", -1, 0) ; next line
    GUICtrlCreateLabel("Line 3 Cell 2", 0, 0) ; next line and next cell
    GUICtrlCreateLabel("Line 3 Cell 3", 0, -1) ; next cell same line
    GUICtrlCreateLabel("Line 4 Cell 1", -3 * $iWidthCell, 0) ; next line Cell1

    GUISetState(@SW_SHOW) ; will display an empty dialog box

    ; Loop until the user exits.
    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE
                ExitLoop

        EndSwitch
    WEnd

    $iOldOpt = Opt("GUICoordMode", $iOldOpt)
 EndFunc   ;==>Example

 ;TEIL 8 Primzahlen berechnen
 For $i = 3 to 100 Step 2
   $root = Sqrt($i)
   if $divident > $root then ExitLoop
   For $divident = 3 to $i - 1
	   if Mod($i, $divident) = 0 Then
		  ContinueLoop(2)
		  MsgBox(0, "Hinweis", $i & " ist keine Primzahl")
	   EndIf
	Next
	MsgBox(0, "Hinweis", i$ & " ist eine Primzahl")
 Next

;TEIL 9 MD5-Hash berechnen
  #include <ComboConstants.au3>
#include <Crypt.au3>
#include <GUIConstantsEx.au3>
#include <StringConstants.au3>

Example()

Func Example()
    Local $iAlgorithm = $CALG_SHA1

    Local $hGUI = GUICreate("Hash File", 500, 100)
    Local $idInput = GUICtrlCreateInput(@ScriptFullPath, 5, 5, 200, 20)
    Local $idBrowse = GUICtrlCreateButton("...", 210, 5, 35, 20)
    Local $idCombo = GUICtrlCreateCombo("", 250, 5, 100, 20, $CBS_DROPDOWNLIST)
    GUICtrlSetData($idCombo, "MD2 (128bit)|MD4 (128bit)|MD5 (128bit)|SHA1 (160bit)|SHA_256 (256bit)|SHA_384 (384bit)|SHA_512 (512bit)", "SHA1 (160bit)")
    Local $idCalculate = GUICtrlCreateButton("Calculate", 400, 40, 65, 25)
    Local $idHashLabel = GUICtrlCreateEdit("Hash Digest", 5, 45, 350, 40)
    GUISetState(@SW_SHOW, $hGUI)

    _Crypt_Startup() ; To optimize performance start the crypt library.

    Local $dHash = 0, _
            $sRead = ""
    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE
                ExitLoop

            Case $idBrowse
                Local $sFilePath = FileOpenDialog("Open a file", "", "All files (*.*)") ; Select a file to find the hash.
                If @error Then
                    ContinueLoop
                EndIf
                GUICtrlSetData($idInput, $sFilePath) ; Set the inputbox with the filepath.
                GUICtrlSetData($idHashLabel, "Hash Digest") ; Reset the hash digest label.

            Case $idCombo ; Check when the combobox is selected and retrieve the correct algorithm.
                Switch GUICtrlRead($idCombo) ; Read the combobox selection.
                    Case "MD2 (128bit)"
                        $iAlgorithm = $CALG_MD2

                    Case "MD4 (128bit)"
                        $iAlgorithm = $CALG_MD4

                    Case "MD5 (128bit)"
                        $iAlgorithm = $CALG_MD5

                    Case "SHA1 (160bit)"
                        $iAlgorithm = $CALG_SHA1

                    Case  "SHA_256 (256bit)"
                        $iAlgorithm = $CALG_SHA_256

                    Case "SHA_384 (384bit)"
                        $iAlgorithm = $CALG_SHA_384

                    Case "SHA_512 (512bit)"
                        $iAlgorithm = $CALG_SHA_512

                EndSwitch

            Case $idCalculate
                $sRead = GUICtrlRead($idInput)
                If StringStripWS($sRead, $STR_STRIPALL) <> "" And FileExists($sRead) Then ; Check there is a file available to find the hash digest
                    $dHash = _Crypt_HashFile($sRead, $iAlgorithm) ; Create a hash of the file.
                    GUICtrlSetData($idHashLabel, $dHash) ; Set the hash digest label with the hash data.
                EndIf
        EndSwitch
    WEnd

    GUIDelete($hGUI) ; Delete the previous GUI and all controls.
    _Crypt_Shutdown() ; Shutdown the crypt library.
EndFunc   ;==>Example

;TEIL 10 Files verschlüsseln
#include <ComboConstants.au3>
#include <Crypt.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <StringConstants.au3>

Example()

Func Example()
    Local $iAlgorithm = $CALG_RC4

    Local $hGUI = GUICreate("File Decrypter", 425, 100)
    Local $idSourceInput = GUICtrlCreateInput("", 5, 5, 200, 20)
    Local $idSourceBrowse = GUICtrlCreateButton("...", 210, 5, 35, 20)

    Local $idDestinationInput = GUICtrlCreateInput("", 5, 30, 200, 20)
    Local $idDestinationBrowse = GUICtrlCreateButton("...", 210, 30, 35, 20)

    GUICtrlCreateLabel("Password:", 5, 60, 200, 20)
    Local $idPasswordInput = GUICtrlCreateInput("", 5, 75, 200, 20)

    Local $idCombo = GUICtrlCreateCombo("", 210, 75, 100, 20, $CBS_DROPDOWNLIST)
    GUICtrlSetData($idCombo, "3DES (168bit)|AES (128bit)|AES (192bit)|AES (256bit)|DES (56bit)|RC2 (128bit)|RC4 (128bit)", "RC4 (128bit)")
    Local $idDecrypt = GUICtrlCreateButton("Decrypt", 355, 70, 65, 25)
    GUISetState(@SW_SHOW, $hGUI)

    Local $sDestinationRead = "", $sFilePath = "", $sPasswordRead = "", $sSourceRead = ""
    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE
                ExitLoop

            Case $idSourceBrowse
                $sFilePath = FileOpenDialog("Select a file to decrypt.", "", "All files (*.*)") ; Select a file to decrypt.
                If @error Then
                    ContinueLoop
                EndIf
                GUICtrlSetData($idSourceInput, $sFilePath) ; Set the inputbox with the filepath.

            Case $idDestinationBrowse
                $sFilePath = FileSaveDialog("Save the file as ...", "", "All files (*.*)") ; Select a file to save the decrypted data to.
                If @error Then
                    ContinueLoop
                EndIf
                GUICtrlSetData($idDestinationInput, $sFilePath) ; Set the inputbox with the filepath.

            Case $idCombo ; Check when the combobox is selected and retrieve the correct algorithm.
                Switch GUICtrlRead($idCombo) ; Read the combobox selection.
                    Case "3DES (168bit)"
                        $iAlgorithm = $CALG_3DES

                    Case "AES (128bit)"
                        $iAlgorithm = $CALG_AES_128

                    Case "AES (192bit)"
                        $iAlgorithm = $CALG_AES_192

                    Case "AES (256bit)"
                        $iAlgorithm = $CALG_AES_256

                    Case "DES (56bit)"
                        $iAlgorithm = $CALG_DES

                    Case "RC2 (128bit)"
                        $iAlgorithm = $CALG_RC2

                    Case "RC4 (128bit)"
                        $iAlgorithm = $CALG_RC4

                EndSwitch

            Case $idDecrypt
                $sSourceRead = GUICtrlRead($idSourceInput) ; Read the source filepath input.
                $sDestinationRead = GUICtrlRead($idDestinationInput) ; Read the destination filepath input.
                $sPasswordRead = GUICtrlRead($idPasswordInput) ; Read the password input.
                If StringStripWS($sSourceRead, $STR_STRIPALL) <> "" And StringStripWS($sDestinationRead, $STR_STRIPALL) <> "" And StringStripWS($sPasswordRead, $STR_STRIPALL) <> "" And FileExists($sSourceRead) Then ; Check there is a file available to decrypt and a password has been set.
                    If _Crypt_DecryptFile($sSourceRead, $sDestinationRead, $sPasswordRead, $iAlgorithm) Then ; Decrypt the file.
                        MsgBox($MB_SYSTEMMODAL, "Success", "Operation succeeded.")
                    Else
                        Switch @error
                            Case 2
                                MsgBox($MB_SYSTEMMODAL, "Error", "Couldn't open the source file.")
                            Case 3
                                MsgBox($MB_SYSTEMMODAL, "Error", "Couldn't open the destination file.")
                            Case 30
                                MsgBox($MB_SYSTEMMODAL, "Error", "Failed to create the key.")
                            Case 400 Or 500
                                MsgBox($MB_SYSTEMMODAL, "Error", "Decryption error.")
                            Case Else
                                MsgBox($MB_SYSTEMMODAL, "Error", "Unexpected @error = " & @error)
                        EndSwitch
                    EndIf
                Else
                    MsgBox($MB_SYSTEMMODAL, "Error", "Please ensure the relevant information has been entered correctly.")
                EndIf
        EndSwitch
    WEnd

    GUIDelete($hGUI) ; Delete the previous GUI and all controls.
EndFunc   ;==>Example














