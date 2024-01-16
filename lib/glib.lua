local VERSION = "0.5.0"

local GLIB_COMMANDS = {
    "glib",
    "neofetch",
    "cat"
}

local GLIB_TURTLE_COMMANDS = {
    "fuel",
    "mine"
}

local FHOST_OVERRIDES = {
    mine = "https://raw.githubusercontent.com/ghostdevv/mining-turtle/main/mine.lua"
}

local function downloadFile(url, dest)
    local file = fs.open(dest, "w")
    
    local response = http.get(url)
    local data = response.readAll()
    
    file.write(data)
    file.close()
end

local command = ...
local isTurtle = turtle ~= nil

if not command or command == "help" then
    print("GLib v" .. VERSION)
    print("")
    print("  Usage")
    print("    glib <command>")
    print("")
    print("  Available Commands")
    print("    help               Show this help message")
    print("    version            Get the current version of GLib")
    print("    install, update    (re)install GLib")
elseif command == "install" or command == "update" then
    term.clear()
    print("Installing GLib:")

    local function downloadCommands(commands)
        for i, cmd in ipairs(commands) do
            print("  - " .. cmd)
    
            local fPath = "/" .. cmd .. ".lua"
    
            fs.delete(fPath)
            
            if FHOST_OVERRIDES[cmd] then
                downloadFile(FHOST_OVERRIDES[cmd], fPath)
            else
                downloadFile("https://raw.githubusercontent.com/ghostdevv/cc-glib/main/lib" .. fPath, fPath)
            end
        end
    end

    downloadCommands(GLIB_COMMANDS)

    if isTurtle then
        print("\nInstalling GLib Turtle:")
        downloadCommands(GLIB_TURTLE_COMMANDS)
    end

    print("\nGLib v" .. VERSION .. " installed!")
elseif command == "version" then
    print("GLib v" .. VERSION)
end
