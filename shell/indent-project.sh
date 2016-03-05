find -E . -regex '.*\.(html|erb|js|css|haml)' |
while read filename
do
  echo "$filename"
  sed -e 's/^/~/' -e ': r' -e 's/^\( *\)~    /\1  ~/' -e 't r' -e 's/~//' $filename > /tmp/e1
  perl -pe 's{^(\s*)}{"  " x (length($1)/2)}e' /tmp/e1 > /tmp/e2
  mv /tmp/e2 $filename
  cat $filename
done
