import subprocess

def motd():
    print ("  _   _       _                                                             ")
    print (" | \ | |     (_)                                                            ")
    print (" |  \| | ___  _ ___ _   _ ___  ___ _ ____   _____ _ __ ___                  ")
    print (" | . ` |/ _ \| / __| | | / __|/ _ | '__\ \ / / _ | '__/ __|                 ")
    print (" | |\  | (_) | \__ | |_| \__ |  __| |   \ V |  __| |  \__ \                 ")
    print (" |_| \_|\___/|_|___/\__, |___/\___|_|    \_/ \___|_|  |___/                 ")
    print ("                     __/ |                                                  ")
    print ("                    |___/                                                   ")
    print ("   _____             __ _         _____             _                       ")
    print ("  / ____|           / _(_)       |  __ \           | |                      ")
    print (" | |     ___  _ __ | |_ _  __ _  | |  | | ___ _ __ | | ___  _   _  ___ _ __ ")
    print (" | |    / _ \| '_ \|  _| |/ _` | | |  | |/ _ | '_ \| |/ _ \| | | |/ _ | '__|")
    print (" | |___| (_) | | | | | | | (_| | | |__| |  __| |_) | | (_) | |_| |  __| |   ")
    print ("  \_____\___/|_| |_|_| |_|\__, | |_____/ \___| .__/|_|\___/ \__, |\___|_|   ")
    print ("                           __/ |             | |             __/ |          ")
    print ("                          |___/              |_|            |___/           ")
    print (" ")
    print ("Authors: Bendik Egenes Dyrli")

motd()
while 1:
    print "Please select what you want to do?"
    print "Remember to run this shit as sudo, or you'll waste time.."
    print "[1] - Install Default Packages"
    print "[2] - Deploy dotfiles"
    mainmenu_sel = raw_input("")

    if mainmenu_sel == "1":
        # Tell user what they have selected
        print "[2] - Install Default Packages [SELECTED]"
        subprocess.call('./install.sh', shell=True)

    elif mainmenu_sel == "2":

        # Tell user what they have selected
        print "[2] - Deploy dotfiles [SELECTED]"

        # Ask what to do
        print "Please select what you want to do?"
        print "[1] - Select userpath"
        print "[2] - .asoundrc"
        print "[3] - .bashrc"
        print "[4] - .conkyrc"
        print "[5] - .rtorrent.rc"
        print "[6] - .vimrc"
        print "[7] - .Xdefaults"
        print "[Any] - Go back"
        submenu1_sel = raw_input("")

        if submenu1_sel == "1":
                print "[1] - Select userpath [SELECTED]"
        print "Type in your userpath."
        userpath = raw_input("-->")

        if submenu1_sel == "2":
                subprocess.call('cp -rfv /configs/dotfiles/.asoundrc %s', shell=True) % userpath

        if submenu1_sel == "3":
                subprocess.call('cp -rfv /configs/dotfiles/.bashrc %s', shell=True) % userpath

        if submenu1_sel == "4":
                subprocess.call('cp -rfv /configs/dotfiles/.conkyrc %s', shell=True) % userpath

        if submenu1_sel == "5":
                subprocess.call('cp -rfv /configs/dotfiles/.rtorrent %s', shell=True) % userpath

        if submenu1_sel == "6":
                subprocess.call('cp -rfv /configs/dotfiles/.vimrc %s', shell=True) % userpath

        if submenu1_sel == "7":
                subprocess.call('cp -rfv /configs/dotfiles/.Xdefaults %s', shell=True) % userpath
