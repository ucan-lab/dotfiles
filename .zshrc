# zsh
## no match found 対策
setopt +o nomatch

## 重複を記録しない
setopt hist_ignore_dups

## 履歴の共有
setopt share_history

# コマンド履歴
## 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

## メモリに保存される履歴の件数
export HISTSIZE=1000

## 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# エイリアス
alias ..='cd ..'
alias mkdir='mkdir -p'
alias relogin='exec $SHELL -l'
alias dc='docker compose'
alias md='vim ./*.md'
alias f='open .'
alias lg='lazygit'

## ツール置き換え
alias cat='bat -p'
alias ls='eza --time-style=long-iso -g'
alias ll='eza --time-style=long-iso -hgl --git'
alias la='eza --time-style=long-iso -ahgl --git'
alias l1='eza -1'
alias tree='eza -T --git-ignore'
alias diff='delta'
alias rm='trash-put'

## マージ済みローカルブランチの削除
alias git-delete-merged-local-branch="git branch --merged|xargs git branch -d"

# 関数
## Finderで開いているディレクトリへ移動
cdf() {
  target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
  if [ "$target" != "" ]; then
    cd "$target"; pwd
  else
    echo 'No Finder window found' >&2
  fi
}

# 初期設定
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(rtx activate zsh)"

. $(brew --prefix)/opt/zsh-autocomplete/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
