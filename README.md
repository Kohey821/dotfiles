# dotfiles

## セットアップ

`git clone --recursive git@github.com:Kohey821/dotfiles.git ~/dotfiles`を実行

[Nerd Font](https://www.nerdfonts.com/)をインストール

[exa](https://the.exa.website/) [fish](https://fishshell.com/) [nodejs npm](https://nodejs.org/)をインストール (Ubuntu注意)

`neovim ranger tmux trash-cli xclip`をインストール

`./make.sh`を実行 (エラー注意)

`chsh`を実行してシェルを`fish`に変更

再ログイン後`fisher update`を実行してfisherのプラグインをインストール

[tmuxinator](https://github.com/tmuxinator/tmuxinator)をインストール

[vim-plug](https://github.com/junegunn/vim-plug#installation)をインストール

[defxが依存するpynvimをインストール](https://github.com/Shougo/defx.nvim#requirements)して

```
vim \
  -c 'PlugUpgrade' \
  -c 'PlugUpdate' \
  -c 'call mkdp#util#install()' \
  -c 'UpdateRemotePlugins'
```

を実行

`~/.gitconfig`に

```
[include]
	path = ~/.common.gitconfig
```

を追記

`~/.hgrc`に

```
%include ~/.common.hgrc
```

を追記

`~/.bashrc`に

```
source ~/.common.bashrc
```

を追記
