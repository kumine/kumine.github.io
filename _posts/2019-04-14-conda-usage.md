---
layout: post
title: conda用法笔记
---


## 01 下载conda

- windows 到清华 https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/ 下载对应版本安装即可
- linux  下载命令示例

```
wget -c https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda2-latest-Linux-x86_64.sh
```

## 安装conda


```
bash Miniconda2-latest-Linux-x86_64.sh
```


```
Please, press ENTER to continue
>>> 
# 此处直接点击enter即可

===================================
Miniconda End User License Agreement
===================================
.......
# 这里点击好几次空格键，直到出现下面行

Do you accept the license terms? [yes|no]
[no] >>> 
# 这里输入yes，点击enter
# 如果输入错误，比如输入yess，又删除不了，此时你应该按enter,重新输入yes即可

[/home/you/miniconda2] >>> 
# 遇到此处时，直接enter即可
# 这里的绝对路径是指miniconda2的安装路径

installation finished.
Do you wish the installer to initialize Miniconda2
in your /home/you/.bashrc ? [yes|no]
[no] >>> 
# 这里输入yes
# 刚开始学的人最好输入yes，目的是让conda自动给你配置环境变量
# 输入yes的结果是：~/.bashrc这里文件里最后几行多了conda的配置信息
# less ~/.bashrc,多出来的配置信息第一行如下：
# added by Miniconda2 4.5.12 installer
.......

Thank you for installing Miniconda2!
# 出现这个代表安装成功

# 执行下面语句
source ~/.bashrc
# 执行后，本身就是没有任何提示

conda --help
# 出现conda的帮助文档信息，即表明conda安装成功
# 这里很重要，不管安装什么软件，都要检测是否安装成功！
# 如下所示
usage: conda [-h] [-V] command ...

conda is a tool for managing and deploying applications, environments and packages.

Options:
......

# 继续调取conda子命令的帮助文档，如
conda create --help
conda install --help
```

### 003.配置镜像


```
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/bioconda
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/msys2/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/bioconda/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/menpo/

conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch/

# for legacy win-64
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/peterjc123/

conda config --add channels https://mirrors6.tuna.tsinghua.edu.cn/anaconda/pkgs/free
conda config --add channels https://mirrors6.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge
conda config --add channels https://mirrors6.tuna.tsinghua.edu.cn/anaconda/cloud/bioconda
conda config --add channels https://mirrors6.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors6.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
conda config --add channels https://mirrors6.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/
conda config --add channels https://mirrors6.tuna.tsinghua.edu.cn/anaconda/cloud/msys2/
conda config --add channels https://mirrors6.tuna.tsinghua.edu.cn/anaconda/cloud/bioconda/
conda config --add channels https://mirrors6.tuna.tsinghua.edu.cn/anaconda/cloud/menpo/

conda config --add channels https://mirrors6.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch/

# for legacy win-64
conda config --add channels https://mirrors6.tuna.tsinghua.edu.cn/anaconda/cloud/peterjc123/

conda config --set show_channel_urls yes
conda config --show
```

### 004.环境管理


```sh

conda info --envs # 查看环境
conda create -n myenv  # 创建一个环境

conda activate myenv  # 激活进入 myenv环境

conda deactivate # 退出当前环境
conda env remove --name myenv # 移除环境

```
### 005.安装软件

- 从conda网页内查找：http://bioconda.github.io/conda-recipe_index.html

- conda search PACKAGENAME：运行命令查找是否存在

- conda 安装R语言以及R包示例
```
conda info --envs # 查看环境
conda create -n R3.5  # 创建名为R3.5的环境
conda activate R3.5  
conda list            #查看当前安装的软件
conda install r-base #安装R语言
conda install r-ggplot2 # R包 以 r- 开头
conda install r-tidyverse 
conda deactivate # 退出当前环境
```

- **安装指定版本**

  - conda install numpy=1.11：即安装能模糊匹配到numpy版本为1.11

  - conda install numpy==1.11：即精确安装numpy为1.11的版本


### 参考资料

[conda管理生信软件一文就够--生信技能树](https://mp.weixin.qq.com/s/vhSpEoIkYP5Hky0lnyGVvQ)











