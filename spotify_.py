# site
# https://www.spotify.com/no/download/linux/

## 1
#import re
#p = re.compile(ur'sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys [A-Z0-9]+')
#test_str = u"    \n          <div id=\"content-main\" class=\"content-main\" role=\"main\">\n          <div class=\"container\">\n    <div class=\"row\">\n      <div class=\"col-sm-8 col-sm-offset-2\">\n        <h1>Spotify for Linux</h1>\n\n        <p>Here you can find a build of Spotify for Linux. We are running\n        this ourselves and we will try to make sure it keeps pace with its\n        Mac and Windows siblings. However, this version is unsupported.\n        You can tell us what you think and ask other users for help at\n        <a href=\"https://community.spotify.com/\">The Spotify Community</a>.</p>\n\n        <p>Spotify for Linux is released as a Debian package. Our aim\n        is that it should work with the latest Long Term Support\n        release of Ubuntu, but we will try to make it work for other\n        releases of Ubuntu and Debian as well.</p>\n\n        <h2>Installation</h2>\n        <pre>\n# 1. Add the Spotify repository signing key to be able to verify downloaded packages\nsudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886\n\n# 2. Add the Spotify repository\necho deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list\n\n# 3. Update list of available packages\nsudo apt-get update\n\n# 4. Install Spotify\nsudo apt-get install spotify-client\n        </pre>\n      </div>\n    </div>\n  </div>\n      </div>"
 
#re.search(p, test_str)

# finish it later.. simple script to get the latest sign key for spotify to get updates and such-.. lawl
