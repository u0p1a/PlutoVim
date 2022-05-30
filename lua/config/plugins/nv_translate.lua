-- https://github.com/uga-rosa/translate.nvim

local mapping = require("core.mappings")

local M = {
    replace_char = {
        ["u003d"] = "=",
        ["＃"] = "#",
    },
}

function M.before()
    M.register_global_key()
end

function M.load()
    local ok, m = pcall(require, "translate")
    if not ok then
        return
    end

    M.translate = m
    M.translate.setup({
        default = {
            command = "translate_shell",
            output = "floating",
            parse_before = "trim",
            parse_after = "replace_symbols",
        },
        preset = {
            output = {
                split = {
                    min_size = 8,
                },
            },
        },
        parse_after = {
            replace_symbols = {
                cmd = function(lines)
                    -- replace some special symbols
                    for i, line in ipairs(lines) do
                        for char, rep in pairs(M.replace_char) do
                            if line:match(char) then
                                lines[i] = line:gsub(char, rep)
                            end
                        end
                    end

                    return lines
                end,
            },
        },
    })
end

function M.after() end

function M.register_global_key()
    mapping.register(mapping.plugins["uga-rosa/translate.nvim"].global)
end

return M
