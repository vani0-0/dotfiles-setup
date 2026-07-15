---@param mode string|string[]
---@param lhs string|string[]
---@param rhs string|function
---@param opts? vim.keymap.set.Opts
return function(mode, lhs, rhs, opts)
    opts = opts or {}

    opts.silent = opts.silent ~= false
    opts.noremap = opts.noremap ~= false

    vim.keymap.set(mode, lhs, rhs, opts)
end
