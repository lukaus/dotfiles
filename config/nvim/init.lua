local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('tomasiser/vim-code-dark')
Plug('pangloss/vim-javascript')
Plug('itchyny/lightline.vim')
Plug('itchyny/vim-gitbranch')
Plug('szw/vim-maximizer')
Plug('christoomey/vim-tmux-navigator')
Plug('kassio/neoterm')
Plug('tpope/vim-commentary')
Plug('sbdchd/neoformat')
Plug('junegunn/fzf', { ['dir']= '~/.fzf', ['do']= './install -all' })
Plug('junegunn/fzf.vim')
Plug('tpope/vim-fugitive')
Plug('airblade/vim-gitgutter')
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
--Plug('nvim-lua/completion-nvim')
Plug('wbthomason/packer.nvim')
Plug('L3MON4D3/LuaSnip')
Plug('puremourning/vimspector')
Plug('sagi-z/vimspectorpy')
vim.call('plug#end')

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
--vim.cmd.colorscheme('codedark')
vim.cmd.colorscheme('mourning')

local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}

local use = require('packer').use
require('packer').startup(function()
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
end)

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

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
vim.cmd("let g:lightline = { 'active': {'left' : [ ['mode', 'paste' ], ['gitbranch', 'readonly', 'filename', 'modified' ] ] },'component_function' : {'gitbranch':'gitbranch#name'},    'colorscheme':'mourning'}")

vim.g.neoterm_default_mod = 'horizontal'
vim.g.neoterm_size = 25 
vim.g.neoterm_autoinsert = 1




-- Bindings
vim.g.mapleader = ' '
    -- maximizer
vim.keymap.set('n', '<leader>m', ':MaximizerToggle<CR>')
    -- neoterm
vim.keymap.set('n', '<c-q>', ':Ttoggle<CR>')
vim.keymap.set('i', '<c-q>', '<Esc>:Ttoggle<CR>')
vim.keymap.set('t', '<c-q>', '<c-\\><c-n>:Ttoggle<CR>')
    -- neoformat (need format files)
vim.keymap.set('n', '<leader>F', ':Neoformat prettier<CR>')

    -- fzf
vim.keymap.set('n', '<leader><space>', ':GFiles<CR>')
vim.keymap.set('n', '<leader>ff', ':GFiles<CR>')
--[[
vim.keymap.set('n', '<leader><space>', ':GFiles<CR>')
if has('nvim')
then
    vim. 
end
--]]
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

