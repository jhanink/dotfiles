_pwd=`pwd`

export EDITOR='vim'

export ACK_OPTIONS='--ignore-dir=lightyear --ignore-dir=toychest --ignore-dir=toys --ignore-dir=woody --ignore-dir=pl-queue --ignore-dir=pl-toolbar --ignore-dir=clinicial_portal --ignore-dir=test'

export CYPRESS_numTestsKeptInMemory=500
export CYPRESS_videoRecording=false

#### foundry test generator

export PL_ENV=movies
export PL_APP_DIR=~/projects/pl/edu-clients
export PL_FOUNDRY_DIR=~/projects/pl/foundry
export PL_FOUNDRY_YAML_FILE=basic-seed-data-SLP-local-timezone.yaml

export AUTH_URL=https://${PL_ENV}.login.presencestag.com
export APIWORKPLACE_URL=https://${PL_ENV}.workplace.presencestag.com
export APOLLO_URL=https://${PL_ENV}.workplace.presencestag.com/graphql/v1/
export APPS_URL=https://${PL_ENV}.apps.presencestag.com
export PLATFORM_URL=https://${PL_ENV}.platform.presencestag.com

export PL_HOST=presencestag.com
export PL_USERNAME=qauser
export PL_PASSWORD=')$#=m$^Epa%b:7AWu$fg'

export PL_CYPRESS_DIR=$PL_APP_DIR/cypress
export PL_CYPRESS_SCRIPTS_DIR=$PL_APP_DIR/cypress-scripts


# /end - foundry test generator
alias foundry='python foundry.py run';
alias foundrybasic='cdfoundry; mv .output .output-BAK; echo "" > .output; foundry scripts/basic-seed-data-SLP-local-timezone.yaml >> .output'
alias basicfoundry='cdfoundry; mv .output .output-BAK; echo "" > .output; foundry scripts/basic-seed-data.yaml > .output'
alias foundryfte='cdfoundry; echo "" > .output; echo "------ fte Users ---- " >> .output; foundry scripts/fte-data.yaml >> .output'
alias foundrybitcoin='export PL_ENV=bitcoin; foundrybasic'
alias tailfoundry='clear; tail -f ~/projects/pl/foundry/.output'
alias foundryavalon='export PL_ENV=avalon; foundrybasic'
alias foundrybitcoin='export PL_ENV=bitcoin; foundrybasic'
alias ccr='npm run copy-repos'

function runecsubset() {
  cypress run --spec cypress/integration/clients/clients-list-all.js;
  sleep 5;
  cypress run --spec cypress/integration/clients/client-details.js
}

#-----------------------------------
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
# export PS1="\u@\h \W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
export PS1="→ \W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "


PATH=/usr/local/Cellar/vim/8.0.0600/bin:$PATH;


#------- Aliases ----------
if [ -z "$CD_CURRENT" ]; then export CD_CURRENT='cdeduclients'; fi;
alias ll='ls -alGp'
alias eb='vim ~/.bash_profile && source ~/.bash_profile'
alias ev='vim ~/.vimrc'
alias et='vim ~/.tmux.conf'

alias cdcurrent='eval $CD_CURRENT'
alias ccd='cdcurrent'
alias cdjoe='cd ~/projects/joe'
alias cdvue='cd ~/projects/joe/vue'
alias cdeduclients='cdpl && cd edu-clients && clear'
alias cdcompslib='cdpl && cd pl-components-ng2/src/lib && clear'
alias cd2educlients='cdpl2 && cd edu-clients'
alias cdclapi='cd /Users/jhanink/projects/__archive/clapi && gitt'
alias cdwoody='cd ~/projects/pl/woody'
alias cdfoundry='cd ~/projects/pl/foundry'

alias stmux='tmux source ~/.tmux.conf'
alias gitt='clear && git branch && git status'
alias gitlog='clear && git branch && git log --oneline'
alias gitlogstat='git log --stat'
alias gitlogname='git log --name-only'
alias gitlogdiff='git log -p'
alias gitlogshort='git log --pretty=format:"%h%x09%an%x09%ad%x09%s"'
alias ggitt='find . -follow -maxdepth 1 -mindepth 1 -type d -exec sh -c "(echo {} && cd {} && git status -s && echo)" \;'
alias gittr='clear && gbranchr && git status'
alias gitr='cdeduclients; git checkout config/env/local.js; gitt'
alias gitcm='git commit -am $@'
alias gcm='git commit -am $@'
alias gbranchr='git fetch --prune origin && git branch -a'
alias reloadd='source ~/.bash_profile'
alias bbn='babel-node'
alias jsonpp='cat $1 | python -m json.tool'

alias vimfoundry='cdfoundry; vim .output'

alias curbranch='echo "Current Branch [ ${__BRANCH} ] "'
alias ngrok='~/joe/install/ngrok'

alias pip='.venv/bin/pip3'

alias cy='cypress'
alias cyhg='/Applications/Cypress.app/Contents/MacOS/Cypress --project ${_pwd} --show-headless-gui'

alias gittags='git fetch && git show-ref --tags | grep "\/Live-Activation" | sort -k2 -r'
alias gitreflog='git log -g --abbrev-commit --pretty=oneline'
alias showlinks='ll node_modules | grep ^l && ll node_modules | grep ^l | wc -l'
#PROMPT_COMMAND='echo -ne "\033]0;\007"'
alias cypress='./node_modules/.bin/cypress'
alias gitusers='git shortlog -sne'
alias gitbranchcontains='git branch --contains $1'
alias gitmergepath='git log --graph --oneline --no-abbrev-commit | grep "Merge branch '.*' into" | sed 's/^[^a-z0-9]*[a-z0-9]//g''
alias _ecenv='node ./node-scripts/set-env --envkey=$1 && ecshowenv '
alias SHA='git log | head -1 | cut -c 8- '
alias grepa='grep -in -m 1 -A 20 $1 $2'
alias grepb='grep -in -m 1 -B 20 $1 $2'
alias greps='grep -in -m 1 -A 20 -B 20 $1 $2'
alias ecclean='cdeduclients; rm -rf node_modules; rm -rf src/lib-components; npm i; gitt'
alias g='grep'

export SK_PROJECTS_DIR=~/projects/sk
alias cdsk='cd $SK_PROJECTS_DIR'
alias cdoo='cd $SK_PROJECTS_DIR/online-office-vue && clear'
alias llintprettier='cdoo && yarn lint && yarn dev:prettier'
alias oostart='cdoo; yarn serve'
alias ecwatch='cdcompslib && pwd && fswatch -0 . | while read -d "" f; do echo $f; rsync -a . ~/projects/pl/edu-clients/src/lib-components; done'

function cctemplates() {
  for i in {html,less,ts};
  do
    cp ~/joe/component-templates/file.component.$i ./$1.component.$i;
    sed -i '' "s/FILE/$1/g" "$1.component.$i";
    sed -i '' "s/CLASSNAME/$2/g" "$1.component.$i";
  done
}

function uutemplates() {
  for i in {html,less,ts};
  do
    sed -i '' "s/FILE/$1/g" "$1.component.$i";
    sed -i '' "s/CLASSNAME/$2/g" "$1.component.$i";
  done
}

function wakeenvs() {
  wget https://abalone.apps.presencestag.com/c/landing > /dev/null;
  wget https://avalon.apps.presencestag.com/c/landing > /dev/null;
}

function ecenv() {
  git checkout ./config/env/local.js;
  sed -i '' -e "s/\/workplace/\/$1\.workplace/g" ./config/env/local.js;
  sed -i '' -e "s/\/login/\/$1\.login/g" ./config/env/local.js;
  sed -i '' -e "s/\/apps/\/$1\.apps/g" ./config/env/local.js;
  sed -i '' -e "s/presencetest/presencestag/g" ./config/env/local.js;
  node ./node-scripts/set-env --envkey=local;
  ecshowenv;
}

alias _ecshowenv='echo "---------------------------------" && cat config/env/joe.js | grep apiWorkplace -A 1 | tail -1 | tr -d "[:space:]" | cut -c 14- | rev | cut -c 3- | rev && echo "---------------------------------"'
function ecshowenv() {
  echo "---------------------------------" && cat config/env/local.js | grep apiWorkplace -A 1 | tail -1 | tr -d "[:space:]" | cut -c 44- | rev | cut -c 3- | rev && echo "---------------------------------";
}
alias _ecstart='clear && ecenv && npm run setup && clear && echo "---------- http://local.presencestag.com/c ----------" && sudo env "PATH=$PATH" ng serve --host=0.0.0.0 --disable-host-check --port=3010 --environment=joe --deploy-url=/c'

function ecstart() {
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

function ecavalon() {
  ecstart avalon
}

function ecbitcoin() {
  ecstart bitcoin
}

function ecmerlin() {
  ecstart merlin
}

function ecmovies() {
  ecstart movies
}

function woodybitcoin() {
  woodystart bitcoin
}

function startec() {
  PL_ENV=$1
  export APIWORKPLACE_URL=https://$PL_ENV.workplace.presencestag.com
  export AUTH_URL=https://$PL_ENV.login.presencestag.com
  export APOLLO_URL=https://$PL_ENV.workplace.presencestag.com/graphql/v1/
  export APPS_URL=https://$PL_ENV.apps.presencestag.com
  npm start
}

function woodystart() {
  cdwoody;
  clear;
  cp config/"$1"-config.js app/dev/woody/env-config.js;
  echo "----- using $1 env config -----";
  grunt serve;
}
function hammstart() {
  clear;
  cp config/avalon-config.js app/dev/hamm/env-config.js;
  echo "----- using wpqa env config -----";
  grunt serve;
}
function landingstart() {
  clear;
  landingenv "$1";
  npm run setup;
  sudo env "PATH=$PATH" ng serve --host=0.0.0.0 --disable-host-check --port=3012 --environment=local --deploy-url=/landing;
  git checkout ./config/env/local.js;
}
alias python='python3'
alias pip='/usr/bin/python3 -m pip'

#alias wwebserver='python -m SimpleHTTPServer 8080'
alias wwebserver='python3 -m http.server'
function vapi() {
  cdapi;
  . .venv/wp/bin/activate;
  alias pip='/Users/jhanink/projects/pl/api-workplace/.venv/wp/bin/pip3'
}


HISTCONTROL=ignorespace


CYPRESS_SINGLE_TEST='invoice-documentation-assistant/ida-readonly-tests.js'
function cypressci() {
  cypress run --spec cypress/integration/${CYPRESS_SINGLE_TEST} --record --key 6b03c4c8-3e3c-4abc-adff-e8f21d436aa6 --env plEnv=local --config=numTestsKeptInMemory=0,watchForFileChanges=false
}


function educlients() {
  echo "" && echo "----- starting educlients -----" && echo "";
  npm run svg && npm start;
}
function eclink() {
  echo "" && echo "----- updating and linking deps -----" && echo "";
  cdeduclients && cd ../pl-components-ng2 && git pull origin master && npm link;
  cdeduclients && cd ../pl-services-ng2 && git pull origin master && npm link;
  cdeduclients && npm link pl-components-ng2 && nm link pl-services-ng2;
  ecstart;
}
function ecclean() {
  echo "" && echo "----- cleaning educlients -----" && echo "";
  cdeduclients && cd src && rm -rf lib-*;
}

function ecupdateandlink() {
  ecclean;
  cdeduclients;
  npm i;
  eclink;
}

function ecupdate() {
  ecclean;
  cdeduclients;
  npm i;
  ecstart
}

# TODO: use jq instead of underscore
# https://www.npmjs.com/package/underscore-cli
alias u='underscore'
alias ggetusers='cat ~/projects/pl/pl-cypress-shared/test-data/manual-qa-base-users-login.json | tr -d "\n"'
alias ggetuserslocal='cat ./test-data/manual-qa-base-users-login.json | tr -d "\n"'
function uusers() {
  ggetusers | u "$@" print --color
}
function uuserslocal() {
  ggetuserslocal | u "$@" print --color && echo "----------";
  ggetuserslocal | u "$@" print --color | grep -m 1 -B 2 -A 1 SLP;

}
function rrawusers() {
  ggetusers | u "$@" | xargs echo -n | pbcopy
}
function ccopyusers() {
  ggetusers | u "$@" | pbcopy
}
function ggetlead() {
  ggetleadlocal
#  ggetusers | u extract leads.0.username | tr -d '"\n' | pbcopy && pbpaste && echo ''
}
function ggetleadlocal() {
  ggetuserslocal | u extract leads.0.username | tr -d '"\n' | pbcopy && pbpaste && echo ''
}

alias ggenusers='cd ~/projects/pl/pl-cypress-shared && npm run test-data-setup && cd - && ggetusers | u print --color'
alias _ggenuserslocal='clear && ecshowenv && npm run test-data-setup -- envKey=joe && ggetuserslocal | u print --color && echo "----------" && uuserslocal'

function ggenusersfoundry() {
  clear
  export PL_ENV=$1
  echo "------------------"
  env | grep PL_ENV
  echo "------------------"
  cd ~/projects/pl/foundry
  foundry scripts/test-seed-data.yaml > /tmp/test-seed-data.txt
  less /tmp/test-seed-data.txt
}


# generate test users against a stag k8s env
# dependencies
#   scripts
#     * ecenv
#     * uuserslocal
#   packages
#     * underscore-cli
function ggenuserslocal() {
  clear;
  ecenv "$1";
  npm run test-data-setup -- envKey=joe;
  uuserslocal
  open https://"$1".login.presencestag.com/logout/
  sleep 1
  open https://"$1".login.presencestag.com/login/?next=/admin/user/user/
}
alias ggendata='npm run test-data-setup -- scenarioset=e2eCI'
alias rruntests='npm run test-data-setup -- scenarioset=e2eCI && cypress run --config=numTestsKeptInMemory=0,watchForFileChanges=false,videoRecording=false --env plEnv=local'
alias rruntestsci='npm run test-data-setup -- scenarioset=e2eCI && cypress run --record --key 6b03c4c8-3e3c-4abc-adff-e8f21d436aa6 --env plEnv=local --config=numTestsKeptInMemory=0,watchForFileChanges=false,videoRecording=false'
#------ PL stuff ------------

export PL_PROJECTS_DIR=~/projects/pl
export PL_PROJECTS2_DIR=~/projects/pl2
alias cdpl='cd $PL_PROJECTS_DIR'
alias cdpl2='cd $PL_PROJECTS2_DIR'
alias cdtable='cd $PL_PROJECTS_DIR/pl-table'
alias cdlightyear='cd $PL_PROJECTS_DIR/lightyear'
alias cdtoys='cd $PL_PROJECTS_DIR/toys'
alias cdchest='cd $PL_PROJECTS_DIR/toychest'
alias cdcore='cd $PL_PROJECTS_DIR/pl-core'
alias cdqueue='cd $PL_PROJECTS_DIR/pl-queue'
alias cdtoolbar='cd $PL_PROJECTS_DIR/pl-toolbar'
export PL_CURRENT_BRANCH=fargo
#alias go='grunt serve'
alias golightyear='cdlightyear && go'
alias gotoys='cdtoys && go'
alias gochest='cdchest && go'
alias gp='git pull origin $1'
alias startjenkins='sudo launchctl load /Library/LaunchDaemons/org.jenkins-ci.plist'
alias stopjenkins='sudo launchctl unload /Library/LaunchDaemons/org.jenkins-ci.plist'
function ggitgrepall() {
git grep "$@" $(git rev-list --all)
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
alias plshowversiondrift='plversiondrift | column -t'

function fbget() {
  firebase data:get $1 -f learning-test | prettyjson --inline-arrays=1
}
function fbgetplain() {
  firebase data:get $1 -f learning-test
}
function fbset() {
  firebase data:set $1 $2 -f learning-test -y
}

function ___plUpdateAll() {
  cd $PL_PROJECTS_DIR/pl-core && git pull && npm install
  cd $PL_PROJECTS_DIR/pl-queue && git pull && npm install
  cd $PL_PROJECTS_DIR/pl-toolbar && git pull && npm install

  cd $PL_PROJECTS_DIR/lightyear&& git pull && npm install
  cd $PL_PROJECTS_DIR/toys && git pull && npm install
  cd $PL_PROJECTS_DIR/toychest && git pull && npm install
}

function plNpmLink() {
  npm link ../pl-core && npm link ../pl-queue && npm link ../pl-toolbar
}

function plNpmLinkAll() {
  cd $PL_PROJECTS_DIR/lightyear && plNpmLink
  cd $PL_PROJECTS_DIR/toys && plNpmLink
  cd $PL_PROJECTS_DIR/toychest && plNpmLink

  plNpmLinkCheck
}

function plNpmLinkCheck() {
  echo "------ lightyear ------"
  cd $PL_PROJECTS_DIR/lightyear/node_modules && ls -al pl-*
  echo "------ toys -----"
  cd $PL_PROJECTS_DIR/toys/node_modules && ls -al pl-*
  echo "------ toychest -----"
  cd $PL_PROJECTS_DIR/toychest/node_modules && ls -al pl-*
}

function plShowBranches () {
  __pwd=`pwd`
  cd $PL_PROJECTS_DIR
  _plShowBranches
  cd $__pwd;
}

function plBranchAll() {
  _pwd=`pwd`
  projects=('lightyear' 'toys' 'toychest' 'pl-core' 'pl-queue' 'pl-toolbar')
  for i in "${projects[@]}"
  do
    cd $PL_PROJECTS_DIR
    cd $i
    git checkout $1
    cd $_pwd
  done
}

function plUpdateAll() {
  plShowBranches
  echo "-- waiting 3 seconds --"
  sleep 3
  _pwd=`pwd`
  projects=('lightyear' 'toys' 'toychest' 'pl-core' 'pl-queue' 'pl-toolbar')
  for i in "${projects[@]}"
  do
    cd $PL_PROJECTS_DIR
    cd $i
    git pull origin $1
    cd $_pwd
  done
}

function _plShowBranches() {
  _pwd=`pwd`
  projects=('lightyear' 'toys' 'toychest' 'pl-core' 'pl-queue' 'pl-toolbar')
  for i in "${projects[@]}"
  do
    cd $i
    printf "%-11s" $i | tr '[:lower:]' '[:upper:]'  && git branch | grep \*
    cd $_pwd
  done
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
alias ggstart='grunt serve'
#------ END / PL stuff ------





#------- Functions --------
function clipp() {
  echo -n "$1" | pbcopy
}

function showdeployedwars() {
  watch -n 1 "echo "" && echo "" && echo "" &&  echo "Current Branch [ `cat ~/.__BRANCH` ]" && echo '' && ls -altGTp $CATALINA_BASE/webapps/*.war && echo '' && echo '-----' && cat ~/.done"
}


function setbranch() {
  echo $1 > ~/.__BRANCH
  showbranch
}

function showbranch() {
  __BRANCH__=`cat ~/.__BRANCH`
  echo "Current Branch in FILE [ $__BRANCH__ ]"
}


export CLAPI_SET_DATATYPE=ON
#export CLAPI_SET_MOCKS=ON

### OLD STUFF ###

export MYSQL_PATH=/usr/local/Cellar/mysql/5.6.27
export PATH=$PATH:$MYSQL_PATH/bin

# say -v Serena < /tmp/hal.txt -o /tmp/hal_serena6.aiff && lame -m m /tmp/hal_serena6.aiff /tmp/hal_serena6.mp3


# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
PATH="/usr/local/bin:${PATH}"
export PATH

#. ~/install/git/contrib/completion/git-completion.bash
#if [ -f `brew --prefix`/etc/bash_completion ]; then
#    . `brew --prefix`/etc/bash_completion
#fi

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

cdcurrent

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm use stable

#npm config set package-lock false

eval "$(pyenv init -)"
pyenv shell 3.6.6

export BASH_SILENCE_DEPRECATION_WARNING=1
#clear
