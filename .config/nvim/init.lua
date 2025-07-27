local v = vim.version()

if v.major == 0 and v.minor == 12 then
	require("nightly.init")
else
	require("conf.init")
end
