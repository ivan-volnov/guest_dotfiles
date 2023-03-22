# dotfiles

My configuration files for guest machines

## Installation

Change the shell:

```bash
chsh -s zsh
```

Install the dotfiles

```bash
mkdir -p "$HOME/.config/zsh"
mkdir -p "$HOME/.config/nvim/"
mkdir -p "$HOME/.local/share/nvim/site/autoload/"
git clone https://github.com/ivan-volnov/pure.git "$HOME/.config/zsh/pure"
fetch "https://raw.githubusercontent.com/ivan-volnov/guest_dotfiles/master/zshrc" -o "$HOME/.zshrc"
fetch "https://raw.githubusercontent.com/ivan-volnov/guest_dotfiles/master/init.vim" -o "$HOME/.config/nvim/init.vim"
fetch "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" -o "$HOME/.local/share/nvim/site/autoload/plug.vim"
```

After terminal restart:

```bash
vim +'PlugInstall --sync' +qa
```
