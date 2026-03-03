# Dependence 
For deployment: [gun/stow](https://www.gnu.org/software/stow/) is **needed** to put the configuration files to correct places. And [Nerd font](https://www.nerdfonts.com/font-downloads) is strongly recommended.
- `Fastfetch`
    - fastfetch
- `helix`: LSP Dependence
    - python: basedpyright, ruff
    - C/C++: clangd
    - typst: tinymist
- `tmux`
    - [TPM](https://github.com/tmux-plugins/tpm): tmux package manager
- `vim`
    - [vim-plug](https://github.com/junegunn/vim-plug): Vim plugins manager
- `Neovim`: If you want to share the LSP with helix or other code editor, you shouldn't install these LSPs through mason.nvim.
    - Mason.nvim:
        - `unzip`
        - `python`, `python venv`
        - `node`
        - `wget`, `curl`
    - Telescope: `ripgrep`
    - Treesitter: `gcc`
    - lint.nvim:
        - cppcheck
        - shellcheck
- `ZSH`: You may want to install some CLI tools that improve your CLI live.
    - [eza](https://github.com/eza-community/eza): better `ls`
    - [tldr](https://tldr.sh): simpler `man`
    - [fzf](https://github.com/junegunn/fzf): for tab completion, **strongly suggest**.
    - [batcat](https://github.com/sharkdp/bat): better `cat`.
    - tmux/[zellij](https://zellij.dev): terminal multiplexer

# Install

```bash
chsh -s $(which zsh)
bash ./impl_all.sh
```
