# PyTorch

Available Docker Images:

- [PyTorch 0.4](0.4/)
    - [CUDA 8.0](0.4/cuda8/)
        - [cuDNN 5](0.4/cuda8/cudnn5/Dockerfile)
        - [cuDNN 6](0.4/cuda8/cudnn6/Dockerfile)
        - [cuDNN 7](0.4/cuda8/cudnn7/Dockerfile)
    - [CUDA 9.2](0.4/cuda9/)
        - [cuDNN 7](0.4/cuda9/cudnn7/Dockerfile)
- PyTorch 0.3.1
    - [CUDA 8.0](0.3.1/cuda8/)
        - [cuDNN 5](0.3.1/cuda8/cudnn5/Dockerfile)
        - [cuDNN 6](0.3.1/cuda8/cudnn6/Dockerfile)
        - [cuDNN 7](0.3.1/cuda8/cudnn7/Dockerfile)
    - [CUDA 9.2](0.3.1/cuda9/)
        - [cuDNN 7](0.3.1/cuda9/cudnn7/Dockerfile)

Currently Ubuntu 16.04 is supported. We only support LTS versions.

Includes:
1. Python 3.6
2. `numpy` - for all the linear algebra awesomeness
3. `scipy` - for scientific computing
4. `requests` - for http requests (such as to model weights)
5. `tqdm` - for progress bars