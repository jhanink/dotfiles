_pwd=`pwd`
export EDITOR='vim'


function setbase() {
  #----------------------------------------------
  export PL_ENV=env45
  export PL_HOST=presencek8s.com
  #----------------------------------------------
  export PL_APP=edu-clients
  export PL_APP_BASE_URL=https://dev.presencek8s.com:3010
  #----------------------------------------------
  export PL_SUITE=basic-smoke
  #----------------------------------------------
  export PL_PROJECTS_DIR=~/projects/pl
  #----------------------------------------------
  #-----------------------------------------------
  export COOKIE_DOMAIN=$PL_HOST
  #-----------------------------------------------
  export PL_USERNAME=qauser
  export PL_PASSWORD=qauser123
  #----------------------------------------------
}

function sette() {
  cdte
  setbase
  export PL_ENV=env45
  #----------------------------------------------
  export PL_APP=therapy-essentials
  export PL_APP_BASE_URL=https://dev.presencek8s.com:3015
  export PL_SUITE=feature
  #----------------------------------------------
  alias pwseed='npm run --prefix playwright-scripts pw-seed'
  alias pwlogin='npm run --prefix playwright-scripts pw-login'
  alias pwusers='npm run --prefix playwright-scripts pw-users'
  alias pwenv='npm run --prefix playwright-scripts pw-list-env'
  alias pwingest='npm run --prefix playwright-scripts pw-ingest'
  alias pwuser='pwfreemium'
  alias pwfreemium='jq . playwright-scripts/transient/individual-freemium-user.json'
  alias pwpremier='jq . playwright-scripts/transient/individual-premier-user.json'
  alias pwschooladmin='jq . playwright-scripts/transient/school-admin-user.json'
  #----------------------------------------------
  export HEAP_KEY=881309070
  export FULLSTORY_KEY=o-1CARV9-na1
  export FULLSTORY_KEY=o-1EFHAF-na1
  export PENDO_KEY=ee9de52a-65a3-494d-66cb-a5e0f581dc2b
  export BAA_SIGN_URL=https://secure.na3.adobesign.com/public/esignWidget?wid=CBFCIBAA3AAABLblqZhAUpnfcrIOIRJ7j5xjEyEzlkObd6J73PalR9sfQ_MEqzoAR_Xq8rCRkOq5NzuBe7FE*

  unset HEAP_KEY
  unset FULLSTORY_KEY
  unset PENDO_KEY
  export DEBUG=true
  #unset BAA_SIGN_URL
  #----------------------------------------------
  setcommon
  #----------------------------------------------
  setenv
  npm run --prefix playwright-scripts pw-list-env
}

function setec() {
  cdec
  setbase
  #----------------------------------------------
  export PL_ENV=env45
  #----------------------------------------------
  export PL_APP=edu-clients
  export PL_APP_BASE_URL=https://dev.presencek8s.com:3010
  export PL_SUITE=basic-smoke
  #----------------------------------------------
  alias pwseed='npm run pw-seed'
  alias pwlogin='npm run pw-login'
  alias pwusers='npm run pw-users'
  alias pwenv='npm run pw-list-env'
  alias pwingest='npm run pw-ingest'
  alias pwuser='pwslp'
  alias pwslp='jq . playwright-scripts/transient/provider-slp.json'
  #----------------------------------------------
  setcommon
  #----------------------------------------------
  setenv
  npm run pw-list-env
}

function setroom() {
  cd ~/projects/pl/room
  setbase
  export PL_ENV=env45
  export PL_APP_BASE_URL=https://dev.presencek8s.com:3013
  #----------------------------------------------
  export PL_APP=room
  export PL_SUITE=feature
  #----------------------------------------------
  setcommon
  #----------------------------------------------
  setenv
  alias pwseed='npm run pw-seed $@'
  alias pwtest='npx playwright test --trace on $@'
  alias pwdebug='npx playwright test --debug --trace on $@'
  alias pwheaded='npx playwright test --headed --trace on $@'
  alias pwreport='npx playwright show-report test-results/ui-tests/report'
  pwd
}

function setroom2() {
  cd ~/projects/pl2/room
  setbase
  export PL_ENV=env45
  #----------------------------------------------
  setcommon
  #----------------------------------------------
  setenv
  alias pwtest='npx playwright test --trace on $@'
  pwd
}

function setroom3() {
  cd ~/projects/pl3/room
  setbase
  export PL_ENV=env45
  #----------------------------------------------
  setcommon
  #----------------------------------------------
  setenv
  alias pwtest='npx playwright test --trace on $@'
  pwd
}

function setcommon() {
  export PL_APP_DIR=$PL_PROJECTS_DIR/$PL_APP
  export PL_FOUNDRY_DIR=$PL_PROJECTS_DIR/foundry
  export PL_PLAYWRIGHT_DIR=$PL_APP_DIR/playwright
  export PL_PLAYWRIGHT_SCRIPTS_DIR=$PL_APP_DIR/playwright-scripts
  export YAML_FILE=suite-${PL_SUITE}.yaml
}

function setenv() {
  export AUTH_URL=https://$PL_ENV-login.presencek8s.com
  export APIWORKPLACE_URL=https://$PL_ENV-workplace.presencek8s.com
  export PLATFORM_URL=https://$PL_ENV-platform.presencek8s.com
  export APOLLO_URL=https://$PL_ENV-workplace.presencek8s.com/graphql/v1/
  export ESSENTIALS_URL=https://$PL_ENV-essentials.presencek8s.com
  export KANGA_URL=$ESSENTIALS_URL
  export KANGA_API=$ESSENTIALS_URL
  export APPS_URL=$PL_APP_BASE_URL

  export PL_APPS=$APPS_URL
  export PL_LOGIN=$AUTH_URL
  export PL_WORKPLACE=$APIWORKPLACE_URL
  export PL_PLATFORM=$PLATFORM_URL
  export PL_KANGA=$ESSENTIALS_URL

  export EDUCLIENTS_URL=https://$PL_ENV-apps.presencek8s.com/c
  export THERAPY_URL=https://$PL_ENV-therapy.presencek8s.com
  export HELP_URL=https://presencelearning.helpjuice.com
  export LIBRARY_URL=https://$PL_ENV-library.presencek8s.com
  export ROOM_URL=https://$PL_ENV-room.presencek8s.com
  export LIGHTYEAR_URL=$ROOM_URL
}


#------- Aliases ----------
alias showlinks='ll node_modules | grep ^l && ll node_modules | grep ^l | wc -l'

alias foundry='python foundry.py run';
alias teformat='cdte; npm run format'
alias techeckformat='cdte; npm run format:check'

alias ll='ls -alGp'
alias eb='vim ~/.bash_profile && source ~/.bash_profile'
alias sb='source ~/.bash_profile'
alias ev='vim ~/.vimrc'
alias et='vim ~/.tmux.conf'
alias stmux='tmux source ~/.tmux.conf'

alias cdpl='cd $PL_PROJECTS_DIR'
alias cdflutter='cdpl && cd flutterapp && clear && pwd'
alias cdfoundry='cd ~/projects/pl/foundry && clear && pwd'
alias cdcypressscripts='cd ~/projects/pl/edu-clients/cypress-scripts && clear && pwd'
alias cdcompslib='cdpl && cd pl-components-ng2/src/lib && clear'
alias cdteservices='cdte && cd projects/pl-core-services/src && clear'
alias cdrn='cdpl && cd nativedev'
alias adminlogin='open https://${PL_ENV}.login.presencek8s.com/admin/user/user'
alias adminworkplace='open https://${PL_ENV}.workplace.presencek8s.com/admin'

function nullish() {
alias pwtest='npx playwright test'
alias pwtesth='npx playwright test --headed'
alias pwtestd='npx playwright test --debug'
alias pwtestr='npx playwright show-report '
}

function cdte() {
  cdpl && cd therapy-essentials && clear && pwd
}
function cdec() {
  cdpl && cd edu-clients && clear && pwd
}
function cdroom() {
  cdpl && cd room && clear && pwd
}

function init() {
  setbase
  setcommon
  setenv

  clear
  setroom
}

#----------------------------------------------
#init
#----------------------------------------------


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
alias SHA='git rev-parse HEAD'
alias gcm='git commit -am $@'
alias gp='git push --no-verify origin $@'

alias grepa='grep -in -m 1 -A 20 $1 $2'
alias grepb='grep -in -m 1 -B 20 $1 $2'
alias greps='grep -in -m 1 -A 20 -B 20 $1 $2'
alias g='grep'

alias jsonpp='cat $1 | python -m json.tool'
alias ngrok='~/joe/install/ngrok'
alias pip='.venv/bin/pip3'

alias nr='npm run $@'
alias cyhg='cypress --show-headless-gui'


alias ecwatch='cdcompslib && pwd && fswatch -0 . | while read -d "" f; do echo $f; rsync -a . ~/projects/pl/edu-clients/src/lib-components; done'

alias tewatch='cdteservices && pwd && fswatch -0 . | while read -d "" f; do echo $f; cdte && npm run format; done'
alias plshowversiondrift='plversiondrift | column -t'

alias wwebserver='python3 -m http.server'


#-----------------------------------

HISTCONTROL=ignorespace

##############################################################
#                     FUNCTIONS
##############################################################

function fix_mosh_server() {
  local fw='/usr/libexec/ApplicationFirewall/socketfilterfw'
  local mosh_sym="$(which mosh-server)"
  local mosh_abs="$(greadlink -f $mosh_sym)"

  sudo "$fw" --setglobalstate off
  sudo "$fw" --add "$mosh_sym"
  sudo "$fw" --unblockapp "$mosh_sym"
  sudo "$fw" --add "$mosh_abs"
  sudo "$fw" --unblockapp "$mosh_abs"
  sudo "$fw" --setglobalstate on
}

function tailfoundry() {
  YAML_OUTPUT_NUMBER=${YAML_OUTPUT_NUMBER:-""};
  if [ -z ${PL_SUITE} ];
  then
    YAML_FILE=${YAML_FILE:-"bsd.yaml"};
  else
    YAML_FILE=suite-${PL_SUITE}.yaml
  fi
  clear;
  tail -f ~/projects/pl/foundry/.output${YAML_OUTPUT_COUNTER}--${YAML_FILE}
}

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

function rooms() {
  setenv
  clear
  npm start
}

function rooms2() {
  setenv
  clear
  npm run pw-list-env
  npm start
}

function ecs() {
  cdec
  setenv
  clear
  npm run pw-list-env
  npm start
}

function tes() {
  cdte
  setenv
  clear
  npm run --prefix playwright-scripts pw-list-env
  npm start
}

function ecbuild() {
  clear
  npm run setup && npx --max_old_space_size=8192 ng build --configuration=local --deployUrl=/c/
}


export PYTHON_CONFIGURE_OPTS="--enable-framework"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

alias python='python3'
alias pip='/usr/bin/python3 -m pip'

#------ END / PL stuff ------


####################################################
#                      THE REST
####################################################

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="→ \W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

source ~/.git-completion.bash

# say -v Serena < /tmp/hal.txt -o /tmp/hal_serena6.aiff && lame -m m /tmp/hal_serena6.aiff /tmp/hal_serena6.mp3

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Setting PATH for Python
PATH="/Users/jhanink/.pyenv/shims:/opt/homebrew/bin:/usr/local/bin:${PATH}"
export PATH

#source ~/.nvm/nvm.sh
source ~/.fzf.bash
eval "$(fnm env --use-on-cd)"

export BASH_SILENCE_DEPRECATION_WARNING=1

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

eval "$(/opt/homebrew/bin/brew shellenv)"
