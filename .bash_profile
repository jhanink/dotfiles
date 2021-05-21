_pwd=`pwd`

export EDITOR='vim'


export PL_APP_DIR=~/projects/pl/edu-clients
export PL_FOUNDRY_DIR=~/projects/pl/foundry
export YAML_FILE=bsd.yaml
export PL_ENV=pldev
export PL_ENV=env16

export PL_TEST_RECORD_VIDEO=0

#export YAML_FILE=basic-seed-data-v4.yaml
#export YAML_FILE=mult-org-cam.yaml

#export PL_ENV=ipadsafari
#export PL_ENV=ipaddev

function showenv() {
  echo
  echo "=================================="
  echo  $PL_ENV
  echo  $AUTH_URL
  echo "=================================="
  echo
}

function setenv() {
  export APPS_URL=https://$PL_ENV-apps.presencek8s.com
  export AUTH_URL=https://$PL_ENV-login.presencek8s.com
  export APIWORKPLACE_URL=https://$PL_ENV-workplace.presencek8s.com
  export APOLLO_URL=https://$PL_ENV-workplace.presencek8s.com/graphql/v1/
  export PLATFORM_URL=https://$PL_ENV-platform.presencek8s.com

  export PL_APPS=$APPS_URL
  export PL_LOGIN=$AUTH_URL
  export PL_WORKPLACE=$APIWORKPLACE_URL
  export PL_PLATFORM=$PLATFORM_URL

  #woody (pl-core)
  export PL_APPS_URL=$APPS_URL
  export PL_LOGIN_URL=$AUTH_URL
  export PL_WORKPLACE_URL=$APIWORKPLACE_URL
  export PL_PLATFORM_URL=$PLATFORM_URL

  export PL_HOST=presencek8s.com
  export PL_USERNAME=qauser
  export PL_PASSWORD=qauser123

#  export PL_HOST=presencestag.com
#  export PL_USERNAME=qauser
#  export PL_PASSWORD=')$#=m$^Epa%b:7AWu$fg'

  showenv
}

setenv


export PL_CYPRESS_DIR=$PL_APP_DIR/cypress
export PL_CYPRESS_SCRIPTS_DIR=$PL_APP_DIR/cypress-scripts

export CYPRESS_numTestsKeptInMemory=500
export CYPRESS_videoRecording=false


HISTCONTROL=ignorespace

export PL_PROJECTS_DIR=~/projects/pl
export PL_PROJECTS2_DIR=~/projects/pl2

#------- Aliases ----------
alias cypress='npx cypress'
alias showlinks='ll node_modules | grep ^l && ll node_modules | grep ^l | wc -l'

alias foundry='python foundry.py run';
alias foundrybasic='cdeduclients; npm run cy-seed'
alias tailfoundry='clear; tail -f ~/projects/pl/foundry/.output--$YAML_FILE'

alias ll='ls -alGp'
alias eb='vim ~/.bash_profile && source ~/.bash_profile'
alias ebb='source ~/.bash_profile'
alias ev='vim ~/.vimrc'
alias et='vim ~/.tmux.conf'
alias stmux='tmux source ~/.tmux.conf'


alias cdgt='cd $PL_PROJECTS_DIR/gt'
alias cdpl='cd $PL_PROJECTS_DIR'
alias cdpl2='cd $PL_PROJECTS2_DIR'
alias cdeduclients='cdpl && cd edu-clients && clear'
alias cdec2='cdpl2 && cd edu-clients && clear'
alias cd1='cdeduclients'
alias cd2='cdec2'
alias cdwoody='cdpl && cd woody && clear'
alias cdroom='cdpl && cd room && clear'
alias cdfoundry='cd ~/projects/pl/foundry'
alias cdcypressscripts='cd ~/projects/pl/edu-clients/cypress-scripts'
alias cdcompslib='cdpl && cd pl-components-ng2/src/lib && clear'
alias cdrn='cdpl && cd nativedev'
alias adminlogin='open https://${PL_ENV}.login.presencestag.com/admin/user/user'
alias adminworkplace='open https://${PL_ENV}.workplace.presencestag.com/admin'

alias gitt='clear && git branch && git status'
alias gitlog='clear && git branch && git log --oneline'
alias gitlogstat='git log --stat'
alias gitlogname='git log --name-only'
alias gitlogdiff='git log -p'
alias gitlogshort='git log --pretty=format:"%h%x09%an%x09%ad%x09%s"'
alias ggitt='find . -follow -maxdepth 1 -mindepth 1 -type d -exec sh -c "(echo {} && cd {} && git status -s && echo)" \;'
alias gittr='git fetch --prune origin && git branch -a'
alias gittags='git fetch && git show-ref --tags | grep "\/Live-Activation" | sort -k2 -r'
alias gitreflog='git log -g --abbrev-commit --pretty=oneline'
alias gitusers='git shortlog -sne'
alias gitbranchcontains='git branch --contains $1'
alias gitmergepath='git log --graph --oneline --no-abbrev-commit | grep "Merge branch '.*' into" | sed 's/^[^a-z0-9]*[a-z0-9]//g''
alias SHA='git log | head -1 | cut -c 8- '
alias gcm='git commit -am $@'

alias grepa='grep -in -m 1 -A 20 $1 $2'
alias grepb='grep -in -m 1 -B 20 $1 $2'
alias greps='grep -in -m 1 -A 20 -B 20 $1 $2'
alias g='grep'

alias jsonpp='cat $1 | python -m json.tool'
alias ngrok='~/joe/install/ngrok'
alias pip='.venv/bin/pip3'
alias cyhg='/Applications/Cypress.app/Contents/MacOS/Cypress --project ${_pwd} --show-headless-gui'

alias ecwatch='cdcompslib && pwd && fswatch -0 . | while read -d "" f; do echo $f; rsync -a . ~/projects/pl/edu-clients/src/lib-components; done'

alias plshowversiondrift='plversiondrift | column -t'

alias wwebserver='python3 -m http.server'
alias roominstall='nvm use v10.24.0 && npm i && nvm use v16.0.0'

#-----------------------------------


##############################################################
#                     FUNCTIONS
##############################################################

function plversiondrift() {
  MODULES=('pl-core' 'pl-apis' 'pl-buttons' 'pl-inputs' 'pl-models' 'pl-modules' 'pl-navs' 'pl-overlays' 'pl-records' 'pl-table')
  for i in "${MODULES[@]}"
  do :
  # echo $(git ls-remote --tags https://github.com/presencelearning/${i}.git | grep -v '\^' | cut -d'/' -f3 | sed 's/^v//' | sort -t"." -k1,1n -k2,2n -k3,3n | tail -1 )$'\t'$i
  # cat package.json | grep $i | cut -d'#' -f2 | sed 's/^v//' | sed 's/"$//' | sed 's/",$//'
  VERSION_REMOTE=$(git ls-remote --tags https://github.com/presencelearning/${i}.git | grep -v '\^' | cut -d'/' -f3 | sed 's/^v//' | sort -t"." -k1,1n -k2,2n -k3,3n | tail -1 )
  VERSION_LOCAL=$(cat package.json | grep $i | cut -d'#' -f2 | sed 's/^v//' | sed 's/"$//' | sed 's/",$//')
  if [ $VERSION_LOCAL ]
  then
    if [ "$VERSION_REMOTE" == "$VERSION_LOCAL" ]
    then echo -e "$i OK $VERSION_LOCAL"
    else echo -e "$i DRIFT $VERSION_LOCAL $VERSION_REMOTE"
    fi
  fi
  done
}

function roomstart() {
#  export PL_ENV=ipadsafari
  setenv
  clear
  showenv
  npm run ipad-dev
}

function ecstart() {
  setenv
  clear
  showenv
  npm start
}

function woodystart() {
  setenv
  clear
  showenv
  grunt serve
}

function _ecstart() {
  #echo "cdeduclients; git checkout config/env/local.js" | at now + 1 minute
  clear;
  #ecenv "$1";
  npm run copy-repos
  #sudo env "PATH=$PATH" ng serve --host=0.0.0.0 --disable-host-check --port=3010 --environment=joe --deploy-url=/c;
  npm start
}

function eclivedev() {
  echo "cdeduclients; git checkout config/env/local.js" | at now+120
  cp config/env/livedev.js src/app/env-config.js;
  clear;
  echo "===== starting LIVE DEV server ====="
  npm run copy-repos
  npm start
}

function gittt {
  clear
  _originalDir=`pwd`
  cd ~/projects/pl;
  _projectDir=`pwd`
  projects=('woody' 'hamm' 'lightyear' 'toychest' 'pl-apis')
  for i in "${projects[@]}"
  do
    cd $i
    printf "%-11s" $i | tr '[:lower:]' '[:upper:]'
    echo ""
    git branch
    git status | grep -v "^On branch"
    cd $_projectDir
  done
  cd $_originalDir
}

export PYTHON_CONFIGURE_OPTS="--enable-framework"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

alias python='python3'
alias pip='/usr/bin/python3 -m pip'


function vapi() {
  cdapi;
  . .venv/wp/bin/activate;
  alias pip='/Users/jhanink/projects/pl/api-workplace/.venv/wp/bin/pip3'
}



function ggitgrepall() {
git grep "$@" $(git rev-list --all)
}



#------ END / PL stuff ------

##############################################
#                  OLD STUFF
##############################################
function ecshowenv() {
  echo "---------------------------------" && cat config/env/local.js | grep apiWorkplace -A 1 | tail -1 | tr -d "[:space:]" | cut -c 44- | rev | cut -c 3- | rev && echo "---------------------------------";
}

function fbget() {
  firebase data:get $1 -f learning-test | prettyjson --inline-arrays=1
}
function fbgetplain() {
  firebase data:get $1 -f learning-test
}
function fbset() {
  firebase data:set $1 $2 -f learning-test -y
}

#alias startjenkins='sudo launchctl load /Library/LaunchDaemons/org.jenkins-ci.plist'
#alias stopjenkins='sudo launchctl unload /Library/LaunchDaemons/org.jenkins-ci.plist'


#############################################
#                     GS
#############################################

export SK_PROJECTS_DIR=~/projects/sk
alias cdsk='cd $SK_PROJECTS_DIR'
alias cdoo='cd $SK_PROJECTS_DIR/online-office-vue && clear'
alias llintprettier='cdoo && yarn lint && yarn dev:prettier'
alias oostart='cdoo; yarn serve'




####################################################
#                      THE REST 
####################################################

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="→ \W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

# export MYSQL_PATH=/usr/local/Cellar/mysql/5.6.27
# export PATH=$PATH:$MYSQL_PATH/bin

# say -v Serena < /tmp/hal.txt -o /tmp/hal_serena6.aiff && lame -m m /tmp/hal_serena6.aiff /tmp/hal_serena6.mp3



# PATH=/usr/local/Cellar/vim/8.0.0600/bin:$PATH;

# Setting PATH for Python
PATH="/Users/jhanink/.pyenv/shims:/usr/local/bin:${PATH}"
export PATH

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm use stable

#npm config set package-lock false

#eval "$(pyenv init -)"
#pyenv shell 3.6.4

export BASH_SILENCE_DEPRECATION_WARNING=1


#cdeduclients


#---------------------------- END ----------------------------

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
    if type __ltrim_colon_completions &>/dev/null; then
      __ltrim_colon_completions "${words[cword]}"
    fi
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
