# dockup-gs

Restore and backup docker container volumes to google cloud storage.

Inspired by [dockup](https://github.com/tutumcloud/dockup)

## Usage examples

Restore and then periodically back up a mysql container to google storage everyday at 02:30, using [docker-compose](https://docs.docker.com/compose/).

```
dockup-gs:
  image: slakah/dockup-gs
  volumes_from:
    - mysql
  command: >
    gs://my-backup/mysql
    /etc/mysql /var/lib/mysql
    --backup-name mysql
    --cron-time '30 2 * * *'
    --gc-key '{
       "type":"service_account",
       "project_id":"my-project-id",
       ...
    }'
```

## Command arguments

```
usage: dockup-gs [-h] [--backup-name BACKUP_NAME] [--gc-key GC_KEY]
                 [--cron-time CRON_TIME] [--no-restore]
                 backup path [path ...]

Restore a backup, and then backup periodically.

positional arguments:
  backup                the google storage backup url
  path                  the path to be restored and backed up

optional arguments:
  -h, --help            show this help message and exit
  --backup-name BACKUP_NAME
                        the the suffix to use for the backup file
  --gc-key GC_KEY       the google cloud service key (json)
  --cron-time CRON_TIME
                        the cron time to backup to
  --no-restore          don't restore from backup
```
