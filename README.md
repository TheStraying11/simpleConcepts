
# Simple concepts for the Obsi 2d game framework

## Usage:
to use this module, simply download 'simpleConcepts.lua' and place it in your project directory then require this module in your main.lua file like so:
```lua
local simpleConcepts = require('simpleConcepts')
```
	
## Classes
### Button
the button class is a simple button with the following arguments:
* `text` (string): the text label of the button,
* `textColor` (`{r, g, b, a}`): the color for the label,
* `buttonColor` (`{r, g, b, a}`): the color for the background (rectangle) of the button,
* `x` (number): the top left x co-ord of the button,
* `y` (number): the top left y co-ord of the button,
* `width` (number): the width of the button,
* `height` (number): the height of the button,
* `callback` (function): a callback function for when the button is pressed,
* `optional` (table): this is a table filled with optional keyword arguments, these are as follows:
	- `mode = 'fill'` (string): mode passed to obsi.graphics.rectangle
	- `textLimit = love.graphics.getWidth()` (number): limit passed to obsi.graphics.printf,


the button is used as follows: 
```lua
local simpleConcepts = require('simpleConcepts')
local button
function obsi.load()
	button = simpleConcepts.ui.button(
		'ping',
		{0,0,0,1},
		{1,0,1,1},
		60,
		60,
		120,
		120,
		function(object, x, y, button)
			print('pong')
		end
	)
end
function obsi.graphics.draw()
	button:draw()
end
function obsi.mousepressed(x, y, button)
	button:handleTouch(x, y, button)
end
```

this will draw a simple button and handle when it is clicked, the callback function is passed the actual button object, so you can do further checks inside it, the only check performed for you is whether the click landed on the button
