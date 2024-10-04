-- Set up key mappings for LSP functionality
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user_lsp_attach', {clear = true}),
  callback = function(event)
	  print("lps is here")
    local opts = {buffer = event.buf}
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'vws', vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set('n', 'vd', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', 'vca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'vrr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'vrn', vim.lsp.buf.rename, opts)
    vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
  end,
})

-- Set up LSP capabilities
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Set up Mason
require('mason').setup({})

-- Set up Mason-LSPConfig
require('mason-lspconfig').setup({
  ensure_installed = {
    'ts_ls',           -- JavaScript/TypeScript
    'rust_analyzer',      -- Rust
    'jdtls',              -- Java
    'html',               -- HTML
    'cssls',              -- CSS
   -- 'dartls',             -- Dart/Flutter
    'gopls',              -- Go
    'pyright',            -- Python
    'lua_ls',             -- Lua
  },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({
        capabilities = lsp_capabilities,
      })
    end,

    -- Special setup for Lua LSP
    ['lua_ls'] = function()
      require('lspconfig').lua_ls.setup({
        capabilities = lsp_capabilities,
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = {'vim'} },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
          }
        }
      })
    end,
  }
})

-- Set up nvim-cmp
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  sources = cmp.config.sources({
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
  }, {
    {name = 'buffer'},
  }),
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({select = true}),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

-- Set up LSP for specific file types
vim.cmd [[
  autocmd FileType javascript,typescript,typescriptreact setlocal omnifunc=v:lua.vim.lsp.omnifunc
  autocmd FileType rust setlocal omnifunc=v:lua.vim.lsp.omnifunc
  autocmd FileType java setlocal omnifunc=v:lua.vim.lsp.omnifunc
  autocmd FileType html,css setlocal omnifunc=v:lua.vim.lsp.omnifunc
  autocmd FileType dart setlocal omnifunc=v:lua.vim.lsp.omnifunc
  autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc
  autocmd FileType python setlocal omnifunc=v:lua.vim.lsp.omnifunc
  autocmd FileType lua setlocal omnifunc=v:lua.vim.lsp.omnifunc
]]
