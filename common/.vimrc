" leaderキーを設定
let mapleader = "\<Space>"

" プラグインインストール {{{
call plug#begin('~/.vim/plugged')
" 表示 {{{
Plug 'overcache/NeoSolarized'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'ntpeters/vim-better-whitespace'

Plug 'will133/vim-dirdiff'

Plug 'ap/vim-css-color'
" }}}

" 操作 {{{
if ! (has('win32') || has('win64'))
  if has('nvim')
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/defx.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif

  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
else
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'PhilRunninger/nerdtree-buffer-ops'
  Plug 'PhilRunninger/nerdtree-visual-selection'

  Plug 'ctrlpvim/ctrlp.vim'
end

Plug 'jiangmiao/auto-pairs'

Plug 'https://github.com/adelarsq/vim-matchit'

Plug 'editorconfig/editorconfig-vim'

Plug 'terryma/vim-multiple-cursors'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'dhruvasagar/vim-table-mode'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'mattn/emmet-vim'
" }}}

" シンタックス {{{
Plug 'pprovost/vim-ps1'

Plug 'chr4/nginx.vim'

Plug 'blueyed/smarty.vim'

Plug 'jwalton512/vim-blade'

" jsx
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" NOTE: cocと併用でフリーズ気味になる気がする...
" Plug 'leafOfTree/vim-vue-plugin'

Plug 'dag/vim-fish'

Plug 'tikhomirov/vim-glsl'

Plug 'Vimjas/vim-python-pep8-indent'
" }}}

" その他 {{{
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

Plug 'tpope/vim-fugitive'
" }}}
call plug#end()
" }}}

" プラグイン設定 {{{
" NeoSolarized {{{
set termguicolors
let g:neosolarized_contrast = "normal"
let g:neosolarized_visibility = "normal"
let g:neosolarized_vertSplitBgTrans = 1
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1
let g:neosolarized_termBoldAsBright = 0
colorscheme NeoSolarized
set background=dark
" }}}

if ! (has('win32') || has('win64'))
  " defx {{{
  autocmd FileType defx call s:defx_my_settings()
  function! s:defx_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
          \ defx#do_action('open')
    nnoremap <silent><buffer><expr> c
          \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
          \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
          \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> l
          \ defx#do_action('open')
    nnoremap <silent><buffer><expr> E
          \ defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> P
          \ defx#do_action('preview')
    nnoremap <silent><buffer><expr> o
          \ defx#do_action('open_tree', 'toggle')
    nnoremap <silent><buffer><expr> K
          \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
          \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M
          \ defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> C
          \ defx#do_action('toggle_columns',
          \                'mark:indent:icon:filename:type:size:time')
    nnoremap <silent><buffer><expr> S
          \ defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> d
          \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
          \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> !
          \ defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x
          \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy
          \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .
          \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ;
          \ defx#do_action('repeat')
    nnoremap <silent><buffer><expr> h
          \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~
          \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> q
          \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> <TAB>
          \ defx#do_action('toggle_select')
    nnoremap <silent><buffer><expr> *
          \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j
          \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
          \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l>
          \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
          \ defx#do_action('print')
    nnoremap <silent><buffer><expr> cd
          \ defx#do_action('change_vim_cwd')
  endfunction
  nmap <leader>e :exe "Defx -show-ignored-files -columns=git:mark:icons:indent:filename:type " . expand('%:h')<CR>
  nmap <leader>E :Defx -show-ignored-files -columns=git:mark:icons:indent:filename:type<CR>
  " }}}

  " fzf {{{
  if executable('rg')
    nmap <leader>g :Rg  <BS>
  end

  nmap <leader>b :Buffers<CR>
  nmap <leader>F :Files  <BS>
  nmap <leader>f :Files<CR>
  nmap ,g :GFiles?<CR>
  nmap ,G :GFiles<CR>
  nmap <leader>h :History<CR>
  " }}}
else
  " nerdtree {{{
  nmap <leader>e :e .<CR>

  let NERDTreeShowHidden=1
  " }}}

  " ctrlp {{{
  let g:ctrlp_map = '<leader>f'
  let g:ctrlp_cmd = 'CtrlP'

  let g:ctrlp_working_path_mode = 'a'

  set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/templates_c/*
  if has('win32') || has ('win64')
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*\\templates_c\\*
  endif

  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }

  let g:ctrlp_user_command = 'find %s -type f'
  if has('win32') || has ('win64')
    let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'
  endif
  " }}}
end

" coc {{{
" https://github.com/neoclide/coc.nvim#example-vim-configuration からサンプルをコピーして編集 {{{
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=200

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
" if has("nvim-0.5.0") || has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader><space>f  <Plug>(coc-format-selected)
nmap <leader><space>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add `:Prettier` command and its shortcut.
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space><space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space><space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space><space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space><space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space><space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space><space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space><space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space><space>p  :<C-u>CocListResume<CR>
" }}}

" extensions {{{
" basic
let g:coc_global_extensions = [
      \ 'coc-diagnostic',
      \ 'coc-git',
      \ 'coc-highlight',
      \ 'coc-prettier',
      \ 'coc-vimlsp',
      \ ]
" settings
let g:coc_global_extensions += [
      \ 'coc-json',
      \ 'coc-toml',
      \ 'coc-yaml',
      \ ]
" markdown
let g:coc_global_extensions += [
      \ 'coc-markdownlint',
      \ ]
" html, css, js
let g:coc_global_extensions += [
      \ '@yaegassy/coc-volar',
      \ 'coc-angular',
      \ 'coc-css',
      \ 'coc-cssmodules',
      \ 'coc-emmet',
      \ 'coc-eslint',
      \ 'coc-html',
      \ 'coc-html-css-support',
      \ 'coc-htmlhint',
      \ 'coc-stylelintplus',
      \ 'coc-svelte',
      \ 'coc-svg',
      \ 'coc-tailwindcss',
      \ 'coc-tsserver',
      \ 'coc-vetur',
      \ 'coc-xml',
      \ ]
" php
let g:coc_global_extensions += [
      \ '@yaegassy/coc-intelephense',
      \ 'coc-blade',
      \ ]
" python
let g:coc_global_extensions += [
      \ 'coc-pyright',
      \ ]
" ruby
let g:coc_global_extensions += [
      \ 'coc-solargraph',
      \ ]
" go
let g:coc_global_extensions += [
      \ 'coc-go',
      \ 'coc-golines',
      \ ]
" perl
let g:coc_global_extensions += [
      \ 'coc-perl',
      \ ]
" nginx
let g:coc_global_extensions += [
      \ '@yaegassy/coc-nginx',
      \ ]
" graphql
let g:coc_global_extensions += [
      \ 'coc-graphql',
      \ ]
" sql
let g:coc_global_extensions += [
      \ 'coc-sql',
      \ ]
" bash
let g:coc_global_extensions += [
      \ 'coc-sh',
      \ ]
" english
let g:coc_global_extensions += [
      \ 'coc-ltex',
      \ 'coc-spell-checker',
      \ ]
" other
let g:coc_global_extensions += [
      \ 'coc-calc',
      \ ]
" }}}
" }}}

" vim-better-whitespace {{{
let g:better_whitespace_enabled=1
" let g:strip_whitespace_on_save=1
" }}}

" vim-indent-guides {{{
let g:indent_guides_enable_on_vim_startup = 0
nnoremap <leader>i :IndentGuidesToggle<CR>
" }}}
" }}}

" 表示（cocで必須のものはcoc設定に記述） {{{
" line number
set number

" 80文字程度入力で自動改行してしまうのを無効に
set textwidth=0

" hidden charactors
set listchars=tab:→\ ,extends:»,precedes:«
set list

" ruler
set colorcolumn=80

" tabline {{{
" デフォルトで1つ表示
set showtabline=2

" 表示項目 {{{
set tabline=%!MyTabLine()

function MyTabLine()
  let s = ''

  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    let s .= '%' . (i + 1) . 'T'

    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

  let s .= '%#TabLineFill#%T'
  let s .= '%='
  let s .= ' ' . fnamemodify(getcwd(), ':~') . ' '

  return s
endfunction

function MyTabLabel(n)
  return a:n . ' ' . fnamemodify(getcwd(tabpagewinnr(a:n), a:n), ':t')
endfunction
" }}}
" }}}

" status line
set statusline=\ %f\ %m\ %r%=(%l:%c)\ %y\ %{&fileencoding}\ %{&fileformat}\ " space

" folding {{{
set foldmethod=manual

" NOTE: defxとぶつかる
" augroup FoldState
"   au!
"
"   au BufWinLeave * mkview
"   au BufWinEnter * silent! loadview
" augroup END
" }}}
" }}}

" 操作（cocで必須のものはcoc設定に記述） {{{
" swap file
set directory=~/.vim/swp

set undodir=~/.vim/undo

set backspace=2

" filetype plugin indent on

" html indent issue
let g:html_indent_script1 = "zero"
let g:html_indent_style1 = "zero"

" if file has changed,
set autoread

if has('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp
set fileformats=unix,dos,mac

if has('mouse')
  set mouse=a
endif

" search {{{
set incsearch
set hlsearch
set ignorecase
set smartcase
" }}}

" コマンド補完 {{{
set wildmenu
set wildmode=longest:full,full
set wildignorecase
" }}}
" }}}

" キーマップ {{{
" grep
autocmd QuickFixCmdPost *grep* cwindow

" indent mode toggle {{{
set autoindent

let s:defaultIndentSize = 2
let s:indentSize = s:defaultIndentSize

let &tabstop = s:indentSize
let &softtabstop = s:indentSize
let &shiftwidth = s:indentSize
set expandtab

function! SetTabMode(count)
  let l:indentSize = a:count ? a:count : 2

  let &tabstop = l:indentSize
  let &softtabstop = 0
  let &shiftwidth = 0
  set noexpandtab

  echo "Indent: " . l:indentSize . " Tabs."
endfunction

function! UnsetTabMode(count)
  let l:indentSize = a:count ? a:count : 2

  let &tabstop = l:indentSize
  let &softtabstop = l:indentSize
  let &shiftwidth = l:indentSize
  set expandtab

  echo "Indent: " . l:indentSize . " Spaces."
endfunction

nnoremap <silent> <Leader><Tab> :<C-U>call SetTabMode(v:count)<CR>
nnoremap <silent> <Leader><S-Tab> :<C-U>call UnsetTabMode(v:count)<CR>
" }}}

" line number toggle {{{
function! ToggleNumber()
  if &rnu == 1
     set relativenumber!
     set number
  else
     set number!
     set relativenumber
  endif
endfunction

nmap <silent> <leader>n :<C-U>call ToggleNumber()<CR>
" }}}

" line wrap toggle {{{
nnoremap <leader>w :<C-u>set wrap!<CR>
" }}}

" quickfix {{{
nmap ]q :cnext<CR>
nmap [q :cprevious<CR>
nmap ]Q :clast<CR>
nmap [Q :cfirst<CR>
" }}}

" tab {{{
nnoremap tl :tabnext<CR>
nnoremap th :tabprevious<CR>
nnoremap tk :tabfirst<CR>
nnoremap tj :tablast<CR>

nnoremap tH :tabm -1<CR>
nnoremap tL :tabm +1<CR>

nnoremap tn :tabnew<CR>
nnoremap te :tabedit<CR>

nnoremap tc :tabclose<CR>
nnoremap tC :tabdo close<CR>
" }}}

" disable undo each line
nnoremap U u

" undo list
nnoremap <leader>u :<C-u>undolist<CR>

" jump list
nnoremap <leader>j :<C-u>jumps<CR>

" registers
nnoremap <leader>r :<C-u>registers<CR>

" window {{{
nnoremap sp :split<CR>
nnoremap vs :vsplit<CR>

nnoremap sh <C-w>h<CR>
nnoremap sj <C-w>j<CR>
nnoremap sk <C-w>k<CR>
nnoremap sl <C-w>l<CR>
" }}}

" diff {{{
nnoremap <leader>d :<C-u>windo diffthis<CR>
nnoremap <leader>D :<C-u>windo diffoff<CR>
" }}}
" }}}

" その他 {{{
" gvim用
set runtimepath^=$HOME/.vim

" デバッグ {{{
command! Profile call s:command_profile()

function! s:command_profile() abort
  profile start ~/.vim/profile.txt
  profile func *
  profile file *
endfunction
" }}}
" }}}

" vim: foldmethod=marker
