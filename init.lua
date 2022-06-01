require("core.options")
require("core.setting")
require("core.plugins")
require("core.mappings")
require("core.after")

-- NeoVide 专用配置
if vim.g.neovide then
    vim.opt.guifont = "DroidSansMono Nerd Font:h19"
    vim.g.neovide_cursor_vfx_mode="railgun"
    vim.g.neovide_remember_window_size="v:true"
    vim.g.neovide_input_use_logo="v:true"
    vim.g.neovide_transparency="0.95"
end
