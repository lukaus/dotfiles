local vim = vim
vim.opt.termguicolors = true

--[[

NEOVIM CONFIG CHEAT SHEET

General
<leader>e        Toggle file tree (nvim-tree)
<leader>m        Toggle maximized window (vim-maximizer)
<leader><space>  FZF Git-tracked files (:GFiles)
<leader>gg       Git status (fugitive)

Telescope (fuzzy finder & LSP navigation)
gd               Go to definition (Telescope)
gD               Go to implementation (Telescope)
gr               Find references (Telescope)
gH               Code actions (Telescope)
<C-k>            Signature help
gh               Hover documentation
gR               Rename symbol
gy               Go to type definition (Telescope, if mapped)
<leader>sf       Find files
<leader>sg       Live grep
<leader>ss       Workspace symbols
<leader>sb       Document symbols

Testing (vim-test)
<leader>t        Test nearest
<leader>T        Test file
<leader>a        Test suite
<leader>l        Last test
<leader>g        Visit test location

Debugging (vimspector + nvim-dap)
<F5>             Start DAP session
<F10>/<F11>/<F12> Step over / into / out
<leader>da       Start Vimspector
<leader>dx       Reset Vimspector
<leader>dn       Continue (Vimspector)
<leader>dh       Toggle breakpoint
<leader>de       Set conditional breakpoint
<leader>dX       Clear all breakpoints
<leader>drc      Run to cursor

Formatting
<leader>F        Format file using Neoformat


Terminal (neoterm)
<C-t>            Toggle terminal window

]]


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
require('treesitter-context').setup {
    enable = true,            -- Enable this plugin
    max_lines = 3,            -- Maximum number of lines to show
    trim_scope = 'outer',     -- Trim outer context first
    mode = 'cursor',          -- 'cursor' or 'topline'
    separator = nil,          -- Use a custom separator like '─'
    zindex = 20,              -- Display priority
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
vim.cmd('colorscheme catppuccin-mocha')


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

--let test#python#runner = 'pytest'

--let test#java#runner = 'gradletest'

vim.g.vimspector_enable_mappings = 'HUMAN'


-- Plugin configs
--vim.cmd("let g:lightline = {'colorscheme':'catppuccin', 'active': {'left' : [ ['mode', 'paste' ], ['gitbranch', 'readonly', 'filename', 'modified' ] ] },'component_function' : {'gitbranch':'gitbranch#name'}}")

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

-- git status
vim.keymap.set('n', '<leader>gg', ':G<CR>')

-- Code completion and language server binds
vim.keymap.set('n', 'gh', vim.lsp.buf.hover, { silent = true, desc = 'Hover documentation' })
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { silent = true, desc = 'Signature help' })
vim.keymap.set('n', 'gR', vim.lsp.buf.rename, { silent = true, desc = 'Rename symbol' })

-- Vimspector Debugger Keymaps (strings with <CR> are appropriate here)
vim.keymap.set('n', '<leader>da', ':call vimspector#Launch()<CR>', { silent = true, desc = 'Vimspector Launch' })
vim.keymap.set('n', '<leader>dx', ':call vimspector#Reset()<CR>', { silent = true, desc = 'Vimspector Reset' })
vim.keymap.set('n', '<S-k>',      ':call vimspector#StepOut()<CR>', { silent = true, desc = 'Vimspector Step Out' })
vim.keymap.set('n', '<S-l>',      ':call vimspector#StepInto()<CR>', { silent = true, desc = 'Vimspector Step Into' })
vim.keymap.set('n', '<S-j>',      ':call vimspector#StepOver()<CR>', { silent = true, desc = 'Vimspector Step Over' })
vim.keymap.set('n', '<leader>d_', ':call vimspector#Restart()<CR>', { silent = true, desc = 'Vimspector Restart' })
vim.keymap.set('n', '<leader>dn', ':call vimspector#Continue()<CR>', { silent = true, desc = 'Vimspector Continue' })
vim.keymap.set('n', '<leader>drc', ':call vimspector#RunToCursor()<CR>', { silent = true, desc = 'Vimspector Run to Cursor' })
vim.keymap.set('n', '<leader>dh', ':call vimspector#ToggleBreakpoint()<CR>', { silent = true, desc = 'Vimspector Toggle Breakpoint' })
vim.keymap.set('n', '<leader>de', ':call vimspector#ToggleConditionalBreakpoint()<CR>', { silent = true, desc = 'Vimspector Conditional Breakpoint' })
vim.keymap.set('n', '<leader>dX', ':call vimspector#ClearBreakpoints()<CR>', { silent = true, desc = 'Vimspector Clear Breakpoints' })



