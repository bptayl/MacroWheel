#Requires AutoHotkey v2.0
#SingleInstance

CoordMode "Mouse", "Screen"


global hkey := IniRead("settings.ini","Settings","Hotkey")
global r := IniRead("settings.ini","Settings","Radius")
global w := IniRead("settings.ini","Settings","ButtonWidth")
global h := IniRead("settings.ini","Settings","ButtonHeight")

global hoverScale := 0.1

global currOption := ""
global hover := false
global prevHwnd := 0

global buttonMapArray := Array()


optionArr := StrSplit(IniRead("Settings.ini","WheelOptions"), "`n")
i := 1
while (i <= optionArr.Length)
{
	optionArr[i]:= StrSplit(optionArr[i],  "=")
	i++
}

MainGui := Gui()
pi := 4 * atan(1)
off := pi/2 


i := 1
while (i <= optionArr.Length)
{
	step := (i-1)/optionArr.Length 
	x := cos(2*pi*step-off)
	y := sin(2*pi*step-off)
	originX := x*r+r+10
	originY := y*r+r+10
	B := MainGui.AddButton("x" . originX . " y" . originY  . " w" . w . " h" . h, optionArr.Get(i).Get(1))
	
	buttonMap := Map()
	buttonMap["button"] := B
	buttonMap["originX"] := originX
	buttonMap["originY"] := originY 
	buttonMap["option"] := optionArr.Get(i).Get(2)
	buttonMapArray.Push(buttonMap)
	
	i++
}

MainGui.BackColor := "EEAA99"
WinSetTransColor("EEAA99", MainGui)

MainGui.Opt("+AlwaysOnTop -Border -Caption -SysMenu")

MainGui.Show("NoActivate Hide")
MainGui.Hide()

OnMessage 0x0200, WM_MOUSEMOVE
OnMessage 0x02A3, WM_MOUSELEAVE

Hotkey hkey, runGui

runGui(*)
{
	MainGui.Hide()
	MouseGetPos &X, &Y 
	mouseX := X
	mouseY := Y 
	
	MainGui.Move(mouseX-r-w/2-10, mouseY-r-h/2-10,,)
	MainGui.Show()	
	
	Keywait hkey, "U"
	
	MainGui.Hide()
	
	if (currOption != "")
	{
		SendInput(currOption)
	}
	
}

WM_MOUSEMOVE(wParam, lParam, msg, Hwnd)
{
	global prevHwnd, currOption, hover
	static prevControl := 0
	
	currControl := GuiCtrlFromHwnd(Hwnd)
	if(currControl)
	{
		currOption := getButtonMapFromHwnd(Hwnd)["option"]
		if (currControl != prevControl && prevControl)
		{
			shrinkButton(prevControl)
		}
		
		if(!hover)
		{
			
			currControl.GetPos(&x,&y,&w,&h)
			currControl.Move(x-w*(hoverScale/2), y-h*(hoverScale/2), w*(1+hoverScale), h*(1+hoverScale))
			hover := true
		}
		prevHwnd := Hwnd
		prevControl := currControl
	}
	
}

WM_MOUSELEAVE(wParam, lParam, msg, Hwnd)
{
	global prevHwnd, currOption
	currOption := ""

	shrinkButton(GuiCtrlFromHwnd(prevHwnd))
}

getButtonMapFromHwnd(Hwnd)
{
	for buttonMap in buttonMapArray
	{
		if(buttonMap["button"].Hwnd = Hwnd)
			return buttonMap
	}
	return
}

shrinkButton(button)
{
	global hover

	prevButtonMap := getButtonMapFromHwnd(button.Hwnd)
	prevButtonMap["button"].Move(prevButtonMap["originX"], prevButtonMap["originY"], w, h)
	hover := false
	return 
}

Esc::ExitApp