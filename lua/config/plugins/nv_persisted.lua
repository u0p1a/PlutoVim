-- https://github.com/olimorris/persisted.nvim

local path = require("utils.api.path")
local mapping = require("core.mappings")

local M = {}

function M.before()
    M.register_global_key()
end

function M.load()
    local ok, m = pcall(require, "persisted")
    if not ok then
        return
    end

    M.persisted = m
    M.persisted.setup({
        save_dir = path.join(vim.fn.stdpath("cache"), "sessions"),
        use_git_branche = true,
        command = "VimLeavePre",
        autosave = true,
    })
end

function M.after() end

function M.register_global_key()
    mapping.register(mapping.plugins["olimorris/persisted.nvim"].global)
end

return M
