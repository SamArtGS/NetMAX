


conn admin
BEGIN
  FOR r IN (select sid,serial# from v$session where not audsid = Sys_Context('USERENV', 'SESSIONID'))
  LOOP
    EXECUTE IMMEDIATE 'alter system kill session ''' || r.sid 
      || ',' || r.serial# || '''';
    EXECUTE IMMEDIATE 'DROP USER NETMAX_BDD cascade';
  END LOOP;
END;
/

SELECT SID, SERIAL#
FROM V$SESSION
WHERE AUDSID = Sys_Context('USERENV', 'SESSIONID');


select s.sid
      ,s.serial#
      ,s.username
      ,s.machine
      ,s.status
      ,s.lockwait
      ,t.used_ublk
      ,t.used_urec
      ,t.start_time
from v$transaction t
inner join v$session s on t.addr = s.taddr;
SELECT * FROM V$TRANSACTION
WHERE STATUS='ACTIVE';