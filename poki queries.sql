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
select top 76 a.Name, g.Name 
from Author a left join Grade g on a.GradeId = g.Id
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
select title
from poem
where WordCount = (select max(wordcount) from Poem)

select title
from poem
where LEN(Poem.Title)-LEN(REPLACE(poem.Title, ' ', '')) = (select max(LEN(Poem.Title)-LEN(REPLACE(poem.Title, ' ', ''))) from Poem)

--15)
select top 10 a.id, count(a.id) as 'Number of poems'
from poem p left join Author a on p.AuthorId = a.Id
group by a.Id
order by count(a.id) desc;

--16) 14570
select count(m.id)
from PoemEmotion p left join poem m on p.PoemId = m.Id
left join Emotion e on p.EmotionId = e.Id
where p.EmotionId = 3;

--17 3368
select count(p.Title)
from PoemEmotion e right join Poem p on e.PoemId = p.id
where e.EmotionId is null;

--18)
select top 1 COUNT(p.poemId), e.Name
from PoemEmotion p left join Emotion e on p.EmotionId = e.Id
group by e.Name
order by COUNT(p.poemId) asc;

--19)
select count(g.Id), g.Name
from poem p left join Author a on p.AuthorId = a.Id
left join Grade g on a.GradeId = g.Id
left join PoemEmotion pm on pm.PoemId = p.Id
left join Emotion e on pm.EmotionId = e.Id
where e.Id = 4
group by g.name
order by count(g.Id) asc


--20)
select count(g.Id), g.Name
from poem p left join Author a on p.AuthorId = a.Id
left join Gender g on a.GradeId = g.Id
left join PoemEmotion pm on pm.PoemId = p.Id
left join Emotion e on pm.EmotionId = e.Id
where e.Id = 2
group by g.Name
