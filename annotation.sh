if [ $# -gt 1 ]
then
    a=1
    mkdir $2 2> /dev/null
    if [ $# -gt 2 ]
    then
    
        for i in $3/*.{jpg,jpeg,JPG,png,PNG,webp,dib}; do
            convert "$i" $2/"$1"_$a.jpg 2> /dev/null && let a=a+1
        done
        #for i in $2/*.jpg; do
        #  convert $i -resize 128x128 $i
        #done
        let a=a-1
        b=`ls -l $3 | grep -v ^d | grep -v ^t | grep -v ^l | wc -l`
        echo Successfully converted $a/$b files
        
    else
        
        for i in *.{jpg,jpeg,JPG,png,PNG,webp,dib}; do
            convert "$i" $2/"$1"_$a.jpg 2> /dev/null && let a=a+1
        done
        let a=a-1
        b=`ls -l | grep -v ^d | grep -v ^t | grep -v ^l | wc -l`
        echo Successfully converted $a/$b files
        #for i in $2/*.jpg; do
        #  convert $i -resize 128x128 $i
        #done

    fi
else
    echo "Usage: ./rename <category name> <target folder> [source folder]"
fi
