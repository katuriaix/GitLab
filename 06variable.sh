#!/bin/bash

# This is called array, instead of single value it can hold multiople values

PERSON=("katuri" "sreeni" "Rao")

# inside array we always refer values with inside ans it starts from 0

echo "First person: ${PERSON[1]}"

#echo "All persons: ${PERSON[@]}"