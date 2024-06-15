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
    "sindrets/diffview.nvim",
    lazy = false,
  },

  {
    "glepnir/template.nvim",
    cmd = { "Template", "TemProject" },
    config = function()
      require("template").setup {
        -- config in there
        temp_dir = "~/.config/nvim/templates/",
      }
    end,
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
    enabled = false,
    config = function()
      require "custom.configs.aerial"
    end,
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    -- lazy = false,
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
    "mfussenegger/nvim-dap",
    lazy = false,
  },
  {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
    lazy = false,
  },

  {
    "MunifTanjim/prettier.nvim",
    lazy = false,
  },
  {
    "lervag/vimtex",
    lazy = false, -- lazy-loading will disable inverse search
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
    lazy = false,
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
    config = function ()
      vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>")
      vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>")
      vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>")
      vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>")
      vim.g.tmux_navigator_save_on_switch = 2
    end
  },
  {
    "vim-test/vim-test",
    dependencies = {
      {
        "preservim/vimux",
      },
    },
    vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>"),
    vim.keymap.set("n", "<leader>tT", ":TestFile<CR>"),
    vim.keymap.set("n", "<leader>ta", ":TestSuite<CR>"),
    vim.keymap.set("n", "<leader>tl", ":TestLast<CR>"),
    vim.keymap.set("n", "<leader>tg", ":TestVisit<CR>"),
    cmd = {
      "TestNearest",
      "TestFile",
      "TestSuite",
      "TestLast",
      "TestVisit",
    },
    vim.cmd "let test#strategy = 'vimux'",
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
