#!/bin/bash


clear
echo "Let's build a mad-lib!"


read -p "1. Please give me an adjective: " ADJ1
read -p "2. Please give me a noun: " NOUN1
read -p "3. Please give me a verb: " VERB1
read -p "4. Please give me an adverb: " ADV1
read -p "5. Please give me a verb: " VERB2
read -p "6. Please give me a noun: " NOUN2
read -p "7. Please give me an adjective: " ADJ2
read -p "8. Please give me a plural noun: " NOUN_PLURAL1


echo "Once upon a time, in a land far away, there was a $ADJ1 $NOUN1. It loved to $VERB1 $ADV1."
echo "One day, it decided to $VERB2 a $NOUN2, which was very $ADJ2. And they all lived happily with their $NOUN_PLURAL1."
