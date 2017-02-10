# MyBB Post Delete

Some simple scripts to mass delete posts on MyBB.

You'll need to modify the scripts before you can use them.

These will run through a counter, 1 to whatever you set to MAX in the script- it'll try everything, but things you don't have permission to delete or edit it should leave alone.

For posts, edit and delete use MyBB's AJAX requests.

For threads, it uses a regular POST request to finish off the thread.

Deleting posts won't remove the thread it's attached to, even if all posts are deleted, so make sure to delete the thread after if there's an issue.

Built using Google Chrome Dev Tools' "Copy cURL" feature.
