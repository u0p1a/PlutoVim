-- https://github.com/nvim-telescope/telescope.nvim
local mapping = require("core.mappings")

local M = {}

function M.before() M.register_global_key() end

function M.load()
    local ok, m = pcall(require, "telescope")
    if not ok then return end

    M.telescope = m
    M.telescope.setup({
        defaults = {
            prompt_prefix = " ",
            selection_caret = " ",
            entry_prefix = " ",
            multi_icon = " ",
            color_devicons = true,
            file_ignore_patterns = {"node_modules"},
            -- theme
            layout_strategy = "bottom_pane",
            -- config
            layout_config = {
                bottom_pane = {
                    height = 15,
                    preview_cutoff = 100,
                    prompt_position = "bottom"
                }
            },
            pickers = {
                find_files = {hidden = true},
                live_grep = {
                    -- don't include the filename in the search results
                    only_sort_text = true
                }
            },
            vimgrep_arguments = {
                "rg", "--color=never", "--no-heading", "--with-filename",
                "--line-number", "--column", "--smart-case", "--hidden",
                "--glob=!.git/"
            },
            file_sorter = require("telescope.sorters").get_fuzzy_file,
            generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
            path_display = {"truncate"},
            winblend = 0,
            border = {},
            borderchars = {
                "─", "│", "─", "│", "╭", "╮", "╯", "╰"
            },
            mappings = mapping.plugins["nvim-telescope/telescope.nvim"].custom(),
            use_less = true,
            set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
            file_previewer = require("telescope.previewers").vim_buffer_cat.new,
            grep_previewer = require("telescope.previewers").vim_buffer_vimgrep
                .new,
            qflist_previewer = require("telescope.previewers").vim_buffer_qflist
                .new
        },
        extensions_list = {"themes", "terms"},
        pickers = {
            buffers = {
                mappings = {
                    i = {["<c-d>"] = "delete_buffer"},
                    n = {["dd"] = "delete_buffer"}
                }
            }
        }
    })
end

function M.after() end

function M.register_global_key()
    mapping.register(mapping.plugins["nvim-telescope/telescope.nvim"].global)
end

return M
