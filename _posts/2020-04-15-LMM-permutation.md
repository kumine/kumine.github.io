[TOC]
## 01.GWAS阈值的确定

混合线性模型(LMM）是GWAS常用的方法，而确定阈值是一个重要的问题。 一般会用0.01/N、0.05/N、1/N 作为经验阈值，N为总标记数或者独立标记数（去掉高LD的标记）。更精确的方法是用置换检验的方法，这个方法比较耗费时间。很多研究的结果表明经验阈值和置换检验的阈值是相差不大。

对于GWAS LMM模型的置换检，**直接对表型随机抽样**进行置换检验是不太符合统计模型假设的。

## 02. 置换检验要保证变量之间可置换性

让我们来考虑最简单的GWAS线性模型：
                   $y = \mu + \beta x +e$

 - $y$ 是表型，
 - $\mu$是均值，
 - $x$ 是SNP向量，
 - $\beta$ 是SNP效应值，
 - $e$是残差。

$\beta = 0$ 是零假设。 随机排列$y$可以检验x的效应值$\beta$。

稍微复杂点的模型:

$y = \mu +Q \alpha + \beta x +e$
 
- Q 为协变量（例如PCA）

$\beta = 0$ 仍是零假设。此时我们通过随机抽样y来检验$\beta = 0$，已经不具有了可置换性， 当随机排列$y$的时候，变量Q的效应$\alpha$ 同时也产生了变化，这样就对 $\beta$的效应值检测产生了混淆效应

对同样的对应混合线性模型

 $y = \mu +Q \alpha + \beta x + \xi +e$ 

- $\xi$ 亲缘关系背景效应  $\xi$ ~ $MVN(0,K\sigma^2)$

当随机排列$y$的时候，协变量$Q$和$\xi$也发生了改变，对 $\beta$的效应值检测也产生了混淆效应。

**所以不能简单的随机抽样表型$y$来检验SNP的显著性。**

## 03.解决方案

 - 01. 随机抽样变量x 即SNP
 
    其实通过上面的分析可以得出结论，我们**应该置换SNP,而非表型。**
    
    支持plink bed格式的GWAS分析软件，可以随机抽样 fam 文件以达到随机置换基因型SNP的目的.

 对于不方便随机抽样基因型的情况下， 可以同时抽样表型y,协变量Q和亲缘关系矩阵K，保持y,Q和K的内在关系一致。
    
 - 02. 运用R包MVNpermute
原文：

>  MVNpermute is based on permutations of an invertible transformation of the phenotype residuals, all structure in the genotype data (e.g., linkage disequilibrium, allele frequencies) is preserved. Inverting the transformation following permutations then results in new simulated datasets that maintain the structure in the entire original data (i.e., phenotype correlations and genotype structure).

MVNpermute包能产生保持基因型内在关系的置换检验表型， 也就是可以用MVNpermute产生的表型进行置换检验

 - 03. MultiTrans
 
    这个方法原理没太看懂，原文里面说计算效率会更高些。
    



## 04.参考文献

[MVNpermute 文章](https://onlinelibrary.wiley.com/doi/full/10.1002/gepi.21893)

[R包MVNpermute](https://cran.r-project.org/web/packages/mvnpermute/)

[MultiTrans](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-016-0903-6)









    
    




