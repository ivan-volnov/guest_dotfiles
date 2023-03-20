# dotfiles

My configuration files for guest machines

## Installation

```bash
mkdir -p "$HOME/.config/zsh"
mkdir -p "~/.config/bc/"
mkdir -p "~/.config/nvim/"
mkdir -p "~/.local/share/nvim/site/autoload/"
git clone https://github.com/ivan-volnov/pure.git "$HOME/.config/zsh/pure"
fetch "https://raw.githubusercontent.com/ivan-volnov/dotfiles/master/zshrc?token=GHSAT0AAAAAAB36STLO3CE3HHRMN5PE3FKGZAYT3PA" -o ~/.zshrc
fetch "https://raw.githubusercontent.com/ivan-volnov/dotfiles/master/bcrc?token=GHSAT0AAAAAAB36STLP25D3ICBNUQVJYXKWZAYT25A" -o ~/.config/bc/config
fetch "https://raw.githubusercontent.com/ivan-volnov/dotfiles/master/init.vim?token=GHSAT0AAAAAAB36STLO4MYPUWCCLZ2GPDRSZAYT4WQ" -o ~/.config/nvim/init.vim
fetch "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" -o ~/.local/share/nvim/site/autoload/plug.vim
```

After terminal restart:

```bash
vim +'PlugInstall --sync' +qa
```
