#include <stdio.h>

int main() {
  // ask for the number of users
  int num_users;
  printf("Enter the number of users: ");
  scanf("%d", &num_users);

  // collect the contribution of each user
  int contributions[num_users];
  int total_contribution = 0;
  for (int i = 0; i < num_users; i++) {
    printf("Enter the contribution of user %d: ", i + 1);
    scanf("%d", &contributions[i]);
    total_contribution += contributions[i];
  }

  // collect the total number of gallons of ice cream acquired
  int total_gallons;
  printf("Enter the total number of gallons of ice cream acquired: ");
  scanf("%d", &total_gallons);

  // calculate how many gallons of ice cream each user gets
  for (int i = 0; i < num_users; i++) {
    int gallons_per_user = total_gallons * contributions[i] / total_contribution;
    printf("User %d gets %d gallons of ice cream\n", i + 1, gallons_per_user);
  }

  return 0;
}
