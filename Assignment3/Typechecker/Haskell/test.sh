arr=(good bad)

stack build

for i in ${arr[@]}; do
    echo "$i files that passed:"
    for f in ./test/$i/*.cc; do
        OUTPUT="$(stack exec CPPTypeChecker-exe $f)"
        if echo "$OUTPUT" | grep -q "OK"; then
            echo -e "\t"$f
        fi
    done
done

