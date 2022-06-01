local mapping = require("core.mappings")

local M = {}

function M.before() 
	vim.g.floaterm_width = 0.9
	vim.g.floaterm_height = 0.8
	vim.g.autoclose = 2
end
function M.load() end
function M.after() 
end

return M