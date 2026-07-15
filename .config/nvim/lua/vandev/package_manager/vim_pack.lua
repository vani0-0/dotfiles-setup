local M = {}

local plugins = require('vandev.package_manager.plugins')

---@param repo string
---@return string
local function gh(repo)
    return 'https://github.com/' .. repo
end

local function add_plugin(specs, plugin)
    table.insert(specs, {
        src = gh(plugin.repo),
        name = plugin.repo:match(".+/(.+)$"),
        version = plugin.version,
        build = plugin.build,
    })

    if plugin.dependencies then
        for _, dep in ipairs(plugin.dependencies) do
            add_plugin(specs, dep)
        end
    end
end

function M.setup()
    local specs = {}

    for _, plugin in ipairs(plugins) do
        add_plugin(specs, plugin)
    end

    vim.pack.add(specs)
end

return M
