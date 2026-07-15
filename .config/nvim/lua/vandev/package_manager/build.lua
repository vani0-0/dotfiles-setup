local plugins = require("vandev.package_manager.plugins")

local M = {}

local function plugin_name(repo)
    return repo:match(".+/(.+)$")
end

local function run_build(name, cmd, cwd)
    local result = vim.system(cmd, { cwd = cwd }):wait()

    if result.code ~= 0 then
        local output = result.stderr ~= "" and result.stderr or result.stdout
        vim.notify(("Build failed for %s\n%s"):format(name, output), vim.log.levels.ERROR)
    end
end

local handlers = {
    make = function(plugin, ev)
        if vim.fn.executable("make") == 1 then
            run_build(plugin_name(plugin.repo), { "make" }, ev.data.path)
        end
    end,

    luasnip = function(plugin, ev)
        if vim.fn.has("win32") == 0 and vim.fn.executable("make") == 1 then
            run_build(plugin_name(plugin.repo), { "make", "install_jsregexp" }, ev.data.path)
        end
    end,

    treesitter = function(_, ev)
        if not ev.data.active then
            vim.cmd.packadd("nvim-treesitter")
        end

        vim.cmd.TSUpdate()
    end,
}


function M.setup()
    vim.api.nvim_create_autocmd("PackChanged", {
        callback = function(ev)
            if ev.data.kind ~= "install" and ev.data.kind ~= "update" then
                return
            end

            for _, plugin in ipairs(plugins) do 
                if plugin_name(plugin.repo) == ev.data.spec.name then
                    local handler = handlers[plugin.build]

                    if handler then 
                        handler(plugin, ev)
                    end

                    return
                end
            end
        end
    })
end

return M
