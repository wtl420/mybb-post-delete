#!/usr/bin/env bash

SITE='' # Root URL of site, no trailing slash 
MY_POST_KEY='' #  my_post_key is generated once per session and can be found in javascript on a forum page if you're logged in
SID='' # sid cookie, session ID
MYBBUSER='' # mybbuser cookie, additional userinfo

MAX=3

for TID in `seq 1 $MAX`;
do
	if ping -c 1 8.8.8.8 &>/dev/null
	then
		curl $SITE'/moderation.php' -H 'Cookie: mybbuser='$MYBBUSER'; sid='$SID -H 'Origin: http://mybb.test' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en-US,en;q=0.8' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: max-age=0' -H 'Referer: '$SITE'/moderation.php' -H 'Connection: keep-alive' --data 'my_post_key='$MY_POST_KEY'&submit=Delete+Thread+Permanently&action=do_deletethread&tid='$TID --compressed &>/dev/null
		sleep 5

	else
		date
		echo COULD NOT CONTINUE AT $TID
		exit 1
	fi
done  
echo COMPLETE, NO ERRORS
exit 0

