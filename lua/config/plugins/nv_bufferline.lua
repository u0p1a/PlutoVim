-- https://github.com/akinsho/bufferline.nvim

local icons = require("utils.icons")
    local mapping = require("core.mappings")

local M = {}

function M.before()
    M.register_global_key()
end

function M.load()
    local ok, m = pcall(require, "bufferline")
    if not ok then
        return
    end

    M.bufferline = m
    M.bufferline.setup({
        options = {
            -- Allow user to override highlight group
            themable = true,
            -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
            numbers = "ordinal",
            -- The currently selected buffer style
            indicator_icon = "▎",
            -- It is not recommended to modify the icons below
            buffer_close_icon = "",
            modified_icon = "●",
            close_icon = "",
            left_trunc_marker = "",
            right_trunc_marker = "",
            -- Diagnostics source
            diagnostics = "nvim_lsp",
            -- Other unselected buffer splits
            -- Split style："slant" | "thick" | "thin" | { "|", "|" }
            separator_style = "thin",
            -- Diagnostic style
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local message
                if diagnostics_dict.error then
                    message = string.format("%s%s", icons.diagnostics.Error, diagnostics_dict.error)
                elseif diagnostics_dict.warning then
                    message = string.format("%s%s", icons.diagnostics.Warn, diagnostics_dict.warning)
                elseif diagnostics_dict.info then
                    message = string.format("%s%s", icons.diagnostics.Info, diagnostics_dict.info)
                elseif diagnostics_dict.hint then
                    message = string.format("%s%s", icons.diagnostics.Hint, diagnostics_dict.hint)
                else
                    message = ""
                end
                return message
            end,
            -- Offset of function
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "center",
                },
                {
                    filetype = "aerial",
                    text = "Outline Explorer",
                    highlight = "Directory",
                    text_align = "center",
                },
                {
                    filetype = "undotree",
                    text = "Undo Explorer",
                    highlight = "Directory",
                    text_align = "center",
                },
                {
                    filetype = "dbui",
                    text = "Database Explorer",
                    highlight = "Directory",
                    text_align = "center",
                },
                {
                    filetype = "spectre_panel",
                    text = "Project Blurry Search",
                    highlight = "Directory",
                    text_align = "center",
                },
            },
        },
    })
end

function M.after()
    -- Define the command to delete the buffer
    vim.api.nvim_create_user_command("BufferDelete", function()
        ---@diagnostic disable-next-line: missing-parameter
        local file_exists = vim.fn.filereadable(vim.fn.expand("%p"))
        local modified = vim.api.nvim_buf_get_option(0, "modified")

        -- if file doesnt exist & its modified
        if file_exists == 0 and modified then
            vim.notify("The file is not saved", "warn", { title = "Buffer" })
            return
        end

        local force = force or not vim.bo.buflisted or vim.bo.buftype == "nofile"

        -- if not force, change to prev buf and then close current
        local close_cmd = force and ":bd!" or ":bp | bd!" .. vim.api.nvim_get_current_buf()
        vim.cmd(close_cmd)
    end, {})
end

function M.register_global_key()
    mapping.register(mapping.plugins["akinsho/bufferline.nvim"].global)
end

return M
