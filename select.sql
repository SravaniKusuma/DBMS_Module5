#1. For event requests, list the event number, event date (eventrequest.dateheld), and count of the event plans. 
# Only include event requests in the result if the event request has more than one related event plan with a work date in December 2018.

SELECT EventRequest.EVENTNO,DATEHELD,COUNT(PLANNO) AS EVENTPLANS
FROM EventRequest,EVENTPLAN
WHERE EventRequest.EVENTNO = EVENTPLAN.EVENTNO
AND (date_format(WORKDATE,'%Y'))=2018
AND (date_format(WORKDATE,'%b'))="Dec"
GROUP BY EventRequest.EVENTNO
HAVING EVENTPLANS>1;

# List the plan number, event number, work date, and activity of event plans meeting the following two conditions: 
#(1) the work date is in December 2018 and (2) the event is held in the “Basketball arena”. 
# Your query must not use the facility number (“F101”) of the basketball arena in the WHERE clause. 
# Instead, you should use a condition on the FacName column for the value of “Basketball arena”.

SELECT PLANNO,EVENTPLAN.EVENTNO,ACTIVITY
FROM EVENTPLAN, EventRequest,Facility
WHERE EVENTPLAN.EVENTNO = EventRequest.EVENTNO
AND EventRequest.FacNo = Facility.FacNo
AND Facility.FacName = "Basketball arena"
AND (date_format(WORKDATE,'%Y'))=2018
AND (date_format(WORKDATE,'%b'))="Dec";

# List the event number, event date, status, and estimated cost of events where there is an event plan managed by 
# Mary Manager and the event is held in the basketball arena in the period October 1 to December 31, 2018.Your query must
# not use the facility number (“F101”) of the basketball arena or the employee number (“E101”) of “Mary Manager” in the WHERE 
# clause.Thus, the WHERE clause should not have conditions involving the facility number or employee number compared to constant values.


SELECT EventRequest.EVENTNO,DATEHELD,STATUS,ESTCOST
FROM EventRequest,EVENTPLAN,EMPLOYEE,Facility
WHERE EventRequest.EVENTNO = EVENTPLAN.EVENTNO
AND EVENTPLAN.EMPNO = EMPLOYEE.EMPNO
AND EventRequest.FacNo = Facility.FacNo
AND DATEHELD BETWEEN '2018-10-01' AND '2018-12-31'
AND Facility.FacName="Basketball Arena"
AND EMPLOYEE.EMPNAME="Mary Manager";

#4.	List the plan number, line number, resource name, number of resources (eventplanline.number),
# location name, time start, and time end where the event is held at the basketball arena,
# the event plan has activity of activity of “Operation”, and the event plan
# has a work date in the period October 1 to December 31, 2018.

SELECT EVENTPLANLINE.PLANNO,LINENO,RESNAME,NUMBERFLD,LocName,TIMESTART,TIMEEND
FROM RESOURCETBL  JOIN EVENTPLANLINE 
ON RESOURCETBL.RESNO=EVENTPLANLINE.RESNO
JOIN EVENTPLAN 
ON EVENTPLAN.PLANNO=EVENTPLANLINE.PLANNO
JOIN Location
ON EVENTPLANLINE.LoCNo=Location.LocNo
JOIN Facility
ON Location.FacNo=Facility.FacNo
WHERE Facility.FACNAME="Basketball Arena"
AND EVENTPLAN.ACTIVITY="Operation"
AND WORKDATE BETWEEN '2018-10-01' AND '2018-12-31';

