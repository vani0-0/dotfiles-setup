local M = {}

local keymapper = require('vandev.utils.keymap')

function M.setup()
    require('telescope').setup { 
        extensions = {
            ['ui-select'] = { require('telescope.themes').get_dropdown() }
        },
    }


    -- Enable extensions
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'
    keymapper('n', '<leader>sh', builtin.help_tags, {desc = '[S]earch [H]elp'})
    keymapper('n', '<leader>sk', builtin.keymaps, {desc = '[S]earch [K]eymaps'})
    keymapper('n', '<leader>sf', builtin.find_files, {desc = '[S]earch [F]iles'})
    keymapper('n', '<leader>ss', builtin.builtin, {desc = '[S]earch [S] Telescope'})
    keymapper({ 'n', 'v' }, '<leader>sw', builtin.grep_string, {desc = '[S]earch current [W]ord'})
    keymapper('n', '<leader>sg', builtin.live_grep, {desc = '[S]earch by [G]rep'})
    keymapper('n', '<leader>sd', builtin.diagnostics, {desc = '[S]earch [D]iagnostics'})
    keymapper('n', '<leader>sr', builtin.resume, {desc = '[S]earch [R]esume'})
    keymapper('n', '<leader>s.', builtin.oldfiles, {desc = '[S]earch Recent Files ("." for repeat)'})
    keymapper('n', '<leader>sc', builtin.commands, {desc = '[S]earch [C]ommands'})
    keymapper('n', '<leader><leader>', builtin.buffers, {desc = '[ ] Find existing buffers'})

    -- Add Telescope-based LSP pickers when an LSP attaches to a buffer.
    -- If you later switch picker plugins, this is where to update these mappings.
    vim.api.nvim_create_autocmd('LspAttach', {
        group = require('vandev.utils.augroup') 'vandev-lsp-attach',
        callback = function(event)
            local buf = event.buf

            keymapper("n", "grr", builtin.lsp_references, {
                buffer = buf,
                desc = "[G]oto [R]eferences",
            })

            keymapper("n", "gri", builtin.lsp_implementations, {
                buffer = buf,
                desc = "[G]oto [I]mplementation",
            })

            keymapper("n", "grd", builtin.lsp_definitions, {
                buffer = buf,
                desc = "[G]oto [D]efinition",
            })

            keymapper("n", "gO", builtin.lsp_document_symbols, {
                buffer = buf,
                desc = "Open Document Symbols",
            })

            keymapper("n", "gW", builtin.lsp_dynamic_workspace_symbols, {
                buffer = buf,
                desc = "Open Workspace Symbols",
            })

            keymapper("n", "grt", builtin.lsp_type_definitions, {
                buffer = buf,
                desc = "[G]oto [T]ype Definition",
            })
        end,
    })
end


return M
