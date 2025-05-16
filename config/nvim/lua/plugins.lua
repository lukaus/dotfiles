return {
  -- Colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",
        integrations = {
          treesitter = true,
          lsp_trouble = true,
          cmp = true,
          gitsigns = true,
          telescope = true,
          nvimtree = true,
        },
      })
      vim.cmd("colorscheme catppuccin")
    end,
  },

  -- UI & Utilities
  "itchyny/lightline.vim",
  "itchyny/vim-gitbranch",
  "szw/vim-maximizer",
  "christoomey/vim-tmux-navigator",
  "kassio/neoterm",
  "tpope/vim-commentary",
  "sbdchd/neoformat",
  { "junegunn/fzf", build = "./install --all" },
  "junegunn/fzf.vim",
  "tpope/vim-fugitive",
  "airblade/vim-gitgutter",
  "puremourning/vimspector",
  "sagi-z/vimspectorpy",

  -- LSP / Completion
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",

  -- Language support
  "pangloss/vim-javascript",
  "tomasiser/vim-code-dark",
}
