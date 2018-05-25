# -*- coding: utf-8 -*-
from sys import platform as _os
import requests
import re
import wget
import time
import argparse
import os

resp = requests.get
foundImg = []
debugging = True
workdir = os.getcwd()

def clearTerm():
    if _os == "linux" or _os == "linux2" or _os == "cygwin" or _os =="darwin":
        os.system('clear')

    elif _os == "win32":
        os.system('cls')

def waiting(data):
    clearTerm()
    chrs = ["\\", "|", "/", "-"]
    for j in chrs:
        print ("{0} {1}".format(data, j))
        time.sleep(0.5)
        clearTerm()

def motd():
       
	print " _  _     ___ _                 "
	print "| || |   / __\ |__   __ _ _ __  "
	print "| || |_ / /  | '_ \ / _` | '_ \ "
	print "|__   _/ /___| | | | (_| | | | |"
	print "   |_| \____/|_| |_|\__,_|_| |_|"
	print "                                "
	print " REGEX GETimg DOWNLOADER \n"

def getImgz(url):

        id_reg = re.compile(ur'\/([0-9]+)')
        loot1 = re.findall(id_reg, url) 
        tmp_urlID = str(loot1)
        urlID = tmp_urlID[2:-2]

        black_magic = re.compile(ur'File: <a href[^s]\S+')                    
        lol = resp(url).text
	loot = re.findall(black_magic, lol)
        
        if not os.path.exists(urlID) or os.path.exists("../"+urlID):
            try:
                os.mkdir(urlID)
            except OSError as oserr_mkdir:
                if debugging:
                    print ("OS Error: {0}".format(oserr_mkdir))
            else:   
                os.chdir(urlID)

        elif os.path.exists(urlID):
            os.chdir(urlID)
           
        for j in os.listdir("../"+urlID):
            foundImg.append(j)

	for i in loot:
                clean = str(i.replace('File: <a href="//', '').replace('"', ''))

		if clean.count("unknown"):                
                    print ("bad img, not downloading")
                else:
                   
                    try:  
                        img_reg = re.compile(ur'\/\d+\S+')
                        loot2 = re.findall(img_reg, clean)
                        tmp_img_name = str(loot2)
                        img_name = tmp_img_name[3:-2]
                        print img_name
                        foundImg.index(img_name)
                    except ValueError as valueerr:           
                        if debugging:
                            print("Value Error: {0}".format(valueerr))   
                     
                        print "input wget", clean
                        print (wget.download("http://"+clean))
                        print "\n"
                    
                    else:                        
                        waiting("Checking thread for new Images")

        os.chdir(workdir)
        if debugging:            
        	print "len(clean)",  len(clean)

parser = argparse.ArgumentParser()
parser.add_argument("--url")
args = parser.parse_args()

motd()
while resp(args.url).status_code != 404:
    getImgz(args.url)

print ("Thread is Dead, RIP {0}".format(args.url))

