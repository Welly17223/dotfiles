return {
  "karb94/neoscroll.nvim",
  opts = {
    easing = "sine",
    post_hook = function(info)
      require("neoscroll").zz { half_win_duration = 50 }
    end,
  },
  lazy = false,
}
