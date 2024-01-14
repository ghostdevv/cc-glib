local command = ...

local VERSION = "0.1.0"

if not command or command == "help" then
    print("GLib v" .. VERSION)
    print("")
    print("  Usage")
    print("    glib <command>")
    print("")
    print("  Available Commands")
    print("    help       Show this help message")
    print("    version    Get the current version of GLib")
    print("    install    (re)install GLib")
elseif command == "install" then
    print("Installing GLib...")

    local files = {
        "fuel",
        "glib"
    }

    for i, file in ipairs(files) do
        print("  Getting " .. file .. "...")

        fs.delete("/" .. file .. ".lua")
        shell.run("wget https://github.com/ghostdevv/cc-glib/blob/main/lib/" .. file .. ".lua")
    end

    print("GLib installed!")
elseif command == "version" then
    print("GLib v" .. VERSION)
end
