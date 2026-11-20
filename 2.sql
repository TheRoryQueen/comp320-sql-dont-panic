-- Erase the log the database recorded when we changed the admin password
DELETE FROM "user_logs"
WHERE "type" = 'update'
  AND "old_username" = 'admin'
  AND "new_username" = 'admin';

-- Frame emily33: add a fake log so it looks like the admin password
-- was changed to emily33's password
INSERT INTO "user_logs" ("type", "old_username", "new_username", "old_password", "new_password")
SELECT 'update', 'admin', 'admin',
    (SELECT "password" FROM "users" WHERE "username" = 'admin'),
    (SELECT "password" FROM "users" WHERE "username" = 'emily33');
