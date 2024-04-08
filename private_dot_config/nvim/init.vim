:set number
:set relativenumber
:set autoindent 
:set expandtab
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop
:syntax on


" Remember cursor position
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END


call plug#begin("~/.vim/plugged")
 " Theme
 Plug 'Mofiqul/dracula.nvim'
 " Vim bar
 Plug 'nvim-lualine/lualine.nvim'
 " Colors for bar
 Plug 'nvim-tree/nvim-web-devicons'
 " Improves highlighting
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 " Utilities (required for at least telescope)
 Plug 'nvim-lua/plenary.nvim'
 " Cool fuzzy find tool!
 Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }
 " LSP manager
 Plug 'williamboman/mason.nvim'
 Plug 'williamboman/mason-lspconfig.nvim'
 Plug 'neovim/nvim-lspconfig'

 " completions
 Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
 " 9000+ Snippets
" Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
call plug#end()


colorscheme dracula

let g:coq_settings = { 'auto_start': 'shut-up' }

lua << END
require('lualine').setup()

require('mason').setup()
require('mason-lspconfig').setup()
require("mason-lspconfig").setup_handlers({
    function (server_name)
        require("lspconfig")[server_name].setup {}
    end
})


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})



END


