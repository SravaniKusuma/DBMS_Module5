SELECT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, employee, facility, eventplan
WHERE estaudience > 5000
  AND eventplan.empno = employee.empno 
  AND eventrequest.facno = facility.facno
  AND facname = 'Football stadium' 
  AND empname = 'Mary Manager';

# Missed join condition , semantic error

SELECT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, employee, facility, eventplan
WHERE estaudience > 5000
  AND eventplan.empno = employee.empno 
  AND eventrequest.facno = facility.facno
  AND eventrequest.eventno = eventplan.eventno
  AND facname = 'Football stadium' 
  AND empname = 'Mary Manager';

# 2.

SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, eventplan
WHERE estaudience > 4000
  AND eventplan.eventno = eventrequest.eventno 
GROUP BY eventrequest.eventno, dateheld, status, estcost;

# Group by clause not required, Redundancy 

SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, eventplan
WHERE estaudience > 4000
  AND eventplan.eventno = eventrequest.eventno ;
  
# 3.

SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, employee, facility, eventplan
WHERE estaudience > 5000
  AND eventplan.empno = employee.empno 
  AND eventrequest.facno = facility.facno
  AND eventplan.eventno = eventrequest.eventno 
  AND facname = 'Football stadium' ;
  
# There is an extra table used which is not required, Redundancy 

SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, facility
WHERE estaudience > 5000
  AND eventrequest.facno = facility.facno
  AND facname = 'Football stadium' ;
  
  # 4.
  
SELECT DISTINCT eventno, dateheld, status, estcost
FROM eventrequest, employee, eventplan
WHERE estaudience BETWEN 5000 AND 10000
  AND eventplan.empno = employee.empno 
  AND eventrequest.eventno = eventplan.eventno
  AND empname = 'Mary Manager';
  
# Invalid synatx for between , syntax error

SELECT DISTINCT eventno, dateheld, status, estcost
FROM eventrequest, employee, eventplan
WHERE estaudience BETWEEN 5000 AND 10000
  AND eventplan.empno = employee.empno 
  AND eventrequest.eventno = eventplan.eventno
  AND empname = 'Mary Manager';
  
  # 5 .
  
  SELECT eventplan.planno, lineno, resname, 
numberfld, timestart, timeend
    FROM eventrequest, facility, eventplan, 
eventplanline, resourcetbl
     WHERE estaudience = '10000'
AND eventplan.planno = 
eventplanline.planno AND eventrequest.facno 
= facility.facno
      AND facname = 
'Basketball arena' AND 
   eventplanline.resno = resourcetbl.resno
      AND eventrequest.eventno = eventplan.eventno ;
      
# Poor coding style

SELECT eventplan.planno, lineno, resname, numberfld, timestart, timeend
FROM eventrequest, facility, eventplan, eventplanline, resourcetbl
WHERE estaudience = '10000'
AND eventplan.planno = eventplanline.planno 
AND eventrequest.facno = facility.facno
AND eventplanline.resno = resourcetbl.resno
AND eventrequest.eventno = eventplan.eventno 
AND facname = 'Basketball arena' ;

  


