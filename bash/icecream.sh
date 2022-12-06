#!/bin/bash

# Ask for the number of users
echo "How many users are contributing to the ice cream fund?"
read num_users

# Initialize variables to store the contributions and the total number of gallons
contributions=0

# Ask for the total number of gallons
echo "How many total gallons are acquired?"
read total_gallons

# Collect the contributions and total number of gallons
for ((i=1; i<=$num_users; i++)); do
  echo "Enter the contribution for user $i:"
  read contribution
  contributions=$((contributions + contribution))
done

# Lazy way to do this

# Calculate the number of gallons per person
for ((i=1; i<=$num_users; i++)); do
  echo "Enter the contribution for user $i:"
  read contribution
  gallons_per_person=$((total_gallons * contribution / contributions))
  echo "User $i will receive $gallons_per_person gallons of ice cream."
done
