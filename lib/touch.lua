if ... == nil then
    print("Usage: touch <file...>")
    return
end

for _, file in ipairs({ ... }) do
    if fs.exists(file) then
        print("File already exists: \"" .. file .. "\"")
    else
        print("Created file: \"" .. file .. "\"")
        fs.open(file, "w").close()
    end
end
