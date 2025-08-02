return {
  "dense-analysis/ale",
  config = function()
    -- Configuration goes here.
    local g = vim.g

    g.ale_sh_shellcheck_executable = "shellcheck"
    g.ale_linters = {
      sh = { "shellcheck" },
      yaml = { "ansible-lint" },
    }
  end,
  ft = { "sh", "yaml" },
}
