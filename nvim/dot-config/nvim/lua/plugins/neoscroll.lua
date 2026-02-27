return {
  "karb94/neoscroll.nvim",
  event = "VeryLazy",
  opts = {
    easing = "sine",
    post_hook = function(info)
      require("neoscroll").zz { half_win_duration = 50 }
    end,
  },
}
