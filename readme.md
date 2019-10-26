# Dotfiles

Still a bit early on for this, haven't tried it on many systems yet. Here are some notes though.

* `./zshrc.symlink` needs to be symlinked to `~/.zshrc`
* Any file with a `.zsh` suffix will be sourced for your shell session.
* It might be dependent on being installed to `~/.zdotfiles/`, I would need to look through things a bit more to be sure and remove this possible dependency.
* If there is a `~/.localrc` file then that will be sourced as well.  This can be used for environment variables / secrets.

## License
See `LICENSE` file for license information.


## iTerm2 Utilities
* imgcat filename
  * Displays the image inline.
* imgls
  * Shows a directory listing with image thumbnails
* it2attention start|stop|fireworks
  * Gets your attention
* it2check
  * Checks if the terminal is iTerm2
* it2copy [filename]
  * Copies to the pasteboard
* it2dl filename
  * Downloads the specified file, saving it in your Downloads folder.
* it2setcolor ...
  * Changes individual color settings or loads a color preset
* it2setkeylabel ...
  * Changes Touch Bar function key labels
* it2ul
  * Uploads a file
* it2universion
  * Sets the current unicode version
