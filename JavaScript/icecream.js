// Ask the user for the number of contributors to the ice cream fund
let numContributors = prompt("Enter the number of contributors to the ice cream fund:");

// Initialize variables to track the total contribution and the total number of gallons of ice cream
let totalContribution = 0;
let totalGallons = prompt(`Enter the number of gallons acquired`);

// Loop over the number of contributors and collect their contribution and gallons of ice cream
for (let i = 0; i < numContributors; i++) {
  // Ask the user for their contribution and the number of gallons they contributed
  let contribution = prompt(`Enter the contribution for contributor ${i + 1}:`);

  // Add the contribution and gallons to the total
  totalContribution += contribution;
}

// Calculate the amount of ice cream each contributor should receive
let gallonsPerContributor = totalGallons / totalContribution;

// Print the amount of ice cream each contributor should receive
console.log(`Each contributor should receive ${gallonsPerContributor} gallons of ice cream.`);
