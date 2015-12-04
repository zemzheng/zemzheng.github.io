# CSS 居中显示

## 先来个基本结构

    <style>
        #temp-box{ border:1px solid blue;width:100%;height:200px; }
        #temp-content{ border:1px solid #ccc; width:100px;height:30px;}
    </style>
    <div id="temp-box">
        <div id="temp-content">wording</div>
    </div>

<style>
    #temp-box{ border:1px solid blue;width:100%;height:200px; }
    #temp-content{ border:1px solid #ccc; width:100px;height:30px;}
</style>

<div id="temp-box">
    <div id="temp-content">wording</div>
</div>


## 水平居中

可选方案 

* text-align
* margin auto
* flexbox

### text-align

行内元素(inline)在父级 text-align 作用下就居中了

    <style>
        .temp-box-v-1{ text-align:center; }
        .temp-content-v-1{ display:inline-block; }
    </style>
    <div id="temp-box" class="temp-box-v-1">
        <div id="temp-content" class="temp-content-v-1">wording</div>
    </div>

<style>
    .temp-box-v-1{ text-align:center; }
    .temp-content-v-1{ display:inline-block; }
</style>

<div id="temp-box" class="temp-box-v-1">
    <div id="temp-content" class="temp-content-v-1">wording</div>
</div>

### margin auto

块级元素(block)利用 margin auto 来自动撑开

    <style>
        .temp-content-v-2{ margin:0 auto; }
    </style>
    <div id="temp-box" class="temp-box-v-2">
        <div id="temp-content" class="temp-content-v-2">wording</div>
    </div>

<style>
    .temp-content-v-2{ margin:0 auto; }
</style>

<div id="temp-box" class="temp-box-v-2">
    <div id="temp-content" class="temp-content-v-2">wording</div>
</div>

### flexbox

利用 flexbox 属性

    <style>
        .temp-box-v-3{ display:flex;justify-content: center; }
    </style>
    <div id="temp-box" class="temp-box-v-3">
        <div id="temp-content" class="temp-content-v-3">wording</div>
    </div>

<style>
    .temp-box-v-3{ display:flex;justify-content: center; }
</style>

<div id="temp-box" class="temp-box-v-3">
    <div id="temp-content" class="temp-content-v-3">wording</div>
</div>

## 垂直居中

可选方案 

* line-height
* table vertical-align middle
* flexbox

### line-height

行内元素(inline)在 line-height 作用下撑开垂直距离

    <style>
        .temp-content-s-1{ line-height:200px; display:inline-block; }
    </style>
    <div id="temp-box" class="temp-box-s-1">
        <div id="temp-content" class="temp-content-s-1">wording</div>
    </div>

<style>
    .temp-content-s-1{ line-height:200px; display:inline-block; }
</style>

<div id="temp-box" class="temp-box-s-1">
    <div id="temp-content" class="temp-content-s-1">wording</div>
</div>

### table vertical-align middle

table元素的 vertical-align 属性设置为 middle

    <style>
        .temp-box-s-2{ display:table;}
        .temp-content-s-2{ display:table-cell; vertical-align:middle;}
    </style>
    <div id="temp-box" class="temp-box-s-2">
        <div id="temp-content" class="temp-content-s-2">wording</div>
    </div>

<style>
    .temp-box-s-2{ display:table;}
    .temp-content-s-2{ display:table-cell; vertical-align:middle;}
</style>

<div id="temp-box" class="temp-box-s-2">
    <div id="temp-content" class="temp-content-s-2">wording</div>
</div>

### flexbox

利用 flexbox 属性

    <style>
        .temp-box-s-3{ display: flex; align-items: center; }
    </style>
    <div id="temp-box" class="temp-box-s-3">
        <div id="temp-content" class="temp-content-s-3">wording</div>
    </div>

<style>
    .temp-box-s-3{ display: flex; align-items: center; }
</style>

<div id="temp-box" class="temp-box-s-3">
    <div id="temp-content" class="temp-content-s-3">wording</div>
</div>
