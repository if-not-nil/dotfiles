function fish_greeting
    set clock (date +%H:%M)
	set boottime (sysctl -n kern.boottime | awk '{print $4}' | sed 's/,//g')
	set unixtime (date +%s)
	set timeAgo (math $unixtime - $boottime)
    set uptime (echo $timeAgo | awk '{
        total_hours = int($1 / 36000);
        total_days = int($1 / 86400);
        printf("%.0f hours (%.0f days)", total_hours, total_days)
    }')
	set left (df -h / | awk 'NR==2 {print $4}')


    echo "$clock"
	echo "up:    $uptime"
    echo "left:  $left"
end
