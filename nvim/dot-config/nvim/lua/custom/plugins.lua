local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = overrides.dap,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "mfussenegger/nvim-jdtls",
    lazy = false,
    --config = function()
    --  require "custom.config.nvim-jdtls"
    --  require "plugins.configs.nvim-jdtls"
    -- end,
  },
  {
    "simrat39/symbols-outline.nvim",
    lazy = false,
    config = function()
      require "custom.configs.symbols-outline"
      require("symbols-outline").setup()
    end,
  },
  {
    "stevearc/aerial.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("aerial").setup {
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
      }
      -- You probably also want to set a keymap to toggle aerial
      vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
    end,
    lazy = false,
  },
  {
    "junegunn/fzf",
    lazy = false,
  },

  {
    "junegunn/fzf.vim",
    lazy = false,
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^3",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
      {
        "lvimuser/lsp-inlayhints.nvim",
        opts = {},
      },
    },
    ft = { "rust" },
    config = function()
      vim.g.rustaceanvim = {
        inlay_hints = {
          highlight = "NonText",
        },
        tools = {
          hover_actions = {
            auto_focus = true,
          },
        },
        server = {
          on_attach = function(client, bufnr)
            require("lsp-inlayhints").on_attach(client, bufnr)
          end,
        },
      }
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    keys = {
      n = {
        ["<leader>tu"] = { "<cmd>lua require('dapui').toggle()", "Toggle DAP UI" },
        ["<leader>to"] = { "<cmd>lua require('dapui').open()", "Open DAP UI" },
        ["<leader>tc"] = { "<cmd>lua require('dapui').close()", "Close DAP UI" },
      },
    },
    config = function()
      require("dapui").setup()
      require "custom.configs.dapui"
    end,
    ft = { "rust", "python", "c", "cpp", "java", "js" },
  },

  {
    "MunifTanjim/prettier.nvim",
    lazy = false,
  },
  {
    "lervag/vimtex",
    ft = { "tex" }, -- lazy-loading will disable inverse search
    config = function()
      vim.api.nvim_create_autocmd({ "FileType" }, {
        group = vim.api.nvim_create_augroup("lazyvim_vimtex_conceal", { clear = true }),
        pattern = { "bib", "tex" },
        callback = function()
          vim.wo.conceallevel = 2
        end,
      })

      vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
      vim.g.vimtex_quickfix_method = vim.fn.executable "pplatex" == 1 and "pplatex" or "latexlog"
      vim.g.vimtex_view_method = "general"
      vim.g.vimtex_view_general_viewer = "okular"
      vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
      vim.g.vimtex_quickfix_mode = 0
    end,
  },
  {
    "majutsushi/tagbar",
    lazy = false,
  },
  {
    "glebzlat/arduino-nvim",
    config = function()
      require("arduino-nvim").setup()
    end,
    ft = { "ino" },
    --
    -- dev = true,
    -- dir = "~/Documents/dev/neovim/Arduino.nvim",
  },
  {
    "dapt4/vim-autoSurround",
    lazy = true,
  },
  {
    "tpope/vim-surround",
    lazy = false,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    keys = {
      {
        "<leader>ccq",
        function()
          local input = vim.fn.input "Quick Chat: "
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "CopilotChat - Quick chat",
      },
      { "<leader>cct", ":CopilotChatToggle<CR>", "Toggle copilot chat window" },
    },
    -- See Commands section for default commands if you want to lazy load on them
    lazy = false,
  },
  {
    "mhinz/vim-startify",
    lazy = false,
    config = function()
      require "custom.configs.startify" ()
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    config = function()
      vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>")
      vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>")
      vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>")
      vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>")
      vim.g.tmux_navigator_save_on_switch = 2
    end,
  },
  {
    "vim-test/vim-test",
    dependencies = {
      {
        "preservim/vimux",
      },
    },
    config = function()
      vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>")
      vim.keymap.set("n", "<leader>tT", ":TestFile<CR>")
      vim.keymap.set("n", "<leader>ta", ":TestSuite<CR>")
      vim.keymap.set("n", "<leader>tl", ":TestLast<CR>")
      vim.keymap.set("n", "<leader>tg", ":TestVisit<CR>")
      vim.cmd "let test#strategy = 'vimux'"
    end,
    cmd = {
      "TestNearest",
      "TestFile",
      "TestSuite",
      "TestLast",
      "TestVisit",
    },
  },
  {
    "mg979/vim-visual-multi",
    config = function()
      vim.g.VM_maps["Find Under"] = "<C-i>"
      vim.g.VM_maps["Find Subword Under"] = "<C-i>"
    end,
    lazy = false,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      {
        "kevinhwang91/promise-async",
      },
    },
    config = function()
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
      for _, ls in ipairs(language_servers) do
        require("lspconfig")[ls].setup {
          capabilities = capabilities,
          -- you can add other fields for setting up lsp server in this table
        }
      end

      require("ufo").setup()
    end,
    lazy = false,

    --[[ keys = {
      { "n", "zR", require("ufo").openAllFolds() },
      { "n", "zM", require("ufo").closeAllFolds() },
    }, ]]
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
