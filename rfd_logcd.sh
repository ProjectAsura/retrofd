#!/sbin/busybox sh

while ! busybox grep "/mnt/external_sd" /proc/mounts > /dev/null
do
	busybox sleep 1
done

# copy log files(/mnt/ram/log/*) to SD(/retrofd/log) if new ones exist
srcd=/mnt/ram   
dstd=/mnt/external_sd/retrofd/log   
while : ;
do
	busybox find $srcd -maxdepth 1 -type f | busybox sed -e 's/.*\///' | while read logfile
	do
		if [ ! -f "$dstd/$logfile" ]; then
			fsize0=`busybox ls -l "$srcd/$logfile" | busybox awk '{print $5}'`
			while : ;
			do
				busybox sleep 1
				fsize=`busybox ls -l "$srcd/$logfile" | busybox awk '{print $5}'`
				[ $fsize = $fsize0 -o "$fsize" = "" ] && break
				fsize0=$fsize
			done
			if [ $fsize != "" ]; then
				busybox cp "$srcd/$logfile" $dstd/
				busybox sync
				busybox dd if=/dev/urandom of=/dev/graphics/fb0 count=100 seek=0 bs=1280
				busybox dd if=/dev/urandom of=/dev/graphics/fb0 count=100 seek=2880 bs=1280
				busybox dd if=/dev/urandom of=/dev/graphics/fb0 count=100 seek=5760 bs=1280
			fi
		fi
	done
	busybox sleep 1
done
#!/sbin/busybox sh

while ! busybox grep "/mnt/external_sd" /proc/mounts > /dev/null
do
	busybox sleep 1
done

# copy log files(/mnt/ram/log/*) to SD(/retrofd/log) if new ones exist
srcd=/mnt/ram/log   
dstd=/mnt/external_sd/retrofd/log   
while : ;
do
	busybox find $srcd -maxdepth 1 -type f | busybox sed -e 's/.*\///' | while read logfile
	do
		if [ ! -f "$dstd/$logfile" ]; then
			fsize0=`busybox ls -l "$srcd/$logfile" | busybox awk '{print $5}'`
			while : ;
			do
				busybox sleep 1
				fsize=`busybox ls -l "$srcd/$logfile" | busybox awk '{print $5}'`
				[ $fsize = $fsize0 -o "$fsize" = "" ] && break
				fsize0=$fsize
			done
			if [ $fsize != "" ]; then
				busybox cp "$srcd/$logfile" $dstd/
				busybox sync
				busybox dd if=/dev/urandom of=/dev/graphics/fb0 count=100 seek=0 bs=1280
				busybox dd if=/dev/urandom of=/dev/graphics/fb0 count=100 seek=2880 bs=1280
				busybox dd if=/dev/urandom of=/dev/graphics/fb0 count=100 seek=5760 bs=1280
			fi
		fi
	done
	busybox sleep 1
done
