clang -emit-llvm -S ${1}.c -Xclang -disable-O0-optnone -o ${1}_unoptimized.ll
echo "Unoptimized instruction count: " > ${1}_extra_stats.txt
grep -E '^\s*(%|[0-9]+|call|ret|load|store|br|define|tail)\b' ${1}_unoptimized.ll | wc -l  >> ${1}_extra_stats.txt


while IFS= read -r line; do
    text_after_colon=$(echo "$line" | awk -F ':' '{print $2}')

    if [ -n "$text_after_colon" ]; then
        passlist=$(echo $text_after_colon | sed -E 's/[[:space:]]*-([^[:space:]]+),?/\1,/g; s/^,//')
        passlist=${passlist%??}
        trial=$(echo $line | awk '{print $1$2$3}' | sed 's/://g')
        # echo "$passlist"
        echo "$trial"
        
        echo "$trial instruction count: " >> ${1}_extra_stats.txt
        opt -S -passes="$passlist" ${1}_unoptimized.ll -o ${1}_${trial}.ll
        grep -E '^\s*(%|[0-9]+|call|ret|load|store|br|define|tail)\b' ${1}_${trial}.ll | wc -l  >> ${1}_extra_stats.txt


    fi
done < ${1}_summaries.txt

echo "-Oz instruction count: " >> ${1}_extra_stats.txt
opt -S -Oz ${1}_unoptimized.ll -o ${1}_oz.ll
grep -E '^\s*(%|[0-9]+|call|ret|load|store|br|define|tail)\b' ${1}_oz.ll | wc -l  >> ${1}_extra_stats.txt
