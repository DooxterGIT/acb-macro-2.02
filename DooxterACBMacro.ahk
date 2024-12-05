#Persistent

; Get the directory of the script
ScriptDir := A_ScriptDir

; Create the GUI
Gui, Add, Button, gRunHC w40, HC
Gui, Add, Button, gRunREG w40, REG
Gui, Add, Button, gRunGUILD w40, GUILD

; Make the GUI always on top
Gui, +AlwaysOnTop

; Add an image to the bottom of the GUI, and move it up using a relative path
ImagePath := ScriptDir . "\\Settings\\Images\\dooxteracb.png"
Gui, Add, Picture, vImagePic, %ImagePath%

; Set the window size (135x165)
Gui, Show, x1720 y162 w145 h165, Simple GUI  ; Adjusted x from 1748 to 1720

; Position buttons next to each other at the top and center them
GuiControl, Move, Button1, x10 y10  ; First button (HC)
GuiControl, Move, Button2, x55 y10  ; Second button (REG)
GuiControl, Move, Button3, x100 y10 ; Third button (GUILD)
GuiControl, Disable, RunGUILD 

; Move the image up (adjust y-position)
GuiControl, Move, ImagePic, x15, y40  ; Move the image higher so it's not cut off

return

; Define the "HC" button action
RunHC:
    HCPath := ScriptDir . "\\Settings\\HCinf.ahk"  ; Path to the HC mango script
    Run, %HCPath%
    return

; Define the "REG" button action
RunREG:
    REGPath := ScriptDir . "\\Settings\\REGinf.ahk"  ; Path to the REG mango script
    Run, %REGPath%
    return

; Define the "GUILD" button action
RunGUILD:
    Msgbox, This feature isnt added yet
    ;REGPath := ScriptDir . "\\Settings\\REGinf.ahk"  ; Path to the REG mango script
    ;Run, %path%
    return

GuiClose:
    ExitApp
