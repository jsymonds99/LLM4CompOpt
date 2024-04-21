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

# read the system prompt from /data/system_prompt.txt
def read_system_prompt():
    with open("data/system_prompt.txt", "r") as file:
        system_prompt = file.read()
    return system_prompt

def prompt_gpt4(prompt, with_system=True):
    completion = client.chat.completions.create(
        model="gpt-4-turbo",
        messages=[
            {"role": "system", "content": read_system_prompt() if with_system else ""},
            {"role": "user", "content": prompt}
        ]
    )
    return completion.choices[0].message.content

def double_prompt_gpt4(prompt1, response1, prompt2):
    completion = client.chat.completions.create(
        model="gpt-4-turbo",
        messages=[
            {"role": "system", "content": read_system_prompt()},
            {"role": "user", "content": prompt1},
            {"role": "assistant", "content": response1},
            {"role": "user", "content": prompt2},
        ]
    )
    return completion.choices[0].message.content

def prompt_gemini(prompt, second_prompt=None, with_system=True):
    chat = model.start_chat(history=[])
    return_text = ""
    if (with_system): response = chat.send_message(read_system_prompt() + "\n\n" + prompt)
    else: response = chat.send_message(prompt)
    return_text += response.text
    if second_prompt:
        response = chat.send_message(second_prompt)
        return_text += response.text
    return return_text

def write_response_to_file(gem1, gem2, gem3, gpt1, gpt2, gpt3, folder):
    with open(f"results/{folder}_responses.txt", "w") as file:
        file.write(f"GEMINI PROMPT 1:\n{gem1}\n\nGEMINI PROMPT 2:\n{gem2}\n\nGEMINI PROMPT 3:\n{gem3}\n\n-----------------------------\n\nGPT-4 PROMPT 1:\n{gpt1}\n\nGPT-4 PROMPT 2:\n{gpt2}\n\nGPT-4 PROMPT 3:\n{gpt3}")

def write_ablation_to_file(gem1, gem2, gpt1, gpt2, folder):
    with open(f"results/{folder}_ablation.txt", "w") as file:
        file.write(f"GEMINI PROMPT 1:\n{gem1}\n\nGEMINI PROMPT 2:\n{gem2}\n\n-----------------------------\n\nGPT-4 PROMPT 1:\n{gpt1}\n\nGPT-4 PROMPT 2:\n{gpt2}")

# go through every folder in /data and read the <foldername>.c and <foldername>_profile_data.txt files
for folder in os.listdir("data"):
    # if folder in ["bubblesort", "custom1", "custom2", "custom3", "hw2corr", "hw2perf", "lowercase", "pi", "queens"]:
    #     continue
    if os.path.isdir("data/" + folder):
        print(folder)
        # # read the c code
        # with open("data/" + folder + "/" + folder + ".c", "r") as file:
        #     c_code = file.read()
        # read the unoptimized LLVM IR code
        with open("data/" + folder + "/" + folder + "_unoptomized.ll", "r") as file:
            c_code = file.read()
        # read the profile data
        with open("data/" + folder + "/" + folder + "_profile_data.txt", "r") as file:
            profile_data = file.read()

        # PROMPTING!
        # Prompt 1
        prompt1 = f"Given the profile data presented below, suggest efficient compiler optimization passes for the associated LLVM IR code:\n{c_code} \n\nPROFILE DATA:\n{profile_data}"
        # Prompt 2
        prompt2 = f"Consider the code snippet and analyze it. Identify its inefficiencies first. Code snippet:\n{c_code}"
        prompt2part2 = "Given the inefficiencies you identified, can you provide a detailed explanation of how to optimize the most significant one/two using LLVM transformation passes?"
        # Prompt 3
        prompt3 = f"Explain in English your train of thought while optimizing the following LLVM IR code:\n{c_code}. \n\nYou should clearly state why you choose certain compiler transformation passes over others."

        # Generate responses
        response1 = prompt_gemini(prompt1)
        response3 = prompt_gemini(prompt3)

        # Generate responses using GPT-4
        gpt_response1 = prompt_gpt4(prompt1)
        gpt_response3 = prompt_gpt4(prompt3)

        # wait 90 seconds before sending the next request
        time.sleep(90)

        # generate prompt 2
        response2 = prompt_gemini(prompt2, prompt2part2)
        gpt_response2 = prompt_gpt4(prompt2)
        gpt_response2part2 = double_prompt_gpt4(prompt2, gpt_response2, prompt2part2)

        # write responses to file
        write_response_to_file(response1, response2, response3, gpt_response1, gpt_response2part2, gpt_response3, folder)

        time.sleep(70)

        # ABLATION STUDY
        prompt0 = f"Suggest efficient compiler optimization passes for the associated LLVM IR code:\n{c_code}"

        response0 = prompt_gemini(prompt0)
        gpt_response0 = prompt_gpt4(prompt0)

        response0_no_system = prompt_gemini(prompt0, with_system=False)
        gpt_response0_no_system = prompt_gpt4(prompt0, with_system=False)

        write_ablation_to_file(response0, response0_no_system, gpt_response0, gpt_response0_no_system, folder)

        time.sleep(90)





