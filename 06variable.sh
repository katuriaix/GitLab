#!/bin/bash

# This is called array, instead of single value it can hold multiople values

PERSON=("katuri" "12" "sreeni" "Rao")

# inside array we always refer values with inside ans it starts from 0

echo "First person: ${PERSON[0]}"

echo "All persons: ${PERSON[@]}"

#echo "Total count: ${PERSON[$#]}"