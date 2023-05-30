local lsp = require('lsp-zero')
lsp.preset({})

local luasnip = require('luasnip')
require("luasnip.loaders.from_vscode").lazy_load()

local cmp = require('cmp')

local cmp_mapping = {
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(1) then
            luasnip.jump(1)
        else
            fallback()
        end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end, { 'i', 's' }),
}

cmp.setup({
    sources = {
        {name = 'path'},
        {name = 'luasnip'},
        {name = 'nvim_lsp'},
        {name = 'buffer'},
    },
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
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    lsp.default_keymaps({buffer = bufnr})
end

lsp.on_attach(on_attach)

lsp.setup_servers({'clangd', 'pyright', 'lua_ls', 'tsserver'})

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = on_attach
  },
  dap = {
      adapter = {
          name = "rt_lldb",
          type = 'server',
          port = "${port}",
          executable = {
              command = vim.env.HOME .. '/.vscode-server/extensions/vadimcn.vscode-lldb-1.9.1/adapter/codelldb',
              args = {"--port", "${port}"},
          }
      }
  }
})

