#!/usr/bin/env bash
echo "Hello, World!" 

WORDFILE=/usr/share/dict/words
# seed random from pid
RANDOM=$$;
# using cat means wc outputs only a number, not number followed by filename
lines=$(cat $WORDFILE  | wc -l);
rnum=$((RANDOM*RANDOM%$lines+1));
tail -n9 random_file.txt > temp.txt
mv temp.txt random_file.txt
sed -n "$rnum p" $WORDFILE >> random_file.txt

git add random_file.txt
git commit -m "Auto commiting..."
# git push