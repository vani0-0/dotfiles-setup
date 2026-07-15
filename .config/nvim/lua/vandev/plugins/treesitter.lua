local M = {}

local augroup = require("vandev.utils.augroup")

function M.setup()
    local ts = require('nvim-treesitter')

    -- Defaults from kickstart
    -- local parsers = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc'	}

    local parsers = {
        -- Neovim
        'lua',
        'vim',
        'vimdoc',
        'query',

        -- Dart
        'dart',

        -- Python
        'python',


        -- Markup
        'markdown',
        'markdown_inline',
        'yaml',
        'toml',

        -- WEB
        'javascript',
        'typescript',
        'tsx',
        'html',
        'css',
        'json',

        -- Git
        'git_config',
        'gitignore',
        'diff',
        'gitcommit',

        -- Shell
        'bash',

    }

    ts.install(parsers)

    local available_parsers = ts.get_available()

    ---@param buf integer
    ---@param language string
    local function treesitter_try_attach(buf, language)
        -- check if a parser exists and load it
        if not vim.treesitter.language.add(language) then return end
        -- enable syntax highlighting and other treesitter features
        vim.treesitter.start(buf, language)

        -- Enable treesitter based folds
        -- For more info on folds see `:help folds`
        -- vim.wo.foldexpr = 'v:lua.treesitter.foldexpr()'
        -- vim.wo.foldmethod = 'expr'

        local has_indent_query = vim.treesitter.query.get(language, 'indents') ~= nil

        if has_indent_query then vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" end
    end

    vim.api.nvim_create_autocmd('FileType', {
        group = augroup 'van-dev-treesitter',
        callback = function(args) 
            local buf, filetype = args.buf, args.match
            local language = vim.treesitter.language.get_lang(filetype)
            if not language then return end

            local installed_parsers = ts.get_installed 'parsers'

            if vim.tbl_contains(installed_parsers, language) then
                -- Enable the parser if it is already installed
                treesitter_try_attach(buf, language)
            elseif vim.tbl_contains(available_parsers, language) then
                -- If a parser is available in `nvim-treesitter`, auto-install it and enable it after the installation is done
                ts.install(language):await(function() treesitter_try_attach(buf, language) end)
            else
                -- Try to enable treesitter features in case the parser exists but is not available from `nvim-treesitter`
                treesitter_try_attach(buf, language)
            end
        end,
    })
end

return M

