
#Requires AutoHotkey v2.0

#SingleInstance Force

/*

NDI Studio Monitor
ahk_class Static
ahk_exe Application.Network.StudioMonitor.x64.exe
ahk_pid 27704
ahk_id 39917246

Windowed Projector (Scene) - [ PTZ  Delay Panel ]
ahk_class Qt643QWindowIcon
ahk_exe obs64.exe
ahk_pid 12804
ahk_id 201986434

Windowed Projector (Scene) - PTZ
ahk_class Qt643QWindowIcon
ahk_exe obs64.exe
ahk_pid 12804
ahk_id 149688076
 

*/

INI_Filename := "NDI Link OBS.ini"

DelayPanelWindowDescriptor :=  IniRead(INI_Filename, "PTZ", "DelayPanelWindowDescriptor" , 'Windowed Projector (Scene) - [ PTZ  Delay Panel ] ahk_exe obs64.exe ahk_class Qt643QWindowIcon' )
PTZWindowDescriptor        :=  IniRead(INI_Filename, "PTZ", "PTZWindowDescriptor" ,'Windowed Projector (Scene) - PTZ ahk_exe obs64.exe ahk_class Qt643QWindowIcon' )
NDIWindowDescriptor        :=  IniRead(INI_Filename, "PTZ", "NDIWindowDescriptor" , 'NDI Studio Monitor ahk_exe Application.Network.StudioMonitor.x64.exe ahk_class Static' )

EnterDelayPause            := IniRead(INI_Filename, "PTZ", "EnterDelayPause" , "3000") * 1
MoveDelay                  :=  IniRead(INI_Filename, "PTZ", "MoveDelay" , "1000") * 1

#HotIf WinActive(  NDIWindowDescriptor ) 
; keys for when StudioMonitor in foreground


NumpadDel::
NumpadDot:: {
 
    if WinExist( DelayPanelWindowDescriptor ) {
        ; switch to delay panel so it is visible, and capturing keys
        WinActivate 
            ; now the keys will be captured and ignored by the delay monitor window while it build up delay
            Sleep EnterDelayPause

            if WinExist( NDIWindowDescriptor ) {
                ; return to the studio monitor window
                WinActivate ;  
            }

    }
    

}


$Numpad1:: {
    Send "{Numpad1}"
    if WinExist( PTZWindowDescriptor ) {
        WinActivate ; Use the window found by WinExist.  
        Sleep MoveDelay
        Send "{Numpad0}"
    }
}
$Numpad2::  {
    Send "{Numpad2}"
    if WinExist( PTZWindowDescriptor ) {
        WinActivate ; Use the window found by WinExist.  
        Sleep MoveDelay
        Send "{Numpad0}"
    }
}

$Numpad3::  {
    Send "{Numpad3}"
    if WinExist( PTZWindowDescriptor ) {
        WinActivate ; Use the window found by WinExist.  
        Sleep MoveDelay
        Send "{Numpad0}"
    }
}
$Numpad4::  {
    Send "{Numpad4}"
    if WinExist( PTZWindowDescriptor ) {
        WinActivate ; Use the window found by WinExist.  
        Sleep MoveDelay
        Send "{Numpad0}"
    }
}
$Numpad5::  {
    Send "{Numpad5}"
    if WinExist( PTZWindowDescriptor ) {
        WinActivate ; Use the window found by WinExist.  
        Sleep MoveDelay
        Send "{Numpad0}"
    }
}
$Numpad6::  {
    Send "{Numpad6}"
    if WinExist( PTZWindowDescriptor ) {
        WinActivate ; Use the window found by WinExist.  
        Sleep MoveDelay
        Send "{Numpad0}"
    }
}
$Numpad7::  {
    Send "{Numpad7}"
    if WinExist( PTZWindowDescriptor ) {
        WinActivate ; Use the window found by WinExist.  
        Sleep MoveDelay
        Send "{Numpad0}"
    }
}
$Numpad8::  {
    Send "{Numpad8}"
    if WinExist( PTZWindowDescriptor ) {
        WinActivate ; Use the window found by WinExist.  
        Sleep MoveDelay
        Send "{Numpad0}"
    }
}
$Numpad9:: {
    Send "{Numpad9}"    
    if WinExist( PTZWindowDescriptor ) {
        WinActivate ; Use the window found by WinExist.  
        Sleep MoveDelay
        Send "{Numpad0}"
    }
}




+^Q:: {
     MsgBox "exiting NDI Link Obs"
     ExitApp 0
}


#HotIf

#HotIf WinActive(  DelayPanelWindowDescriptor ) 
; keys for when Obs Windowed Projector in foreground



Numpad1::
Numpad2::
Numpad3::
Numpad4::
Numpad5::
Numpad6::
Numpad7::
Numpad8::
Numpad9:: {
    ; we want to swallow up the triggers while focused on this window.
    ; (that way the delay won't be false triggered until the camera has actually moved)
    return
}



NumpadDel::
NumpadDot:: {
 
    if WinExist( NDIWindowDescriptor ) {

        Sleep EnterDelayPause
        if WinExist( NDIWindowDescriptor ) {
            WinActivate ; Use the window found by WinExist.          
        }
        
    }
}


#HotIf


+^Q:: {
    MsgBox "exiting NDI Link Obs"
    ExitApp 0
}


NumpadDel::
NumpadDot:: {
    ; we need both windows to do this....

    if WinExist( NDIWindowDescriptor  ) {
        if WinExist( DelayPanelWindowDescriptor ) {
            WinActivate 
                ; now the keys will be captured and ignored by the delay monitor window while it build up delay
                Sleep EnterDelayPause
                if WinExist( NDIWindowDescriptor ) {
                    WinActivate          
                }
  
        }
    }
    
    

}
