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
    oz
]) / np.array(unopt)).T

x = np.arange(7) 
width = 0.06

plt.figure(figsize=(12, 6))
plt.ylim(0, 1)
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
plt.bar(x, averages, width*16, color='black', alpha=0.2)


plt.xticks(x, ["GEM:1", "GEM:2", "GEM:3", "GPT:1", "GPT:2", "GPT:3", "Oz"], rotation=45) 
plt.ylabel("Instruction Count / Unoptimized Instruction Count") 
plt.legend(tests, bbox_to_anchor=(1.1, 1), loc='upper right')
plt.hlines(averages[6], colors='black', linestyles='dashed', xmin=-0.5, xmax=6.5)
plt.title("Instruction Count Change After Optimization (with loop unrolling passes removed)")
plt.savefig("multibar.png")


improvements = averages[:-1] / averages[-1]

paper = 1-0.046
improvements = np.concatenate((improvements, [paper]))
improvements = (1 - improvements) * 100

plt.figure(figsize=(8, 6))
plt.xticks(x, ["GEM:1", "GEM:2", "GEM:3", "GPT:1", "GPT:2", "GPT:3", "Previous Work [1]"], rotation=15)
plt.bar(x, improvements, color=['cornflowerblue', 'royalblue', 'dodgerblue', 'indianred', 'maroon', 'firebrick', 'black'])
plt.ylabel("% Instruction Count Reduction Against Oz")
plt.hlines(improvements[-1], colors='black', linestyles='dashed', xmin=-0.5, xmax=6.5)
plt.title("Instruction Count Improvement Against Oz")
plt.savefig("improvements.png")



# ablation
data = np.average((np.array([
    gemp1,
    gemp2,
    gemp3,
    gemab1,
    gemab2,
    gptp1,
    gptp2,
    gptp3,
    gptab1,
    gptab2,
]) / np.array(unopt)), axis=1)

x = np.arange(10)
plt.figure(figsize=(12, 6))
plt.ylim(0, 1)
plt.bar(x, data, color=['cornflowerblue', 'royalblue', 'dodgerblue', 'darkorchid', 'purple', 'indianred', 'maroon', 'firebrick', 'khaki', 'gold'])

plt.bar(1, np.average(data[0:3]), 3, color='blue', alpha=0.3)
plt.bar(3.5, np.average(data[3:5]), 2, color='purple', alpha=0.3)
plt.bar(6, np.average(data[5:8]), 3, color='red', alpha=0.3)
plt.bar(8.5, np.average(data[8:10]), 2, color='orange', alpha=0.3)


plt.xticks(x, ["GEM:1", "GEM:2", "GEM:3", "GEMab:1", "GEMab:2", "GPT:1", "GPT:2", "GPT:3", "GPTab:1", "GPTab:2"], rotation=45)
plt.ylabel("Instruction Count / Unoptimized Instruction Count")
plt.title("Instruction Count Change Ablation")
plt.savefig("ablation.png")
