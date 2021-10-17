" vim: syntax=vim
" Environment {
    " Basics {
    set nocompatible        " Must be first line
    set background=dark     " Assume a dark background
    " }

    " Start vim-plug {
    let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
    if empty(glob(data_dir . '/autoload/plug.vim'))
        silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

	call plug#begin('~/.vim/plugged')
    " }
" }

" Bundle {
    " Color {
        Plug 'rafi/awesome-vim-colorschemes'
        Plug 'tomasr/molokai'
        Plug 'connorholyday/vim-snazzy'
        Plug 'gruvbox-community/gruvbox'
	    let g:gruvbox_contrast_dark='hard'
    " }

    " git {
        Plug 'tpope/vim-fugitive'
        Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
            set updatetime=100
            nnoremap <leader>gp :SignifyHunkDiff<cr>
            nnoremap <leader>gu :SignifyHunkUndo<cr>
    "}

    " Editor {
        Plug 'tpope/vim-surround'
        Plug 'tpope/vim-commentary'
        Plug 'ntpeters/vim-better-whitespace'
        Plug 'jiangmiao/auto-pairs'
            let g:AutoPairsMapBS=0  " ignore auto delete pair
        Plug 'Yggdroot/indentLine'
        Plug 'vim-airline/vim-airline'
	    let g:airline#extensions#tabline#enabled = 1
        Plug 'vim-airline/vim-airline-themes'
	    let g:airline#extensions#tabline#formatter = 'unique_tail'
	    let g:airline_theme='base16_gruvbox_dark_hard'
        " alt-mapping only work on windows terminal.
        " Plug 'vim-utils/vim-alt-mappings'
        Plug 'ojroques/vim-oscyank'
    " }

    " Tracing and Debug {
        Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' } " {
            nmap <F8> :TagbarToggle<CR>
            "auto move cursor to tagbar window.
            let g:tagbar_autofocus = 1
        " }
        Plug 'charz/multi-cscope-db'
        Plug 'chrisbra/vim-autoread'
    " }

    " Copy and paste {
        " Copy remote clipboard to local's.
        Plug 'ojroques/vim-oscyank'
    " }

    " Search {
        Plug '~/.fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'
	    let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }
        Plug 'mileszs/ack.vim' "{
            nnoremap <Leader>a :Ack!<Space>
            if executable('rg')
                let g:ackprg = 'rg --vimgrep'
            elseif executable('ag')
                let g:ackprg = 'ag --vimgrep'
            endif
        "}
    " }
    "
    " C/C++ {
        Plug 'octol/vim-cpp-enhanced-highlight'
    " }
" }

" Environment {
    " End {
        call plug#end()		" required
    " }
" }
silent! colorscheme gruvbox
