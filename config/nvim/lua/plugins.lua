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
                ensure_installed = { "pyright" }, -- LSPs for Python and Java
                handlers = {
                    jdtls = function() end
                }
            }
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            -- Python
            lspconfig.pyright.setup {}

            -- Java
            local jdtls_path = vim.fn.expand("~/.local/jdtls")

            local jars = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar", 1, 1)
            if #jars == 0 then
                error("Could not find jdtls launcher jar in " .. jdtls_path)
            end
            local launcher_jar = jars[1]

            local java_21_path = "/usr/lib/jvm/java-1.21.0-openjdk-amd64/bin/java"

            lspconfig.jdtls.setup {
                cmd = {
                    java_21_path,
                    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                    "-Dosgi.bundles.defaultStartLevel=4",
                    "-Declipse.product=org.eclipse.jdt.ls.core.product",
                    "-Dlog.level=ALL",
                    "-noverify",
                    "-Xmx1G",
                    "-jar", launcher_jar,
                    "-configuration", jdtls_path .. "/config_linux",
                    "-data", vim.fn.expand("~/.cache/jdtls-workspace")
                },
                settings = {
                    java = {
                        configuration = {
                            runtimes = {
                                {
                                    name = "JavaSE-17",
                                    path = "/usr/lib/jvm/java-1.17.0-openjdk-amd64",
                                },
                            },
                        },
                        compiler = {
                            source = "17",
                            target = "17",
                        },
                    },
                }
            }
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
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")

            vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'References (Telescope)' })
            vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'Definitions (Telescope)' })
            vim.keymap.set('n', 'gD', builtin.lsp_implementations, { desc = 'Implementations (Telescope)' })
            vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
            vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
            vim.keymap.set('n', '<leader>ss', builtin.lsp_workspace_symbols, { desc = '[S]earch [S]ymbols' })
            vim.keymap.set('n', '<leader>sb', builtin.lsp_document_symbols, { desc = '[S]ymbols in [B]uffer' })
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
