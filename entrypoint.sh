#!/bin/sh -l

lftp $INPUT_HOST -u $INPUT_USER,$INPUT_PASSWORD -e "set ftp:ssl-force $INPUT_FORCESSL; set ssl:verify-certificate false;
mirror $INPUT_OPTIONS --reverse --continue --only-newer --dereference -x ^\.git/$ $INPUT_LOCALDIR $INPUT_REMOTEDIR; 
mv public_html/demo-5 public_html/demo-5_old; 
mv public_html/demo-5_load public_html/demo-5; 
mv public_html/demo-5_old public_html/demo-5_load; 
quit"

# rm -r public_html/sveltekit_old;
# mkdir public_html/sveltekit_load;