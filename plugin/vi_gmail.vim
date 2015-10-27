if exists('g:loaded_vi_gmail')
  finish
else
  let g:loaded_vi_gmail = 1
endif

" FIXME: Replace with actual binary path.
let s:bin_path = $HOME . '/projects/vi_gmail/bin/'
let s:drb_client = s:bin_path . 'drb_client '

function! s:OpenBuffer(file_path)
  if &buflisted
    let edit_command = 'tabedit'
  else
    let edit_command = 'edit'
  endif

  execute edit_command . ' ' . a:file_path
endfunction

function! s:SetInboxFlags()
  setlocal filetype=vi_gmail_inbox
  setlocal nomodifiable
endfunction

function! s:Begin(email)
  let file_path = system(s:drb_client . 'setup_inbox' . ' ' . a:email)
  call <SID>OpenBuffer(file_path)
  call <SID>SetInboxFlags()
endfunction

command! -nargs=1 ViGmail call <SID>Begin(<f-args>)
