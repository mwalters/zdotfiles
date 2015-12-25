# Dotfiles

Still a bit early on for this, haven't tried it on many systems yet. Here are some notes though.

* `./zshrc.symlink` needs to be symlinked to `~/.zshrc`
* Any file with a `.zsh` suffix will be sourced for your shell session.
* It might be dependent on being installed to `~/.zdotfiles/`, I would need to look through things a bit more to be sure and remove this possible dependency.
* If there is a `~/.localrc` file then that will be sourced as well.  This can be used for environment variables / secrets.

This is currently in use on an Ubuntu system with a zsh shell.  Some things will rely on Ubuntu/linux and some things will rely on zsh.  I would like to eventually make it more aware of its environment so I can use it on other machines.

## License
See `LICENSE` file for license information.
