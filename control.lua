#!/usr/bin/env lua

local uname = io.popen("uname"):read("*l")
local home_dir = os.getenv("HOME")

-- shared
local files = {
  ".config/wezterm",
  ".bashrc",
  ".blerc",
  ".config/kitty",
  ".config/bottom",
  ".config/yazi",
}

if uname == "Darwin" then
  -- todo
  os.exit(0)
else
  for _, i in pairs({
    ".config/hypr",
    ".config/waybar",
    ".config/foot",
  }) do
    table.insert(files, i)
  end
end

local operation = arg[1]
if operation == "rsync" then
  print("review and paste:")
  for _, what in pairs(files) do
    local cmd = "rsync -rva ~/" .. what .. " . "
    print(cmd)
  end
elseif operation == "link" then
  print("review and paste:")
  for _, what in pairs(files) do
    local target_path = home_dir .. "/" .. what
    local source_path = "./" .. what

    local cmd = "ln -sf " .. source_path .. " " .. target_path
    print(cmd)
  end
elseif operation == "routine" then
  local cmd = [[git add . && git commit -m "routine commit" && git push]]
  print("```")
  print(cmd)
  print("```")
  print("")
  print("is this alright? [y/N]")
  local ret = io.read()
  print(string.lower(ret) == "y")
else
  print("usage: " .. arg[0] .. " [rsync|symlink|routine]")
  os.exit(1)
end
