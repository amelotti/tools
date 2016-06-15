# Original author: Michalis Georgiou <mechmg93@gmail.comr>
# Modified by Amelotti http://www.amelotti.com <luiz@amelotti.com>

sudo apt-get install git fontconfig

_gitroot="https://github.com/google/fonts.git"
_gitrepo="googlefontdirectory"

echo "Connecting to Git server...."
if [ -d $_gitrepo ] ; then
        cd $_gitrepo
        git pull -u || return 1
        echo "The local files have been updated."
        cd ..
else
        git clone $_gitroot $_gitrepo || return 1
fi
echo "Git checkout done or server timeout"
sudo mkdir -p /usr/share/fonts/truetype/google-fonts/
find $PWD/$_hgrepo/ -name "*.ttf" -exec sudo install -m644 {} /usr/share/fonts/truetype/google-fonts/ \; || return 1
fc-cache -f > /dev/null
echo "done."
