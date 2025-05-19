local vim = vim
vim.opt.termguicolors = true

vim.g.mapleader = ' '

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")


pcall(require, "catppuccin")
pcall(function()
    require("catppuccin").setup({
        flavour = "mocha",
        integrations = {
            treesitter = true,
            lsp_trouble = true,
            cmp = true,
            gitsigns = true,
            telescope = true,
            nvimtree = true,
            lualine = true,
        }
    })
end)

require('lualine').setup {
    sections = {
        lualine_c = {
            'filename',
            { 'lsp_progress' },  -- Optional: requires plugin like arkav/lualine-lsp-progress
        },
        lualine_x = {
            'filetype'
        }
    }
}

-- default options
vim.cmd('set completeopt=menuone,noinsert,noselect')
vim.opt.wrap = false

vim.opt.wildmode='longest,list,full'
vim.opt.mouse='a'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.expandtab = true
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hidden = true
vim.opt.backup = false 
vim.opt.writebackup = false
vim.opt.cmdheight=1

vim.opt.updatetime=750
vim.cmd('filetype plugin indent on')
vim.cmd('let g:netwr_banner=0')
--let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json=javascript']
vim.cmd('colorscheme catppuccin-mocha')
--vim.cmd("colorscheme ashen")

local lspconfig = require('lspconfig')
--lspconfig.pyright.setup {}
--lspconfig.tsserver.setup {}


-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')


-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
        ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
        -- C-b (back) C-f (forward) for snippet placeholder navigation.
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}


vim.g.vimspector_enable_mappings = 'HUMAN'


-- Plugin configs

vim.g.neoterm_default_mod = 'horizontal'
vim.g.neoterm_size = 25 
vim.g.neoterm_autoinsert = 1




-- Bindings
-- maximizer
vim.keymap.set('n', '<leader>m', ':MaximizerToggle<CR>')
-- neoterm
vim.keymap.set('n', '<c-t>', ':Ttoggle<CR>')
vim.keymap.set('i', '<c-t>', '<Esc>:Ttoggle<CR>')
vim.keymap.set('t', '<c-t>', '<c-\\><c-n>:Ttoggle<CR>')
-- neoformat (need format files)
vim.keymap.set('n', '<leader>F', ':Neoformat prettier<CR>')

-- fzf
vim.keymap.set('n', '<leader><space>', ':GFiles<CR>')
vim.keymap.set('n', '<leader>ff', ':GFiles<CR>')
--
-- git status
vim.keymap.set('n', '<leader>gg', ':G<CR>')

-- Code completion and language server binds
vim.keymap.set('n', 'gd',       '<cmd> lua vim.lsp.buf.definition()', {silent=true})
vim.keymap.set('n', 'gh',       '<cmd> lua vim.lsp.buf.hover()', {silent=true})
vim.keymap.set('n', 'gH',       '<cmd> lua vim.lsp.buf.code_action()', {silent=true})
vim.keymap.set('n', 'gD',       '<cmd> lua vim.lsp.buf.implementation()', {silent=true})
vim.keymap.set('n', '<c-k>',    '<cmd> lua vim.lsp.buf.signature_help()', {silent=true})
vim.keymap.set('n', 'gr',       '<cmd> lua vim.lsp.buf.references()', {silent=true})
vim.keymap.set('n', 'gR',       '<cmd> lua vim.lsp.buf.rename()', {silent=true})

vim.keymap.set('n', "<leader>da", ":call vimspector#Launch()<CR>")
vim.keymap.set('n', "<leader>dx", ":call vimspector#Reset()<CR>")
vim.keymap.set('n', "<S-k>", ":call vimspector#StepOut()<CR>")
vim.keymap.set('n', "<S-l>", ":call vimspector#StepInto()<CR>")
vim.keymap.set('n', "<S-j>", ":call vimspector#StepOver()<CR>")
vim.keymap.set('n', "<leader>d_", ":call vimspector#Restart()<CR>")
vim.keymap.set('n', "<leader>dn", ":call vimspector#Continue()<CR>")
vim.keymap.set('n', "<leader>drc", ":call vimspector#RunToCursor()<CR>")
vim.keymap.set('n', "<leader>dh", ":call vimspector#ToggleBreakpoint()<CR>")
vim.keymap.set('n', "<leader>de", ":call vimspector#ToggleConditionalBreakpoint()<CR>")
vim.keymap.set('n', "<leader>dX", ":call vimspector#ClearBreakpoints()<CR>")

