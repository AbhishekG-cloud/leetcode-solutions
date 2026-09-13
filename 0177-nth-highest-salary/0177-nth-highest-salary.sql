CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      select salary 
      from(select salary,
      dense_rank() over(order by salary desc )as r
      from Employee
      )t
      where r= N
      limit 1
      


  );
END