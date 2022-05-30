-- https://github.com/kristijanhusak/vim-carbon-now-sh

local mapping = require("core.mappings")

local M = {}

function M.entrance()
    M.register_global_key()
end

function M.register_global_key()
    mapping.register(mapping.plugins["kristijanhusak/vim-carbon-now-sh"].global)
end

return M
