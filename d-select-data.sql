select * from Life_Table where Step = (select Max(Step) from Life_Table);
