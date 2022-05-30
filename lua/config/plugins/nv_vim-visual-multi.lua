-- https://github.com/mg979/vim-visual-multi
-- 多光标模式

local mapping = require("core.mappings")

local M = {}

function M.entrance()
    M.register_global_key()
    vim.g.VM_Extend_hl = "VM_Extend_hi"
    vim.g.VM_Cursor_hl = "VM_Cursor_hi"
    vim.g.VM_Mono_hl = "VM_Mono_hi"
    vim.g.VM_Insert_hl = "VM_Insert_hi"
    vim.g.VM_default_mappings = 0
    vim.g.VM_maps = mapping.plugins["mg979/vim-visual-multi"].custom 
end

function M.register_global_key()
    mapping.register(mapping.plugins["mg979/vim-visual-multi"].global)
end

return M
