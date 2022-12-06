import * as readline from 'readline';

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Ask the user for the number of contributors to the ice cream fund
rl.question("Enter the number of contributors to the ice cream fund:", (numContributors: string) => {
  // Initialize variables to track the total contribution and the total number of gallons of ice cream
  let totalContribution = 0;

  rl.question("Enter the number of gallons acquired:", (totalGallons: string) => {
    // Loop over the number of contributors and collect their contribution and gallons of ice cream
    for (let i = 0; i < parseInt(numContributors); i++) {
      // Ask the user for their contribution and the number of gallons they contributed
      rl.question(`Enter the contribution for contributor ${i + 1}:`, (contribution: string) => {
        // Add the contribution and gallons to the total
        totalContribution += parseInt(contribution);

        // Calculate the amount of ice cream each contributor should receive
        let gallonsPerContributor = parseInt(totalGallons) / totalContribution;

        // Print the amount of ice cream each contributor should receive
        console.log(`Each contributor should receive ${gallonsPerContributor} gallons of ice cream.`);

        rl.close();
      });
    }
  });
});
