#!/bin/bash

# zufallsdateien.txt
#
# Erstellt im aktuellen Verzeichnis 200 Dateien
# mit zufaelligen Namen aus maximal 15 Zeichen


DATEIZAHL=1000
MAXLAENGE=15


buchstabe=a

zeichen()
{
    dezimal=$[$RANDOM%62] # 0-61
    if [ $dezimal -lt 10 ]
    then
        dezimal=$[$dezimal+48 ] # 48-57
    else
        if [ $dezimal -lt 36 ]
        then
            dezimal=$[$dezimal+55] # 65-90
        else
            dezimal=$[$dezimal+61] # 97-122
        fi
    fi
    buchstabe=$(echo -e "\0$(printf %o $dezimal)") # dezimal -> ASCII-Zeichen
}




while [ $DATEIZAHL -gt 0 ]
do
    NAME=''
    LAENGE=$[$RANDOM%$MAXLAENGE+1]
    while [ $LAENGE -gt 0 ]
    do
        zeichen        
        NAME=$NAME$buchstabe
        LAENGE=$[$LAENGE-1]
    done
    echo $NAME
#    touch $NAME
    DATEIZAHL=$[$DATEIZAHL-1]
done
