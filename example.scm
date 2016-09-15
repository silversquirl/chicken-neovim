(use (prefix neovim vim:))

(let ((conn (vim:connect path: "/tmp/nvim")))
  (vim:command conn "echo \"Hello, world!\"")
  
  (vim:call conn "HelloWorld")

  (vim:feedkeys conn "30iFoo")
  (vim:command conn "call feedkeys(\"\\<CR>\\<esc>\")")
  
  (vim:command conn "let g:hello_world = \"Hai\"")
  (print (vim:eval conn "g:hello_world")))

