#!/bin/bash
# 1. Run net users /domain
# 2. Copy the results to users.txt but exclude the header and footer lines
# 3. Run ad-user-dump-cleanup.sh and the 3 separate columns will be divided into 1 column in a new file. Also, any usernames with a $ will be removed.
cat users.txt |tr "|" " "|awk '{print $1}' > users2.txt
cat users.txt |tr "|" " "|awk '{print $2}' >> users2.txt
cat users.txt |tr "|" " "|awk '{print $3}' >> users2.txt
grep -v '\$' users2.txt > ad-usernames-cleaned-up.txt
rm users2.txt
echo Output file: ad-usernames-cleaned-up.txt
