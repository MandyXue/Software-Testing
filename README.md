# Software Testing Homework

## 作业一：万年历

需求描述：

设计一个类方法，输入年月日则自动生成下一个日期

#### 边界值分析法

用例设计：

- [x] [一般边界值分析](https://github.com/MandyXue/Software-Testing/blob/master/TestCases/BoundaryValueAnalysis1.csv)
- [x] [一般最坏情况边界值](https://github.com/MandyXue/Software-Testing/blob/master/TestCases/BoundaryValueAnalysis2.csv)
- [x] [健壮边界值](https://github.com/MandyXue/Software-Testing/blob/master/TestCases/BoundaryValueAnalysis3.csv)
- [x] [健壮最坏情况边界值](https://github.com/MandyXue/Software-Testing/blob/master/TestCases/BoundaryValueAnalysis4.csv) （这里与一般最坏重复的部分没有写在表格里）

#### 等价类分析法

用例设计：

- [x] [弱一般等价类](https://github.com/MandyXue/Software-Testing/blob/master/TestCases/EquivalenceClass1.csv)
- [x] [强一般等价类](https://github.com/MandyXue/Software-Testing/blob/master/TestCases/EquivalenceClass2.csv)
- [ ] 弱健壮等价类
- [ ] 强健壮等价类

## 作业二：电信收费问题

需求描述：

1. 每月电话总费用 = 基本月租 + 折扣后的实际通话费，没有折扣则按实际通话费计算，基本月租为25元，每分钟通话费为0.15元

2. 实际通话费是否有折扣与当月通话时间（分钟）和本年度至本月的累计未按时缴费次数有关。跨年度缴费与折扣无关，但跨年未交部分每月需要交付总额5%的滞纳金。

3. 当月通话分钟数和折扣比例及本年度未按时缴费次数之间有直接的对应关系，如果本年度的未按时缴费的次数超过本月通话时间所对应的容许值，则免于折扣，并按实际的通话费计算。

4. 电话费的收取，采用在线支付，支付方式为：支付宝／银行卡（开发简单的模拟子系统），支付后打印支付成功或不成功清单。

5. 通话时间和折扣比例及未按时缴费次数的关系为：

	|本月通话分钟数|通话时间段的最大容许不按时缴费次数|通话时间段折扣率|
	|---|---|---|
	|（0, 60］|1|1.0%|
	|（60, 120］|2|1.5%|
	|（120, 180］|3|2.0%|
	|（180, 300］|3|2.5%|
	|（300, 43200］|6|3.0%|

（在这里我们人为规定了通话时间不得超过 30天&#215;24小时&#215;60分钟 = **43200**分钟）

#### 决策表分析法
	
	以决策表分析法作为主要用例

#### 边界值分析法

	以边界值分析法的用例作为补充

