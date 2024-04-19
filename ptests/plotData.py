import matplotlib.pyplot as plt
import numpy as np
tests = ["bubblesort", "custom1", "custom2", "custom3", "hw2corr", "hw2perf", "lowercase", "pi", "queens", "towers"]
files = [ f"{test}/{test}_extra_stats.txt" for test in tests ]

unopt = []
oz = []

gemp1 = []
gemp2 = []
gemp3 = []
gptp1 = []
gptp2 = []
gptp3 = []

gemab1 = []
gemab2 = []
gptab1 = []
gptab2 = []

for file in files:
    with open(file, "r") as f:
        lines = f.readlines()
        unopt.append(float(lines[1].strip()))
        gemp1.append(float(lines[3].strip()))
        gemp2.append(float(lines[5].strip()))
        gemp3.append(float(lines[7].strip()))
        gptp1.append(float(lines[9].strip()))
        gptp2.append(float(lines[11].strip()))
        gptp3.append(float(lines[13].strip()))
        gemab1.append(float(lines[15].strip()))
        gemab2.append(float(lines[17].strip()))
        gptab1.append(float(lines[19].strip()))
        gptab2.append(float(lines[21].strip()))
        oz.append(float(lines[23].strip()))

import matplotlib.pyplot as plt 
import numpy as np 

data = (np.array([
    gemp1,
    gemp2,
    gemp3,
    gptp1,
    gptp2,
    gptp3,
    #gemab1,
    #gemab2,
    #gptab1,
    #gptab2,
    oz
]) / np.array(unopt)).T

x = np.arange(7) 
width = 0.06

plt.figure(figsize=(12, 6))
plt.ylim(0, 2)
plt.bar(x-4.5*width, data[0], width, color='pink') # bubblesort
plt.bar(x-3.5*width, data[1], width, color='red') # custom1
plt.bar(x-2.5*width, data[2], width, color='orange') # custom2
plt.bar(x-1.5*width, data[3], width, color='yellow') # custom3
plt.bar(x-0.5*width, data[4], width, color='olive') # hw2corr
plt.bar(x+0.5*width, data[5], width, color='green') # hw2perf
plt.bar(x+1.5*width, data[6], width, color='blue') # lowercase
plt.bar(x+2.5*width, data[7], width, color='purple') # pi
plt.bar(x+3.5*width, data[8], width, color='grey') # queens
plt.bar(x+4.5*width, data[9], width, color='black') # towers

averages = np.mean(data, axis=0)
plt.bar(x, averages, width*16, color='black', alpha=0.3)


plt.xticks(x, ["GEM:1", "GEM:2", "GEM:3", "GPT:1", "GPT:2", "GPT:3", "Oz"], rotation=45) 
plt.ylabel("Instruction Count / Unoptimized Instruction Count") 
plt.legend(tests, bbox_to_anchor=(1.1, 1), loc='upper right')
plt.hlines(averages[6], colors='black', linestyles='dashed', xmin=-0.5, xmax=6.5)
plt.title("Instruction Count Change After Optimization")
plt.savefig("multibar.png")

