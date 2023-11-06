#import Pkg; 
#Pkg.add("DataFrames");
#Pkg.add("CSV");
#Pkg.add("Plots");
#Pkg.precompile();
using DataFrames, CSV, Plots, Graphs
function read()
    path = "data.csv"
    dataframe = DataFrame(CSV.File(path))
end
dataframe = read()
function table()
        
end
function filtro_table(a::Int64, b::Int64, cols::Vector{String})
    col=dataframe[a:b, cols]
    return col
    
end
println(dataframe[1:3, [:id]])
println(filtro_table(1, 3, ["id", "Movie Name"]))

