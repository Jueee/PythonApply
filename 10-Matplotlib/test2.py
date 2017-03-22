import matplotlib.pyplot as plt

import seaborn as sns #要注意的是一旦导入了seaborn，matplotlib的默认作图风格就会被覆盖成seaborn的格式



sns.distplot(births['tips'])

sns.plt.show()