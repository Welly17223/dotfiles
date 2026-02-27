return {
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", mode = { "n" } },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>", mode = { "n" } },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>", mode = { "n" } },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>", mode = { "n" } },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", mode = { "n" } },
    },
  },
  {
    "swaits/zellij-nav.nvim",
    lazy = true,
    event = "VeryLazy",
    keys = {
      { "<c-h>", "<cmd>ZellijNavigateLeftTab<cr>", { silent = true, desc = "navigate left or tab" }, mode = { "n" } },
      { "<c-j>", "<cmd>ZellijNavigateDown<cr>", { silent = true, desc = "navigate down" }, mode = { "n" } },
      { "<c-k>", "<cmd>ZellijNavigateUp<cr>", { silent = true, desc = "navigate up" }, mode = { "n" } },
      {
        "<c-l>",
        "<cmd>ZellijNavigateRightTab<cr>",
        { silent = true, desc = "navigate right or tab" },
        mode = { "n" },
      },
    },
    opts = {},
  },
}
