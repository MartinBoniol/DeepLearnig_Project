
NBMAX=60
PLAFOND=200
index=1
declare -a tableau=()



while [ "$index" -le $NBMAX ]
do
    nombre=$RANDOM
    tableau=($nombre ${tableau[@]})
    for i in $tableau; 
    do
        if [ "$nombre" -ne "$i" -a "$oui" ]
            then
            oui=true
            else
            oui=false
        fi
    done
    if [ "$oui" ]
        then 
        tableau=($nombre ${tableau[@]})
            if [ "$nombre" -le $PLAFOND ]
                then
                if [ "$index" -le 30 ]
                    then
                    mv  Sport/Basket/Basket_$nombre.* Partition/Test/Basket
                    mv  Sport/Foot/Foot_$nombre.* Partition/Test/Foot
                    mv  Sport/Tennis/Tennis_$nombre.* Partition/Test/Tennis
                    mv  Sport/Hockey/Hockey_$nombre.* Partition/Test/Hockey
                    else
                    mv  Sport/Basket/Basket_$nombre.* Partition/Validation/Basket
                    mv  Sport/Foot/Foot_$nombre.* Partition/Validation/Foot
                    mv  Sport/Tennis/Tennis_$nombre.* Partition/Validation/Tennis
                    mv  Sport/Hockey/Hockey_$nombre.* Partition/Validation/Hockey
                fi
         
                let "index += 1"
            fi
    fi
done

mv  Sport/Basket/* Partition/Apprentissage/Basket
mv  Sport/Foot/* Partition/Apprentissage/Foot
mv  Sport/Tennis/* Partition/Apprentissage/Tennis
mv  Sport/Hockey/* Partition/Apprentissage/Hockey







