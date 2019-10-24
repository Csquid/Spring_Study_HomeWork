create sequence seq_user
start with 1
increment by 1
maxvalue 10000000000;

create sequence seq_board
start with 21
increment by 1
minvalue 1
maxvalue 10000000000
nocycle
nocache;

create sequence seq_file
start with 1
increment by 1
maxvalue 10000000000;

drop sequence seq_board;
drop sequence seq_user;

select * from USER_SEQUENCES where SEQUENCE_NAME = upper('seq_board');
select * from USER_SEQUENCES where SEQUENCE_NAME = upper('seq_file');
select * from USER_SEQUENCES where SEQUENCE_NAME = upper('seq');
select last_number from USER_SEQUENCES where SEQUENCE_NAME = upper('seq_board');

select * from member;
desc member;

create table board (
    idx number not null primary key,
    title varchar2(100) not null,
    contents varchar2(4000) not null,
    history_count number not null,
    creation_date date default sysdate not null,
    creation_userid varchar2(30) not null
);

commit;

alter table board modify creation_date date default sysdate not null;
alter table board modify history_count number default 0;


alter table board add recommend_count number default 0 not null;
alter table board add creation_userid varchar2(30) not null;
alter table board add update_date date default sysdate not null;

desc board;

select * from board;
select sysdate FROM DUAL;

select * from board where idx = '1';

update board set idx = 1 where idx=2;
update board set title = '테스트 타이틀', contents = '테스트 콘텐스트'
