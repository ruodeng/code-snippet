#/bin/sh

#Copy large number files in the type ttf in current path with directory tree:
find . -name '*.ttf'   -exec cp --parents \{\} TARGET \;
#all files.
find . -type f -exec cp --parents \{\} TARGET \;


#Remove the file without sub directories
#To avoid mistake, we setup -i to require confirm
find PATH -path 'PATH/*/*' -prune -o -type f  -exec rm -i {} \;
#Once the files correct, we can use -r.
find PATH -path 'PATH/*/*' -prune -o -type f  -exec rm -r {} \;
