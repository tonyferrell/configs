term_name=`uname`
if [[ $term_name == MINGW* ]]; then
export TERM=msys
elif [[ $term_name == CYGWIN* ]]; then
export TERM=cygwin
fi

source .bash_profile
