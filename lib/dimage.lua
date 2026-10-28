local Renderer = require "combox.Renderer"
local PixelBoxCombinator = require("combox.combinators.PixelBoxCombinator"):new()
local MediaParser = require "combox.MediaParser"
local tf = require("tf")

local file = ...

if file == nil then
    file = "file.qoi"
end

if not fs.exists(file) then
    print("Can't find file: \"" .. file .. "\"")
    return
end

term.clear()
term.setCursorPos(1, 1)

--- @type Monitor
--- @diagnostic disable-next-line: assign-type-mismatch
local monitor = peripheral.find("monitor")
monitor.setTextScale(0.5)
monitor.clear()
monitor.setCursorPos(1, 1)

--- @param message string
local function log(message)
    tf.print(message)
    local prev = term.redirect(monitor)
    tf.print(message)
	term.redirect(prev)
end

log("Loading image...")

local image = MediaParser:open(file)
assert(image, "image failed to load")

log("Finding palette...")

local palette = image:findPalette()
assert(palette and #palette > 0, "palette is nil/empty")

log("Rendering...")

local screen = Renderer:new{
    term = monitor,
    combinators = { PixelBoxCombinator },
    debug = true,
}

PixelBoxCombinator:onImageChange(image, palette, screen)
screen:render(image, palette):display()
