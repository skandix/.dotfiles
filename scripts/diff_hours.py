#!/usr/bin/env python3
import datetime as dt

start = input("Start: ")
stop = input("Stop: ")

stop_dt = dt.datetime.strptime(stop, "%H:%M")
start_dt = dt.datetime.strptime(start, "%H:%M")
diff = stop_dt - start_dt
print(f"===================\nTimer Diff: {diff}")
