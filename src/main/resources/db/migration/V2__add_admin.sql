insert into usr (id, username, password, active)
    values (1, 'admin', '$2a$08$s8WOjK5UwOBD0889ucDdNei3GwP696b1vZXzQ/uoL4ns1nUOfPoDe', true);

insert into user_role (user_id, roles)
    values (1, 'USER'), (1, 'ADMIN');