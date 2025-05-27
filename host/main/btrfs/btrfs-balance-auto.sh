#/bin/sh
UUID_LIST='ddacd9bc-110f-4621-aa1b-f257830ee5ec bb99279a-1612-4641-ab80-8320893cadd2'
VALUE='10'

for UUID in $UUID_LIST; do
    TARGET="/sys/fs/btrfs/$UUID/allocation/data/bg_reclaim_threshold"
    BEFORE_VALUE=$(cat $TARGET)
    echo $VALUE > $TARGET
    AFTER_VALUE=$(cat $TARGET)
    echo "$TARGET: set $BEFORE_VALUE to $AFTER_VALUE"
done
