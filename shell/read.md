# read

## 等待输入

### Example

    # 让用户输入一个字符来表示是否进行某个操作
    # http://stackoverflow.com/questions/1885525/how-do-i-prompt-a-user-for-confirmation-in-bash-script
    #
    read -p "Are you sure? " -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        # do dangerous stuff
    fi
    

### 参数说明

    -n <num> 可以输入多少字符
    
