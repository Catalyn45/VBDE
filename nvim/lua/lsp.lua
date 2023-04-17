u = require('utils')

local lsp = require('lsp-zero')
lsp.preset({})

local cmp = require('cmp')
local luasnip = require('luasnip')

local cmp_mapping = {
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

    -- tab stuff
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
}

cmp.setup({
    mapping = cmp_mapping,
    experimental = {
        native_menu = false,
        ghost_text = true
    }
})

require('mason-lspconfig').setup({
    automatic_installation = true
})

local on_attach = function(_, bufnr)
      lsp.default_keymaps({buffer = bufnr})
end

lsp.on_attach(on_attach)

lsp.setup_servers({'clangd', 'pyright', 'lua_ls', 'tsserver'})

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
