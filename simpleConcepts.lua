--[[
    Ui Elements
]]
 
local button = {}
 
button.__index = button
 
function button:new(text, textColor, buttonColor, x, y, width, height, callback, optional)
    --[[
        optional:
            mode = 'fill'
            textLimit = width
    ]]
    
    local optional = optional or {}
    
    local o = {
        text = text,
        textColor = textColor,
        buttonColor = buttonColor,
        x = x,
        y = y,
        width = width,
        height = height,
        callback = callback,
        mode = optional["mode"] or 'fill',
        textLimit = optional["textLimit"] or width
    }
    
    setmetatable(o, button)
    
    return o
end
 
function button:draw()
    local oldColor = {obsi.graphics.bgColor, obsi.graphics.fgColor}
    
    obsi.graphics.setForegroundColor(self.buttonColor)
    obsi.graphics.rectangle(
        self.mode, 
        self.x, 
        self.y, 
        self.width, 
        self.height
    )
 
    obsi.graphics.setForegroundColor(self.textColor)
    obsi.graphics.setBackgroundColor(self.buttonColor)
    obsi.graphics.write(
        self.text, 
        self.x + (self.width-#self.text)/2, 
        self.y + (self.height/2)
    )
 
    obsi.graphics.setBackgroundColor(oldColor[1])
    obsi.graphics.setForegroundColor(oldColor[2])
end
 
function button:setText(s)
    self.text = s
end
 
function button:handleTouch(x, y, button)
    if y >= self.y and y <= self.y+self.height and
       x >= self.x and x <= self.x+self.width then
        self:callback(
            x, 
            y, 
            button
        )
    end
end
 
--[[
    End of Ui Elements
]]
 
prototypes = {
    ui = {
        button = setmetatable(button, {
                __call = button.new
            }
        )
    }
}
 
return prototypes
