⍝ Ask for the number of users contributing to the ice cream fund
numUsers ← ⍞ 'Enter the number of users:'

⍝ Collect the individual contributions
contributions ← numUsers ⍴ ⍞ 'Enter the contributions:'

⍝ Collect the total number of gallons of ice cream acquired
totalGallons ← ⍞ 'Enter the total number of gallons of ice cream acquired:'

⍝ Calculate the number of gallons of ice cream per user
gallonsPerUser ← totalGallons / contributions

⍝ Print the result
gallonsPerUser
