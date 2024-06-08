//join de estado com regiao

select estado.nome, estado.uf, regiao.nome as Regiao
from estado
inner join regiao
on regiao.id = estado.regiao
where regiao = 1;

//join de cidade com estado
select municipio.nome, estado.nome as Estado, estado.uf
from municipio
inner join estado
on municipio.uf = estado.uf
where estado.uf = "RS";

//join de cidade com estado
select c.nome, e.nome as Estado, e.uf
from municipio c
inner join estado e
on c.uf = e.uf
where e.uf = "RS";


//join da cidade do estado e da região
select c.nome as Cidade, e.nome as Estado, e.uf as UF, r.nome as Regiao
from municipio c
inner join estado e on c.uf = e.uf
inner join regiao r on e.regiao = r.id
where e.uf = "RS";



//left join

select estado.nome, estado.uf, regiao.nome as Regiao
from estado
left join regiao
on regiao.id = estado.regiao
limit 10;

//right join

select e.nome, e.uf, r.nome as Regiao
from estado e
right join regiao r
on e.Regiao = 6;


//consultas aninhadas

SELECT nome, uf, regiao
FROM (
  SELECT e.nome, e.uf, r.nome AS regiao
  FROM estado e
  INNER JOIN regiao r ON e.regiao = r.id
) AS subquery
WHERE regiao = 'Norte'
ORDER BY nome
LIMIT 10;

//consulta aninhada com contagem

select count(*) as Total
from (
		select nome from municipio
		where uf = 'AP'
	  )as subconsulta;
	  
	  
select count(*) as Total
from (
		select nome from estado
		where regiao = 3
	  )as subconsulta;
	  
	  
// resultado + as cidades
SELECT 
    nome, 
    COUNT(*) AS total_registros
FROM 
    (
        SELECT 
            nome
        FROM 
            municipio 
        WHERE 
            uf = 'SP'
    ) AS subconsulta
GROUP BY nome;
