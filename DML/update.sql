update swedb.users 
set password = '654321', jobtitle = 'Professor'
where userid = '00001';

update swedb.pages 
set json = '00005.json', updatedjson = '00005_update.json'
where userid = '00001';