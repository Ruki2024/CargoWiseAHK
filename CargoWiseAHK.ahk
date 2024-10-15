#Requires AutoHotkey v2.0

#HotIf WinActive("ahk_class RAIL_WINDOW")  ; Hotkeys only active when RAIL_WINDOW is active

SetTitleMatchMode(2) ; Allows partial matching of window titles

; Initialize flags for the Autorating and Important windows
inputsSent1 := false
inputsSent2 := false

; Check for the windows periodically
SetTimer(CheckForWindows, 100)  ; Check every 100 ms

CheckForWindows() {
    global inputsSent1, inputsSent2  ; Make sure the flags are accessible within this function

    ; Check for the first window
    if WinExist("Important! - Production - Branch: CMB - Company:") {
        if !inputsSent1 {
            WinActivate("Important! - Production - Branch: CMB - Company:")
            ; Send inputs to the first window
            Send("{Tab}{Enter}")  ; Example inputs for the first window
            inputsSent1 := true  ; Set the flag to true after sending inputs
        }
    } else {
        inputsSent1 := false  ; Reset the flag when the window is not found
    }

    ; Check for the second window
    if WinExist("Autorating - Production - Branch: CMB - Company:") {
        if !inputsSent2 {
            WinActivate("Autorating - Production - Branch: CMB - Company:")
            ; Send inputs to the second window
            Send("{Right}{Enter}")  ; Example inputs for the second window
            inputsSent2 := true  ; Set the flag to true after sending inputs
        }
    } else {
        inputsSent2 := false  ; Reset the flag when the window is not found
    }
}

; // CW SHORTCUTS //
!1::Send("{Control Down}{F1}{Control Up}")
!2::Send("{Control Down}{F2}{Control Up}")
!3::Send("{Control Down}{F3}{Control Up}")

; // SHIPPER CODES //
1::SendInput("BRAAPPMAA{Tab}")
2::SendInput("LINFASMAA{Numpad1}{Tab}")
3::SendInput("SEEINTMAA{Tab}")
4::SendInput("INTFASMAA{Tab}")

; // HAWB COPY //
Insert:: {
    ; Set the coordinate mode to be relative to the active window
    CoordMode("Mouse", "Window")

    ; Send email and navigate with tabs
    Send("{Tab 3}e{Tab 2}rwijethunge@omnilogistics.com")
    Sleep 100

    MouseClick("L", 170, 50)
    Sleep 50

    ; Send Tab key, Down Arrow key 9 times, and Space
    Send("{Tab}")
    Sleep 50
    Send ("{Down 9}")
    Sleep 50
    Send ("{Space}")
    Sleep 50

    MouseClick("L", 520, 430)
}

; // NOTIFY PARTY //
9::SendInput("FORTRACMH{Tab}")
0::SendInput("EXPINTCMH{Tab}")

; // BKD //
`:: {
    SendInput("{Numpad9}{Numpad0}{Numpad0}{Numpad0}{Numpad1}{Numpad2}{Numpad3}{Numpad4}{Numpad5}{Tab}")
    SendInput("{Numpad1}{Numpad7}{Numpad6}{Numpad1}{Numpad2}{Numpad3}{Numpad4}{Numpad1}{Numpad2}{Numpad3}{Numpad4}{Tab}")
    SendInput("^s")
    SendInput("{RAlt}{Right 2}{Enter}{Down 9}{Right}{Enter}CNE{Tab 3}BKD{Tab 2}{Enter}")
}

; // AGENT NOTES //
Playspeed := 1

<+`:: {
    ; Set the coordinate mode to be relative to the active window
    CoordMode("Mouse", "Window")

    ; Define the window title pattern and class
    tt := "Edit Shipment ahk_class RAIL_WINDOW"

    ; Wait for the window to appear
    WinWait(tt)
    ; Activate the window if it's not already active
    if !WinActive(tt) {
        WinActivate(tt)
    }

    ; Check if the window is active
    if WinActive("ahk_class RAIL_WINDOW") {
        Sleep(1000 / Playspeed)

        MouseClick("L", 1155, 75)
        Sleep 50
        Send("{Tab}{Down 4}")
        Sleep 50
        Send("ag{Tab}")
        Sleep 50
        MouseClick("L", 166, 811)
        Sleep 50

        ; Ensure Caps Lock is turned on
        if !GetKeyState("CapsLock", "T") { ; Check if Caps Lock is off
            SetCapsLockState("On")
        }

        ; Type "TRINITY SHIPMENT"
        Send("TRINITY SHIPMENT")
        Sleep 50

        ; Continue with the rest of the script
        MouseClick("L", 1410, 965)
    } else {
        MsgBox("The specified window is not active.")
    }
}

; // E2E //
<!`:: {
    ; Set the coordinate mode to be relative to the active window
    CoordMode("Mouse", "Window")

    ; Define the window title pattern and class
    tt := "Edit Shipment ahk_class RAIL_WINDOW"

    ; Wait for the window to appear
    WinWait(tt)
    ; Activate the window if it's not already active
    if !WinActive(tt) {
        WinActivate(tt)
    }

    ; Check if the window is active
    if WinActive("ahk_class RAIL_WINDOW") {
        Send("{RAlt}{Right 3}{Enter}{Down 8}{Right}{Enter}")

        ; Check if the "Manually Send XML Universal Shipment" window appears
        manuallysend_tt := "Manually Send XML"
        WinWait(manuallysend_tt, "", 3) ; Wait up to 3 seconds for the window to appear
        if WinExist(manuallysend_tt) {
            WinActivate(manuallysend_tt)
            Send("OTH{Tab}")
            MouseClick("L", 187, 84)
            Send("FOR{Tab}OMNGOFDFW{Tab 2}E2E{Tab 2}{Enter}")
        }
    } else {
        MsgBox("The specified window is not active.")
    }
}

#HotIf  ; Reset condition for hotkeys
return
