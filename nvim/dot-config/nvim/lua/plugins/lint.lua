return {
  {
    "mfussenegger/nvim-lint",
    ft = { "yaml", "yaml.ansible" },
    config = function()
      require("lint").linters_by_ft = {
        -- yaml = { "ansible_lint" },
        ansible = { "ansible_lint" },
      }

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          -- try_lint without arguments runs the linters defined in `linters_by_ft`
          -- for the current filetype
          require("lint").try_lint()

          -- You can call `try_lint` with a linter name or a list of names to always
          -- run specific linters, independent of the `linters_by_ft` configuration
          -- require("lint").try_lint("cspell")
        end,
      })
    end,
  },
  {
    "rshkarin/mason-nvim-lint",
    dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-lint" },
    config = function()
      require("mason-nvim-lint").setup {
        ensure_installed = { "ansible-lint" },
      }
    end,
  },
}
