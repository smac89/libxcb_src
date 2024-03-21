#!/usr/bin/awk -f

BEGIN {
    FS = ":"
    id = ""
    keyGrip = ""
}
id && keyGrip {exit}
{
    if (!id && ($1 == "fpr" || $1 == "fp2")) {
        id = $10
        next
    }
    if (!keyGrip && $1 == "grp") {
        keyGrip = $10
        next
    }
}
END {
    print id
    print keyGrip
}
