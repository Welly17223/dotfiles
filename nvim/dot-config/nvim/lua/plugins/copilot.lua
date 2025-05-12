return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    {
      "github/copilot.vim",
      cmd = "Copilot",
      event = "BufWinEnter",
      init = function()
        vim.g.copilot_no_maps = true
      end,
      config = function()
        -- Block the normal Copilot suggestions
        vim.api.nvim_create_augroup("github_copilot", { clear = true })
        vim.api.nvim_create_autocmd({ "FileType", "BufUnload" }, {
          group = "github_copilot",
          callback = function(args)
            vim.fn["copilot#On" .. args.event]()
          end,
        })
        vim.fn["copilot#OnFileType"]()
      end,
    }, -- or zbirenbaum/copilot.lua
    { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
  },
  build = "make tiktoken", -- Only on MacOS or Linux
  opts = {
    -- See Configuration section for options
  },
  keys = {
    { "<leader>ccq", "<cmd>CopilotChatToggle<cr>", "Toggle copilog chat" },
  },
  -- See Commands section for default commands if you want to lazy load on them
}
