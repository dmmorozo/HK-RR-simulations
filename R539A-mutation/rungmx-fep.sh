#!/bin/bash
#MSUB -q rome
#MSUB -A racov12
#MSUB -m scratch,work,store

l=@lambda@

#minimize
gmx_mpi grompp -f lambda_${l}_opt_fep.mdp -p ../hybrid.top -c ../hybrid.pdb -t ../eq/state.cpt -maxwarn 10 -o lambda_${l}-opt.tpr 
ccc_mprun -n $SLURM_NPROCS gmx_mpi mdrun -s lambda_${l}-opt.tpr


#equilibrate and production
gmx_mpi grompp -f lambda_${l}_fep.mdp -p ../hybrid.top -c ../hybrid.pdb -t traj.trr -maxwarn 10 -o lambda_${l}-prod.tpr 
ccc_mprun -n $SLURM_NPROCS gmx_mpi mdrun -s lambda_${l}-prod.tpr -deffnm lambda_${l}