-- https://github.com/nvim-pack/nvim-spectre
local aux = require("utils.api.aux")
local mapping = require("core.mappings")

local M = {}

function M.before() M.register_global_key() end

function M.load()
    local ok, m = pcall(require, "spectre")
    if not ok then return end

    M.spectre = m
    M.spectre.setup({
        color_devicons = true,
        open_cmd = 'vnew',
        live_update = true, 
        -- line_sep_start = '┌-----------------------------------------',
        -- result_padding = '¦  ',
        -- line_sep = '└-----------------------------------------',
        highlight = {
            ui = "String",
            search = "DiffChange",
            replace = "DiffDelete"
        },
        mapping = {
            ['enter_file'] = {
                map = "<cr>",
                cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
                desc = "goto current file"
            },
            ['toggle_line'] = {
                map = "dd",
                cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
                desc = "toggle current item"
            },
            ['replace_cmd'] = {
                -- 生成 Vim 替换命令
                map = "<leader>c",
                cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
                desc = "input replace vim command"
            },
            ['run_replace'] = {
                -- 全部替换
                map = "<leader>R",
                cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
                desc = "replace all"
            },
            ['show_option_menu'] = {
                map = "?",
                cmd = "<cmd>lua require('spectre').show_options()<CR>",
                desc = "show option"
            },
            -- ['send_to_qf'] = {
            --     map = "<leader>q",
            --     cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
            --     desc = "send all item to quickfix"
            -- },
            -- ['toggle_live_update'] = {
            --     map = "tu",
            --     cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
            --     desc = "update change when vim write file."
            -- },
            -- ['toggle_ignore_case'] = {
            --     map = "ti",
            --     cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
            --     desc = "toggle ignore case"
            -- },
            -- ['toggle_ignore_hidden'] = {
            --     map = "th",
            --     cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
            --     desc = "toggle search hidden"
            -- }
        },
        find_engine = {
            -- rg is map with finder_cmd
            ['rg'] = {
                cmd = "rg",
                args = {
                    '--color=never', '--no-heading', '--with-filename',
                    '--line-number', '--column'
                },
                options = {
                    ['ignore-case'] = {
                        value = "--ignore-case",
                        icon = "[I]",
                        desc = "ignore case"
                    },
                    ['hidden'] = {
                        value = "--hidden",
                        desc = "hidden file",
                        icon = "[H]"
                    }
                    -- you can put any rg search option you want here it can toggle with
                    -- show_option function
                }
            },
            ['ag'] = {
                cmd = "ag",
                args = {'--vimgrep', '-s'},
                options = {
                    ['ignore-case'] = {
                        value = "-i",
                        icon = "[I]",
                        desc = "ignore case"
                    },
                    ['hidden'] = {
                        value = "--hidden",
                        desc = "hidden file",
                        icon = "[H]"
                    }
                }
            }
        },
        replace_engine = {
            ['sed'] = {cmd = "sed", args = nil},
            options = {
                ['ignore-case'] = {
                    value = "--ignore-case",
                    icon = "[I]",
                    desc = "ignore case"
                }
            }
        },
        default = {
            find = {
                -- pick one of item in find_engine
                cmd = "rg",
                options = {"ignore-case"}
            },
            replace = {
                -- pick one of item in replace_engine
                cmd = "sed"
            }
        },
        replace_vim_cmd = "cdo",
        is_open_target_win = true, -- open file on opener window
        is_insert_mode = false -- start open panel on is_insert_mode

    })
end

function M.after() end

function M.register_global_key()
    mapping.register(mapping.plugins["nvim-pack/nvim-spectre"].global)
end

return M
