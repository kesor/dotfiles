#!/bin/sh

plugin() {
    name=$1
    target="${name%%/*}/start/${name##*/}"
    if [ -n "${target}" -a -d "${target}" ]; then
        echo -n "${name} - "
        (cd "${target}" ; git pull)
    elif [ -n "${name}" ]; then
        mkdir -p "${name%%/*}/start"
        git clone "https://github.com/${name}.git" "${target}"
    else
        echo "Name '${name}' invalid."
    fi
}

plugin airblade/vim-gitgutter
plugin catppuccin/nvim
plugin chaoren/vim-wordmotion
plugin christoomey/vim-tmux-navigator
plugin DanilaMihailov/beacon.nvim
plugin danymat/neogen
plugin esensar/nvim-dev-container
plugin folke/todo-comments.nvim
plugin folke/trouble.nvim
plugin hrsh7th/cmp-buffer
plugin hrsh7th/cmp-cmdline
plugin hrsh7th/cmp-nvim-lsp
plugin hrsh7th/cmp-path
plugin hrsh7th/nvim-cmp
plugin ibhagwan/fzf-lua
plugin j-hui/fidget.nvim
plugin kevinhwang91/nvim-ufo
plugin kosayoda/nvim-lightbulb
plugin lspcontainers/lspcontainers.nvim
plugin ludovicchabant/vim-gutentags
plugin lukas-reineke/indent-blankline.nvim
plugin m4xshen/hardtime.nvim
plugin m4xshen/smartcolumn.nvim
plugin MunifTanjim/nui.nvim
plugin neovim/nvim-lspconfig
plugin NvChad/nvim-colorizer.lua
plugin nvim-lualine/lualine.nvim
plugin nvim-lua/plenary.nvim
plugin nvim-tree/nvim-tree.lua
plugin nvim-tree/nvim-web-devicons
plugin nvim-treesitter/nvim-treesitter
plugin nvim-treesitter/nvim-treesitter-context
plugin nvim-treesitter/nvim-treesitter-textobjects
plugin preservim/vimux
plugin RRethy/vim-illuminate
plugin SmiteshP/nvim-navic
plugin stevearc/oil.nvim
plugin tmux-plugins/vim-tmux
plugin tpope/vim-commentary
plugin tpope/vim-dadbod
plugin tpope/vim-dispatch
plugin tpope/vim-eunuch
plugin tpope/vim-fugitive
plugin tpope/vim-obsession
plugin tpope/vim-repeat
plugin tpope/vim-rhubarb
plugin tpope/vim-rsi
plugin tpope/vim-sensible
plugin tpope/vim-sleuth
plugin tpope/vim-speeddating
plugin tpope/vim-surround
plugin tpope/vim-tbone
plugin tpope/vim-unimpaired
plugin utilyre/barbecue.nvim
plugin vim-scripts/quilt
plugin windwp/nvim-autopairs
