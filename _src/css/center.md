# CSS 居中显示

## 水平居中

可选方案 

* text-align
* margin auto
* position absolute right + left 0
* flexbox

### text-align

行内元素(inline)在父级 text-align 作用下就居中了

    <style>
        #temp-box-1{ text-align:center; border:1px solid blue;padding:5em; }
        #temp-content-1{ display:inline-block; border:1px solid #ccc;}
    </style>
    <div id="temp-box-1">
        <div id="temp-content-1">wording</div>
    </div>

<style>
#temp-box-1{ text-align:center; border:1px solid blue;padding:5em; }
#temp-content-1{ display:inline-block; border:1px solid #ccc;}
</style>

<div id="temp-box-1">
    <div id="temp-content-1">wording</div>
</div>

### margin auto

块级元素(block)利用 margin auto 来自动撑开

    <style>
        #temp-box-2{ border:1px solid blue;min-width:250px; padding:5em 0; }
        #temp-content-2{ width:200px; margin:0 auto; border:1px solid #ccc;}
    </style>
    <div id="temp-box-2">
        <div id="temp-content-2">wording</div>
    </div>

<style>
#temp-box-2{ border:1px solid blue;min-width:250px; padding:5em 0; }
#temp-content-2{ width:200px; margin:0 auto; border:1px solid #ccc;}
</style>

<div id="temp-box-2">
    <div id="temp-content-2">wording</div>
</div>

