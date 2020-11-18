#!/bin/bash
for i in {0..20} 
do
     j=`printf "%0*d\n" 2 $i`
     nme=lambda_${j}
     mkdir $nme
     cp grompp_fep.mdp ${nme}/${nme}_fep.mdp
     sed -i "s/@lambda@/${j}/g" ${nme}/${nme}_fep.mdp
     cp grompp_opt_fep.mdp ${nme}/${nme}_opt_fep.mdp
     sed -i "s/@lambda@/${j}/g" ${nme}/${nme}_opt_fep.mdp
     cp rungmx-fep.sh ${nme}/rungmx-fep.sh
     sed -i "s/@lambda@/${j}/g" ${nme}/rungmx-fep.sh
done