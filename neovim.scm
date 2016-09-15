(module neovim
    (connect
     command
     feedkeys
     call
     eval)

  (import chicken scheme)
  (use msgpack-rpc)

  (define (command conn cmd)
    (rpc-call conn "vim_command" cmd))

  (define (feedkeys conn
                    keys
                    #!optional
                    (options '())
                    (escape #t))
    (let ((optstring
           (case options
             ((m remap ()) "m")
             ((n noremap)  "n")
             ((t typed)    "t"))))

      (rpc-call conn "vim_feedkeys" keys optstring escape)))

  (define (call conn func . args)
    (rpc-call conn
              "vim_call_function"
              func
              (list->vector args)))

  (define (eval conn expr)
    (rpc-call conn "vim_eval" expr)))

