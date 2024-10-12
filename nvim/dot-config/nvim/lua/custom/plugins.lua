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
    keys = {
      { "<F8>", "<cmd>SymbolsOutline<CR>", "Show symbols outline" },
    },
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
    keys = {
      { "<leader>a",  "<cmd>AerialToggle!<CR>",    "Toggle Aerial" },
      { "<leader>fx", "<cmd>Telescope aerial<CR>", "Search Outline" },
    },
    config = function()
      require("aerial").setup {
        backends = { "lsp", "treesitter" },
        filter_kind = {
          "Array",
          "Boolean",
          "Class",
          "Constant",
          "Constructor",
          "Enum",
          "EnumMember",
          "Event",
          "Field",
          "File",
          "Function",
          "Interface",
          "Key",
          "Method",
          "Module",
          "Namespace",
          "Number",
          "Object",
          "Operator",
          "Package",
          "Property",
          "String",
          "Struct",
          "TypeParameter",
          "Variable",
        },
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
      }
    end,
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
    config = function()
      local prettier = require "prettier"
      prettier.setup {
        ["null-ls"] = {
          condition = function()
            return prettier.config_exists {
              -- if `false`, skips checking `package.json` for `"prettier"` key
              check_package_json = true,
            }
          end,
          runtime_condition = function(params)
            -- return false to skip running prettier
            return true
          end,
          timeout = 5000,
        },
        filetypes = {
          "css",
          "graphql",
          "html",
          "javascript",
          "javascriptreact",
          "json",
          "less",
          "markdown",
          "scss",
          "typescript",
          "typescriptreact",
          "yaml",
        },
      }
    end,
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
    "tpope/vim-surround",
    lazy = false,
  },
  {
    "tpope/vim-repeat",
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
      require "custom.configs.startify"
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
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
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
  {
    "dense-analysis/ale",
    config = function()
      -- Configuration goes here.
      local g = vim.g

      g.ale_sh_shellcheck_executable='shellcheck'
      g.ale_linters = {
        sh = { "shellcheck" },
      }
    end,
    ft = { "sh" },
  },
  {
    "TheLeoP/powershell.nvim",
    ---@type powershell.user_config
    opts = {
      bundle_path = "/home/welly/Downloads/powershell/PowerShellEditorServices/",
      init_options = { "-SessionDetailsPath ./session.json" },
    },
    ft = { "ps1" },
  },
  { "echasnovski/mini.icons", version = "*" },
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
