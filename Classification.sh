
NBMAX=60
PLAFOND=200
index=1
declare -a tableau=()



while [ "$index" -le $NBMAX ]      # Génère $NBMAX entiers aléatoires.
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
                    mv  Sport/Basket/Basket_$nombre.* Test/
                    mv  Sport/Foot/Foot_$nombre.* Test/
                    mv  Sport/Tennis/Tennis_$nombre.* Test/
                    mv  Sport/Hockey/Hockey_$nombre.* Test/
                    else
                    mv  Sport/Basket/Basket_$nombre.* Validation/
                    mv  Sport/Foot/Foot_$nombre.* Validation/
                    mv  Sport/Tennis/Tennis_$nombre.* Validation/
                    mv  Sport/Hockey/Hockey_$nombre.* Validation/
                fi
            
                echo $nombre
                let "index += 1"  # Incrémente l'index.$
            fi
    fi
done

mv  Sport/Basket/* Apprentissage/
mv  Sport/Foot/* Apprentissage/
mv  Sport/Tennis/* Apprentissage/
mv  Sport/Hockey/* Apprentissage/

echo "-----------------"





