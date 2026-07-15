local M = {}

function M.setup()
    require('vandev.package_manager.vim_pack').setup()
    require('vandev.package_manager.build').setup()
end

return M
