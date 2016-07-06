import subprocess
# all the if sentences.. such wow, much messy but does the job

userpath = " /home/skandix/"
awesomepath = " /home/skandix/.config/awesome/"

def motd():
    print ("   _____             __ _         _____             _                       ")
    print ("  . ____|           . _(_)       |  __ \           | |                      ")
    print (" | |     ___  _ __ | |_ _  __ _  | |  | | ___ _ __ | | ___  _   _  ___ _ __ ")
    print (" | |    . _ \| '_ \|  _| |/ _` | | |  | |/ _ | '_ \| |/ _ \| | | |/ _ | '__|")
    print (" | |___| (_) | | | | | | | (_| | | |__| |  __| |_) | | (_) | |_| |  __| |   ")
    print ("  \_____\___/|_| |_|_| |_|\__, | |_____/ \___| .__/|_|\___/ \__, |\___|_|   ")
    print ("                           __/ |             | |             __/ |          ")
    print ("                          |___/              |_|            |___/           ")
    print (" ")
    print ("Authors: bendik(skandix)")
    print (" ")
    print ("remember to change 'userpath' and 'awesomepath' ")

motd()
while 1:
    print "Please select what you want to do?"
    print "Remember to run this shit as sudo, or you'll waste time.."
    print " "
    print "[1] - Install Default Packages"
    print "[2] - Deploy dotfiles"
    print "[3] - Deploy Awesome Theme" 
    mainmenu_sel = raw_input("")

    if mainmenu_sel == "1":
        # Tell user what they have selected
        print "[2] - Install Default Packages [SELECTED]"
        subprocess.call('./install.sh', shell=True)

    elif mainmenu_sel == "2":
 
        print "================================"
        print "[2] - Deploy dotfiles [SELECTED]"

        print "Please select what you want to do?"
        print " "
        print "[1] - .asoundrc"
        print "[2] - .bashrc"
        print "[3] - .conkyrc"
        print "[4] - .rtorrent.rc"
        print "[5] - .vimrc"
        print "[6] - .Xdefaults(1080p)"
        print "[7] - .Xdefaults(3k)"
        print "[8] - All of the above"
        print "[Any] - Go back"
        submenu1_sel = raw_input("")

        if submenu1_sel == "1":
                subprocess.call('cp -rfv ./dotfiles/.asoundrc' + userpath, shell=True)

        if submenu1_sel == "2":
                subprocess.call('cp -rfv ./dotfiles/.bashrc' + userpath, shell=True)

        if submenu1_sel == "3":
                subprocess.call('cp -rfv ./dotfiles/.conkyrc' + userpath, shell=True)

        if submenu1_sel == "4":
                subprocess.call('cp -rfv ./dotfiles/.rtorrent.rc' + userpath, shell=True)

        if submenu1_sel == "5":
                subprocess.call('cp -rfv ./dotfiles/.vimrc' + userpath, shell=True)

                #1080
        if submenu1_sel == "6":
                subprocess.call('cp -rfv ./dotfiles/1080p/.Xdefaults' + userpath, shell=True) 

                #3k
        if submenu1_sel == "7":
                subprocess.call('cp -rfv ./dotfiles/3k/.Xdefaults' + userpath, shell=True)
        
        if submenu1_sel == "8":
                subprocess.call('cp -rfv ./dotfiles/.*' + userpath, shell=True)

    elif mainmenu_sel == "3":

        print "====================================="
        print "[3] - Deploy Awesome Theme [SELECTED]"

        print "Please select what you want to do?"
        print " "
        print "[1] - Fibonacci Theme (1920x1080)"
        print "[2] - hypothalamus Theme"
        print "[Any] - Go Back"
        submenu2_sel = raw_input("")

        if submenu2_sel == "1":
                subprocess.call('cp -rfv ./dotconfig/awesome/fibonacci/*' + awesomepath, shell=True)
        
        if submenu2_sel == "2":
            print "==================================="
            print "[2] - hypothalamus Theme [SELECTED]"

            print "Please select what you want to do?"
            print " "
            print "[1] - hypothalamus Theme (1920x1080)"
            print "[2] - hypothalamus Theme (3200x1800)"
            print "[Any] - Go Back"
            subsubmenu2_sel = raw_input("")

            if subsubmenu2_sel == "1":
                subprocess.call('cp -rfv ./dotconfig/awesome/hypothalamus/1080p/*' + awesomepath, shell=True)

            if subsubmenu2_sel == "2":
                subprocess.call('cp -rfv ./dotconfig/awesome/hypothalamus/3k/*' + awesomepath, shell=True)

    else:
        break
