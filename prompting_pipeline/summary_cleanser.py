import os

# read all the results/summaries files and remove flags that ARE NOT in the system prompt

# list of all transformation pass flags
transformation_pass_flags = [
    "-adce",
    "-always-inline",
    "-argpromotion",
    "-block-placement",
    "-break-crit-edges",
    "-codegenprepare",
    "-constmerge",
    "-dce",
    "-deadargelim",
    "-dse",
    "-function-attrs",
    "-globaldce",
    "-globalopt",
    "-gvn",
    "-indvars",
    "-inline",
    "-instcombine",
    "-aggressive-instcombine",
    "-internalize",
    "-ipsccp",
    "-jump-threading",
    "-lcssa",
    "-licm",
    "-loop-deletion",
    "-loop-extract",
    "-loop-reduce",
    "-loop-rotate",
    "-loop-simplify",
    "-loop-unroll",
    "-loop-unroll-and-jam",
    "-lower-global-dtors",
    "-lower-atomic",
    "-lower-invoke",
    "-lower-switch",
    "-mem2reg",
    "-memcpyopt",
    "-mergefunc",
    "-mergereturn",
    "-partial-inliner",
    "-reassociate",
    "-rel-lookup-table-converter",
    "-reg2mem",
    "-sroa",
    "-sccp",
    "-simplifycfg",
    "-sink",
    "-simple-loop-unswitch",
    "-strip",
    "-strip-dead-debug-info",
    "-strip-dead-prototypes",
    "-strip-debug-declare",
    "-strip-nondebug",
    "-tailcallelim"
]

# go through each summaries file
for filename in os.listdir("results/summaries"):
    with open(f"results/summaries/{filename}", "r") as file:
        # check if file name ends with ablation_summaries.txt
        ablation = False
        if "ablation_summaries.txt" in filename:
            ablation = True

        # for every row in the file, we split words by space and then check if they're in the transformation_pass_flags list
        content = file.read()
        lines = content.split("\n")
        new_lines = []
        # first keep everything before the ":"
        for line in lines:
            full_line = ""
            if ":" in line:
                colon_split = line.split(":")
                if (len(colon_split) > 0): line = colon_split[1]
                if (ablation): full_line = colon_split[0] + " (ablation):"
                else: full_line = colon_split[0] + ":"
            # then split by space
            words = line.split(" ")

            for word in words:
                if word in transformation_pass_flags:
                    full_line += word + " "
            new_lines.append(full_line)
        with open(f"results/clean_summaries/{filename}", "w") as new_file:
            new_file.write("\n".join(new_lines))