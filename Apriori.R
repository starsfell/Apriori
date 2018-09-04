# Apriori算法

# arules包：关联规则

# Groceries数据集，包括了9835事务，被分成169个类别。还有例如最频繁项集、项集分布等信息，也可以使用itemFrequencyPlot函数来绘制支持度超过0.1的五个最步频繁项。
# 我们利用算法找到了支持度大于0.001,置信度大于0.5的规则，并使用summary函数来检查这些规则的详细信息
# 从输出的结果可知，使用Apriori算法获得了5668个符合条件的规则。我们还进一步获取了有关规则长度的分布情况，质量评估信息，挖掘结果等。

# 从质量评估结果可以得到三类指标，分别是支持度，置信度，提升度。其中，支持度代表了特定项集在事务数据库中所占的比例，置信度是规则的正确率，而提升度代表了响应目标关联规则与平均响应的比值。
# 可以使用inspect函数来查看部分规则，5668个规则中的前6个，最后我们可以对些规则进行依据置信度大小排序，并将置信度最高的那些规则列表显示出来。
# 我们发现糖与全脂牛奶的关联度最强，支持度为0.001220132.置信度为1，提升度达到3.913649。


# Dataset：arules自带的Groceries数据集
library(arules)
library(arulesViz)


data(Groceries)

# 调用itemFrequencyPlot函数检验项集的相关项集频繁度：
# 检验与其他项同时产生发生次数最多的5项
itemFrequencyPlot(Groceries,support = 0.1,cex.names = 0.8,topN = 5)


# 使用apriori函数找到支持度超过0.001，置信度在0.5以上的关联规则
rules = apriori(Groceries,parameter = list(supp = 0.001,conf = 0.5,target = "rules"))
summary(rules)

# 查看前面一部分规则：
inspect(head(rules))

# 根据置信度对规则进行排序并查看前面的部分规则：
# 结论:根据confidence排序的话，sugar、rice => 牛奶的关系最强烈
rules = sort(rules,by = "confidence",decreasing = TRUE)
inspect(head(rules))


