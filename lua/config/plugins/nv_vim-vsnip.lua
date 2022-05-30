-- https://github.com/L3MON4D3/LuaSnip
-- https://github.com/hrsh7th/vim-vsnip

local options = require("core.options")
local mapping = require("core.mappings")

local M = {}

function M.entrance()
    M.register_global_key()
    vim.g.vsnip_snippet_dir = options.code_snippets_directory
    vim.g.vsnip_filetypes = {
        javascript = { "typescript" },
        typescript = { "javascript" },
        vue = { "javascript", "typescript" },
    }
end

function M.register_global_key()
    mapping.register(mapping.plugins["hrsh7th/vim-vsnip"].global)
end

return M
