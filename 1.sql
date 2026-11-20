-- Change the admin password to "opps!" (stored as its MD5 hash)
UPDATE "users"
SET "password" = '1c658300a285a58aa25d7bd133ca9896'
WHERE "username" = 'admin';
