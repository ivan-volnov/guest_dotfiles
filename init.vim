let mapleader="\<space>"

" Plugins -------------------------------------------------------------------------------
call plug#begin('~/.local/share/nvim/plugged')

" Look and feel
Plug 'sonph/onehalf', {'rtp': 'vim/'}   " Color theme
Plug 'sainnhe/gruvbox-material'         " Color theme
Plug 'vim-airline/vim-airline'          " Status line
Plug 'mhinz/vim-startify'               " Fancy start screen
Plug 'ctrlpvim/ctrlp.vim'

" Text editing
Plug 'tomtom/tcomment_vim'              " File-type sensible toggle comments
Plug 'matze/vim-move'                   " Plugin to move lines and selections up and down
Plug 'lambdalisue/suda.vim'             " A sudo.vim for Vim and Neovim

" Programming
Plug 'PratikBhusal/vim-grip', {'for': 'markdown'} " GitHub Readme Instant Preview

call plug#end()


" Plugin specific settings --------------------------------------------------------------

" Color schemes
set background=dark
let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_enable_bold = 1
colorscheme gruvbox-material

" Startify
let g:startify_files_number = 20
let g:startify_update_oldfiles = 1
let g:startify_lists = [
            \ { 'type': 'files', 'header': ['   Recent files'] },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] }]
" let g:startify_bookmarks = ['~/dev', '~/dev/2019', '~/dev/2020']
let g:startify_custom_header = [
            \ "  ",
            \ '   ╻ ╻   ╻   ┏┳┓',
            \ '   ┃┏┛   ┃   ┃┃┃',
            \ '   ┗┛    ╹   ╹ ╹',
            \ '   ',
            \ ]

" Other plugins
let g:gitgutter_map_keys = 0
let g:plug_window = 'topleft new | res'
let g:move_key_modifier = 'C'           " matze/vim-move
let g:tcomment_maps = 0
let g:airline#extensions#whitespace#enabled = 0
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
let g:suda_smart_edit = 1

let g:grip_default_map = 0

" General settings ----------------------------------------------------------------------
set encoding=utf-8                      " The encoding diaplayed
set fileencoding=utf-8                  " The encoding  written

set expandtab                           " Use spaces instead of tabs
set tabstop=4
set softtabstop=4                       " Tab key indents by 4 spaces
set shiftwidth=4                        " >> indents by 4 spaces
set shiftround                          " >> indents to next multiple of 'shiftwidth'

set hidden                              " Switch between buffers without having to save first
" set display=lastline                    " Show as much as possible of the last line
set mouse=a

set showcmd                             " Show already typed keys when more are expected
set formatoptions-=t                    " Disable auto-wrapping
set noshowmode                          " Hide mode in the last line

set incsearch                           " Highlight while searching with / or ?
set ignorecase                          " case insensivity search
set hlsearch                            " Keep matches highlighted
set complete-=i                         " disable scanning included files
set complete-=t                         " disable searching tags
set wrapscan                            " Searches wrap around end-of-file

" set lazyredraw                          " Only redraw when necessary
set synmaxcol=0                         " Unlimit highlight columns

set splitbelow                          " Open new windows below the current window
" set splitright                          " Open new windows right of the current window
" set winwidth=999                        " Disable vertical sptlit

set relativenumber                      " Show relative line numbers
set timeoutlen=600                      " The time in milliseconds that is waited for a key code or mapped key sequence to complete
set updatetime=300
set shortmess+=c
set signcolumn=yes                      " Always show signcolumns
" set cmdheight=2

augroup cursorline                      " Highlight current line only on active window
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

set report=0                            " Always report changed lines
set history=1000                        " Store lots of :cmdline history

set noerrorbells                        " Disable beep
set novisualbell                        " Disable beep
set t_vb=                               " Disable beep
set visualbell                          " Disable beep

set scrolloff=5                         " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

autocmd BufWritePre * :%s/\s\+$//e      " Trim trailing whitespace on save

set gcr=a:blinkon0                      " Disable cursor blink

set list                                " Show non-printable characters
let &listchars = 'tab:  ,trail: ,nbsp:+'

" set completeopt-=preview                " disable preview window popping up

" Put all temporary files under the same directory
set nobackup
set nowritebackup
set undofile
set undodir     =~/.local/share/nvim/undo/
set shada       =\'20,:100,<0,h,n~/.local/share/nvim/viminfo

" Autoreload .vimrc
augroup vimrc
    au!
    au BufWritePost ~/.config/nvim/init.vim source % | AirlineRefresh
augroup end

" Restore cursor to file position in previous editing session
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END


" Key bindings --------------------------------------------------------------------------
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev Wa wa
cnoreabbrev wA wa
cnoreabbrev WA wa
cnoreabbrev Qa qa
cnoreabbrev qA qa
cnoreabbrev QA qa

noremap Q <Nop>
noremap q <Nop>

" turbo moving
nnoremap J  4j
nnoremap K  4k
" nnoremap H  ^
" nnoremap L  $
" nnoremap <CR> w
" nnoremap <bs> ^

" vim config
noremap <leader>, :tabnew ~/.config/nvim/init.vim<CR>

autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType markdown noremap <silent><leader>r :GripStart<CR>
" split navigation
nnoremap <A-j> <C-W><C-J>
nnoremap <A-k> <C-W><C-K>
nnoremap <A-l> <C-W><C-L>
nnoremap <A-h> <C-W><C-H>

" comments
nnoremap <silent> <leader>c :TComment<CR>
vnoremap <silent> <leader>c :TComment<CR>

" system clipboard
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>Y "+Y
noremap <leader>P "+P

" my "y register
" noremap <leader>Y "yy
" noremap <leader>P "yp

" clear search history
nnoremap <silent> <leader>/ :let @/=""<CR>


nnoremap <Leader>t :tabnew<CR>:Startify<CR>

