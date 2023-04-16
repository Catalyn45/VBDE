u = require('utils')

local lsp = require('lsp-zero')
lsp.preset({})

local cmp = require('cmp')

local cmp_mapping = lsp.defaults.cmp_mappings({
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true })
})

lsp.setup_nvim_cmp({
    mapping = cmp_mapping,
    experimental = {
        native_menu = false,
        ghost_text = true
    }
})

local on_attach = function(_, _)
    u.nnoremap('<F2>', vim.lsp.buf.rename)

    u.nnoremap('K', vim.lsp.buf.hover)
    u.nnoremap('<C-]>', vim.lsp.buf.declaration)
    u.nnoremap('<C-[>', vim.lsp.buf.definition)
end

lsp.on_attach(on_attach)

lsp.setup_servers({'clangd', 'pyright', 'lua_ls'})

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
