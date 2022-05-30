-- https://github.com/mfussenegger/nvim-dap

-- Dap download the debugger manually
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

local mapping = require("core.mappings")

local M = {}

function M.load_dap_config()
    -- Load adapter configuration file
    M.dubug_adapter_config = {
        go = require("config.dap.go"),
        python = require("config.dap.python"),
        dotnet = require("config.dap.dotnet"),
    }
end

function M.before()
    M.register_global_key()
end

function M.load()
    local ok, m = pcall(require, "dap")
    if not ok then
        return
    end

    M.dap = m
    M.load_dap_config()
end

function M.after()
    for _, dap_config in pairs(M.dubug_adapter_config) do
        M.dap.adapters = vim.tbl_deep_extend("force", M.dap.adapters, dap_config.adapters)
        M.dap.configurations = vim.tbl_deep_extend("force", M.dap.configurations, dap_config.configurations)
    end
end

function M.register_global_key()
    mapping.register(mapping.plugins["mfussenegger/nvim-dap"].global)
end

return M
