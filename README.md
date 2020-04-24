Simple concepts for the löve2d game framework

Usage:
	to use this module, simply download 'simpleConcepts.lua' and place it in your project directory then require this module in your main.lua file like so
	`simpleConcepts = require('simpleConcepts')`
		
	classes:
		`button` :
			the button class is a simple button with the following arguments:
				text: (string) the text label of the button,
				textColor ({r, g, b, a}) the color for the label,
				buttonColor ({r, g, b, a}) the color for the background (rectangle) of the button,
				x (number) the top left x co-ord of the button,
				y (number) the top left y co-ord of the button,
				width (number) the width of the button,
				height (number) the height of the button,
				callback (function) a callback function for when the button is pressed,
				optional (table) this is a table filled with optional keyword arguments, these are as follows:
					mode = 'fill' (string) mode passed to love.graphics.rectangle
					rx = nil (number) rx passed to love.graphics.rectangle,
					ry = rx (number) ry passed to love.graphics.rectangle,
					segments = nil (number) segments passed to love.graphics.rectangle,
					textLimit = love.graphics.getWidth() (number) limit passed to love.graphics.printf,
					font = love.graphics.getFont() (Löve2d Font) the font used for the label,
					textAlignment = 'center' ('left', 'center', or 'right') the alignment passed to love.graphics.printf
			the button is used as follows: 
			`
			simpleConcepts = require('simpleConcepts')
			
			local button
			
			function love.load()
				button = simpleConcepts.ui.button(
					'ping',
					{0,0,0,1},
					{1,0,1,1},
					60,
					60,
					120,
					120,
					function(object, x, y, button, istouch, presses)
						print('pong')
					end
				)
			end
			
			function love.graphics.draw()
				button:draw()
			end
			
			function love.mousepressed(x, y, button, istouch, presses)
				button:handleTouch(x, y, button, istouch, presses)
			end
			` this will draw a simple button and handle when it is clicked or tapped, the callback function is passed the actual button object aswell as all of the click/touch data, so you can do further checks inside it, the only check performed for you is whether the click/tap landed on the button, so you dont have to worry about that.
