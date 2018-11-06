#!/usr/bin/env bash
#influx数据备份
#for i in `find /mnt2/db/data/cadvisor/90_days/ -mtime +30 -type d`;
time=`date "+%Y_%m_%d"`
echo $time
mkdir -p backup_${time}
for i in `find /mnt2/db/data/cadvisor/90_days/ -mtime +30 -type d`;
do
	echo $i
	basename=$(basename $i)
	echo $basename
	tar -zcvf ${basename}.tar.gz $i
	mv ${basename}.tar.gz backup_${time}
	rm -rf $i
done

cp -r /mnt2/db/meta backup_${time}
cp -r /mnt2/influx backup_${time}
echo "上传到阿里云OSS"
/mnt2/cron/ossutil/ossutil64 cp backup_${time} oss://oss_bucket/monitor/influxdb/backup_${time} --recursive
echo "rm -rf backup_${time}"
rm -rf backup_${time}
