# MacroWheel
A program featuring a simple GUI that allows you to quickly select and send customizable list of text options.  
![gif](https://github.com/user-attachments/assets/dbf794ea-8a86-4287-90e2-184ac0c15bc1)
Developed using AHKv2.

## Installation
Download and extract the zip file which contains the compiled exe and the ini file.

## Operation
In order to use:
1. Select (click) an applicable spot for text to go.
2. Hold down the specified hotkey (middle mouse button by default) to show the option wheel.
3. Hover over the desired option.
4. Release the hotkey to send the text associated with that option.

## Configuration Settings
The following settings may be changed in settings.ini:

### Hotkey 
The key/button that must be held down for the program to show.

A complete list of useable hotkeys and modifiers can be found here:  
https://www.autohotkey.com/docs/v2/KeyList.htm

### Radius 
The distance between the center of each button and the center of where the circle is created (mouse).

### ButtonWidth/ButtonHeight 
The size of the button.


### WheelOptions Section
The list of options that will be shown on the wheel. Must be in x=y format. The lefthand of the equals is the text that will appear on the button, the righthand of the equals is what appears when the button is selected. 

For instance:  
`Address=221B Baker Street`  
Will add a button labeled "Address" and when selected will send "221B Baker Street."

By default there are 8 button placeholders, however any number of buttons may be used by modifying the amount of lines in this section, but the radius/button size may need to be modified in order for it scale properly. Some number of options may cause weird looking geometries due to the way the circle is drawn (seems to correspond with primes higher than 5).
