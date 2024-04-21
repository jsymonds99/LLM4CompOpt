sh ../run.sh ${1} 2> ${1}_profile_data.txt

clang -S -emit-llvm ${1}.c
mv ${1}.ll ${1}_unoptomized.ll

clang -S -Oz -emit-llvm ${1}.c
mv ${1}.ll ${1}_oz.ll

echo "Unoptimized instruction count: " > ${1}_extra_stats.txt
#grep -oP '%\K[0-9]+(?= =)' ${1}_oz.ll | wc -l >> ${1}_extra_stats.txt
grep -E '^\s*(%|[0-9]+|call|ret|load|store|br|define|tail)\b' ${1}_unoptomized.ll | wc -l  >> ${1}_extra_stats.txt
echo "Optimized instruction count: " >> ${1}_extra_stats.txt
#grep -oP '%\K[0-9]+(?= =)' ${1}_unoptomized.ll | wc -l >> ${1}_extra_stats.txt
grep -E '^\s*(%|[0-9]+|call|ret|load|store|br|define|tail)\b'  ${1}_oz.ll | wc -l >> ${1}_extra_stats.txt

# clean up
rm correct_output default.profraw fplicm_output ${1}_fplicm ${1}_no_fplicm ${1}_prof ${1}.bc
rm ${1}.fplicm.bc ${1}.ls.bc ${1}.ls.prof.bc ${1}.profdata ${1}.profdata.bc

