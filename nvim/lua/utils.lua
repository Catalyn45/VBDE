local utils = {}

local map = function(mode, source, target, silent)
    if silent == nil then
        silent = true
    end

    vim.keymap.set(mode, source, target, { noremap = true, silent = silent })
end


utils.noremap = function(source, target, silent)
    map('', source, target, silent)
end

utils.vnoremap = function (source, target, silent)
    map('v', source, target, silent)
end

utils.inoremap = function(source, target, silent)
    map('i', source, target, silent)
end

utils.nnoremap = function(source, target, silent)
    map('n', source, target, silent)
end

return utils
