let s:cpo_save=&cpo
set cpo&vim
inoremap <C-J> <Cmd>lua MiniSnippets.expand()
inoremap <expr> <S-Tab> pumvisible() ? "\" : "\<S-Tab>"
inoremap <C-W> u
inoremap <C-U> u
xnoremap  zz
nnoremap  zz
xnoremap 	 <Cmd>bnext
nnoremap 	 <Cmd>bnext
nnoremap  <Cmd>nohlsearch|diffupdate|normal! 
xnoremap  zz
nnoremap  zz
tnoremap  
nmap  d
nnoremap  <Cmd>noh
nnoremap  j <Cmd>!just
xnoremap  p "_dP
nnoremap  Q :bd!
nnoremap  q :bd
xnoremap  w :w
nnoremap  w :w
omap <silent> % <Plug>(MatchitOperationForward)
xmap <silent> % <Plug>(MatchitVisualForward)
nmap <silent> % <Plug>(MatchitNormalForward)
nnoremap & :&&
vnoremap < <gv
vnoremap > >gv
xnoremap <silent> <expr> @ mode() ==# 'V' ? ':normal! @'.getcharstr().'' : '@'
nnoremap J mzJ`z
vnoremap J :m '>+1gv=gv
vnoremap K :m '<-2gv=gv
xnoremap <silent> <expr> Q mode() ==# 'V' ? ':normal! @=reg_recorded()' : 'Q'
nnoremap Y y$
omap <silent> [% <Plug>(MatchitOperationMultiBackward)
xmap <silent> [% <Plug>(MatchitVisualMultiBackward)
nmap <silent> [% <Plug>(MatchitNormalMultiBackward)
omap <silent> ]% <Plug>(MatchitOperationMultiForward)
xmap <silent> ]% <Plug>(MatchitVisualMultiForward)
nmap <silent> ]% <Plug>(MatchitNormalMultiForward)
xmap a% <Plug>(MatchitVisualTextObject)
omap <silent> g% <Plug>(MatchitOperationBackward)
xmap <silent> g% <Plug>(MatchitVisualBackward)
nmap <silent> g% <Plug>(MatchitNormalBackward)
xnoremap <silent> sa :lua MiniSurround.add('visual')
xmap <silent> <Plug>(MatchitVisualTextObject) <Plug>(MatchitVisualMultiBackward)o<Plug>(MatchitVisualMultiForward)
onoremap <silent> <Plug>(MatchitOperationMultiForward) :call matchit#MultiMatch("W",  "o")
onoremap <silent> <Plug>(MatchitOperationMultiBackward) :call matchit#MultiMatch("bW", "o")
xnoremap <silent> <Plug>(MatchitVisualMultiForward) :call matchit#MultiMatch("W",  "n")m'gv``
xnoremap <silent> <Plug>(MatchitVisualMultiBackward) :call matchit#MultiMatch("bW", "n")m'gv``
nnoremap <silent> <Plug>(MatchitNormalMultiForward) :call matchit#MultiMatch("W",  "n")
nnoremap <silent> <Plug>(MatchitNormalMultiBackward) :call matchit#MultiMatch("bW", "n")
onoremap <silent> <Plug>(MatchitOperationBackward) :call matchit#Match_wrapper('',0,'o')
onoremap <silent> <Plug>(MatchitOperationForward) :call matchit#Match_wrapper('',1,'o')
xnoremap <silent> <Plug>(MatchitVisualBackward) :call matchit#Match_wrapper('',0,'v')m'gv``
xnoremap <silent> <Plug>(MatchitVisualForward) :call matchit#Match_wrapper('',1,'v'):if col("''") != col("$") | exe ":normal! m'" | endifgv``
nnoremap <silent> <Plug>(MatchitNormalBackward) :call matchit#Match_wrapper('',0,'n')
nnoremap <silent> <Plug>(MatchitNormalForward) :call matchit#Match_wrapper('',1,'n')
tnoremap <silent> <Plug>(fzf-normal) 
tnoremap <silent> <Plug>(fzf-insert) i
nnoremap <silent> <Plug>(fzf-normal) <Nop>
nnoremap <silent> <Plug>(fzf-insert) i
xnoremap <C-U> zz
nnoremap <C-U> zz
xnoremap <C-D> zz
nnoremap <C-D> zz
tnoremap <C-W> 
xnoremap <S-Tab> <Cmd>bprevious
nnoremap <S-Tab> <Cmd>bprevious
nmap <C-W><C-D> d
nnoremap <C-L> <Cmd>nohlsearch|diffupdate|normal! 
inoremap <expr> 	 pumvisible() ? "\" : "\	"
inoremap <NL> <Cmd>lua MiniSnippets.expand()
inoremap  u
inoremap  u
let &cpo=s:cpo_save
unlet s:cpo_save
set clipboard=unnamedplus
set expandtab
set fillchars=eob:\ 
set formatoptions=jcqt
set grepformat=%f:%l:%c:%m
set grepprg=rg\ --vimgrep\ -uu\ 
set helplang=en
set ignorecase
set imsearch=0
set runtimepath=~/.config/nvim,/etc/xdg/nvim,~/.local/share/nvim/site,~/.local/share/nvim/site/pack/core/opt/ccc.nvim,~/.local/share/nvim/site/pack/core/opt/undotree,~/.local/share/nvim/site/pack/core/opt/friendly-snippets,~/.local/share/nvim/site/pack/core/opt/mini.extra,~/.local/share/nvim/site/pack/core/opt/mini.pick,~/.local/share/nvim/site/pack/core/opt/mini.files,~/.local/share/nvim/site/pack/core/opt/mini.surround,~/.local/share/nvim/site/pack/core/opt/blink.cmp,~/.local/share/nvim/site/pack/core/opt/nvim-lspconfig,~/.local/share/nvim/site/pack/core/opt/nvim-treesitter,~/.local/share/nvim/site/pack/core/opt/mini.tabline,~/.local/share/nvim/site/pack/core/opt/mini.snippets,/usr/local/share/nvim/site,/usr/share/nvim/site,~/.nix-profile/share/nvim/site,/nix/var/nix/profiles/default/share/nvim/site,/tmp/.mount_nvimiEEfdp/usr/share/nvim/runtime,/tmp/.mount_nvimiEEfdp/usr/share/nvim/runtime/pack/dist/opt/netrw,/tmp/.mount_nvimiEEfdp/usr/share/nvim/runtime/pack/dist/opt/matchit,/tmp/.mount_nvimiEEfdp/usr/lib/nvim,/nix/var/nix/profiles/default/share/nvim/site/after,~/.nix-profile/share/nvim/site/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,~/.local/share/nvim/site/after,/etc/xdg/nvim/after,~/.config/nvim/after,/usr/share/vim/vimfiles,/usr/share/vim/vimfiles/after
set scrolloff=10
set shada='10,<0,s10,h
set shiftwidth=4
set shortmess=TOClAoFt
set showtabline=0
set smartcase
set smartindent
set splitright
set noswapfile
set tabline=%!v:lua.MiniTabline.make_tabline_string()
set tabstop=4
set termguicolors
set undodir=~/.local/share/nvim/undo
set undofile
set window=34
" vim: set ft=vim :
