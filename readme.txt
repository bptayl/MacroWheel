MacroWheel
A program featuring a simple GUI that allows you to quickly select and send customizable list of text options.

[Operation]
	In order to use:
	1. Select (click) an applicable spot for text to go.
	2. Hold down the specified hotkey (middle mouse button by default) to show the option wheel.
	3. Hover over the desired option.
	4. Release the hotkey to send the text associated with that option.


[Configuration Settings]
The following settings may be changed in settings.ini.

Hotkey 
	The key/button that must be held down for the program to show. 
	(default=MButton).
	
	A complete list of useable hotkeys and modifiers can be found here:
	https://www.autohotkey.com/docs/v2/KeyList.htm

Radius 
	The distance between the center of each button and the center of where the circle is created (mouse).
	(default=125).

ButtonWidth/ButtonHeight 
	The size of the button.
	(default=75).

WheelOptions Section
	The list of options that will be shown on the wheel. Must be in x=y format.
	The lefthand of the equals is the text that will appear on the button, the righthand of the equals is what appears when the button is selected.
	Any number of buttons may be used by modifying the amount of lines in this section, however the radius/button size may need to be modified in order for it scale properly.
	Some number of options may cause weird looking geometries (seems to correspond with primes higher than 5).