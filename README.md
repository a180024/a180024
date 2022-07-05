# My Dotfiles Configuration

## IDE setup
- Iterm2
- Tmux <br/>
 `$ brew install tmux`

## Other tools setup
- Hammerspoon
- Karabiner Elements
- OhMyZSH <br/>
  `$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- PowerLevel10K <br/>
  `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`
- FZF, fd, rg

## ZSH setup
- Syntax Highlighting <br/>
  `brew install zsh-syntax-highlighting`
  
## Copy Dotfiles
```
$ cd ~/
$ mkdir .dotfiles
$ cd .dotfiles
$ git clone https://github.com/a180024/dotfiles
$ find ~+ -type f -name ".*" -exec ln -sv {} ~ \;
$ ln -sv ~/.dotfiles/init.lua ~/.hammerspoon/init.lua
$ ln -sv ~/coc-settings.json ~/.config/coc/nvim
```



