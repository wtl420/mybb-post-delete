#!/usr/bin/env bash

SITE='' # Root URL of site, no trailing slash 
MY_POST_KEY='' #  my_post_key is generated once per session and can be found in javascript on a forum page if you're logged in
SID='' # sid cookie, session ID
MYBBUSER='' # mybbuser cookie, additional userinfo
POST_CONTENT='' # edit post content
EDIT_REASON='' # edit post reason

MAX=12

for PID in `seq 1 $MAX`;
do
	if ping -c 1 8.8.8.8 &>/dev/null
	then
		curl $SITE'/xmlhttp.php?action=edit_post&do=update_post&pid='$PID'&my_post_key='$MY_POST_KEY -H 'Cookie: sid='$SID'; mybbuser='$MYBBUSER -H 'Origin: '$SITE -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en-US,en;q=0.8' -H 'User-Agent: Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H 'Accept: text/html, */*; q=0.01' -H 'Referer: '$SITE'/showthread.php?tid=1&pid='$PID -H 'X-Requested-With: XMLHttpRequest' -H 'Connection: keep-alive' --data 'value='$POST_CONTENT'&id=pid_'$PID'&editreason='$EDIT_REASON --compressed &>/dev/null

		sleep 5

	else
		date
		echo COULD NOT CONTINUE AT $PID
		exit 1
	fi
done  
echo COMPLETE, NO ERRORS
exit 0

