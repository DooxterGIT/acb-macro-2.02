MsgBox, MUST READ: Please wait like 5-10 seconds after clicking save to actually start the script by pressing f1. This is to allow the whole macro to load.

#SingleInstance Force

; Scale factor based on 1920x1080 reference resolution
global ScaleX := A_ScreenWidth / 1920
global ScaleY := A_ScreenHeight / 1080

Gui, Add, Tab, vTabControl gUpdateTab, Main Settings|Advanced Settings

; Main Settings (Tab 1)
Gui, Tab, Main Settings
Gui, Add, Text,, Enter your challenge time in milliseconds:
Gui, Add, Text,, F1 to start!
Gui, Add, Edit, vSleepTime Number, 135000 ; Default value in milliseconds
Gui, Add, Button, gStartScript, Save
Gui, Add, Text,, Make sure to click "Save"`nso the macro uses your timing.`nclick the X at the top to close.`nusing f3 will also close the macro.

; Advanced Settings (Tab 2)
Gui, Tab, Advanced Settings

Gui, Add, Button, gHeroicLastStand, HeroicLastStand
Gui, Add, Button, gVengeancePath, VengeancePath

Gui, Add, Text,, WKeySleep: ; Label for WKeySleep
Gui, Add, Edit, vWKeySleep Number w50, 1400 ; Default for WKeySleep (50px wide)

Gui, Add, Text,, AKeySleep: ; Label for AKeySleep
Gui, Add, Edit, vAKeySleep Number w50, 1220 ; Default for AKeySleep (50px wide)

Gui, Add, Text,, InfW1KeySleep: ; Label for InfW1KeySleep
Gui, Add, Edit, vInfW1KeySleep Number w50, 100 ; Default for InfW1KeySleep (50px wide)

Gui, Add, Text,, InfDKeySleep: ; Label for InfW2KeySleep
Gui, Add, Edit, vInfW2KeySleep Number w50, 1200 ; Default for InfW2KeySleep (50px wide)

Gui, Add, Text,, Ignore this box: ; Label for InfDKeySleep
Gui, Add, Edit, vInfDKeySleep Disabled w50, 1800 ; Default for InfDKeySleep (50px wide)

; Show GUI with initial dimensions for Main Settings tab
Gui, Show, w217 h200, DooxterACB
return

UpdateTab:
GuiControlGet, CurrentTab,, TabControl
if (CurrentTab = "Main Settings") {
    Gui, Show, w217 h200, DooxterACB  ; Resize for Main Settings
} else if (CurrentTab = "Advanced Settings") {
    Gui, Show, w200 h320, DooxterACB  ; Resize for Advanced Settings
}

Return

HeroicLastStand:
    selectedOption := "HeroicLastStand"
    MsgBox, You selected HeroicLastStand
    return

VengeancePath:
    selectedOption := "VengeancePath"  ; Set the option
    MsgBox, You selected VengeancePath  ; Confirm the selection
return

StartScript:
Gui, Submit, NoHide  ; Update variables based on GUI input
Return

F1::

; Scale image search based on the screen resolution
ImageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, "\\Settings\\Images\\DC.png"

; If the first image is found
if (ErrorLevel = 0) {
    ; Perform your custom actions with scaled coordinates
    MouseMove, 1042 * ScaleX, 615 * ScaleY
    Sleep, 400
    Click

    Loop
    {
        ; Search for the second image on the screen with scaling
        ImageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, "\\Settings\\Images\\TPbutton.png"

        ; If the second image is found (ErrorLevel = 0)
        if (ErrorLevel = 0) {
            ; Exit the loop after finding the image
            break
        }

        ; If the second image isn't found, continue searching (loop)
        Sleep, 500  ; Optional: add a small delay to avoid excessive CPU usage
    }
} else {
    ; If the first image isn't found, continue with the next part of your script
}

Loop ; Main loop for the entire script
{
    ; Define the rectangle coordinates and color
X1 := 1256 * ScaleX
Y1 := 348 * ScaleY
X2 := 1270 * ScaleX
Y2 := 358 * ScaleY
ColorToCheck := "FFFFFF"

CoordMode, Pixel, Screen  ; Use screen coordinates

; Check for the color in the rectangle
PixelSearch, FoundX, FoundY, X1, Y1, X2, Y2, %ColorToCheck%, 0, RGB

; If found, add a delay and then click the location
if !ErrorLevel {
    Sleep, 200  ; 200ms delay
    Click, %FoundX%, %FoundY%
}
    
    MouseMove, 146 * ScaleX, 571 * ScaleY
    Sleep 100
    Click

    MouseMove, 1145 * ScaleX, 549 * ScaleY
    Sleep 100
    Click
    Sleep 1500
    
    ; Send W key press with sleep based on button selection
    Send, {W down}
    Sleep, %WKeySleep%
    Send, {W up}

    ; Send A key press with sleep based on button selection
    Send, {A down}
    Sleep, %AKeySleep%
    Send, {A up}

    Sleep, 1000 ; Wait before checking for the text box





    ; Find the textbox and click
    CoordMode, Pixel, Screen ; Use screen coordinates
    CoordMode, Mouse, Screen ; Ensure mouse uses screen coordinates

    ; First inner loop to check for white color in the area (504, 677) to (846, 832)

Area11_StartX := 440 * ScaleX
Area11_StartY := 637 * ScaleY
Area11_EndX := 781 * ScaleX
Area11_EndY := 797 * ScaleY

Area22_StartX := 844 * ScaleX
Area22_StartY := 830 * ScaleY
Area22_EndX := 872 * ScaleX
Area22_EndY := 837 * ScaleY

; Define the color to search for
ColorToFind := "0xFFFFFF"

Loop
{
    ; Repeat sending the key "E"
    Send, {E}
    Sleep, 300

    ; Check the second area for the color
    PixelSearch, Px, Py, Area22_StartX, Area22_StartY, Area22_EndX, Area22_EndY, %ColorToFind%, 0, Fast RGB
    if (ErrorLevel = 0)
    {
        ; Click the found position in the second area
        Sleep, 300
        Click, %Px%, %Py%
        break ; Exit the loop after clicking
    }
}


    ; Now it checks for red or green to either start or exit the challenge menu
   ; Define areas and scaling factors
Area1_StartX := 899 * ScaleX
Area1_StartY := 747 * ScaleY
Area1_EndX := 1076 * ScaleX
Area1_EndY := 779 * ScaleY

Area2_StartX := 899 * ScaleX
Area2_StartY := 747 * ScaleY
Area2_EndX := 1076 * ScaleX
Area2_EndY := 779 * ScaleY

; Define colors to search for
Color1 := "0x74F893"
Color2 := "0xCE0000"

Loop
{
    ; Check for Color1 in Area1
    PixelSearch, Px1, Py1, Area1_StartX, Area1_StartY, Area1_EndX, Area1_EndY, %Color1%, 10, Fast RGB
    if (ErrorLevel = 0)
    {
        ; Click at (1126, 759) first
        Sleep, 300
        MouseMove, 1126 * ScaleX, 759 * ScaleY
        Sleep, 500
        Click

        if (selectedOption = "VengeancePath") {
    VGP := A_ScriptDir . "\VengeancePath.ahk"  ; Correct path
    RunWait, %VGP%  ; Wait for the script to finish
}
else if (selectedOption = "HeroicLastStand") {

}
else {
    
}

        Sleep 1000
        ; Then click the found position
        Sleep, 300
        MouseMove, 985 * ScaleX, 757 *ScaleY
        Sleep, 500
        Click

        ; Wait for a defined time
        Sleep, SleepTime
        break
    }

    ; Check for Color2 in Area2
    PixelSearch, Px2, Py2, Area2_StartX, Area2_StartY, Area2_EndX, Area2_EndY, %Color2%, 10, Fast RGB
    if (ErrorLevel = 0)
    {
        ; Click at (1278, 305)
        Sleep, 300
        MouseMove, 1278 * ScaleX, 305 * ScaleY
        Sleep, 500
        Click
        break
    }

    ; Delay before repeating
    Sleep, 100
}



    ; Perform clicks in other areas (after the inner loops)
    MouseMove, 146 * ScaleX, 571 * ScaleY
    Sleep 100
    Click

    MouseMove, 1145 * ScaleX, 549 * ScaleY
    Sleep 100
    Click

    Sleep 1000 ; Wait for a brief moment before going to inf

    Send, {W down}
    Sleep, %InfW1KeySleep%
    Send, {W up}

    Send, {D down}
    Sleep, %InfW2KeySleep%
    Send, {D up}

    

    Sleep 1000

    ; Find inf button and click
    
    ; Define the coordinates for the two search areas

Area2_StartX := 854 * ScaleX
Area2_StartY := 830 * ScaleY
Area2_EndX := 869 * ScaleX
Area2_EndY := 838 * ScaleY

; Define the color to search for
ColorToFind := "0xFFFFFF"

Loop
{
    ; Repeat sending the key "E"
    Send, {E}
    Sleep, 300

    ; Check the second area for the color
    PixelSearch, Px, Py, Area2_StartX, Area2_StartY, Area2_EndX, Area2_EndY, %ColorToFind%, 0, Fast RGB
    if (ErrorLevel = 0)
    {
        ; Click the found position in the second area
        Sleep, 300
        Click, %Px%, %Py%
        break ; Exit the loop after clicking
    }
}

   sleep 1000
    Sleep, 450000 ; Can adjust for testing
        Send {space down}
        Sleep, 100
        Send {space up}
        Sleep, 450000 ; Can adjust for testing
        Send {space down}
        Sleep, 100
        Send {space up}
        Sleep, 450000 ; Can adjust for testing
        Send {space down}
        Sleep, 100
        Send {space up}
        Sleep 450000

    ; Find the orange pause inf button
    sleep 5000 ; just for testing
    
    Send, {space}

    ; Pixel search for color
    x1 := 599 * ScaleX, y1 := 819 * ScaleY  ; Top-left corner of the region
    x2 := 743 * ScaleX, y2 := 851 * ScaleY ; Bottom-right corner of the region
    color := 0xFFA60B       ; The pixel color you want to detect (in hex format)

    ; Repeat searching for the color until it's found
    Loop
    {
        PixelSearch, x, y, x1, y1, x2, y2, color, 5, Fast RGB  ; Search within the region for the pixel color
        if (ErrorLevel = 0) {
            ; If found, move the mouse to the position and click it
            MouseMove, x, y
            Click
            Sleep, 4500
            Click
            Sleep, 100
            Click
            Sleep, 100
            Click
            Sleep, 100
            Click
            Sleep, 100
            Click
            Sleep, 100
            Click
            break  ; Exit the loop once clicked
        }
        Sleep, 1000  ; Wait for a short time before trying again (adjust as needed)
    }
}
return ; This closes the outer loop

F3::ExitApp ; Press F3 to exit the script
GuiClose:
    ExitApp