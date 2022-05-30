-- https://github.com/nvim-pack/nvim-spectre

local aux = require("utils.api.aux")
local mapping = require("core.mappings")

local M = {}

function M.before()
    M.register_global_key()
end

function M.load()
    local ok, m = pcall(require, "spectre")
    if not ok then
        return
    end

    M.spectre = m
    M.spectre.setup()
end

function M.after() end

function M.register_global_key()
    mapping.register(mapping.plugins["nvim-pack/nvim-spectre"].global)
end

return M
