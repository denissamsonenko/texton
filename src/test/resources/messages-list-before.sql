delete from message;

insert into message (id, text, tag, user_id) values
(1, 'message1', 'tag', 1),
(2, 'message2', 'tag2', 1),
(3, 'message3', 'tag', 1),
(4, 'message4', 'tag4', 1);


# alter sequence hibernate_sequence restart with 10;
# ALTER TABLE message AUTO_INCREMENT=0;