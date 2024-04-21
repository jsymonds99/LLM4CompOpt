import os
import openai
import time
from my_secrets import my_secrets
openai_key = my_secrets.get('openai_key')
openai.api_key = openai_key   
os.environ["OPENAI_API_KEY"] = openai_key

from openai import OpenAI
client = OpenAI()

import google.generativeai as genai
genai.configure(api_key=my_secrets.get('gemini_key'))
model = genai.GenerativeModel('gemini-1.5-pro-latest')

def prompt_gpt4(prompt):
    completion = client.chat.completions.create(
        model="gpt-4-turbo",
        messages=[
            {"role": "system", "content": "You are an expert in LLVM Optimization. You are now trying to summarize some suggestions by the LLMs and GPT 4 using different prompts."},
            {"role": "user", "content": prompt}
        ]
    )
    return completion.choices[0].message.content

example_summary = """
GEMINI PROMPT 1: -always-inline -instcombine -aggressive-instcombine -simplifycfg -constmerge -sroa -mem2reg -gvn -indvars -licm -loop-unroll -loop-simplify -dce -adce -deadargelim -globaldce -strip -strip-dead-debug-info -ipsccp -function-attrs -jump-threading -tailcallelim 

GEMINI PROMPT 2: -mem2reg -dce -constfold -loop-invariant-code-motion -loop-unswitching -loop-strength-reduction -basicaa -loop-vectorize -inline -tailcallelim -PGO -loop-unrolling -loop-fusion -loop-distribution 

GPT-4 PROMPT 1: -mem2reg -simplifycfg -instcombine -gvn -loop-unroll -licm -sccp -inline -dce -tailcallelim -reassociate 

GPT-4 PROMPT 2: -mem2reg -dce -instcombine -loop-unroll -inline -scalarrepl -gvn -constprop -simplifycfg
"""

# to_include = ['hw2perf_', 'queens_', 'pi_', 'towers_']
to_include = ['lowercase_']

# for every txt file in results folder, read the content and summarize it
for file in os.listdir("results"):
    if (any([x in file for x in to_include]) and file.endswith("_responses.txt")):
    # if file.endswith("_responses.txt"):
        print("Summarizing: ", file)
        # change file from _responses.txt to _summaries.txt
        new_name = file.replace("_responses.txt", "_summaries.txt")

        with open(f"results/{file}", "r") as file:
            content = file.read()
            summary = prompt_gpt4(f"Summarize the contents of each of the 6 prompts (3 from Gemini and 3 from GPT-4) respectively into the commands they suggest, as one single line. For example:\n{example_summary} \n\n{content}")
            with open(f"results/summaries/{new_name}", "w") as new_file:
                new_file.write(summary)
            
        time.sleep(30)

# for every txt file in results folder, read the content and summarize it
for file in os.listdir("results"):
    if (any([x in file for x in to_include]) and file.endswith("_ablation.txt")):
    # if file.endswith("ablation.txt"):
        print("Summarizing: ", file)
        new_name = file.replace("_ablation.txt", "_ablation_summaries.txt")

        with open(f"results/{file}", "r") as file:
            content = file.read()
            # ablation summary: 
            summary = prompt_gpt4(f"Summarize the contents of each of the 4 prompts (2 from Gemini and 2 from GPT-4) respectively into the commands they suggest, as one single line. For example:\n{example_summary} \n\n{content}")
            with open(f"results/summaries/{new_name}", "w") as new_file:
                new_file.write(summary)
            
        time.sleep(30)

