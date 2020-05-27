""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " Functions For Statuslines " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Vim Signify Hunks Support
function! StatuslineSignify()
let [added, modified, removed] = sy#repo#get_stats()
let l:sy = ''
for [flag, flagcount] in [
	\   [exists("g:signify_sign_add")?g:signify_sign_add:'+', added],
	\   [exists("g:signify_sign_delete")?g:signify_sign_delete:'-', removed],
	\   [exists("g:signify_sign_change")?g:signify_sign_change:'!', modified]
	\ ]
	if flagcount> 0
		let l:sy .= printf('%s%d', flag, flagcount)
	endif
endfor
if !empty(l:sy)
	let l:sy = printf('[%s]', l:sy)
	let l:sy_vcs = get(b:sy, 'updated_by', '???')
	return printf('%s%s', l:sy_vcs, l:sy)
else
	return ''
endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Vim Fugitive Powerline Symbol
function! StatuslineFugitive()
    if exists('*FugitiveHead')
        let branch = FugitiveHead()
        return branch !=# '' ? '  '.branch : ''
    endif
    return ''
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Read Only Powerline Symbol
function! StatuslineReadonly()
    return &readonly ? '' : ''
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" VIM DEVICONS SUPPORT

""" Filetype Symbol
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

" """ File Format(Unix) Symbol
" function! MyFileformat()
"   return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
" endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Bufferline Configuration
" function! LightlineBufferline()
"   call bufferline#refresh_status()
"   return [ g:bufferline_status_info.before, g:bufferline_status_info.current . WebDevIconsGetFileTypeSymbol(), g:bufferline_status_info.after]
" endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " END " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
