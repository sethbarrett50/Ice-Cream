main = do
  putStrLn "How many users are contributing to the ice cream fund?"
  numUsers <- readLn

  contributions <- mapM (\n -> do
    putStrLn $ "User " ++ show n ++ ": How much are you contributing?"
    readLn) [1..numUsers]

  putStrLn "How many gallons of ice cream have been acquired?"
  totalGallons <- readLn

  let gallonsPerUser = totalGallons / fromIntegral numUsers

  mapM_ (\(n, c) -> putStrLn $ "User " ++ show n ++ ": " ++ show (gallonsPerUser * c) ++ " gallons") (zip [1..] contributions)



--The main function asks the user how many users are contributing to the ice cream fund. It uses readLn to read the user's response as an Int.

--The main function uses mapM to iterate over the list of user numbers [1..numUsers], asking each user how much they are contributing. The function passed to mapM uses putStrLn to print the question, and then readLn to read the user's response as a Double. The list of contributions is returned as a [Double].

--The main function asks the user how many gallons of ice cream have been acquired, and uses readLn to read the user's response as a Double.

--The main function calculates how many gallons of ice cream each user should receive by dividing the total number of gallons by the number of users. It then uses mapM_ to iterate over the list of user numbers and contributions, printing out each user's share of the ice cream.





