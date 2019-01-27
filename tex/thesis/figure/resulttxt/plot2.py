import numpy as np
import matplotlib.pyplot as plt

plt.title("Elapsed Time[s]", fontname="serif", fontsize=25)
plt.bar(X, elapsed, color="b", width=w, align="center")

# 棒グラフ内に数値を書く
for x, y in zip(X, elapsed):
    plt.text(x, y, y, ha='center', va='bottom')

plt.xticks(X, data_file_name)
plt.show()
