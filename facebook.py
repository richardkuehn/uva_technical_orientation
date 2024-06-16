import pandas as pd

comsur = pd.read_csv('MSDS-Orientation-Computer-Survey(in).csv')

print(comsur.head())

import matplotlib.pyplot as plt

plt.figure(figsize=(10, 6))
plt.hist(comsur['Hard Drive Size (in GB)'], bins=70, edgecolor='k', alpha=0.7)
plt.title(f'Histogram of Hard Drive Size')
plt.xlabel('Gigabytes')
plt.ylabel('Frequency')
plt.grid(True)
plt.show()