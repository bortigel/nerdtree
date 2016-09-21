"CLASS: Multihead
"Communication between MH client & server
"============================================================
let NERDTreeMH = {}

function! NERDTreeMH.new( multihead_client )
    let nerdtreemh = copy( s:Multihead )
    let nerdtreemh.multihead_client = a:multihead_client

    return nerdtreemh
endfunction

call g:Multihead.install_plugin('NERDTreeMH')

let s:Multihead = {}
" let g:NERDTreeMultihead = s:Multihead

function! s:Multihead.connect( server_name )
    call self.multihead_client.connect( a:server_name )
    call self.init()
    call b:NERDTree.render()
endfunction

function! s:Multihead.init()
    let self.creator = g:NERDTreeCreator.New()
    let path = self.creator._pathForString('')

    call self.creator._createNERDTree(path, "tab")
    call self.creator._setCommonBufOptions()
    call self.set_mh_options()
    call feedkeys("<CR>")
endfunction

function! s:Multihead.set_mh_options()
    set cmdheight=2
    set showtabline=0
    set noruler
endfunction
