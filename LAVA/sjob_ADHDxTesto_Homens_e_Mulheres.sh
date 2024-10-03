#!/bin/bash
#SBATCH --job-name=ADHDxTESTO_M_H    # Job name


#SBATCH --ntasks=1                    # Run on a single CPU
#SBATCH --mem=64gb                     # Job memory request
#SBATCH --time=192:00:00               # Time limit hrs:min:sec
#SBATCH --output=/home/physiogenlab/LAVA/outputs/LAVA_ADHDxTESTO_M_H_%j.log   # Standard output and error log
pwd; hostname; date

#OpenMP settings:
export OMP_NUM_THREADS=1
export MKL_NUM_THREADS=1
export OMP_PLACES=threads
export OMP_PROC_BIND=spread

echo $SLURM_JOB_ID              #ID of job allocation
echo $SLURM_SUBMIT_DIR          #Directory job where was submitted
echo $SLURM_JOB_NODELIST        #File containing allocated hostnames
echo $SLURM_NTASKS              #Total number of cores for job


#run the application:

# command line arguments, specifying input/output file names and phenotype subset
# arg = commandArgs(T); ref.prefix = arg[1]; loc.file = arg[2]; info.file = arg[3]; sample.overlap.    file = arg[4]; phenos = unlist(strsplit(arg[5],";")); out.fname = arg[6]

srun Rscript /home/physiogenlab/LAVA/LAVA_parallel_Rscript.R "/home/physiogenlab/LAVA/g1000_eur" \
"/home/physiogenlab/LAVA/LAVA_2500loci.txt" \
"/home/physiogenlab/LAVA/input.info.file.txt" \
"/home/physiogenlab/ldsc/1.SAMPLE_OVERLAP/sample.overlap.kleber.txt" \
"ADHD;TESTO_M_H" \
"/home/kleber/15.07.2024-ADHDxTESTO_M_H"

