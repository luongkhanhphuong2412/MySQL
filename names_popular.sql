use gender;
select * from yob2014;
select Names from yob2014 where Gender = 'M' order by count DESC limit 5;