import Pkg; 
Pkg.add("DataFrames");
Pkg.add("CSV");
#Pkg.add("Plots");
Pkg.precompile();
using DataFrames, CSV#, Plots
function readcsv() # leitura do csv
    path = "data.csv"
    dataframe = DataFrame(CSV.File(path))
end
dataframe = readcsv()
function table()
        
end
function filtro_table(a::Int64, b::Int64, cols::Vector{SubString{String}}) # faz o plot dos dados em dataframe
    col=dataframe[a:b, cols]
    return col
    
end
function filtro_table(a::Int64, b::Int64, cols::Vector{String})
    col=dataframe[a:b, cols]
    return col
    
end
println(dataframe[1:3, [:id]])
#text = readline()
text = "id, Movie Name, Year of Release"
println(text)
text = split(text, ",")
text = strip.(text)
println(text)
println(filtro_table(1, 3, text))

