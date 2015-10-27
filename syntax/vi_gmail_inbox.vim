set background=dark

syn clear
syn match viGmailThreadId /| \d\+$/
syn match viGmailSnippet / - [^-]\+| \d\+$/ contains=viGmailThreadId
syn match viGmailUnRead /^+.*$/ contains=viGmailSnippet
syn match viGmailRead /^[^+].*$/ contains=viGmailSnippet

hi viGmailThreadId   guifg=bg             ctermfg=233
hi viGmailSnippet    guifg=DarkYellow     ctermfg=80
hi viGmailUnRead     guifg=fg gui=bold    ctermfg=white
hi viGmailRead       guifg=DarkGray       ctermfg=249
