# dockup-gs

Restore and backup docker container volumes to google cloud storage.

Inspired by [dockup](https://github.com/tutumcloud/dockup)

## Command arguments

```
usage: dockup-gs [-h] [--backup-name BACKUP_NAME] [--gs-key GS_KEY]
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
  --gs-key GS_KEY       the google cloud service key (json)
  --cron-time CRON_TIME
                        the cron time to backup to
  --no-restore          don't restore from backup
```

