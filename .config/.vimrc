set relativenumber
set number

set nocompatible

filetype plugin on

set hidden

" highlights
set hls
nnoremap <esc><esc> :noh<return><esc>

" display line number, row number and percentages 
set ruler

" set system clipboard as the default clipboard
set clipboard=unnamedplus
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab


" netrw
" set tree mode as default in Netrw
let g:netrw_liststyle = 3


" automatic installation https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Begin Vim-Plug plugin manager
call plug#begin('~/.vim/plugged')

" joshdick/onedark: dark theme
Plug 'joshdick/onedark.vim'

" vim-airline/vim-airline: modern theme
Plug 'vim-airline/vim-airline'

" fadeout
Plug 'TaDaa/vimade'

" limelight
Plug 'junegunn/limelight.vim'

" hide
" Plug 'junegunn/goyo.vim'

" surround
Plug 'tpope/vim-surround'

" junegunn/vim-peekaboo: preview vim regisiters
Plug 'junegunn/vim-peekaboo'

" fzf plugin for Vim
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
" let g:deoplete#enable_at_startup = 1

" ALE
Plug 'dense-analysis/ale'

Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install --frozen-lockfile --production',
      \ 'branch': 'release/0.x'
      \ }

Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" chatGPT
Plug 'madox2/vim-ai', { 'do': './install.sh' }

" git
Plug 'airblade/vim-gitgutter'

" Junegunn/varder.vim: Vimscript test framework
Plug 'junegunn/vader.vim'

" sillybun/vim-repl: python repl
Plug 'sillybun/vim-repl'

" easymotion/vim-easymotion: jump
Plug 'easymotion/vim-easymotion' 
" justinmk/vim-sneak: jump
Plug 'justinmk/vim-sneak'

" dpelle/vim-LanguageTool: grammar check
Plug 'dpelle/vim-LanguageTool'

" End Vim-Plug plugin manager
call plug#end()


" Begin Vim-Plug plugin config

" junegunn/fzf.vim
let g:fzf_preview_window = ['up,50%', 'ctrl-/']

" fzf key bidings
nnoremap <silent> <Leader>b :Buffers<CR>
" maps control+f to search files with fzf
nnoremap <silent> <C-f> :Files<CR>
" maps \f to finding in files with rg 
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>

" keybidings in fzf preview
" CTRL-T open in a new tab
" CTRL-X open in a new split
" CTRL-V open in a new vertical split


" autopep8
autocmd FileType python set equalprg=autopep8\ -


  " onedark
  colorscheme onedark


" TaDaa/vimade
let g:vimade = {}
let g:vimade.fadelevel = 0.5
let g:vimade.enablesigns = 1


" limelight
set background=dark
highlight Normal ctermbg=235

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

let g:limelight_conceal_termfg = 'gray'
let g:limelight_conceal_termfg = 240 " 
" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 0

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
" TODO let g:limelight_bop = '{\%([^{]*{[^}]*}\)*'
let g:limelight_bop = '^\n\n'
let g:limelight_eop = '\n\n\n'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -50

autocmd VimEnter * Limelight


" dense-analysis/ale
" Use ALE and also some plugin 'foobar' as completion sources for all code.
" call deoplete#custom#option('sources', {
" \ '_': ['ale', 'foobar'],
" \})

" ALE
" Enable completion where available.
" This setting must be set before ALE is loaded.
"
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
let g:ale_virtualtext_cursor = 1
let g:ale_completion_enabled = 1
nmap gd :ALEGoToDefinition<CR>
nmap gr :ALEFindReferences<CR>
nmap K :ALEHover<CR>


" -tab
"  `<Plug>(ale_go_to_definition)`           - `:ALEGoToDefinition`
"  `<Plug>(ale_go_to_definition_in_tab)`    - `:ALEGoToDefinition -tab`
"  `<Plug>(ale_go_to_definition_in_split)`  - `:ALEGoToDefinition -split`
"  `<Plug>(ale_go_to_definition_in_vsplit)` - `:ALEGoToDefinition -vsplit`


" madox2/vim-ai
xnoremap <leader>c :AIChat<CR>
nnoremap <leader>c :AIChat<CR>

let myprompt = "Please add comments to the code explaining the code line by line".", and keep in mind that you can only write comments"
command! -range -nargs=? AICode <line1>,<line2>call vim_ai#AIRun(<range>, myprompt . "Noted that the programming syntax is " . &filetype)

xnoremap <leader>e :AICode<CR>
nnoremap <leader>e :AICode<CR>


" junegunn/vim-peekaboo
let g:peekaboo_compact = 1


" vim-repl
let g:repl_output_copy_to_register = "r" " only support for ipython
let g:repl_program = {
      \	'python': ['ipython3'],
      \	'default': ['bash'],
      \ 'vim': 'vim -e',
      \	}

let g:repl_exit_commands = {
      \	'python': 'quit()',
      \	'ipython3': 'exit()',
      \	'bash': 'exit',
      \	'zsh': 'exit',
      \ 'vim': 'exit',
      \	}

nnoremap <leader>r :REPLToggle<Cr>


" vim-sneak
let g:sneak#label = 1


" vim-LanguageTool
let g:languagetool_jar = '/usr/local/share/LanguageTool-5.2/languagetool-commandline.jar'
let g:languagetool_lang = 'en-US' 
nnoremap <leader>l :LanguageToolCheck<CR>
