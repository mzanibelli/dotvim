" Plugin
if exists('g:loaded_local_plugin_nop')
    finish
endif
let g:loaded_local_plugin_nop = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <Left>    <NOP>
nnoremap <Right>   <NOP>
nnoremap <Up>      <NOP>
nnoremap <Down>    <NOP>
vnoremap <Left>    <NOP>
vnoremap <Right>   <NOP>
vnoremap <Up>      <NOP>
vnoremap <Down>    <NOP>
inoremap <Up>      <NOP>
inoremap <Down>    <NOP>
inoremap <Left>    <NOP>
inoremap <Right>   <NOP>
inoremap <C-Up>    <NOP>
inoremap <C-Down>  <NOP>
inoremap <C-Left>  <NOP>
inoremap <C-Right> <NOP>
inoremap <S-Up>    <NOP>
inoremap <S-Down>  <NOP>
inoremap <S-Left>  <NOP>
inoremap <S-Right> <NOP>
nnoremap <S-Left>  <NOP>
nnoremap <S-Right> <NOP>
nnoremap <S-Up>    <NOP>
nnoremap <S-Down>  <NOP>
nnoremap <C-Up>    <NOP>
nnoremap <C-Down>  <NOP>
nnoremap <C-Left>  <NOP>
nnoremap <C-Right> <NOP>
vnoremap <S-Left>  <NOP>
vnoremap <S-Right> <NOP>
vnoremap <S-Up>    <NOP>
vnoremap <S-Down>  <NOP>
vnoremap <C-Up>    <NOP>
vnoremap <C-Down>  <NOP>
vnoremap <C-Left>  <NOP>
vnoremap <C-Right> <NOP>
nnoremap <C-]>     <NOP>
nnoremap <C-T>     <NOP>
nnoremap gh        <NOP>
nnoremap gH        <NOP>
nnoremap g<C-H>    <NOP>
vnoremap <C-G>     <NOP>
" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
