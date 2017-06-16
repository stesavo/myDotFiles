DIFF="/usr/bin/vimdiff"
LEFT=${7}
RIGHT_MINE=${6}
$DIFF -R $RIGHT_MINE $LEFT -c 'wincmd W' -c ':set noreadonly'
