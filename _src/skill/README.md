# 一些小技巧

因为还没有确定怎么归类先放这里吧

## windows

### 解决 文件名过长/文件夹路径过长 无法删除文件夹
    
[百度百科 - robocopy](http://baike.baidu.com/view/1777236.htm)

    # 要删除的文件夹名为 long
    > mkdir tmp
    > robocopy /MIR tmp long
    > rmdir long tmp




