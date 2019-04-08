--[[
 @package   GeanyPluginsLua
 @filename  status.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <diaz.victor@openmailbox.org>
 @date      05.08.2018 00:03:05 -04
]]--

-- Variables
local file_path = geany.fileinfo().path

-- pulled from, https://stackoverflow.com/questions/295052/how-can-i-determine-the-os-of-the-system-from-within-a-lua-script#14425862
function os.capture(cmd, raw)
	local f = assert(io.popen(cmd, 'r'))
	local s = assert(f:read('*a'))
	f:close()
	if raw then return s end
	s = string.gsub(s, '^%s+', '')
	s = string.gsub(s, '%s+$', '')
	s = string.gsub(s, '[\n\r]+', '\n\n')
	return s
end

local execute = os.capture("cd "..file_path..";git status")
geany.newfile("Git Status")
geany.text(execute)
