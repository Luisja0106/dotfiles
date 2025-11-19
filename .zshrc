#     ______ _____ _   _   _____ _____ _   _ ______ _____ _____ 
#    |___  //  ___| | | | /  __ \  _  | \ | ||  ___|_   _|  __ \
#       / / \ `--.| |_| | | /  \/ | | |  \| || |_    | | | |  \/
#      / /   `--. \  _  | | |   | | | | . ` ||  _|   | | | | __ 
#    ./ /___/\__/ / | | | | \__/\ \_/ / |\  || |    _| |_| |_\ \
#    \_____/\____/\_| |_/  \____/\___/\_| \_/\_|    \___/ \____/
#                                                               
#   don't edit this file, if you want edit the config of your zsh
#   do in ~/.config/zshrc
for f in ~/.config/zsh/*; do
  if [ ! -d $f ]; then
    c='echo $f'
    [[ -f $c ]] && source $c || source $f
  fi
done
    

