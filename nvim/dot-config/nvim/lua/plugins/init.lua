return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
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
      { "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial" },
      { "<leader>fx", "<cmd>Telescope aerial<CR>", desc = "Search Outline" },
    },
    config = function()
      require "configs.aerial"
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
    "lervag/vimtex",
    ft = { "tex" }, -- lazy-loading will disable inverse search
    cmd = {
      "VimtexInverseSearch",
    },
    config = function()
      require "configs.vimtex"
    end,
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
      require "configs.startify"
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
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      {
        "kevinhwang91/promise-async",
      },
    },
    config = function()
      require "configs.nvim-ufo"
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

      g.ale_sh_shellcheck_executable = "shellcheck"
      g.ale_linters = {
        sh = { "shellcheck" },
      }
    end,
    ft = { "sh" },
  },
  {
    "karb94/neoscroll.nvim",
    opts = {
      easing = "sine",
      post_hook = function(info)
        require("neoscroll").zz { half_win_duration = 50 }
      end,
    },
    lazy = false,
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup()
      vim.notify = require "notify"
    end,
    lazy = false,
    opts = {},
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "tpope/vim-unimpaired",
    lazy = false,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      modes = {
        char = {
          jump_labels = true,
        },
      },
    },
  -- stylua: ignore
  keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
