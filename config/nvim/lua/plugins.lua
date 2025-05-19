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
    -- lualine
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
    -- tree-sitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = { 'python', 'java' }, -- Add languages here
                highlight = { enable = true },
                indent = { enable = true },
            }
        end
    },
    {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = true  -- uses default config
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = true
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup {
                ensure_installed = { "pyright", "jdtls" }, -- LSPs for Python and Java
            }
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.pyright.setup {}
            lspconfig.jdtls.setup {}
        end
    },

    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip'
        },
        config = function()
            local cmp = require'cmp'
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' }
                }
            })
        end
    },

    {
        'mfussenegger/nvim-dap',
        config = function()
            local dap = require('dap')

            -- Example: Python setup with debugpy
            dap.adapters.python = {
                type = 'executable',
                command = 'python',
                args = { '-m', 'debugpy.adapter' },
            }
            dap.configurations.python = {
                {
                    type = 'python',
                    request = 'launch',
                    name = "Launch file",
                    program = "${file}", -- current file
                    pythonPath = function()
                        return 'python' -- or detect venv
                    end,
                }
            }

            -- Keybindings (optional)
            vim.keymap.set('n', '<F5>', dap.continue)
            vim.keymap.set('n', '<F10>', dap.step_over)
            vim.keymap.set('n', '<F11>', dap.step_into)
            vim.keymap.set('n', '<F12>', dap.step_out)
            vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint)
            vim.keymap.set('n', '<Leader>B', function()
                dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
            end)
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    },
    {
        'vim-test/vim-test',
        config = function()
            vim.cmd [[
      let test#strategy = "neovim"
      " Optional key mappings
      nmap <leader>t :TestNearest<CR>
      nmap <leader>T :TestFile<CR>
      nmap <leader>a :TestSuite<CR>
      nmap <leader>l :TestLast<CR>
      nmap <leader>g :TestVisit<CR>
      ]]
        end
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- optional icons
        },
        config = function()
            require("nvim-tree").setup {
                view = {
                    width = 30,
                    side = "left",
                },
                filters = {
                    dotfiles = false,
                },
                git = {
                    enable = true,
                }
            }

            -- Keybinding to toggle the tree
            vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
        end
    },
    -- ashen colorscheme
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
