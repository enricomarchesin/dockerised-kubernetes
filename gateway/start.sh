#!/bins/bash
PFX="${INLETS_PREFIX}"
DOM="${INLETS_DOMAIN}"

UPS="${DOM}=http://docker:8081"
UPS="${UPS},${PFX}1.${DOM}=http://machine1:8022"
UPS="${UPS},${PFX}2.${DOM}=http://machine2:8022"
UPS="${UPS},${PFX}3.${DOM}=http://machine3:8022"
UPS="${UPS},${PFX}4.${DOM}=http://machine4:8022"
UPS="${UPS},${PFX}5.${DOM}=http://machine5:8022"
UPS="${UPS},${PFX}6.${DOM}=http://machine6:8022"
UPS="${UPS},${PFX}7.${DOM}=http://machine7:8022"
UPS="${UPS},${PFX}8.${DOM}=http://machine8:8022"
UPS="${UPS},${PFX}9.${DOM}=http://machine9:8022"
UPS="${UPS},${PFX}10.${DOM}=http://machine10:8022"
UPS="${UPS},${PFX}11.${DOM}=http://machine11:8022"
UPS="${UPS},${PFX}12.${DOM}=http://machine12:8022"
UPS="${UPS},${PFX}13.${DOM}=http://machine13:8022"
UPS="${UPS},${PFX}14.${DOM}=http://machine14:8022"
UPS="${UPS},${PFX}15.${DOM}=http://machine15:8022"
UPS="${UPS},${PFX}16.${DOM}=http://machine16:8022"
UPS="${UPS},${PFX}17.${DOM}=http://machine17:8022"
UPS="${UPS},${PFX}18.${DOM}=http://machine18:8022"
UPS="${UPS},${PFX}19.${DOM}=http://machine19:8022"
UPS="${UPS},${PFX}20.${DOM}=http://machine20:8022"

echo "$UPS"

inlets client --remote "$INLETS_REMOTE" --upstream "$UPS" --token $INLETS_TOKEN
