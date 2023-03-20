# dotfiles

My configuration files for guest machines

## Installation

```bash
mkdir -p "$HOME/.config/zsh"
mkdir -p "~/.config/bc/"
mkdir -p "~/.config/nvim/"
mkdir -p "~/.local/share/nvim/site/autoload/"
git clone https://github.com/ivan-volnov/pure.git "$HOME/.config/zsh/pure"
fetch "https://raw.githubusercontent.com/ivan-volnov/guest_dotfiles/master/zshrc" -o ~/.zshrc
fetch "https://raw.githubusercontent.com/ivan-volnov/bc/master/bcrc" -o ~/.config/bc/config
fetch "https://raw.githubusercontent.com/ivan-volnov/guest_dotfiles/master/init.vim" -o ~/.config/nvim/init.vim
fetch "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" -o ~/.local/share/nvim/site/autoload/plug.vim
```

After terminal restart:

```bash
vim +'PlugInstall --sync' +qa
```
