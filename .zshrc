export PATH="$HOME/.rbenv/bin:$PATH"
export ANDROID_SDK=/Users/koji/Library/Android/sdk
export PATH=/Users/koji/Library/Android/sdk/platform-tools:$PATH
export EDITOR="vi"
export PATH="$PATH:$HOME/.fzf/bin"
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 30% --border'
export PATH=$HOME/.local/bin:$PATH
export PATH="$PATH:/Users/koji/Developer/flutter/bin"
export PATH=$PATH:/Users/koji/Library/Android/sdk/platform-tools
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(rbenv init - zsh)"
# --------------------------------------------------
#  カレントディレクトリ表示（左）
# --------------------------------------------------

PROMPT='
%F{green}%(5~,%-1~/.../%2~,%~)%f
%F{green}%B●%b%f'

# --------------------------------------------------
#  git branch状態を表示（右）
# --------------------------------------------------

autoload -Uz vcs_info
setopt prompt_subst

# trueで作業ブランチの状態に応じて表示を変える
zstyle ':vcs_info:*' check-for-changes true
# addしてない場合の表示
zstyle ':vcs_info:*' unstagedstr "%F{red}%B＋%b%f"
# commitしてない場合の表示
zstyle ':vcs_info:*' stagedstr "%F{yellow}★ %f"
# デフォルトの状態の表示
zstyle ':vcs_info:*' formats "%u%c%F{green}【 %b 】%f"
# コンフリクトが起きたり特別な状態になるとformatsの代わりに表示
zstyle ':vcs_info:*' actionformats '【%b | %a】'

precmd () { vcs_info }

RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

# --------------------------------------------------
#  gitコマンド補完機能セット
# --------------------------------------------------

# autoloadの文より前に記述
fpath=(~/.zsh/completion $fpath)

# --------------------------------------------------
#  コマンド入力補完
# --------------------------------------------------

# 補完機能有効にする
autoload -U compinit
compinit -u

# 補完候補に色つける
autoload -U colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

# 単語の入力途中でもTab補完を有効化
setopt complete_in_word

# 補完候補をハイライト
zstyle ':completion:*:default' menu select=1
# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true
# 大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完リストの表示間隔を狭くする
setopt list_packed

# コマンドの打ち間違いを指摘してくれる
setopt correct
SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] => "

# --------------------------------------------------
#  $ cd 機能拡張
# --------------------------------------------------

# cdを使わずにディレクトリを移動できる
setopt auto_cd

# --------------------------------------------------
#  git エイリアス
# --------------------------------------------------

alias g="git"
alias gs='git status'
alias ga='git add -A'
alias gap='git add -p'
alias gc='git commit -m'
alias gps='git push -u origin HEAD'
alias gpsu='git push -u origin'
alias gpsf='git push -f origin'
alias gp='git pull origin'
alias gpm='git pull origin master'
alias gf='git fetch'
alias gfp='git fetch -p'
# logを見やすく
alias gl='git log --abbrev-commit --no-merges --date=short --date=iso'
alias gd='git diff'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gb='git branch'
alias gba='git branch -a'
alias gbr='git branch -r'
alias gm='git merge'
alias gr='git reset'
alias grf='git reflog'
alias grh='git reset --hard'
alias gbd='git branch -d'

# --------------------------------------------------
#  bundleのエイリアス
# --------------------------------------------------

alias be='bundle exec'
alias ber='bundle exec rake'
alias berr='bundle exec rake routes'
alias berdc='bundle exec rake db:create'
alias berdm='bundle exec rake db:migrate'
alias bi='bundle install'
alias becsd='bundle exec cap staging deploy'
alias becsc='bundle exec cap staging rails:c'
alias becpc='bundle exec cap production rails:c'
alias bers='bundle exec rails s'
alias becpd='bundle exec cap production deploy'
alias bercre='bundle exec rails credentials:edit'
alias brsp='bin/rspec'
alias berubogen='bundle exec rubocop --auto-gen-config --exclude-limit=99999 --no-offense-counts --no-auto-gen-timestamp'
alias beruboa='bundle exec rubocop -a'
alias berubo='bundle exec rubocop'

# --------------------------------------------------
#  pythonのエイリアス
# --------------------------------------------------

alias py='python3'

# --------------------------------------------------
#  コマンドラインのエイリアス
# --------------------------------------------------

alias v='vim'
alias vz='vim ~/.zshrc'
alias vj='vim ~/japanpoint'
alias vw='vim ~/wt'
alias vv='vim ~/.vimrc'
alias vd='vim ~/.dein/dein.toml'
alias vdl='vim ~/.dein/dein-lazy.toml'
alias vm='vim ~/marketplace'
alias va='vim ~/app_ranking_app'
alias vk='vim ~/kura-vel'
alias vp='vim ~/popai-sekine'
alias chokojizsh='sudo chown koji:staff /usr/local/share/zsh/'
alias chokojisite='sudo chown koji:staff /usr/local/share/zsh/site-functions'
alias zshkoji='sudo chown koji /usr/local/share/zsh/; sudo chown koji /usr/local/share/zsh/site-functions/; sudo chown koji /usr/local/share/zsh/site-functions/_aws; sudo chown koji /usr/local/share/zsh/site-functions/_brew; sudo chown koji /usr/local/share/zsh/site-functions/_brew_cask; sudo chown koji /usr/local/share/zsh/site-functions/_brew_services;'
alias zshkuraoec='sudo chown kuraoec /usr/local/share/zsh/; sudo chown kuraoec /usr/local/share/zsh/site-functions/; sudo chown kuraoec /usr/local/share/zsh/site-functions/_aws; sudo chown kuraoec /usr/local/share/zsh/site-functions/_brew; sudo chown kuraoec /usr/local/share/zsh/site-functions/_brew_cask; sudo chown kuraoec /usr/local/share/zsh/site-functions/_brew_services;'

# --------------------------------------------------
#  コマンド履歴対策
# --------------------------------------------------
setopt HIST_IGNORE_DUPS           # 前と重複する行は記録しない
setopt HIST_IGNORE_ALL_DUPS       # 履歴中の重複行をファイル記録前に無くす
setopt HIST_IGNORE_SPACE          # 行頭がスペースのコマンドは記録しない
setopt HIST_FIND_NO_DUPS          # 履歴検索中、(連続してなくとも)重複を飛ばす
setopt HIST_REDUCE_BLANKS         # 余分な空白は詰めて記録
setopt HIST_NO_STORE              # histroyコマンドは記録しない

# --------------------------------------------------
#  自動補完をイクリメンタルサーチ化
# --------------------------------------------------

autoload -U compinit
zle -N self-insert self-insert-incr
zle -N vi-cmd-mode-incr
zle -N vi-backward-delete-char-incr
zle -N backward-delete-char-incr
zle -N expand-or-complete-prefix-incr
compinit

bindkey -M viins '^[' vi-cmd-mode-incr
bindkey -M viins '^h' vi-backward-delete-char-incr
bindkey -M viins '^?' vi-backward-delete-char-incr
bindkey -M viins '^i' expand-or-complete-prefix-incr
bindkey -M emacs '^h' backward-delete-char-incr
bindkey -M emacs '^?' backward-delete-char-incr
bindkey -M emacs '^i' expand-or-complete-prefix-incr

unsetopt automenu
# compdef -d scp
# compdef -d tar
# compdef -d make
# compdef -d java
# compdef -d svn
# compdef -d cvs

now_predict=0

function limit-completion
{
	if ((compstate[nmatches] <= 1)); then
		zle -M ""
	elif ((compstate[list_lines] > 6)); then
		compstate[list]=""
		zle -M "too many matches."
	fi
}

function correct-prediction
{
	if ((now_predict == 1)); then
		if [[ "$BUFFER" != "$buffer_prd" ]] || ((CURSOR != cursor_org)); then
			now_predict=0
		fi
	fi
}

function remove-prediction
{
	if ((now_predict == 1)); then
		BUFFER="$buffer_org"
		now_predict=0
	fi
}

function show-prediction
{
	# assert(now_predict == 0)
	if
		((PENDING == 0)) &&
		((CURSOR > 1)) &&
		[[ "$PREBUFFER" == "" ]] &&
		[[ "$BUFFER[CURSOR]" != " " ]]
	then
		cursor_org="$CURSOR"
		buffer_org="$BUFFER"
		comppostfuncs=(limit-completion)
		zle complete-word
		cursor_prd="$CURSOR"
		buffer_prd="$BUFFER"
		if [[ "$buffer_org[1,cursor_org]" == "$buffer_prd[1,cursor_org]" ]]; then
			CURSOR="$cursor_org"
			if [[ "$buffer_org" != "$buffer_prd" ]] || ((cursor_org != cursor_prd)); then
				now_predict=1
			fi
		else
			BUFFER="$buffer_org"
			CURSOR="$cursor_org"
		fi
		echo -n "\e[32m"
	else
		zle -M ""
	fi
}

function preexec
{
	echo -n "\e[39m"
}

function vi-cmd-mode-incr
{
	correct-prediction
	remove-prediction
	zle vi-cmd-mode
}

function self-insert-incr
{
	correct-prediction
	remove-prediction
	if zle .self-insert; then
		show-prediction
	fi
}

function vi-backward-delete-char-incr
{
	correct-prediction
	remove-prediction
	if zle vi-backward-delete-char; then
		show-prediction
	fi
}

function backward-delete-char-incr
{
	correct-prediction
	remove-prediction
	if zle backward-delete-char; then
		show-prediction
	fi
}

function expand-or-complete-prefix-incr
{
	correct-prediction
	if ((now_predict == 1)); then
		CURSOR="$cursor_prd"
		now_predict=0
		comppostfuncs=(limit-completion)
		zle list-choices
	else
		remove-prediction
		zle expand-or-complete-prefix
	fi
}
export PATH=$PATH:/Users/koji/.nodebrew/current/bin
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH=/Users/koji/.nodebrew/current/bin:/Users/koji/.nodebrew/current/bin:/usr/local/opt/mysql@5.7/bin:/Users/koji/.rbenv/shims:/Users/koji/.local/bin:/Users/koji/Library/Android/sdk/platform-tools:/Users/koji/.rbenv/bin:/Library/Frameworks/Python.framework/Versions/3.8/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/opt/X11/bin:/Library/Apple/usr/bin:/Users/koji/.fzf/bin:/Users/koji/Developer/flutter/bin:/Users/koji/.nodebrew/current/bin
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
