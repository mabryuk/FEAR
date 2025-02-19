if [[ -z "${PYTHON_VERSION}" ]]; then
  echo "PYTHON_VERSION is not set, using default version 3.11"
  PYTHON_VERSION="3.11"
fi

echo "conda init"
conda init bash

if [ -e environment.yml ]; then
    echo "installing the conda environment ..."
    conda env update -n base -f environment.yml

    echo "activate the conda base environment ..."
    source activate base
else
    echo "activate the conda base environment ..."
    source activate base

    echo "uninstalling old python version ..."
    conda uninstall python -y

    echo "Installing Python $PYTHON_VERSION ..."
    conda install python="$PYTHON_VERSION" -y
    
    echo "saving the conda environment ..."
    ./.devcontainer/scripts/export.sh
fi

exit 0