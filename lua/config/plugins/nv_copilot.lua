-- https://github.com/github/copilot.vim

local mapping = require("core.mappings")

local M = {}

function M.entrance()
    M.register_global_key()
    -- Disable default tab completion
    vim.g.copilot_no_tab_map = true
end

function M.register_global_key()
    mapping.register(mapping.plugins["github/copilot.vim"].global)
end

return M
