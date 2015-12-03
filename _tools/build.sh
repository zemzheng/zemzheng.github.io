
root="`dirname $0`/.."
cd $root;
if [ `git status -sb | grep -e '\(_src\|_tool\)' | wc -l` -gt 0 ]; then
    gitbook build _src _output
    cp _output/* . -r

    echo ""
    echo -e "\e[32;40m"
    echo "Build DONE@[`date +'%Y-%m-%d %H:%M:%S'`]";
    echo -e "\e[0m"
fi
cd -
