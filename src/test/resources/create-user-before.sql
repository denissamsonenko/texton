delete from user_role;
delete from usr;

insert into usr(id, active, password, username)
values (1, true, '$2a$08$C6bjnW/hKxh/29g1.4mxx.i.12Zgm7UOYjuy3hjxJRdqrbgHJfvEC', 'admin'),
       (2, true, '$2a$08$C6bjnW/hKxh/29g1.4mxx.i.12Zgm7UOYjuy3hjxJRdqrbgHJfvEC', 'mike');

insert into user_role(user_id, roles)
values (1, 'ADMIN'),
       (1, 'USER'),
       (2, 'USER');

