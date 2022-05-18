
XButton1::PgUp
XButton2::PgDn

#If WinActive("ahk_exe chrome.exe") || WinActive("ahk_exe Slack.exe") || WinActive("ahk_class CabinetWClass")
WheelLeft::Browser_Back
^XButton2::Browser_Back
WheelRight::Browser_Forward
^XButton1::Browser_Forward
#IfWinActive


#q::PostMessage, 0x112, 0xF060,,, A

#+1::
Send {Lwin down}{Left} 
Sleep 100
Send {Lwin down}1
Sleep 100
Send {Lwin down}{Right}
return

#+2::
Send {Lwin down}{Left} 
Sleep 100
Send {Lwin down}2
Sleep 100
Send {Lwin down}{Right}
return

#+3::
Send {Lwin down}{Left} 
Sleep 100
Send {Lwin down}3
Sleep 100
Send {Lwin down}{Right}
return


#+4::
Send {Lwin down}{Left} 
Sleep 100
Send {Lwin down}4
Sleep 100
Send {Lwin down}{Right}
return


#+5::
Send {Lwin down}{Left} 
Sleep 100
Send {Lwin down}5
Sleep 100
Send {Lwin down}{Right}
return


#+6::
Send {Lwin down}{Left} 
Sleep 100
Send {Lwin down}6
Sleep 100
Send {Lwin down}{Right}
return


#+7::
Send {Lwin down}{Left} 
Sleep 100
Send {Lwin down}7
Sleep 100
Send {Lwin down}{Right}
return


#+8::
Send {Lwin down}{Left} 
Sleep 100
Send {Lwin down}8
Sleep 100
Send {Lwin down}{Right}
return


#+9::
Send {Lwin down}{Left} 
Sleep 100
Send {Lwin down}9
Sleep 100
Send {Lwin down}{Right}
return


#+0::
Send {Lwin down}{Left} 
Sleep 100
Send {Lwin down}2
Sleep 100
Send {Lwin down}{Right}
return


; ---------------------------------------------------------
;not working properly always, used SharpKeys instead
;LAlt::Ctrl
;RAlt:RAlt
;Capslock::Esc
; ---------------------------------------------------------

<#Tab::AltTab


;; Author: fwompner gmail com
;#InstallKeybdHook
;SetCapsLockState, alwaysoff
;Capslock::
;Send {LControl Down}
;KeyWait, CapsLock
;Send {LControl Up}
;f ( A_PriorKey = "CapsLock" )
;{
;    Send {Esc}
;}
;return

