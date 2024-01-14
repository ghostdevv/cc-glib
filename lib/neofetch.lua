local tWidth, tHeight = term.getSize()

local function printCentered(text)
    local x, y = term.getCursorPos()
    term.setCursorPos(math.floor((tWidth - #text) / 2) + 1, y)
    print(text)
end

local function printSeparator()
    print(string.rep("-", tWidth))
end

term.clear()
term.setTextColor(colors.cyan)
printCentered("  ccNeofetch")
printSeparator()

term.setTextColor(colors.yellow)
print("  ID:   " .. os.getComputerID())
print("  Host: " .. _HOST)

printSeparator()

term.setTextColor(colors.green)
print("  Free Space: " .. math.floor(fs.getFreeSpace("/") / 1024) .. " KB")

if turtle then
    print("  Fuel:       " .. turtle.getFuelLevel() .. "/" .. turtle.getFuelLimit())
end

printSeparator()

term.setTextColor(colors.orange)
print("  Colour: " .. tostring(term.isColour()))
print("  Size:   " .. tWidth .. "x" .. tHeight)


term.setTextColor(colors.white)
printSeparator()
