# shortcut to this dotfiles path is $ZSH
export ZSH=$HOME/.config/zsh
export DOTFILES_BIN=$HOME/.dotfiles/bin

# your project folder that we can `c [tab]` to
export PROJECTS=~/git

# Stash your environment variables in ~/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

# all of our zsh files
typeset -U config_files
config_files=($ZSH/**/*.zsh)

# load the path files
for file in ${(M)config_files:#*/path.zsh}
do
  source $file
done

# load everything but the path, completion, and autostart files
for file in ${${${config_files:#*/path.zsh}:#*/completion.zsh}:#*/autostart.zsh}
do
  source $file
done

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# load every completion after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh}
do
  source $file
done

# load the autostart file
for file in ${(M)config_files:#*/autostart.zsh}
do
  source $file
done


unset config_files
