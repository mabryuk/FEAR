echo "exproting the conda environment to environment.yml ..."
conda env export --from-history --no-build  | sed '/prefix:/d' > environment.yml 