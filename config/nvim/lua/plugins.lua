return {
  -- Colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
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
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",          -- load after start‑up
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional icons
    config = function()
	  require("lualine").setup({
	    options = {
		  theme = "catppuccin",   -- Catppuccin hands the palette to lualine :contentReference[oaicite:0]{index=0}
		  section_separators = "",
		  component_separators = "",
	    },
	    sections = {
		  lualine_a = { "mode" },
		  lualine_b = { "branch" },
		  lualine_c = { { "filename", path = 1 }, "diff" },
		  lualine_x = { "diagnostics", "encoding", "filetype" },
		  lualine_y = { "progress" },
	  	  lualine_z = { "location" },
	    },
	  })
    end,
  },

  {
    "ficcdaf/ashen.nvim",
    -- optional but recommended,
    -- pin to the latest stable release:
    --tag = "*",
    version = "*",
    lazy = false,
    priority = 1000,
    -- configuration is optional!
    opts = {
      -- your settings here
    },
  },
  -- UI & Utilities
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
