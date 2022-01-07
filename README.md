# セットアップ

## 共通1

`git clone --recursive git@github.com:Kohey821/dotfiles.git ~/dotfiles`を実行

[Nerd Font](https://www.nerdfonts.com/)をインストール

## 共通2

[vim-plug](https://github.com/junegunn/vim-plug#installation)をインストール

## 共通3

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

## Linux (Arch推奨)

[共通1](#共通1)を行う

[exa](https://the.exa.website/) [fish](https://fishshell.com/) [nodejs npm](https://nodejs.org/)をインストール (Ubuntu注意)

`neovim ranger tmux trash-cli xclip`をインストール

`./make-linux.sh`を実行 (エラー注意)

`chsh`を実行してシェルを`fish`に変更

再ログイン後`fisher update`を実行してfisherのプラグインをインストール

[tmuxinator](https://github.com/tmuxinator/tmuxinator)をインストール

[共通2](#共通2)を行った後

[defxが依存するpynvimをインストール](https://github.com/Shougo/defx.nvim#requirements)して

```
vim \
  -c 'PlugUpgrade' \
  -c 'PlugUpdate' \
  -c 'call mkdp#util#install()' \
  -c 'UpdateRemotePlugins'
```

を実行

[共通3](#共通3)を行う

### 日本語

#### 入力設定

`fcitx5-mozc fcitx5-configtool fcitx5-qt fcitx5-gtk`をインストールして

`/etc/environment`に

```
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
```

を追記

#### フォント

`noto-fonts noto-fonts-cjk noto-fonts-emoji`をインストール

### デスクトップ環境

#### Gnome

##### シェル拡張

[Vitals](https://extensions.gnome.org/extension/1460/vitals/)をインストール

##### ショートカット

`dconf`で`/org/gnome/desktop/wm/keybindings/`の下記の設定を見直す

```
maximize

move-to-workspace-down
move-to-workspace-left
move-to-workspace-right
move-to-workspace-up

switch-applications
switch-applications-backward
switch-windows
switch-windows-backward
```

## Windows

[共通1](#共通1)を行う

[Node.js](https://nodejs.org/ja/)をインストール

`./make-windows.ps1`を実行

[共通2](#共通2)を行った後

```
vim \
  -c 'PlugUpgrade' \
  -c 'PlugUpdate' \
  -c 'call mkdp#util#install()'
```

を実行

[共通3](#共通3)を行う
