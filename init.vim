:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set smarttab
:set mouse+=a
:set syntax=on
:set clipboard+=unnamedplus
"автоподстановка
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
"плагины
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'https://github.com/preservim/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'https://github.com/folke/tokyonight.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'ryanoasis/vim-devicons'
call plug#end()
"тема
colorscheme tokyonight-storm
"let g:airline_theme='deus'
"бинды nerdtree 
nnoremap <C-t> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
"бинды выход
"nnoremap <C-r> :wq<CR>
"nnoremap <C-y> :qa<CR>
"скрытые файлы nerdtree 
let NERDTreeShowHidden=1
"картинка
let g:startify_custom_header = [
            \ '███╗   ██╗██╗   ██╗      ██╗██████╗ ███████╗',
            \ '████╗  ██║██║   ██║      ██║██╔══██╗██╔════╝',
            \ '██╔██╗ ██║██║   ██║█████╗██║██║  ██║█████╗',
            \ '██║╚██╗██║╚██╗ ██╔╝╚════╝██║██║  ██║██╔══╝',
            \ '██║ ╚████║ ╚████╔╝       ██║██████╔╝███████╗',
            \ '╚═╝  ╚═══╝  ╚═══╝        ╚═╝╚═════╝ ╚══════╝',
            \ ]
"панель
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'unique_tailo'
"кодировка
set encoding=UTF-8
"lua config
lua << EOF
require'nvim-treesitter.configs'.setup {
   ensure_installed = {  "lua", "python" },

    sync_install = false,

   auto_install = false,

    ignore_install = { "javascript" },

 
  highlight = {
       enable = true,


    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

       additional_vim_regex_highlighting = false,
  },
}
--выпадающее меню coc.nvim
-- highlight
-- for custom pop menu
vim.api.nvim_set_hl(0, "CocCustomPopup", { fg = "#ebdbb2", bg = "#282828" })
-- border
vim.api.nvim_set_hl(0, "CocCustomPopupBoder", { fg = "#5F5F5F", bold = true })
-- selected row
vim.api.nvim_set_hl(0, "CocMenuSel", { bg = "#3c3836", bold = true })
-- matched_text
vim.api.nvim_set_hl(0, "CocSearch", { fg = "#fabd2f" })
-- unused code
vim.api.nvim_set_hl(0, "CocUnusedHighlight", { underline = true })
--lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
		  lualine_a = { 'mode'},
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = {},
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
EOF
