# PyTorch CUDA DevContainer Template

<a href="https://github.com/mabryuk/miniCUDA/generate">
  <img src="https://img.shields.io/badge/use%20this-template-blue?logo=github">
</a>

This repository provides a template for setting up a development container (DevContainer) for working with PyTorch on CUDA. This setup ensures a consistent development environment, making it easier to manage dependencies and configurations.

## Features

- [**MiniForge3**](https://github.com/rocker-org/devcontainer-features/tree/main/src/miniforge): A minimal Conda distribution with conda-forge as the default channel.
- [**CUDA**](https://github.com/devcontainers/features/tree/main/src/nvidia-cuda): Configured to leverage NVIDIA GPUs for deep learning tasks.

## Getting Started

### Prerequisites

- **Docker**: Ensure Docker is installed and running on your machine [from here](https://docs.docker.com/engine/install/) or [here](https://docs.docker.com/desktop/).
- **Visual Studio Code**: Install [Visual Studio Code](https://code.visualstudio.com/Download) with the [Remote Development extension pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack).

### Setup

1. **Open** `.devcontainer/devcontainer.json`

1. **Choose python version**:
    ```json
    "containerEnv": { 
		"PYTHON_VERSION": "3.11"
	}
    ```

2. **Choose Cuda and Cudnn versions**:
    ```json
    "features": {
		"ghcr.io/devcontainers/features/nvidia-cuda:1": {
			"installCudnn": true,
			"installCudnnDev": true,
			"installNvtx": true,
			"installToolkit": true,
			"cudaVersion": "12.4",
			"cudnnVersion": "9.3.0.75"
		}
    }
    ```
    check the compatibility matrix [here](https://docs.nvidia.com/deeplearning/cudnn/support-matrix/index.html)

3. **Reopen in Container**:
    - Press `F1` and select `Remote-Containers: Reopen in Container`.
    - VS Code will build the container and open the workspace inside it.

### Usage

1. **Activate Conda Environment**:
    ```bash
    conda activate base
    ```
2. **Install PyTorch**:
    ```bash
    conda install pytorch torchvision torchaudio pytorch-cuda=12.4 -c pytorch -c nvidia
    ```
    make sure `pytorch-cuda=<PYTORCH_VERSION>` is compatible with the installed `cuda` version.

3. **Test PyTorch Installation**:

    `main.py`:
    ```python
    import torch
    print(torch.__version__)
    print(torch.cuda.is_available())
    ```
    Run the script:
    ```bash
    python main.py
    ```
4. **Run export script to save the installed modules**:
    
    ```bash
    .devcontainer/scripts/export.sh
    ```

## Contributing

Feel free to submit issues or pull requests if you have suggestions for improvements or find any bugs.

## License

This project is licensed under the MIT License.