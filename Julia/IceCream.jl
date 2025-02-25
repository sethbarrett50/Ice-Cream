#                *******             
#              ***********           
#            ***************         
#            ***************         
#            ***************         
#            ***************         
#             *************          
#               *********            
#       *********       *********    
#     *************   *************  
#    **************   ************** 
#    *************** *************** 
#    *************** *************** 
#    **************   ************** 
#     ************     ************  
#        *******         *******     

"""
    userValidation(question::AbstractString, convType::Type)

Prompts the user with `question`, reads input (with trailing newline removed),
and converts the input using `convType`. For numeric types, it ensures the
value is non-negative. Repeats until valid input is provided.
"""
function userValidation(question::AbstractString, convType::Type)
    while true
        try
            print(question)
            input_str = chomp(readline())
            if convType <: Number
                val = parse(convType, input_str)
                if val < 0
                    println("Value cannot be negative. Please try again.")
                    continue
                end
                return val
            else
                return convType(input_str)
            end
        catch e
            println("Error: $e. Please enter a value of the correct type: ")
        end
    end
end

"""
    allocateGallons!(contrib::AbstractMatrix{<:Real}, totalGallons::Real)

Given a matrix `contrib` with each row representing a person (column 1: dollars contributed,
column 2: gallons allocated), computes the gallons allocated proportionally based on dollars.
Modifies `contrib` in-place.
"""
function allocateGallons!(contrib::AbstractMatrix{<:Real}, totalGallons::Real)
    totalDollars = sum(contrib[:, 1])
    if totalDollars == 0
        error("Total dollars contributed cannot be zero; cannot allocate gallons proportionally.")
    end
    contrib[:, 2] .= (contrib[:, 1] ./ totalDollars) .* totalGallons
end

function main()
    numPeeps = userValidation("Enter the number of contributors: ", Int64)
    peepNames = [userValidation("Please enter your name, person $i: ", String) for i in 1:numPeeps]
    contributions = [userValidation("Please enter the amount you are contributing, $(peepNames[i]): \$", Float64) for i in 1:numPeeps]

    contrib = zeros(Float64, numPeeps, 2)
    contrib[:, 1] .= contributions

    totalGallons = userValidation("Please enter the total number of gallons you are getting: ", Float64)
        
    allocateGallons!(contrib, totalGallons)

    for (name, gals) in zip(peepNames, contrib[:, 2])
        println("$name is getting $(round(gals, digits=2)) gallons")
    end
end


main()