insert into Life_Table (Step, X, Y)
select f.Step + 1, f.X, f.Y
from (
      select f.Step, f.X, f.Y,
             (select Count(1) from Life_Table st where st.Step = f.Step and st.X = f.X and st.Y = f.Y) AliveAlready,
             (select Count(1) from Life_Table st where st.Step = f.Step and st.X between f.X - 1 and f.X + 1 and st.Y between f.Y - 1 and f.Y + 1) AliveAround 
      from (
            select Step, X - 1 as X, Y - 1 as Y from Life_Table where Step = (select Max(Step) from Life_Table) union
            select Step, X + 0 as X, Y - 1 as Y from Life_Table where Step = (select Max(Step) from Life_Table) union
            select Step, X + 1 as X, Y - 1 as Y from Life_Table where Step = (select Max(Step) from Life_Table) union
            select Step, X - 1 as X, Y + 0 as Y from Life_Table where Step = (select Max(Step) from Life_Table) union
            select Step, X + 0 as X, Y + 0 as Y from Life_Table where Step = (select Max(Step) from Life_Table) union
            select Step, X + 1 as X, Y + 0 as Y from Life_Table where Step = (select Max(Step) from Life_Table) union
            select Step, X - 1 as X, Y + 1 as Y from Life_Table where Step = (select Max(Step) from Life_Table) union
            select Step, X + 0 as X, Y + 1 as Y from Life_Table where Step = (select Max(Step) from Life_Table) union
            select Step, X + 1 as X, Y + 1 as Y from Life_Table where Step = (select Max(Step) from Life_Table)
           ) f
      ) f 
where (f.AliveAlready = 1 and (f.AliveAround - 1) in (2, 3)) 
   or (f.AliveAlready = 0 and f.AliveAround = 3) 
order by f.X, f.Y;
commit;
