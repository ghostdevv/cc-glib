local command = ...

local VERSION = "0.2.0"

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
    print("Installing GLib...")

    local files = {
        "fuel",
        "glib"
    }

    for i, file in ipairs(files) do
        print("  Getting " .. file .. "...")

        local fPath = "/" .. file .. ".lua"

        fs.delete(fPath)

        local response = http.get("https://raw.githubusercontent.com/ghostdevv/cc-glib/main/lib" .. fPath)
        local file = fs.open(fPath, "w")
        local data = response.readAll()

        file.write(data)
        file.close()
    end

    print("GLib v" .. VERSION .. " installed!")
elseif command == "version" then
    print("GLib v" .. VERSION)
end
