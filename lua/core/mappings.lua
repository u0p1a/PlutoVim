local path = require("utils.api.path")
local aux = require("utils.api.aux")
local mapping = {}

-- 简单型映射 (使用 Vimsciprt 配置)
vim.cmd("source " .. path.join(vim.fn.stdpath("config"), "vim", "mappings.vim"))

-- 前缀型映射 (自动注册到 Which-key)
vim.g.mapleader = ";"
local opt = {noremap = true, silent = true}

mapping.register = function(group_keymap, bufnr)
    for _, key_map in pairs(group_keymap) do
        if key_map.options == nil then key_map.options = opt end
        if bufnr then key_map.options.buffer = bufnr end
        key_map.options.desc = key_map.description

        if (type(key_map.lhs) == "table") then
            for _, ilhs in pairs(key_map.lhs) do
                vim.keymap.set(key_map.mode, ilhs, key_map.rhs, key_map.options)
            end
        else
            vim.keymap.set(key_map.mode, key_map.lhs, key_map.rhs,
                           key_map.options)
        end
    end
end

mapping.global = {
    -------------------------
    -- 文件相关
    -------------------------
    {
        mode = {"n", "v"},
        lhs = "<leader>w",
        rhs = ":w<cr>",
        description = "Save file",
    }, {
        mode = {"n", "v"},
        lhs = "<space>w",
        rhs = ":wa<cr>",
        description = "Safe all file"
    }, {
        mode = {"n", "v"},
        lhs = "<leader>q",
        rhs = ":q<cr>",
        description = "Close file"
    }, {
        mode = {"n", "v"},
        lhs = "<leader>Q",
        rhs = ":q!<cr>",
        description = "Close file nosave"
    }, {
        mode = {"n", "v"},
        lhs = "<space><esc>",
        rhs = ":qa!<cr>",
        description = "Quit"
    }, --
    -------------------------
    -- 标签管理 
    -------------------------
    {
        mode = {"n"},
        lhs = {"<M-h>", "<C-S-h>"},
        rhs = "<cmd>BufferLineCyclePrev<cr>",
        description = "Go to left buffer"
    }, {
        mode = {"n"},
        lhs = {"<M-l>", "<C-S-l>", "<C-tab>"},
        rhs = "<cmd>BufferLineCycleNext<cr>",
        description = "Go to right buffer"
    }, {
        mode = {"n"},
        lhs = "<M-e>",
        rhs = "<cmd>BufferLineMovePrev<cr>",
        description = "Move current buffer to left"
    }, {
        mode = {"n"},
        lhs = "<c-y>",
        rhs = "<cmd>BufferLineMoveNext<cr>",
        description = "Move current buffer to right"
    }, {
        mode = {"n"},
        lhs = {"<space>bn", "<C-n>"},
        rhs = "<cmd>enew<cr>",
        description = "Create new buffer"
    }, {
        mode = {"n"},
        lhs = {"<M-q>", "<space>bc", "<space>bx"},
        rhs = "<cmd>BufferDelete<cr>",
        description = "Close current buffer"
    }, {
        mode = {"n"},
        lhs = "<space>bl",
        rhs = "<cmd>BufferLineCloseLeft<cr>",
        description = "Close all left buffers"
    }, {
        mode = {"n"},
        lhs = "<space>br",
        rhs = "<cmd>BufferLineCloseRight<cr>",
        description = "Close all right buffers"
    }, {
        mode = {"n"},
        lhs = {"<space>bo", "<space>bX", "<M-Q>"},
        rhs = function()
            vim.cmd("BufferLineCloseLeft")
            vim.cmd("BufferLineCloseRight")
        end,
        description = "Close all other buffers"
    }, {
        mode = {"n"},
        lhs = "<space>ba",
        rhs = function()
            vim.cmd("BufferLineCloseLeft")
            vim.cmd("BufferLineCloseRight")
            vim.cmd("BufferDelete")
        end,
        description = "Close all buffers"
    }, {
        mode = {"n"},
        lhs = "<space>bs",
        rhs = "<cmd>BufferLineSortByExtension<cr>",
        description = "Buffers sort (by extension)"
    }, {
        mode = {"n"},
        lhs = "<space>b1",
        rhs = "<cmd>BufferLineGoToBuffer 1<cr>",
        description = "Go to buffer 1"
    }, {
        mode = {"n"},
        lhs = "<space>b2",
        rhs = "<cmd>BufferLineGoToBuffer 2<cr>",
        description = "Go to buffer 2"
    }, {
        mode = {"n"},
        lhs = "<space>b3",
        rhs = "<cmd>BufferLineGoToBuffer 3<cr>",
        description = "Go to buffer 3"
    }, {
        mode = {"n"},
        lhs = "<space>b4",
        rhs = "<cmd>BufferLineGoToBuffer 4<cr>",
        description = "Go to buffer 4"
    }, {
        mode = {"n"},
        lhs = "<space>b5",
        rhs = "<cmd>BufferLineGoToBuffer 5<cr>",
        description = "Go to buffer 5"
    }, {
        mode = {"n"},
        lhs = "<space>b6",
        rhs = "<cmd>BufferLineGoToBuffer 6<cr>",
        description = "Go to buffer 6"
    }, {
        mode = {"n"},
        lhs = "<space>b7",
        rhs = "<cmd>BufferLineGoToBuffer 7<cr>",
        description = "Go to buffer 7"
    }, {
        mode = {"n"},
        lhs = "<space>b8",
        rhs = "<cmd>BufferLineGoToBuffer 8<cr>",
        description = "Go to buffer 8"
    }, {
        mode = {"n"},
        lhs = "<space>b9",
        rhs = "<cmd>BufferLineGoToBuffer 9<cr>",
        description = "Go to buffer 9"
    }, --
    -------------------------
    -- 分屏管理 
    -------------------------
    {
        mode = {"n", "v"},
        lhs = "<space>pv",
        rhs = ":vsplit<cr>",
        description = "Panel Split Vertial"
    }, {
        mode = {"n", "v"},
        lhs = "<space>ph",
        rhs = ":split<cr>",
        description = "Panel Split Horizontol"
    }, {
        mode = {"n", "v"},
        lhs = {"<space>px", "<C-q>"},
        rhs = "<C-w>c",
        description = "Close current panel"
    }, {
        mode = {"n", "v"},
        lhs = {"<space>po", "<space>pX"},
        rhs = "<C-w>o",
        description = "Close other panel"
    }, {
        mode = {"n", "v"},
        lhs = "<space>p=",
        rhs = "<C-w>p=",
        description = "Panel Resize default"
    }, {
        mode = {"n", "v"},
        lhs = "<space>pf",
        rhs = "<C-w>T",
        description = "Panel Fullscreen"
    }, --
    -------------------------
    -- 视图管理
    -------------------------
    {
        -- 目录视图
        mode = {"n", "v"},
        lhs = {"<space>e", "<M-b>"},
        rhs = function()
            aux.toggle_sidebar("NvimTree")
            vim.cmd("NvimTreeToggle")
        end,
        description = "Open File Explorer"
    }, {
        -- 大纲视图
        mode = {"n", "v"},
        lhs = {"<space>2", "<leader>o", "<space>o"},
        rhs = "<cmd>AerialToggle! right<cr>",
        description = "Open Outilne Explorer"
    }, {
        -- 版本视图
        mode = {"n"},
        lhs = {"<space>3", "<C-y>"},
        -- rhs = ":UndotreeToggle<cr>",
        rhs = function()
            aux.toggle_sidebar("undotree")
            vim.cmd("UndotreeToggle")
        end,
        options = {silent = true},
        description = "Open Undo Explorer"
    }, {
        -- ctags视图
        mode = {"n"},
        lhs = "<space>4",
        rhs = ":TagbarToggle<cr>",
        description = "Open Tagbar"
    }, {
        -- 数据库视图
        mode = {"n"},
        lhs = "<space>5",
        -- rhs = ":NvDBUIToggle<cr>",
        rhs = function()
            aux.toggle_sidebar("dbui")
            vim.cmd("DBUIToggle")
        end,
        options = {silent = true},
        description = "Open Database Explorer"
    }, --
    -------------------------
    -- 编辑功能
    -------------------------
    {
        mode = {"n", "v"},
        lhs = "<leader>;",
        rhs = '$a;<esc>',
        description = "Line append ;"
    }, {
        mode = {"n"},
        lhs = {"<leader>rf", "<C-r>"},
        rhs = function()
            aux.toggle_sidebar("spectre_panel")
            require("spectre").open_file_search({select_word = true})
        end,
        description = "Replace in current file"
    }, {
        mode = {"n"},
        lhs = {"<leader>rp", "<M-r>"},
        rhs = function()
            aux.toggle_sidebar("spectre_panel")
            require("spectre").open({select_word = true})
        end,
        description = "Replace in workspace"
    }, -- {
    --     mode = {"n"},
    --     lhs = {"<leader>rk"},
    --     rhs = "viw:lua require('spectre').open_file_search({select_word=true})<cr>",
    --     description = "Search in current file"
    -- }, {
    --     mode = {"n"},
    --     lhs = {"<leader>rw"},
    --     rhs = "<cmd>lua require('spectre').open_visual({select_word=true})<cr>",
    --     description = "Search current word in current file"
    -- }, {
    --     mode = {"n"},
    --     lhs = "<space>rq",
    --     rhs = function()
    --         aux.toggle_sidebar("spectre_panel")
    --         require("spectre").open_visual({select_word = true})
    --     end,
    --     description = "Replace current word in workspace"
    -- },
    -------------------------
    -- Code 功能
    -------------------------
    {
        mode = {"n", "v"},
        lhs = {"<leader>cpd"},
        rhs = "<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>",
        description = "Toggle comment"
    }, {
        mode = {"n", "v"},
        lhs = {"<leader>f"},
        rhs = ":w",
        description = "Formt buffer"
    }, {
        mode = {"n", "v"},
        lhs = {"<leader>cpd"},
        rhs = "<cmd>lua require('lvim.lsp.peek').Peek('definition')<cr>",
        description = "Peek definition"
    }, {
        mode = {"n", "v"},
        lhs = {"<leader>cpi"},
        rhs = "<cmd>lua require('lvim.lsp.peek').Peek('implementation')<cr>",
        description = "Peek implementation"
    }, {
        mode = {"n", "v"},
        lhs = {"<leader>ca"},
        rhs = "Telescope diagnostics bufnr=0 theme=get_ivy<cr>",
        description = "Code action"
    }, {
        mode = {"n", "v"},
        lhs = {"<leader>ca"},
        rhs = "<cmd>Telescope quickfix<cr>",
        description = "Quick fix"
    }, {
        mode = {"n", "v"},
        lhs = {"<leader>cd"},
        rhs = "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>",
        description = "Buffer diagnostics"
    }, {
        mode = {"n", "v"},
        lhs = {"<leader>ck"},
        rhs = "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>",
        description = "Previous diagnostics"
    }, {
        mode = {"n", "v"},
        lhs = {"<leader>cj"},
        rhs = "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>",
        description = "Next diagnostics"
    }, --
    -----------------------
    -- 查找 功能
    -------------------------
    { -- 项目导航
        mode = {"n"},
        lhs = {"<space>fp"},
        rhs = ":Telescope projects<cr>",
        description = "Navigate projects"
    }, { -- 文件导航
        mode = {"n"},
        lhs = {"<space>ff", "<M-p>", "<C-p>"},
        rhs = ":Telescope find_files<cr>",
        description = "Navigate files in workspace"
    }, {
        mode = {"n"},
        lhs = "<space>fh",
        rhs = ":Telescope oldfiles<cr>",
        description = "Navigate file in history"
    }, {
        mode = {"n"},
        lhs = {"<space>fb", "<C-t>"},
        rhs = ":Telescope buffers<cr>",
        description = "Navigate file in buffers"
    }, {
        -- 内容查找 (项目范围)
        mode = {"n"},
        lhs = {"<space>fg", "<M-f>"},
        rhs = ":Telescope live_grep<cr>",
        description = "Find string in workspace",
        requires = {"nvim-telescope/telescope.nvim"}
    }, {
        -- 内容查找
        mode = {"n"},
        lhs = {"<leader>fg", "<C-f>"},
        rhs = ":Telescope current_buffer_fuzzy_find<cr>",
        description = "Find string in buffer",
        requires = {"nvim-telescope/telescope.nvim"}
    }, {
        -- 查找标记
        mode = {"n"},
        lhs = "<space>fm",
        rhs = ":Telescope marks<cr>",
        description = "Find marks in workspace",
        requires = {"nvim-telescope/telescope.nvim"}
    }, {
        -- 查找诊断
        mode = {"n"},
        lhs = {"<space>fd", "<leader>fd"},
        rhs = ":Telescope diagnostics bufnr=0 theme=get_ivy<cr>",
        description = "Find diagnostics in buffer",
        requires = {"nvim-telescope/telescope.nvim"}
    }, {
        -- 历史搜索记录
        mode = {"n"},
        lhs = "<space>f/",
        rhs = ":Telescope search_history<cr>",
        description = "Find search history",
        requires = {"nvim-telescope/telescope.nvim"}
    }, {
        -- 历史命令记录
        mode = {"n"},
        lhs = "<space>f:",
        rhs = ":Telescope command_history<cr>",
        description = "Find command history",
        requires = {"nvim-telescope/telescope.nvim"}
    }, {
        -- 历史消息记录
        mode = {"n"},
        lhs = "<space>fn",
        -- <CMD>lua require('telescope').extensions.notify.notify()<CR>", "Notifications"
        rhs = function() require("telescope").extensions.notify.notify() end,
        description = "Find notices history",
        requires = {"nvim-telescope/telescope.nvim"}
    }, {
        -- 查找寄存器
        mode = {"n"},
        lhs = "<leader>fr",
        rhs = ":Telescope registers<cr>",
        description = "Find register",
        requires = {"nvim-telescope/telescope.nvim"}
    }, {
        -- 查找符号
        mode = {"n"},
        lhs = "<leader>fs",
        rhs = ":Telescope lsp_document_symbols<cr>",
        description = "Find document symbols",
        requires = {"nvim-telescope/telescope.nvim"}
    }, {
        mode = {"n"},
        lhs = {"<space>fk", "<leader>fS"},
        rhs = ":Telescope lsp_workspace_symbols<cr>",
        description = "Find workspace symbols",
        requires = {"nvim-telescope/telescope.nvim"}
    }, {
        -- 查找快捷键
        mode = {"n"},
        lhs = "<space>f?",
        rhs = ":Telescope keymaps<cr>",
        description = "Find Keymaps",
        requires = {"nvim-telescope/telescope.nvim"}
    }, {
        -- 查找帮助文档
        mode = {"n"},
        lhs = "<space>fh",
        rhs = ":Telescope help_tags<cr>",
        description = "Find help",
        requires = {"nvim-telescope/telescope.nvim"}
    }, {
        -- 查找并预览主题
        mode = {"n"},
        lhs = "<space>fc",
        rhs = ":lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<CR>",
        description = "Preview Colorscheme",
        requires = {"nvim-telescope/telescope.nvim"}
    }, 
    {
        -- 查找历史剪切板
        mode = {"n"},
        lhs = "<space>fy",
        rhs = function()
            require("telescope").extensions.neoclip.default()
        end,
        description = "Find Clipboard History",
        requires = {"nvim-telescope/telescope.nvim", "AckslD/nvim-neoclip.lua"}
    },
    --
    -------------------------
    -- Git 功能
    -------------------------
    {
        mode = {"n", "v"},
        lhs = {"<leader>go", "<leader>fm"},
        rhs = "<cmd>Telescope git_status<cr>",
        description = "Open Changed file"
    }, {
        mode = {"n", "v"},
        lhs = "<leader>gR",
        rhs = "lua require 'gitsigns'.reset_buffer()<cr>",
        description = "Reset buffer"
    }, {
        mode = {"n", "v"},
        lhs = "<leader>gd",
        rhs = "<cmd>Gitsigns diffthis HEAD<cr>",
        description = "Diff current file"
    }, {
        mode = {"n", "v"},
        lhs = "<leader>gc",
        rhs = ":Telescope git_bcommits<cr>",
        description = "Checkout commit for current file"
    }, {
        mode = {"n", "v"},
        lhs = {"<space>gc", "<leader>gC"},
        rhs = ":Telescope git_commits<cr>",
        description = "Checkout commit"
    }, {
        mode = {"n", "v"},
        lhs = "<leader>gb",
        rhs = ":Telescope git_branches<cr>",
        description = "Checkout branch"
    }, {
        mode = {"n", "v"},
        lhs = "<leader>gl",
        rhs = "<cmd>lua require 'gitsigns'.blame_line()<cr>",
        description = "Blame line"
    }, {
        mode = {"n", "v"},
        lhs = "<leader>gj",
        rhs = "<cmd>lua require 'gitsigns'.next_hunk()<cr>",
        description = "Next hunk"
    }, {
        mode = {"n", "v"},
        lhs = "<leader>g",
        rhs = "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",
        description = "Previous hunk"
    }, {
        mode = {"n", "v"},
        lhs = "<leader>gp",
        rhs = "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
        description = "Preview hunk"
    }, {
        mode = {"n", "v"},
        lhs = "<leader>gr",
        rhs = "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",
        description = "Reset hunk"
    }, {
        mode = {"n", "v"},
        lhs = "<leader>gs",
        rhs = "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",
        description = "Stage hunk"
    }, {
        mode = {"n", "v"},
        lhs = "<leader>gu",
        rhs = "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
        description = "Undo Stage hunk"
    }, -- 
    -------------------------
    -- 调试功能
    -------------------------
    {
        mode = {"n"},
        lhs = "<leader>db",
        rhs = function() require("dap").toggle_breakpoint() end,
        options = {silent = true},
        description = "Mark or delete breakpoints"
    }, {
        mode = {"n"},
        lhs = "<leader>dc",
        rhs = function() require("dap").clear_breakpoints() end,
        options = {silent = true},
        description = "Clear breakpoints in the current buffer"
    }, {
        mode = {"n"},
        lhs = "<F5>",
        rhs = function() require("dap").continue() end,
        options = {silent = true},
        description = "Enable debugging or jump to the next breakpoint"
    }, {
        mode = {"n"},
        lhs = "<F6>",
        rhs = function() require("dap").step_into() end,
        options = {silent = true},
        description = "Step into"
    }, {
        mode = {"n"},
        lhs = "<F7>",
        rhs = function()
            ---@diagnostic disable-next-line: missing-parameter
            require("dap").step_over()
        end,
        options = {silent = true},
        description = "Step over"
    }, {
        mode = {"n"},
        lhs = "<F8>",
        rhs = function() require("dap").step_out() end,
        options = {silent = true},
        description = "Step out"
    }, {
        mode = {"n"},
        lhs = "<F9>",
        rhs = function() require("dap").run_last() end,
        options = {silent = true},
        description = "Rerun debug"
    }, {
        mode = {"n"},
        lhs = "<F10>",
        rhs = function() require("dap").terminate() end,
        options = {silent = true},
        description = "Close debug"
    }, {
        mode = {"n"},
        lhs = "<leader>du",
        rhs = function() require("dapui").toggle() end,
        options = {silent = true},
        description = "Toggle debug ui"
    }, {
        mode = {"n"},
        lhs = "<leader>de",
        rhs = function()
            require("dapui").eval(vim.fn.input("Enter debug expression : "))
        end,
        options = {silent = true},
        description = "Execute debug expressions"
    }, --
    -------------------------
    -- 终端功能
    -------------------------
    -- {
    --     mode = {"n", "v"},
    --     lhs = {"<space>tt", [[<C-\>]]},
    --     -- rhs = ":1ToggleTerm<cr>",
    --     description = "Open terminal"
    -- },  
    {
        mode = {"n", "v"},
        lhs = {"<space>tb"},
        rhs = ":terminal<cr>",
        description = "Buffer terminal"
    }, {
        mode = {"n", "v"},
        lhs = {"<space>tt", [[<C-\>]]},
        -- rhs = function()
        --     require("toggleterm").float_toggle()
        -- end,
        rhs = ":FloatermToggle<cr>",
        description = "Toggle floating terminal"
    }, {
        mode = {"t"},
        lhs = {[[<C-\>]]},
        -- rhs = function()
        --     require("toggleterm").float_toggle()
        -- end,
        rhs = [[<C-\><C-n>:FloatermToggle<cr>]],
        description = "Toggle floating terminal"
    }, {
        mode = {"t"},
        lhs = {[[<C-n>]]},
        rhs = [[<C-\><C-n>:FloatermNew<cr>]],
        options = {},
        description = "New terminal"
    }, {
        mode = {"t"},
        lhs = {[[<C-j>]]},
        rhs = [[<C-\><C-n>:FloatermNext<cr>]],
        description = "Next terminal"
    }, {
        mode = {"t"},
        lhs = {[[<C-k>]]},
        rhs = [[<C-\><C-n>:FloatermPrev<cr>]],
        description = "Prev terminal"
    }, {
        mode = {"t"},
        lhs = {[[<C-q>]]},
        rhs = [[<C-\><C-n>:FloatermKill<cr>]],
        description = "Kill terminal"
    }, {
        mode = {"t"},
        lhs = {[[<C-q>]]},
        rhs = [[<C-\><C-n>:FloatermKill<cr>]],
        description = "Kill terminal"
    }
    -- {
    --     mode = {"n", "v"},
    --     lhs = "<space>tv",
    --     rhs = function()
    --         require("toggleterm").vertical_toggle()
    --     end,
    --     description = "Toggle vertical terminal"
    -- },
    -- {
    --     mode = {"n", "v"},
    --     lhs = "<space>tg",
    --     rhs = function()
    --         require("toggleterm").lazygit_toggle()
    --     end,
    --     description = "Toggle lazygit terminal"
    -- }, {
    --     mode = {"n", "v"},
    --     lhs = "<space>ta",
    --     rhs = ":ToggleTermToggleAll<cr>",
    --     description = "Toggle all terminal"
    -- }, {
    --     mode = {"n", "v"},
    --     lhs = "<space>t1",
    --     rhs = ":1ToggleTerm<cr>",
    --     options = {},
    --     description = "Toggle terminal #1"
    -- }, {
    --     mode = {"n", "v"},
    --     lhs = "<space>t2",
    --     rhs = ":2ToggleTerm<cr>",
    --     options = {},
    --     description = "Toggle terminal #2"
    -- }, {
    --     mode = {"n", "v"},
    --     lhs = "<space>t3",
    --     rhs = ":3ToggleTerm<cr>",
    --     options = {},
    --     description = "Toggle terminal #3"
    -- }, {
    --     mode = {"n", "v"},
    --     lhs = "<space>t4",
    --     rhs = ":4ToggleTerm<cr>",
    --     options = {},
    --     description = "Toggle terminal #4"
    -- }
}

mapping.register(mapping.global)

-- 插件映射
mapping.plugins = {
    ["kyazdani42/nvim-tree.lua"] = {
        global = {
            -- {
            --     mode = {"n"},
            --     lhs = {"<space>e", "<M-b>"},
            --     -- rhs = "<cmd>NvimTreeToggle<cr>",
            --     rhs = function()
            --         aux.toggle_sidebar("NvimTree")
            --         vim.cmd("NvimTreeToggle")
            --     end,

            --     description = "Open File Explorer"
            -- }
            -- {
            --     mode = { "n" },
            --     lhs = "<M-e>",
            --     rhs = "<cmd>NvimTreeFindFile<cr>",
            --    
            --     description = "Find the current file and open it in file explorer",
            -- },
        },
        custom = function()
            return {
                {key = "o", action = "system_open"}, -- 打开文件或文件夹
                {
                    key = {"l", "<2-LeftMouse>", "<CR>"},
                    action = "edit",
                    mode = "n"
                }, -- 打开文件(标签页)
                {key = "n", action = "tabnew"}, -- 打开文件(全屏)
                {key = "v", action = "vsplit"}, -- 打开文件(垂直分屏)
                {key = "h", action = "split"}, -- 打开文件(水平分屏)
                {key = "R", action = "refresh"}, -- 刷新文件管理器
                {key = "a", action = "create"}, -- 新建文件
                {key = "d", action = "remove"}, -- 删除文件
                {key = "r", action = "rename"}, -- 重命名 文件
                {key = {"x", "<C-x>"}, action = "cut"}, -- 剪切文件
                {key = {"c", "<C-c>"}, action = "copy"}, -- 复制文件
                {key = {"p", "<C-p>"}, action = "paste"}, -- 粘贴文件
                {key = "y", action = "copy_name"}, -- 复制文件名
                {key = "Y", action = "copy_path"}, -- 复制文件相对路径
                {key = "gy", action = "copy_absolute_path"}, -- 复制文件绝对路径
                {key = {"]"}, action = "cd"}, -- 进入下一级
                {key = {"["}, action = "dir_up"}, -- 进入上一级
                {key = "i", action = "toggle_ignored"}, -- 显示/隐藏文件
                {key = "I", action = "toggle_file_info"} -- 显示/隐藏文件信息
                --    { key = "gtf", action = "telescope_find_files", action_cb = telescope_find_files },
                --    { key = "gtg", action = "telescope_live_grep", action_cb = telescope_live_grep },
            }
        end
    },
    ["akinsho/bufferline.nvim"] = {
        global = {
            -- {
            --     mode = {"n"},
            --     lhs = "<M-h>",
            --     rhs = "<cmd>BufferLineCyclePrev<cr>",
            --     description = "Go to left buffer"
            -- }, {
            --     mode = {"n"},
            --     lhs = "<M-l>",
            --     rhs = "<cmd>BufferLineCycleNext<cr>",
            --     description = "Go to right buffer"
            -- }, {
            --     mode = {"n"},
            --     lhs = "<M-e>",
            --     rhs = "<cmd>BufferLineMovePrev<cr>",
            --     description = "Move current buffer to left"
            -- }, {
            --     mode = {"n"},
            --     lhs = "<c-y>",
            --     rhs = "<cmd>BufferLineMoveNext<cr>",
            --     description = "Move current buffer to right"
            -- }, {
            --     mode = {"n"},
            --     lhs = "<space>bn",
            --     rhs = "<cmd>enew<cr>",
            --     description = "Create new buffer"
            -- }, {
            --     mode = {"n"},
            --     lhs = {"<M-q>", "<space>bc", "<space>bx"},
            --     rhs = "<cmd>BufferDelete<cr>",
            --     description = "Close current buffer"
            -- }, {
            --     mode = {"n"},
            --     lhs = "<space>bl",
            --     rhs = "<cmd>BufferLineCloseLeft<cr>",
            --     description = "Close all left buffers"
            -- }, {
            --     mode = {"n"},
            --     lhs = "<space>br",
            --     rhs = "<cmd>BufferLineCloseRight<cr>",
            --     description = "Close all right buffers"
            -- }, {
            --     mode = {"n"},
            --     lhs = {"<space>bo", "<space>bX", "<M-Q>"},
            --     rhs = function()
            --         vim.cmd("BufferLineCloseLeft")
            --         vim.cmd("BufferLineCloseRight")
            --     end,
            --     description = "Close all other buffers"
            -- }, {
            --     mode = {"n"},
            --     lhs = "<space>ba",
            --     rhs = function()
            --         vim.cmd("BufferLineCloseLeft")
            --         vim.cmd("BufferLineCloseRight")
            --         vim.cmd("BufferDelete")
            --     end,
            --     description = "Close all buffers"
            -- }, {
            --     mode = {"n"},
            --     lhs = "<space>bs",
            --     rhs = "<cmd>BufferLineSortByExtension<cr>",
            --     description = "Buffers sort (by extension)"
            -- }, {
            --     mode = {"n"},
            --     lhs = "<space>b1",
            --     rhs = "<cmd>BufferLineGoToBuffer 1<cr>",
            --     description = "Go to buffer 1"
            -- }, {
            --     mode = {"n"},
            --     lhs = "<space>b2",
            --     rhs = "<cmd>BufferLineGoToBuffer 2<cr>",
            --     description = "Go to buffer 2"
            -- }, {
            --     mode = {"n"},
            --     lhs = "<space>b3",
            --     rhs = "<cmd>BufferLineGoToBuffer 3<cr>",
            --     description = "Go to buffer 3"
            -- }, {
            --     mode = {"n"},
            --     lhs = "<space>b4",
            --     rhs = "<cmd>BufferLineGoToBuffer 4<cr>",
            --     description = "Go to buffer 4"
            -- }, {
            --     mode = {"n"},
            --     lhs = "<space>b5",
            --     rhs = "<cmd>BufferLineGoToBuffer 5<cr>",
            --     description = "Go to buffer 5"
            -- }, {
            --     mode = {"n"},
            --     lhs = "<space>b6",
            --     rhs = "<cmd>BufferLineGoToBuffer 6<cr>",
            --     description = "Go to buffer 6"
            -- }, {
            --     mode = {"n"},
            --     lhs = "<space>b7",
            --     rhs = "<cmd>BufferLineGoToBuffer 7<cr>",
            --     description = "Go to buffer 7"
            -- }, {
            --     mode = {"n"},
            --     lhs = "<space>b8",
            --     rhs = "<cmd>BufferLineGoToBuffer 8<cr>",
            --     description = "Go to buffer 8"
            -- }, {
            --     mode = {"n"},
            --     lhs = "<space>b9",
            --     rhs = "<cmd>BufferLineGoToBuffer 9<cr>",
            --     description = "Go to buffer 9"
            -- }
        }
    },
    ["nvim-telescope/telescope.nvim"] = {
        global = {
            -- { -- 项目导航
            --     mode = {"n"},
            --     lhs = {"<space>fp"},
            --     rhs = ":Telescope projects<cr>",
            --     description = "Find projects in history"
            -- }, { -- 文件导航
            --     mode = {"n"},
            --     lhs = {"<space>ff", "<M-p>", "<C-p>"},
            --     rhs = ":Telescope find_files<cr>",
            --     description = "Find files in workspace"
            -- }, {
            --     mode = {"n"},
            --     lhs = "<space>fo",
            --     rhs = ":Telescope oldfiles<cr>",
            --     description = "Find file in history"
            -- }, {
            --     mode = {"n"},
            --     lhs = {"<space>fb", "<C-t>"},
            --     rhs = ":Telescope buffers<cr>",
            --     description = "Find file in buffers"
            -- }, {
            --     -- 内容查找 (项目范围)
            --     mode = {"n"},
            --     lhs = {"<space>fg", "<M-f>"},
            --     rhs = ":Telescope live_grep<cr>",
            --     description = "Find string in workspace"
            -- }, {
            --     -- 内容查找
            --     mode = {"n"},
            --     lhs = {"<leader>fg", "<C-f>"},
            --     rhs = ":Telescope current_buffer_fuzzy_find<cr>",
            --     description = "Find string in buffer"
            -- }, {
            --     -- 查找标记
            --     mode = {"n"},
            --     lhs = "<space>fm",
            --     rhs = ":Telescope marks<cr>",
            --     description = "Find marks in workspace"
            -- }, {
            --     -- 查找诊断
            --     mode = {"n"},
            --     lhs = {"<space>fd", "<leader>fd"},
            --     rhs = ":Telescope diagnostics bufnr=0 theme=get_ivy<cr>",
            --     description = "Find diagnostics in buffer"
            -- }, {
            --     -- 历史搜索记录
            --     mode = {"n"},
            --     lhs = "<space>f/",
            --     rhs = ":Telescope search_history<cr>",
            --     description = "Find search history"
            -- }, {
            --     -- 历史命令记录
            --     mode = {"n"},
            --     lhs = "<space>f:",
            --     rhs = ":Telescope command_history<cr>",
            --     description = "Find command history"
            -- }, {
            --     -- 历史消息记录
            --     mode = {"n"},
            --     lhs = "<space>fn",
            --     -- <CMD>lua require('telescope').extensions.notify.notify()<CR>", "Notifications"
            --     rhs = function()
            --         require("telescope").extensions.notify.notify()
            --     end,
            --     description = "Find notices history"
            -- }, -- {
            -- --     mode = {"n"},
            -- --     lhs = "<space>fh",
            -- --     rhs = function()
            -- --         require("telescope.builtin").resume()
            -- --     end,
            -- --     description = "Find last lookup"
            -- -- },
            -- {
            --     -- 寄存器
            --     mode = {"n"},
            --     lhs = "<leader>fr",
            --     rhs = ":Telescope registers<cr>",
            --     description = "Find register"
            -- }, {
            --     -- 查找符号
            --     mode = {"n"},
            --     lhs = "<leader>fs",
            --     rhs = ":Telescope lsp_document_symbols<cr>",
            --     description = "Find document symbols"
            -- }, {
            --     mode = {"n"},
            --     lhs = {"<space>fk", "<leader>fS"},
            --     rhs = ":Telescope lsp_workspace_symbols<cr>",
            --     description = "Find workspace symbols"
            -- }, {
            --     -- 查找快捷键
            --     mode = {"n"},
            --     lhs = "<space>fk",
            --     rhs = ":Telescope keymaps<cr>",
            --     description = "Find Keymaps"
            -- }, {
            --     -- 查找帮助文档
            --     mode = {"n"},
            --     lhs = "<space>fh",
            --     rhs = ":Telescope help_tags<cr>",
            --     description = "Find help"
            -- }, {
            --     -- 查找并预览主题
            --     mode = {"n"},
            --     lhs = "<space>fc",
            --     rhs = ":lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<CR>",
            --     description = "Preview Colorscheme"
            -- }
        },
        custom = function()
            local _, actions = pcall(require, "telescope.actions")
            return {
                i = {
                    -- 关闭窗口
                    ["<C-c>"] = actions.close,
                    -- 选择项目
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-W>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<Down>"] = actions.move_selection_next,
                    ["<Up>"] = actions.move_selection_previous,

                    -- 预览窗口滚动
                    ["<C-u>"] = actions.preview_scrolling_up,
                    ["<C-d>"] = actions.preview_scrolling_down,
                    ["<PageUp>"] = actions.results_scrolling_up,
                    ["<PageDown>"] = actions.results_scrolling_down,

                    -- 历史记录
                    ["<C-n>"] = actions.cycle_history_next,
                    ["<C-p>"] = actions.cycle_history_prev,

                    -- 打开方式
                    ["<CR>"] = actions.select_default, -- 打开
                    ["<C-l>"] = actions.file_edit,
                    ["<C-t>"] = actions.select_tab,
                    ["<C-h>"] = actions.select_horizontal, -- 水平分屏打开
                    ["<C-v>"] = actions.select_vertical, -- 垂直分屏打开

                    -- 选择多个
                    ["<Tab>"] = actions.toggle_selection +
                        actions.move_selection_worse,
                    ["<S-Tab>"] = actions.toggle_selection +
                        actions.move_selection_better,
                    ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                    ["<M-q>"] = actions.send_selected_to_qflist +
                        actions.open_qflist
                },
                n = {
                    -- 关闭窗口
                    ["<esc>"] = actions.close,
                    ["<C-c>"] = actions.close,

                    -- 打开方式
                    ["l"] = actions.file_edit,
                    ["<CR>"] = actions.select_default, -- 打开
                    ["<C-t>"] = actions.select_tab,
                    ["<C-h>"] = actions.select_horizontal, -- 水平分屏打开
                    ["h"] = actions.select_vertical,
                    ["<C-v>"] = actions.select_vertical, -- 垂直分屏打开
                    ["v"] = actions.select_vertical,

                    -- 选择窗口光标移动
                    ["j"] = actions.move_selection_next,
                    ["k"] = actions.move_selection_previous,
                    ["<Down>"] = actions.move_selection_next,
                    ["<Up>"] = actions.move_selection_previous,
                    ["H"] = actions.move_to_top,
                    ["M"] = actions.move_to_middle,
                    ["L"] = actions.move_to_bottom,
                    ["gg"] = actions.move_to_top,
                    ["G"] = actions.move_to_bottom,
                    ["<PageUp>"] = actions.results_scrolling_up,
                    ["<PageDown>"] = actions.results_scrolling_down,

                    -- 预览窗口滚动
                    ["<C-u>"] = actions.preview_scrolling_up,
                    ["<C-d>"] = actions.preview_scrolling_down,

                    ["<Tab>"] = actions.toggle_selection +
                        actions.move_selection_worse,
                    ["<S-Tab>"] = actions.toggle_selection +
                        actions.move_selection_better,
                    ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                    ["<M-q>"] = actions.send_selected_to_qflist +
                        actions.open_qflist
                }
            }
        end
    },
    ["stevearc/aerial"] = {
        buffer = {
            {
                mode = {"n"},
                lhs = "{",
                rhs = "<cmd>AerialPrev<cr>",
                description = "Move item up"
            }, {
                mode = {"n"},
                lhs = "}",
                rhs = "<cmd>AerialNext<cr>",
                description = "Move item down"
            }, {
                mode = {"n"},
                lhs = "[[",
                rhs = "<cmd>AerialPrevUp<cr>",
                description = "Move up one level"
            }, {
                mode = {"n"},
                lhs = "]]",
                rhs = "<cmd>AerialNextUp<cr>",
                description = "Move down one level"
            }
        }
    },
    ["akinsho/toggleterm.nvim"] = {global = {}},
    ["kristijanhusak/vim-dadbod-ui"] = {
        global = {
            -- {
            --     mode = {"n"},
            --     lhs = "<leader>4",
            --     -- rhs = ":NvDBUIToggle<cr>",
            --     rhs = function()
            --         aux.toggle_sidebar("dbui")
            --         vim.cmd("DBUIToggle")
            --     end,
            --     options = {silent = true},
            --     description = "Open Database Explorer"
            -- }
        }
    },
    ["hrsh7th/vim-vsnip"] = {
        global = {
            {
                mode = {"i", "s"},
                lhs = "<tab>",
                rhs = "vsnip#jumpable(1)? '<Plug>(vsnip-jump-next)':'<tab>'",
                options = {silent = true, expr = true},
                description = "Jump to the next fragment placeholder"
            }, {
                mode = {"i", "s"},
                lhs = "<s-tab>",
                rhs = "vsnip#jumpable(-1)?'<Plug>(vsnip-jump-prev)':'<s-tab>'",
                options = {silent = true, expr = true},
                description = "Jump to the prev fragment placeholder"
            }
        }
    },
    ["lewis6991/gitsigns.nvim"] = {
        buffer = {
            {
                mode = {"n"},
                lhs = "[c",
                rhs = "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<cr>'",
                options = {silent = true, expr = true},
                description = "Jump to the prev hunk"
            }, {
                mode = {"n"},
                lhs = "]c",
                rhs = "&diff ? ']c' : '<cmd>Gitsigns next_hunk<cr>'",
                options = {silent = true, expr = true},
                description = "Jump to the next hunk"
            }, {
                mode = {"n"},
                lhs = "<leader>gl",
                rhs = "<cmd>Gitsigns toggle_current_line_blame<cr>",
                description = "Toggle current line blame"
            }, {
                mode = {"n"},
                lhs = "<leader>gh",
                rhs = "<cmd>lua require'gitsigns'.preview_hunk()<cr>",
                description = "Preview current hunk"
            }, {
                mode = {"n"},
                lhs = "<leader>gH",
                rhs = "<cmd>lua require'gitsigns'.blame_line{full=true}<cr>",
                description = "Show current block blame"
            }, {
                mode = {"n"},
                lhs = "<leader>gd",
                rhs = "<cmd>Gitsigns diffthis<cr>",
                description = "Open deff view"
            }, {
                mode = {"n"},
                lhs = "<leader>gD",
                rhs = "<cmd>Gitsigns toggle_deleted<cr>",
                description = "Show deleted lines"
            }, {
                mode = {"n", "v"},
                lhs = "<leader>gr",
                rhs = "<cmd>Gitsigns reset_hunk<cr>",
                description = "Reset current hunk"
            }, {
                mode = {"n"},
                lhs = "<leader>gR",
                rhs = "<cmd>Gitsigns reset_buffer<cr>",
                description = "Reset current buffer"
            }
        }
    },
    ["williamboman/nvim-lsp-installer"] = {
        buffer = {
            {
                mode = {"n"},
                lhs = "<leader>ca",
                rhs = vim.lsp.buf.code_action,

                description = "Show code action"
            }, {
                mode = {"n"},
                lhs = "<leader>cn",
                rhs = vim.lsp.buf.rename,

                description = "Variable renaming"
            }, {
                mode = {"n"},
                lhs = "<leader>cf",
                rhs = vim.lsp.buf.formatting_sync,

                description = "Format buffer"
            }, {
                mode = {"n"},
                lhs = "gI",
                rhs = function()
                    require("telescope.builtin").lsp_implementations()
                end,

                description = "Go to implementations"
            }, {
                mode = {"n"},
                lhs = "gD",
                rhs = function()
                    require("telescope.builtin").lsp_type_definitions()
                end,

                description = "Go to type definitions"
            }, {
                mode = {"n"},
                lhs = "gd",
                rhs = function()
                    require("telescope.builtin").lsp_definitions()
                end,

                description = "Go to definitions"
            }, {
                mode = {"n"},
                lhs = "gr",
                rhs = function()
                    require("telescope.builtin").lsp_references()
                end,
                description = "Go to references"
            }, {
                mode = {"n"},
                lhs = "gh",
                rhs = vim.lsp.buf.hover,

                description = "Show help information"
            }, {
                mode = {"n"},
                lhs = "go",
                rhs = function()
                    require("telescope.builtin").diagnostics()
                end,

                description = "Show Workspace Diagnostics"
            }, {
                mode = {"n"},
                lhs = "g[",
                rhs = function()
                    vim.diagnostic.goto_prev({float = {border = "rounded"}})
                end,

                description = "Jump to prev diagnostic"
            }, {
                mode = {"n"},
                lhs = "g]",
                rhs = function()
                    vim.diagnostic.goto_next({float = {border = "rounded"}})
                end,

                description = "Jump to next diagnostic"
            }, {
                mode = {"i"},
                lhs = "<c-8>",
                rhs = function()
                    -- When the signature is visible, pressing <c-j> again will close the window
                    local wins = vim.api.nvim_list_wins()
                    for _, win_id in ipairs(wins) do
                        local buf_id = vim.api.nvim_win_get_buf(win_id)
                        local ft = vim.api.nvim_buf_get_option(buf_id,
                                                               "filetype")
                        if ft == "lsp-signature-help" then
                            vim.api.nvim_win_close(win_id, false)
                            return
                        end
                    end
                    vim.lsp.buf.signature_help()
                end,

                description = "Toggle signature help"
            }, {
                mode = {"i", "n"},
                lhs = "<c-f>",
                rhs = function()
                    local scroll_floating_filetype = {
                        "lsp-signature-help", "lsp-hover"
                    }
                    local wins = vim.api.nvim_list_wins()

                    for _, win_id in ipairs(wins) do
                        local buf_id = vim.api.nvim_win_get_buf(win_id)
                        local ft = vim.api.nvim_buf_get_option(buf_id,
                                                               "filetype")

                        if vim.tbl_contains(scroll_floating_filetype, ft) then
                            local win_height =
                                vim.api.nvim_win_get_height(win_id)
                            local cursor_line =
                                vim.api.nvim_win_get_cursor(win_id)[1]
                            local buf_total_line =
                                vim.api.nvim_buf_line_count(buf_id)
                            ---@diagnostic disable-next-line: redundant-parameter
                            local win_last_line = vim.fn.line("w$", win_id)

                            if buf_total_line == win_height then
                                vim.api.nvim_echo({
                                    {"Can't scroll down", "MoreMsg"}
                                }, false, {})
                                return
                            end

                            opt_scrolloff = vim.opt.scrolloff:get()
                            vim.opt.scrolloff = 0
                            if cursor_line < win_last_line then
                                vim.api.nvim_win_set_cursor(win_id, {
                                    win_last_line + 5, 0
                                })
                            elseif cursor_line + 5 > buf_total_line then
                                vim.api.nvim_win_set_cursor(win_id,
                                                            {buf_total_line, 0})
                            else
                                vim.api.nvim_win_set_cursor(win_id, {
                                    cursor_line + 5, 0
                                })
                            end
                            vim.opt.scrolloff = opt_scrolloff
                            return
                        end
                    end

                    local map = "<c-f>"
                    local key = vim.api.nvim_replace_termcodes(map, true, false,
                                                               true)
                    vim.api.nvim_feedkeys(key, "n", true)
                end,

                description = "Scroll down floating window"
            }, {
                mode = {"i", "n"},
                lhs = "<c-b>",
                rhs = function()
                    local scroll_floating_filetype = {
                        "lsp-signature-help", "lsp-hover"
                    }
                    local wins = vim.api.nvim_list_wins()

                    for _, win_id in ipairs(wins) do
                        local buf_id = vim.api.nvim_win_get_buf(win_id)
                        local ft = vim.api.nvim_buf_get_option(buf_id,
                                                               "filetype")

                        if vim.tbl_contains(scroll_floating_filetype, ft) then
                            local win_height =
                                vim.api.nvim_win_get_height(win_id)
                            local cursor_line =
                                vim.api.nvim_win_get_cursor(win_id)[1]
                            local buf_total_line =
                                vim.api.nvim_buf_line_count(buf_id)
                            ---@diagnostic disable-next-line: redundant-parameter
                            local win_first_line = vim.fn.line("w0", win_id)

                            if buf_total_line == win_height then
                                vim.api.nvim_echo({
                                    {"Can't scroll up", "MoreMsg"}
                                }, false, {})
                                return
                            end

                            opt_scrolloff = vim.opt.scrolloff:get()
                            vim.opt.scrolloff = 0
                            if cursor_line > win_first_line then
                                vim.api.nvim_win_set_cursor(win_id, {
                                    win_first_line - 5, 0
                                })
                            elseif cursor_line - 5 < 1 then
                                vim.api.nvim_win_set_cursor(win_id, {1, 0})
                            else
                                vim.api.nvim_win_set_cursor(win_id, {
                                    cursor_line - 5, 0
                                })
                            end
                            vim.opt.scrolloff = opt_scrolloff
                            return
                        end
                    end

                    local map = "<c-b>"
                    local key = vim.api.nvim_replace_termcodes(map, true, false,
                                                               true)
                    vim.api.nvim_feedkeys(key, "n", true)
                end,

                description = "Scroll up floating window"
            }
        }
    },
    ["hrsh7th/nvim-cmp"] = {
        custom = function()
            local cmp = require("cmp")
            local has_words_before = function()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and
                           vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(
                               col, col):match "%s" == nil
            end

            return {
                ["<cr>"] = cmp.mapping(cmp.mapping.confirm(), {"i", "s", "c"}),
                ["<c-l>"] = cmp.mapping(cmp.mapping.confirm(), {"i", "s", "c"}),
                ["<c-k>"] = cmp.mapping(cmp.mapping.select_prev_item(),
                                        {"i", "s", "c"}),
                ["<c-j>"] = cmp.mapping(cmp.mapping.select_next_item(),
                                        {"i", "s", "c"}),
                ["<c-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-5),
                                        {"i", "s", "c"}),
                ["<c-d>"] = cmp.mapping(cmp.mapping.scroll_docs(5),
                                        {"i", "s", "c"}),
                ["<c-p>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        for i = 1, 5, 1 do
                            cmp.select_prev_item({
                                behavior = cmp.SelectBehavior.Select
                            })
                        end
                    else
                        fallback()
                    end
                end, {"i", "s", "c"}),

                ["<c-n>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        for i = 1, 5, 1 do
                            cmp.select_next_item({
                                behavior = cmp.SelectBehavior.Select
                            })
                        end
                    else
                        fallback()
                    end
                end, {"i", "s", "c"}),

                ["<c-c>"] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.abort()
                        -- else
                        --     cmp.complete()
                    end
                end, {"i", "s", "c"}),

                ["<m-.>"] = cmp.mapping(cmp.mapping.complete(), {'i', 's', 'c'}),

                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, {"i", "c", "v"}),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, {"i", "c", "v"})
            }
        end
    },
    ["mbbill/undotree"] = {
        global = {
            -- {
            --     -- 文件历史版本树
            --     mode = {"n"},
            --     lhs = {"<C-y>", "<space>3"},
            --     -- rhs = ":UndotreeToggle<cr>",
            --     rhs = function()
            --         aux.toggle_sidebar("undotree")
            --         vim.cmd("UndotreeToggle")
            --     end,
            --     options = {silent = true},
            --     description = "Open Undo Explorer"
            -- }
        }
    },
    ["mfussenegger/nvim-dap"] = {global = {}},
    ["rcarriga/nvim-dap-ui"] = {global = {}},
    ["kevinhwang91/nvim-hlslens"] = {global = {}},
    ["nvim-pack/nvim-spectre"] = {
        global = {},
        buffer = {
            ['toggle_line'] = {
                map = "dd",
                cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
                desc = "toggle current item"
            },
            ['enter_file'] = {
                map = "<cr>",
                cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
                desc = "goto current file"
            },
            ['send_to_qf'] = {
                map = "<leader>q",
                cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
                desc = "send all item to quickfix"
            },
            ['replace_cmd'] = {
                map = "<leader>c",
                cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
                desc = "input replace vim command"
            },
            ['show_option_menu'] = {
                map = "<leader>o",
                cmd = "<cmd>lua require('spectre').show_options()<CR>",
                desc = "show option"
            },
            ['run_replace'] = {
                map = "<leader>R",
                cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
                desc = "replace all"
            },
            ['change_view_mode'] = {
                map = "<leader>v",
                cmd = "<cmd>lua require('spectre').change_view()<CR>",
                desc = "change result view mode"
            },
            ['toggle_live_update'] = {
                map = "tu",
                cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
                desc = "update change when vim write file."
            },
            ['toggle_ignore_case'] = {
                map = "ti",
                cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
                desc = "toggle ignore case"
            },
            ['toggle_ignore_hidden'] = {
                map = "th",
                cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
                desc = "toggle search hidden"
            }
        }
    },
    ["phaazon/hop.nvim"] = {
        global = {
            {
                mode = {"n"},
                lhs = "f",
                rhs = "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"
            }, {
                mode = {"n"},
                lhs = "F",
                rhs = "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"
            }, {
                mode = {"o"},
                lhs = "f",
                rhs = "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>"
            }, {
                mode = {"o"},
                lhs = "F",
                rhs = "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>"
            }, {
                mode = '',
                lhs = 't',
                rhs = "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"
            }, {
                mode = '',
                lhs = 'T',
                rhs = "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"
            }, {
                -- 快速查找本行指定字符 (用法: '<char>)
                mode = {"n", "v"},
                lhs = "'",
                rhs = "<cmd>HopChar1CurrentLine<cr>",
                description = "Jump to search char on current line"
            }, -- {
            --     -- 提示可视范围内指定字符
            --     mode = {"n", "v"},
            --     lhs = "<leader>jc",
            --     rhs = "<cmd>HopChar1<cr>",
            --     description = "Jump to char on buffer"
            -- },
            {
                -- 提示可视范围内单词首字母
                mode = {"n", "v"},
                lhs = "<leader>jw",
                rhs = "<cmd>HopWord<cr>",
                description = "Jump to word on buffer"
            }, {
                -- 提示可视范围内行首
                mode = {"n", "v"},
                lhs = "<leader>jl",
                rhs = "<cmd>HopLine<cr>",
                description = "Jump to line on buffer"
            }
        }
    },
    ["todo-comments.nvim"] = {
        global = {
            {
                mode = {"n"},
                lhs = "<space>ft",
                rhs = function()
                    require("telescope").extensions["todo-comments"].todo()
                end,
                description = "Find todo tag in the current workspace"
            }
        }
    },
    ["AckslD/nvim-neoclip.lua"] = {
        global = {
            
            --  {
            --     mode = {"n"},
            --     lhs = "<leader>cy",
            --     rhs = function()
            --         require("neoclip").clear_history()
            --     end,
            --     description = "Clear Clipboard History"
            -- }
        },
        custom = {
            i = {
                select = "<nop>",
                paste = "<cr>",
                paste_behind = "<nop>",
                replay = "<nop>",
                delete = "<c-d>",
                custom = {}
            },
            n = {
                select = "<nop>",
                paste = "<cr>",
                paste_behind = "<nop>",
                replay = "<nop>",
                delete = "dd",
                custom = {}
            }
        }
    },
    ["mg979/vim-visual-multi"] = {
        global = {
            {
                mode = {"n"},
                lhs = {"<M-p>", "<C-S-p>"},
                rhs = ":call vm#commands#add_cursor_up(0, v:count1)<cr>",
                options = {silent = true},
                description = "Create cursor down"
            }, {
                mode = {"n"},
                lhs = {"<M-n>", "<C-S-n>"},
                rhs = ":call vm#commands#add_cursor_down(0, v:count1)<cr>",
                options = {silent = true},
                description = "Create cursor up"
            }
        },
        custom = {
            ["Find Under"] = "<c-n>",
            ["Find Prev"] = "<c-p>",
            ["Skip Region"] = "<c-s>",
            ["Remove Region"] = "<c-d>"
        }
    },
    ["github/copilot.vim"] = {
        global = {
            {
                mode = {"i"},
                lhs = "<c-l>",
                rhs = "copilot#Accept('')",
                options = {silent = true, expr = true},
                description = "Suggestions for using copilot"
            }
        }
    },
    ["olimorris/persisted.nvim"] = {
        global = {
            {
                mode = {"n"},
                lhs = "<leader>sl",
                rhs = function()
                    vim.cmd("silent! SessionLoad")
                    -- Reload lsp servers
                    pcall(vim.cmd, "edit")
                end,
                description = "Load session"
            }, {
                mode = {"n"},
                lhs = "<leader>ss",
                rhs = function()
                    vim.cmd("silent! SessionSave")
                    print("Session saved successfully")
                end,
                description = "Save session"
            }, {
                mode = {"n"},
                lhs = "<leader>sd",
                rhs = function()
                    local ok, _ = pcall(vim.cmd, "SessionDelete")
                    if ok then
                        print("Session deleted successfully")
                    else
                        print("Session deleted failed, file has been deleted")
                    end
                end,
                description = "Delete session"
            }
        }
    },
    ["AndrewRadev/switch.vim"] = {
        global = {
            {
                mode = {"n"},
                lhs = "<leader>gs",
                rhs = ":Switch<cr>",
                description = "Switch the opposite meaning of the word"
            }, {
                mode = {"n"},
                lhs = "<leader>gS",
                rhs = function()
                    vim.fn["switch#Switch"]({
                        definitions = vim.g.variable_style_switch_definitions
                    })
                end,
                description = "Switch variable naming style"
            }
        }
    },
    ["askfiy/nvim-picgo"] = {
        global = {
            {
                mode = {"n"},
                lhs = "<leader>uc",
                rhs = function()
                    require("nvim-picgo").upload_clipboard()
                end,
                description = "Upload image from clipboard"
            }, {
                mode = {"n"},
                lhs = "<leader>uf",
                rhs = function()
                    require("nvim-picgo").upload_imagefile()
                end,
                description = "Upload image from disk file"
            }
        }
    },
    ["uga-rosa/translate.nvim"] = {
        global = {
            {
                mode = {"n", "v"},
                lhs = "<leader>tcs",
                rhs = ":Translate ZH -source=EN -output=split<cr>",
                description = "Translate English to Chinese and open in split window"
            }, {
                mode = {"n", "v"},
                lhs = "<leader>tcr",
                rhs = ":Translate ZH -source=EN -output=replace<cr>",
                description = "Translate English to Chinese and replace English"
            }, {
                mode = {"n", "v"},
                lhs = "<leader>tcf",
                rhs = ":Translate ZH -source=EN -output=floating<cr>",
                description = "Translate English to Chinese and open in float window"
            }, {
                mode = {"n", "v"},
                lhs = "<leader>tci",
                rhs = ":Translate ZH -source=EN -output=insert<cr>",
                description = "Translate English to Chinese and insert to next line"
            }, {
                mode = {"n", "v"},
                lhs = "<leader>tcc",
                rhs = ":Translate ZH -source=EN -output=register<cr>",
                description = "Translate English to Chinese and copy result to clipboard"
            }, {
                mode = {"n"},
                lhs = "<leader>tcb",
                rhs = ":Translate ZH -source=EN -output=floating -comment<cr>",
                description = "Translate English comment to Chinese and open in float window"
            }, {
                mode = {"n"},
                lhs = "<leader>tcw",
                rhs = ":normal! viw<cr>:Translate ZH -source=EN -output=floating<cr>",
                description = "Translate English word to Chinese and open in float window"
            }, {
                mode = {"n", "v"},
                lhs = "<leader>tes",
                rhs = ":Translate EN -source=ZH -output=split<cr>",
                description = "Translate Chinese to English and open in split window"
            }, {
                mode = {"n", "v"},
                lhs = "<leader>ter",
                rhs = ":Translate EN -source=ZH -output=replace<cr>",
                description = "Translate Chinese to English and replace Chinese"
            }, {
                mode = {"n", "v"},
                lhs = "<leader>tef",
                rhs = ":Translate EN -source=ZH -output=floating<cr>",
                description = "Translate Chinese to English and open in float window"
            }, {
                mode = {"n", "v"},
                lhs = "<leader>tei",
                rhs = ":Translate EN -source=ZH -output=insert<cr>",
                description = "Translate Chinese to English and insert to next line"
            }, {
                mode = {"n", "v"},
                lhs = "<leader>tec",
                rhs = ":Translate EN -source=ZN -output=register<cr>",
                description = "Translate Chinese to English and copy result to clipboard"
            }, {
                mode = {"n"},
                lhs = "<leader>teb",
                rhs = ":Translate EN -source=ZH -output=floating -comment<cr>",
                description = "Translate Chinese comment to English and open in float window"
            }, {
                mode = {"n"},
                lhs = "<leader>tew",
                rhs = ":normal! viw<cr>:Translate EN -source=ZH -output=floating<cr>",
                description = "Translate Chinese word to English and open in float window"
            }
        }
    },
    ["kristijanhusak/vim-carbon-now-sh"] = {
        global = {
            {
                mode = {"v"},
                lhs = "<leader>ci",
                rhs = ":CarbonNowSh<cr>",
                options = {silent = true},
                description = "Code screenshot"
            }, {
                mode = {"n"},
                lhs = "<leader>ci",
                rhs = "ggVG:CarbonNowSh<cr>",
                options = {silent = true},
                description = "Code screenshot"
            }
        }
    },
    ["jbyuki/venn"] = {
        global = {
            {
                -- ASCII 画布
                mode = {"n"},
                lhs = "<space>5",
                rhs = function()
                    require("venn").toggle_venn_mode()
                end,
                options = {silent = true},
                description = "Open Venn Mode"
            }
        },
        buffer = {
            {
                mode = {"n"},
                lhs = "<c-j>",
                rhs = "<c-v>j:VBox<cr>",
                description = "Draw line to down"
            }, {
                mode = {"n"},
                lhs = "<c-k>",
                rhs = "<c-v>k:VBox<cr>",
                description = "Draw line to up"
            }, {
                mode = {"n"},
                lhs = "<c-l>",
                rhs = "<c-v>l:VBox<cr>",
                description = "Draw line to left"
            }, {
                mode = {"n"},
                lhs = "<c-h>",
                rhs = "<c-v>h:VBox<cr>",
                description = "Draw line to right"
            },
            {
                mode = {"v"},
                lhs = "b",
                rhs = ":VBox<cr>",
                description = "Draw hollow box"
            },
            {
                mode = {"v"},
                lhs = "f",
                rhs = ":VFill<cr>",
                description = "Draw solid box"
            }
        }
    }
}

return mapping
