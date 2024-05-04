#consulta por região 
select Nome,Uf,Regiao from estado 
order by Regiao ASC


#consulta por região e nome
select Nome,Uf,Regiao from estado 
order by Regiao ASC, Nome ASC;


#consulta por valor
select Cidade_Origem,Cidade_Destino, Valor
from viagem 
WHERE Valor <= 300


#consulta intervalo de valor
select Cidade_Origem,Cidade_Destino, Valor
from viagem 
WHERE Valor <= 90 and Valor >= 60


#consulta com exclusão (diferente)
select Cidade_Origem,Cidade_Destino, Valor
from viagem 
WHERE Uf_destino != 'BA';


#consulta com exclusão dupla (diferente)
select Cidade_Origem,Cidade_Destino, Valor
from viagem 
WHERE Uf_destino != 'RJ'
AND Uf_origem != 'RJ';


#pesquisa por LIKE no início

select Nome,Uf from municipio 
where Nome LIKE 'A%'; 

select Nome,Uf from municipio 
where Nome LIKE 'Porto%'


#pesquisa por LIKE no final
select Nome,Uf from municipio 
where Nome LIKE '%Alegre'; 

select Nome,Uf from municipio 
where Nome LIKE '%er';


#pesquisa por LIKE no meio
select Nome,Uf from municipio 
where Nome LIKE '%Antonio%'; 

select Nome,Uf from municipio 
where Nome LIKE '%mar%';


#pesquisa por LIKE e NOT LIKE
select Nome,Uf from municipio 
where Nome LIKE '%mar%'
AND Nome NOT LIKE '%maria%'


#pesquisa por LIKE e NOT LIKE múltiplo
select Nome,Uf from municipio 
where Nome LIKE '%mar%'
AND Nome NOT LIKE '%maria%'
AND Nome NOT LIKE '%sao%'


#pesquisa por LIKE, NOT LIKE múltiplo e por igual
select Nome,Uf from municipio 
where Nome LIKE '%mar%'
AND Nome NOT LIKE '%maria%'
AND Nome NOT LIKE '%sao%'
AND Uf = 'RS';


#pesquisa por LIKE, NOT LIKE múltiplo e por diferente
select Nome,Uf from municipio 
where Nome LIKE '%mar%'
AND Nome NOT LIKE '%maria%'
AND Nome NOT LIKE '%sao%'
AND Uf != 'MA';


#contar os resutados da pesquisa
select COUNT(*) from regiao;


#contar os resutados da pesquisa com WHERE
select COUNT(*) from municipio
WHERE Uf = 'RS';

select COUNT(*) from municipio
WHERE 
Nome LIKE '%mar%'
AND
Uf = 'RS';

#Coluna virtual para contar os resutados
select Nome, Uf, COUNT(*) as Total_Cidades from municipio
WHERE Uf = 'RS';

#conta os resultados por estado 
select Nome, Uf, COUNT(*) as Total_Cidades from municipio
WHERE Nome LIKE "Porto%"
GROUP BY Uf
ORDER By Nome;


#calculo com coluna virtual
select Cidade_Origem, Cidade_Destino, Valor, 
Valor * 0.02 AS Seguro
From viagem


#calculo arredondando as casas decimais
select Cidade_Origem, Cidade_Destino, Valor, 
Round (Valor * 0.02,2) AS Seguro
From viagem


#calculando o Total (Valor + seguro)
select Cidade_Origem, Cidade_Destino, Valor, 
Round (Valor * 0.02,2) AS Seguro,
Valor + Round(Valor * 0.02,2) as Total
From viagem;