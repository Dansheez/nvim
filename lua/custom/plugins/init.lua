-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  {
    'mbbill/undotree',
  },

  {
    'ray-x/lsp_signature.nvim',
    event = 'VeryLazy',
    opts = {},
    config = function(_, opts) require('lsp_signature').setup(opts) end,
  },

  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup {
        opts = {
          -- Defaults
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false, -- Auto close on trailing </
        },
        -- Also override individual filetype configs, these take priority.
        -- Empty by default, useful if one of the "opts" global settings
        -- doesn't work well in a specific filetype
        per_filetype = {
          ['html'] = {
            enable_close = false,
          },
        },
      }
    end,
  },

  {
    'pedro757/emmet',
    config = function()
      local lspconfig = require 'lspconfig'
      local configs = require 'lspconfig.configs'

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      if not configs.ls_emmet then
        configs.ls_emmet = {
          default_config = {
            cmd = { 'ls_emmet', '--stdio' },
            filetypes = {
              'html',
              'css',
              'scss',
              'javascriptreact',
              'typescriptreact',
              'haml',
              'xml',
              'xsl',
              'pug',
              'slim',
              'sass',
              'stylus',
              'less',
              'sss',
              'hbs',
              'handlebars',
            },
            root_dir = function(fname) return vim.loop.cwd() end,
            settings = {},
          },
        }
      end

      lspconfig.ls_emmet.setup { capabilities = capabilities }
    end,
  },

  { -- cool indent arrows
    'shellRaining/hlchunk.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('hlchunk').setup {
        chunk = {
          enable = true,
          -- ...
        },
        indent = {
          enable = true,
          -- ...
        },
      }
    end,
  },

  { -- fold functions
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    opts = {
      filetype_exclude = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason' },
    },
    config = function(_, opts)
      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('local_detach_ufo', { clear = true }),
        pattern = opts.filetype_exclude,
        callback = function() require('ufo').detach() end,
      })

      vim.opt.foldlevelstart = 99
      require('ufo').setup(opts)
    end,
  },
}
