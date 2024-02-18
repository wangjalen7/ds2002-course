#!/usr/bin/env python

import os

FAV_SUBJECT = input('What is your favorite subject? ')
BEST_MOVIE = input('What is the best movie ever? ')
DREAM_JOB = input('What is your dream job? ')

os.environ["FAV_SUBJECT"] = FAV_SUBJECT
os.environ["BEST_MOVIE"] = BEST_MOVIE
os.environ["DREAM_JOB"] = DREAM_JOB

print("Favorite Subject:", os.getenv("FAV_SUBJECT"))
print("Best Movie:", os.getenv("BEST_MOVIE"))
print("Dream Job:", os.getenv("DREAM_JOB"))
