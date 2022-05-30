-- https://github.com/kevinhwang91/nvim-hlslens

local mapping = require("core.mappings")

local M = {}

function M.before()
    M.register_global_key()
end

function M.load()
    local ok, m = pcall(require, "hlslens")
    if not ok then
        return
    end

    M.hlslens = m
    M.hlslens.setup({
        -- Automatically clear search results
        calm_down = true,
        -- Set to the nearest match to add a shot
        nearest_only = true,
    })
end

function M.after() end

function M.register_global_key()
    mapping.register(mapping.plugins["kevinhwang91/nvim-hlslens"].global)
end

return M
