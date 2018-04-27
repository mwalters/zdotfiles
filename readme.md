# Dotfiles

Still a bit early on for this, haven't tried it on many systems yet. Here are some notes though.

* `./zshrc.symlink` needs to be symlinked to `~/.zshrc`
* Any file with a `.zsh` suffix will be sourced for your shell session.
* It might be dependent on being installed to `~/.zdotfiles/`, I would need to look through things a bit more to be sure and remove this possible dependency.
* If there is a `~/.localrc` file then that will be sourced as well.  This can be used for environment variables / secrets.

## License
See `LICENSE` file for license information.
