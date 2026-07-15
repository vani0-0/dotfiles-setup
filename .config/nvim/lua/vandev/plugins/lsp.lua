local M = {}

local augroup = require 'vandev.utils.augroup'

function M.setup()
    require('fidget').setup {}

    vim.api.nvim_create_autocmd('LspAttach', {
        group = augroup 'vandev-lsp-attach',
        callback = function(event)
            local map = function(keys, func, desc, mode)
                mode = mode or 'n'
                vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
            end

            map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
            map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
            map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if client and client:supports_method('textDocument/documentHighlight', event.buf) then
                local highlight_augroup = augroup 'vandev-lsp-highlight' 
                vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                    buffer = event.buf,
                    group = highlight_augroup,
                    callback = vim.lsp.buf.document_highlight,
                })

                vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                    buffer = event.buf,
                    group = highlight_augroup,
                    callback = vim.lsp.buf.clear_references,
                })

                vim.api.nvim_create_autocmd('LspDetach', {
                    group = augroup 'vandev-lsp-detach',
                    callback = function(event2)
                        vim.lsp.buf.clear_references()
                        vim.api.nvim_clear_autocmds { group = 'vandev-lsp-highlight', buffer = event2.buf }
                    end,
                })
            end

            if client and client:supports_method('textDocument/inlayHint', event.buf) then
                map('<leader>th', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }) end, '[T]oggle Inlay [H]ints')
            end
        end,
    })

    ---@type table<string, vim.lsp.Config>
    local servers = {
        pyright = {},
        ts_ls = {},
        stylua = {}, -- Used to format Lua code

        -- Special Lua Config, as recommended by neovim help docs
        lua_ls = {
            on_init = function(client)
                client.server_capabilities.documentFormattingProvider = false -- Disable formatting (formatting is done by stylua)

                if client.workspace_folders then
                    local path = client.workspace_folders[1].name
                    if path ~= vim.fn.stdpath 'config' and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then return end
                end

                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                    runtime = {
                        version = 'LuaJIT',
                        path = { 'lua/?.lua', 'lua/?/init.lua' },
                    },
                    workspace = {
                        checkThirdParty = false,
                        -- NOTE: this is a lot slower and will cause issues when working on your own configuration.
                        --  See https://github.com/neovim/nvim-lspconfig/issues/3189
                        library = vim.tbl_extend('force', vim.api.nvim_get_runtime_file('', true), {
                            '${3rd}/luv/library',
                            '${3rd}/busted/library',
                        }),
                    },
                })
            end,
            ---@type lspconfig.settings.lua_ls
            settings = {
                Lua = {
                    format = { enable = false }, -- Disable formatting (formatting is done by stylua)
                },
            },
        },
    }
    require('mason').setup {}

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
        "prettier",
        "black",
        "isort",
    })

    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    for name, server in pairs(servers) do
        vim.lsp.config(name, server)
        vim.lsp.enable(name)
    end

    require('conform').setup {
        notify_on_error = false,
        format_on_save = function(bufnr)
            -- You can specify filetypes to autoformat on save here:
            local enabled_filetypes = {
                -- lua = true,
                -- python = true,
            }
            if enabled_filetypes[vim.bo[bufnr].filetype] then
                return { timeout_ms = 500 }
            else
                return nil
            end
        end,
        default_format_opts = {
            lsp_format = 'fallback', -- Use external formatters if configured below, otherwise use LSP formatting. Set to `false` to disable LSP formatting entirely.
        },
        -- You can also specify external formatters in here.
        formatters_by_ft = {
            -- rust = { 'rustfmt' },
            -- Conform can also run multiple formatters sequentially
            -- python = { "isort", "black" },
            --
            -- You can use 'stop_after_first' to run the first available formatter from the list
            -- javascript = { "prettierd", "prettier", stop_after_first = true },

            dart = { 'dart_format' },
        },
    }
    local keymapper = require("vandev.utils.keymap")

    keymapper({ "n", "v" }, "<leader>f", function()
        require("conform").format({ async = true })
    end, {
    desc = "[F]ormat buffer",
})
end

return M
