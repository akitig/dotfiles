export PATH="/Users/akunimot/Library/Python/3.9/bin":$PATH

alias ccwf='cc -Wall -Werror -Wextra -fsanitize=address'
alias ccw='cc -Wall -Werror -Wextra'
alias vim='~/nvim-macos-x86_64/bin/nvim'

# git ブランチ名を色付きで表示させるメソッド
# git
autoload -U colors; colors
function rprompt-git-current-branch {
  local branch_name st branch_status

  branch='🌵'
  color='%{\e[38;5;' # 文字色を設定
  green='114m%}'
  red='001m%}'
  yellow='227m%}'
  blue='033m%}'
  reset='%{\e[0m%}'   # reset

  local git_dir=$(git rev-parse --git-dir 2> /dev/null)
  if [ -z "$git_dir" ]; then
    # git 管理されていないディレクトリは何も返さない
    return
  fi

  branch_name=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  st=$(git status 2> /dev/null)

  if [[ -n $(echo "$st" | grep "^nothing to") ]]; then
    # 全て commit されてクリーンな状態
    branch_status="${color}${green}${branch}"
  elif [[ -n $(echo "$st" | grep "^Untracked files") ]]; then
    # git 管理されていないファイルがある状態
    branch_status="${color}${red}${branch}?"
  elif [[ -n $(echo "$st" | grep "^Changes not staged for commit") ]]; then
    # git add されていないファイルがある状態
    branch_status="${color}${red}${branch}+"
  elif [[ -n $(echo "$st" | grep "^Changes to be committed") ]]; then
    # git commit されていないファイルがある状態
    branch_status="${color}${yellow}${branch}!"
  elif [[ -n $(echo "$st" | grep "^rebase in progress") ]]; then
    # コンフリクトが起こった状態
    echo "${color}${red}${branch}!(no branch)${reset}"
    return
  else
    # 上記以外の状態の場合
    branch_status="${color}${blue}${branch}"
  fi

  # ブランチ名を色付きで表示する
  echo "${branch_status}${branch_name}${reset}"
}


# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst
 
# プロンプトの右側にメソッドの結果を表示させる
RPROMPT='$(git config user.name) `rprompt-git-current-branch`'

PROMPT="💣 %2~%{$reset_color%} %(?:%{$fg[green]%}> %{$reset_color%}:%{$fg[red]%}> %{$reset_color%})"

# プロンプトカスタマイズ
# PROMPT='
# [%B%F{red}%n@%m%f%b:%F{green}%~%f]%F{cyan}$vcs_info_msg_0_%f
# %F{yellow}$%f v'
# PROMPT="🔹 %2~%{$reset_color%} %(?:%{$fg[green]%}> %{$reset_color%}:%{$fg[red]%}> %{$reset_color%})"
# RPROMPT='$(git_prompt_info)'

# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}git:(%{$fg[red]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
