-- https://github.com/askfiy/nvim-picgo

local mapping = require("core.mappings")

local M = {}

function M.before()
    M.register_global_key()
end

function M.load()
    local ok, m = pcall(require, "nvim-picgo")
    if not ok then
        return
    end

    M.nvim_picgo = m
    M.nvim_picgo.setup()
end

function M.after() end

function M.register_global_key()
    mapping.register(mapping.plugins["askfiy/nvim-picgo"].global)
end

return M
