local file_path = ...

if file_path == nil then
    print("Usage: cat <file>")
    return
end

if not fs.exists(file_path) then
    print("Can't find file: \"" .. file_path .. "\"")
    return
end

local file = fs.open(file_path, "r")
local contents = file.readAll() or ""

local _, line_count = contents:gsub("\n", "\n")
line_count = math.max(line_count, 1)

-- * Print file info

term.setBackgroundColor(colors.white)
term.setTextColor(colors.black)

--- Write info statistic for the top bar
--- @param name string
--- @param stat string|number
local function write_stat(name, stat)
    term.write(name .. ": ")
    term.setTextColor(colors.blue)
    term.write(tostring(stat))
    term.setTextColor(colors.black)
    term.write(" ")
end

--- Format bytes to string
--- @param bytes number
--- @return string
local function fmt_bytes(bytes)
    local kb = bytes / 1000

    if kb >= 1 then
        return kb .. "kb"
    else
        return bytes .. "B"
    end
end

write_stat("File", ("\"%s\""):format(file_path))
write_stat("Lines", line_count)
write_stat("Size", fmt_bytes(fs.getSize(file_path)))

local cursor_x, cursor_y = term.getCursorPos()
local screen_w, _ = term.getSize()

term.setTextColor(colors.white)
term.write((" "):rep((screen_w - cursor_x) + 1))

term.setBackgroundColor(colors.black)
print()

-- * Print file

textutils.pagedPrint(contents, cursor_y - 3)
