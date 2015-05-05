dotfiles
========

Now, the only supporting shell is `bash`. And `vimrc` is quite vanilla, i.e.
no other `vim` plugins at all.

Dependencies
------------

- base16-shell (automatically resolved)
- pyenv (optional)
- pyenv virtualenv (optional)

Files being installed
---------------------

- `bash_profile`
- `bashrc`
- `screenrc`
- `vimrc`
- `vim/`

How to install
--------------

The install script will make soft links to the rcfiles and backup your old
rcfiles automatically.

```
$ sh install.sh
```

P.S. Please add Homebrew GitHub access token manually if you're using `brew`.

