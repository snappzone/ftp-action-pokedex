#!/bin/sh -l

lftp $INPUT_HOST -u $INPUT_USER,$INPUT_PASSWORD -e "set ftp:ssl-force $INPUT_FORCESSL; set ssl:verify-certificate false;
mirror $INPUT_OPTIONS --reverse --continue --only-newer --dereference -x ^\.git/$ $INPUT_LOCALDIR $INPUT_REMOTEDIR; 
mv public_html/sveltekit public_html/sveltekit_old; 
mv public_html/sveltekit_load public_html/sveltekit; 
mv public_html/sveltekit_old public_html/sveltekit_load; 
quit"

# rm -r public_html/sveltekit_old;
# mkdir public_html/sveltekit_load;