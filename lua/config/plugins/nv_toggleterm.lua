-- https://github.com/akinsho/toggleterm.nvim
local mapping = require("core.mappings")

local M = {vertical_term = nil, floating_term = nil, lazygit_term = nil}

function M.before() M.register_global_key() end

function M.load()
    local ok, m = pcall(require, "toggleterm")
    if not ok then return end

    M.toggleterm = m
    M.terms = require("toggleterm.terminal").Terminal

    M.toggleterm.setup({
        start_in_insert = true,
        open_mapping = [[<c-\>]],
        shade_terminals = true,
        shading_factor = 1,
        size = function(term)
            if term.direction == "horizontal" then
                return vim.o.lines * 0.2
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.25
            end
        end,
        on_open = function() vim.wo.spell = false end,
        highlights = {
            Normal = {link = "Normal"},
            NormalFloat = {link = "NormalFloat"},
            FloatBorder = {link = "FloatBorder"}
        }
    })
end

function M.after()
    M.toggleterm.vertical_toggle = function()
        return M.terms:new({direction = "vertical"}):toggle()
    end
    M.toggleterm.float_toggle = function()
        return M.terms:new({
            hidden = true,
            count = 120,
            direction = "float",
            float_opts = {border = "double"},

            on_open = function(term)
                M.open_callback()
                vim.keymap.set({"t"}, "<esc>", "<c-\\><c-n><cmd>close<cr>",
                               {silent = true, buffer = term.bufnr})
                vim.keymap.set({"t"}, "<M-q>", "<c-\\><c-n><cmd>close<cr>",
                               {silent = true, buffer = term.bufnr})
            end,
            on_close = M.close_callback
        }):toggle()
    end
    M.toggleterm.lazygit_toggle = function()
        return M.terms:new({
            cmd = "lazygit",
            count = 130,
            hidden = true,
            direction = "float",
            float_opts = {border = "double"},
            on_open = function(term)
                M.open_callback()
                vim.keymap.set({"i"}, "q", "<cmd>close<cr>",
                               {silent = true, buffer = term.bufnr})
            end,
            on_close = M.close_callback
        }):toggle()
    end    
end

function M.open_callback()
    vim.cmd("startinsert")
    -- disable terminal normal mode
    -- vim.keymap.del({"t"}, "<esc>")
end

function M.close_callback()
    -- vim.keymap.set({"t"}, "<esc>", "<c-\\><c-n>", {silent = true})
end

function M.register_global_key()
    mapping.register(mapping.plugins["akinsho/toggleterm.nvim"].global)
end

return M
