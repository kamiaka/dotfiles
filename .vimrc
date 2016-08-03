
"---------------------------
" Setting 
"---------------------------

"新しい行のインデントを現在行と同じにする
set autoindent

"クリップボードをWindowsと連携
set clipboard=unnamed,autoselect

"タブの代わりに空白文字を挿入する
set expandtab

"ファイル内の <Tab> が対応する空白の数
set tabstop=2

" 連続した空白に対してカーソルが動く幅
set softtabstop=2

"シフト移動幅(自動インデントでずれる幅
set shiftwidth=2

"変更中のファイルでも、保存しないで他のファイルを表示
set hidden

"インクリメンタルサーチを行う
set incsearch

"タブ文字、行末など不可視文字を表示する
set list

"listで表示される文字のフォーマットを指定する
set listchars=tab:>\ ,extends:<

"行番号を表示する
set number

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

"新しい行を作ったときに高度な自動インデントを行う
set smartindent

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab

"---------------------------
" Start Neobundle Settings.
"---------------------------

set runtimepath^=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle/'))

" Neobundle自体を自分で管理
NeoBundleFetch 'Shougo/neobundle.vim'

" Install EditorConfig
NeoBundle 'editorconfig/editorconfig-vim'

call neobundle#end()


"---------------------------
" 
"---------------------------

" ハイライト
syntax on

