import Pkg; 

Pkg.add("DataFrames");
Pkg.add("CSV");
Pkg.add("Statistics");
Pkg.precompile();

using DataFrames, CSV, Statistics


function readcsv() # leitura do csv
    path = "data.csv"
    dataframe = DataFrame(CSV.File(path))
end
dataframe = readcsv()
function table()
    println(filtro_table(1, 5, colunas)) 
end
function calcular_probabilidade(table, colunas, elemento1, elemento2)
    # Filtra o DataFrame para obter apenas as colunas desejadas
    df_filtrado = select(table, colunas)

    # Calcula a média e o desvio padrão para cada coluna
    medias = mean.(eachcol(df_filtrado))
    desvios_padrao = std.(eachcol(df_filtrado))

    # Normaliza os valores das colunas
    df_normalizado = (df_filtrado .- medias) ./ desvios_padrao

    # Seleciona as linhas correspondentes aos elementos
    linha_elemento1 = table[table.MovieName .== elemento1, colunas]
    linha_elemento2 = table[table.MovieName .== elemento2, colunas]

    # Normaliza os valores das linhas
    linha_elemento1_normalizada = (linha_elemento1 .- medias) ./ desvios_padrao
    linha_elemento2_normalizada = (linha_elemento2 .- medias) ./ desvios_padrao

    # Calcula a probabilidade de similaridade usando a distância euclidiana
    probabilidade = exp(-sum((linha_elemento1_normalizada .- linha_elemento2_normalizada).^2))

    return probabilidade
end
function filtro_table(linha_i::Int64, linha_f::Int64, cols::Vector{SubString{String}}) # faz o plot dos dados em dataframe
    Filtro=dataframe[linha_i:linha_f, cols]
    return Filtro
    
end
function filtro_table(linha_i::Int64, linha_f::Int64, cols::Vector{String})
    Filtro=dataframe[linha_i:linha_f, cols]
    return Filtro
    
end
colunas = "id, Movie Name, Year of Release, Run Time in minutes, Movie Rating, Votes, MetaScore, Gross, Genre, Certification, Director, Stars, Description"
colunas = split(colunas, ",") # separa valores por virgulas
colunas = strip.(colunas) # tira espaços
println(colunas[2])
tabela = table()
colunas_para_calculo = [:id, :MovieName, :YearOfRelease]
println(colunas_para_calculo)

#println(tabela[2,:2])


#calcular_probabilidade(tabela, colunas[1:3], tabela(1,1))
