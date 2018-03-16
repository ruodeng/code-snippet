#/bin/sh
#find the file with special extension and cp them into another directory with directory tree.
find . -name '*.js'   -exec cp --parents \{\} /TARGET_FOLDER \