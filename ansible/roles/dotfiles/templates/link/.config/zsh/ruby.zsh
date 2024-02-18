# Ruby, install gems to user directory
# https://stackoverflow.com/questions/40385493/how-to-run-bundle-install-as-normal-user/66570536#66570536
export GEM_HOME="$(ruby -e 'puts Gem.user_dir' 2>/dev/null)"
if [ "$GEM_HOME" != "" ]; then
    export PATH="$GEM_HOME/bin:$PATH"
fi
