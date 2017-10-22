ALTER TABLE message add column name VARCHAR(191);
ALTER TABLE message add column display_name VARCHAR(64);
ALTER TABLE message add column avatar_icon VARCHAR(64);

update message set name = (select name from user where id=user_id)

update message set display_name = (select display_name from user where id=user_id);

update message set avatar_icon = (select avatar_icon from user where id=user_id);
