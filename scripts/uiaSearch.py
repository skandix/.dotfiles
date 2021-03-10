#!/usr/bin/env python3
import argparse
import requests
import re

search_url = "https://www.uia.no/kk/ans_autocomplete/"
profile_url = "https://www.uia.no/kk/profil/"

getData = lambda url: requests.Session().get(url)


def searchJSON(where, search):
    if where == "search":
        return getData(f"{search_url}{search}").json()

    elif where == "profile":
        return getData(f"{profile_url}{search}").text


def showPerson(search):
    for key, value in enumerate(searchJSON("search", search)):
        room = searchJSON("search", search)[key]["room"]
        location = searchJSON("search", search)[key]["l"]
        uid = searchJSON("search", search)[key]["uid"]
        full_name = searchJSON("search", search)[key]["cn"]
        url = searchJSON("search", search)[key]["url"]
        img = searchJSON("search", search)[key]["image"]
        email = re.findall(
            r"<a href\=\"mailto:([^ \"]+)", (searchJSON("profile", uid))
        )[0]
        decorations = "=" * (len(full_name) + len(uid) + 10)
        print(
            f"{decorations}\nName: {full_name} ({uid})\nCity: {location}\nOffice: {room}\nEmail: {email}\n{decorations}\n"
        )


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-s", type=str, help="who are you looking for?")
    args = parser.parse_args()
    showPerson(args.search)
