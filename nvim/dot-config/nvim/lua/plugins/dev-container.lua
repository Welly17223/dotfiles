return {
  "https://codeberg.org/esensar/nvim-dev-container",
  opts = {
    config_search_start = function()
      if vim.g.devcontainer_selected_config == nil or vim.g.devcontainer_selected_config == "" then
        local candidates =
          vim.split(vim.fn.glob(vim.loop.cwd() .. "/.devcontainer/**/devcontainer.json"), "\n", { trimempty = true })
        if #candidates < 2 then
          vim.g.devcontainer_selected_config = vim.loop.cwd()
        else
          local choices = { "Select devcontainer config file to use:" }
          for idx, candidate in ipairs(candidates) do
            table.insert(choices, idx .. ". - " .. candidate)
          end
          local choice_idx = vim.fn.inputlist(choices)
          if choice_idx > #candidates then
            choice_idx = 1
          end
          vim.g.devcontainer_selected_config = string.gsub(candidates[choice_idx], "/devcontainer.json", "")
        end
      end
      return vim.g.devcontainer_selected_config
    end,
    container_runtime = "podman",
    compose_command = "podman compose",
    attach_mounts = {
      neovim_config = {
        -- enables mounting local config to /root/.config/nvim in container
        enabled = true,
        -- makes mount readonly in container
        -- options = { "readonly" },
      },
      neovim_data = {
        -- enables mounting local data to /root/.local/share/nvim in container
        enabled = true,
        -- no options by default
        options = {},
      },
      -- Only useful if using neovim 0.8.0+
      neovim_state = {
        -- enables mounting local state to /root/.local/state/nvim in container
        enabled = true,
        -- no options by default
        options = {},
      },
    },
  },
  cmd = {
    "DevcontainerStart",
    "DevcontainerAttach",
    "DevcontainerExec",
    "DevcontainerStop",
    "DevcontainerStopAll",
    "DevcontainerRemoveAll",
    "DevcontainerLogs",
    "DevcontainerEditNearestConfig",
  },
}
