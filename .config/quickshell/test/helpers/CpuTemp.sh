#!/bin/bash

sensors | awk '
/Core 0:/ {print $3; exit}
/Package id 0:/ {print $4; exit}
/Tctl:/ {print $2; exit}
' | sed 's/+//'
