--1) grades 1-5
select * from Grade;


--2) anger, fear, sadness, joy
select Name from Emotion;

--3) 32842
select COUNT(title) from Poem;

--4)
select Name from Author
where id < 77
order by Name asc;

--5)
select a.Name, g.Name 
from Author a left join Grade g on a.GradeId = g.Id
where a.Id < 77
order by a.Name asc;

--6)
select a.Name, g.Name, d.Name
from Author a left join Grade g on a.GradeId = g.Id
left join Gender d on a.GenderId = d.Id
where a.Id < 77
order by a.Name asc;

--7) 374584
select sum(WordCount) from Poem

--8) Hi 6
select Title, CharCount from Poem
where CharCount = (select min(CharCount) from Poem)

--9) 2344
select count(a.id) as 'Num 3rd graders'
from Author a left join Grade g on a.GradeId = g.id
where g.id = 3;

--10) 4404
select count(a.id) as 'Num 1st - 3rd graders'
from Author a left join Grade g on a.GradeId = g.id
where g.id < 4;

select * from Grade;

--11)
select count(p.id) as 'poems per grade'
from Poem p left join Author a on p.AuthorId = a.id
left join Grade g on a.GradeId = g.id
where g.Name = '4th Grade';


--12)
select count(p.id) as 'poems per grade', g.Name
from Poem p left join Author a on p.AuthorId = a.id
left join Grade g on a.GradeId = g.id
group by g.Name;

--13)
select count(a.id), g.Name
from Author a left join Grade g on a.GradeId = g.Id
group by g.name
order by COUNT(a.id) asc;


--14)
select title from Poem
where Title = 

