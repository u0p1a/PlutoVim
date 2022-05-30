-- https://github.com/phaazon/hop.nvim

local mapping = require("core.mappings")

local M = {}

function M.before()
    M.register_global_key()
end

function M.load()
    local ok, m = pcall(require, "hop")
    if not ok then
        return
    end

    M.hop = m
    M.hop.setup({
        -- Assign key
        { keys = "qwertyuiopasdfghjklzxcvbnm" },
    })
end

function M.after() end

function M.register_global_key()
    mapping.register(mapping.plugins["phaazon/hop.nvim"].global)
end

return M
