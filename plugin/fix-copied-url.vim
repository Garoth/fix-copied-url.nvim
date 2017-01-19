" fix-copied-url: Removes spaces from copied URLs
" Last Change: 18-Jan-2017
" Maintainer : Andrei Thorp
" License    : MIT

if exists("g:loaded_fix_copied_url")
  finish
endif
let g:loaded_fix_copied_url = 1

ruby << EOF
  def fix_url
    re = %r{(?i)\b((?:[a-z][\w-]+:(?:/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\((?:[^\s()<>]+|(?:\([^\s()<>]+\)))*\))+(?:\((?:[^\s()<>]+|(?:\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))}
    contentString = VIM::evaluate("g:yanked_content_string_for_urls").gsub(/\s*/, "")
    urls = contentString.scan(re).flatten
    if urls.empty?
        VIM::command("let g:yanked_content_was_url = 0")
        return false
    else
        VIM::command("let g:yanked_content_was_url = 1")
        VIM::command("let g:yanked_content_string_for_urls = '" + contentString + "'")
        return true
    end
  end
EOF

function! s:fixcopied()
    let g:yanked_content_string_for_urls = join(v:event["regcontents"], "")
    ruby fix_url
    if g:yanked_content_was_url == 1
        echom "fix-copied-url fixed yank ->" . g:yanked_content_string_for_urls
        let targetreg = v:event["regname"]
        if targetreg == ""
            let targetreg = "*"
        endif
        let evalstring = "let @" . targetreg . " = '" . g:yanked_content_string_for_urls . "'"
        execute evalstring
    endif
endfunction

autocmd TextYankPost * call s:fixcopied()
