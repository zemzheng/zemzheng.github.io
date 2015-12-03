

root="`dirname $0`/.."

cd $root;

if [ `git status -sb | sed '1d' | wc -l` -gt 0 ]; then
    echo -e "\e[31m"
    echo "Check and submit before build";
    echo -e "\e[0m"
    git status -sb
    exit
fi

git checkout master
gitbook build _src _output
cp _output/* . -r

if [ `git status -sb | sed '1d' | wc -l` -gt 0 ]; then
    git add -A
    git commit -m "build @[`date +'%Y-%m-%d %H:%M:%S'`]"
fi

# git checkout -
# cd -
