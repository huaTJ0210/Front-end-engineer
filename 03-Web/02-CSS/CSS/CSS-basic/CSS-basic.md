### CSS

#### 1、CSS简介

> CSS是样式表，用来美化HTML及进行页面布局

#### 2、选择器

##### 2.1 基础选择器

> CSS中的选择器作用是根据需求将页面中的元素选择出来

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <style>
      /*（1）标签选择器:html标签【元素】*/
      p {
        color: red;
      }
      /*(2) 类选择器:使用.定义类名*/
      .red {
        color: green;
      }
      /*(3) id选择器：*/
      #nav {
        color: blue;
      }
      /*(4) 通配符选择器 采用（*） */
    </style>
  </head>
  <body>
    <p>段落字体显示红色</p>
    <div class="green">将div中的字体修改为green</div>
    <div id="nav">导航栏设置blue</div>
  </body>
</html>
```

##### 2.2 复合选择器

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <style>
      /*(1)包含选择器：某元素内部指定的所有元素*/
      .first p {
        color: red;
      }
      /*（2）并集选择器:一次选择多个元素*/
      .first,
      #nav {
        font-size: 16px;
      }
      /*（3）后代选择器：只选择指定元素下的儿子元素*/
      ul > li {
        font-size: 20px;
      }
      /*（4）伪类选择器*/
      a:hover{/*鼠标悬停时候的状态*/
        color: aqua;
        text-decoration: underline;
      }
      input:focus{
        background-color: blueviolet;
      }
    </style>
  </head>
  <body>
    <div class="first">
      <p>包含选择器</p>
    </div>
    <p>段落字体显示红色</p>
    <div class="green">将div中的字体修改为green</div>
    <div id="nav">
      <p>1</p>
      <p>2</p>
    </div>
    <ul>
      <li>ul中的li</li>
    </ul>
    <a href="www.baidu.com">百度</a>
    <input type="text">
  </body>
</html>

```

##### 2.3 CSS伪类和CSS伪元素

> 向某些选择器添加特殊效果

```css
a:link{
  color:black;
}
a:hover{
  color:red
}

p:first-child{
  /*向元素的第一个子元素p[html中第一个p元素标签]*/
}

p:first-letter{
  /*向文本的第一个字母添加样式*/
}
p:first-line{
  /*向文本的首行添加特殊样式*/
}
p:before{
  /*在元素前添加内容*/
  content:url('logo.gif');
}
p:after{
  /*在元素后添加内容*/
}
```

#### 3、CSS的元素显示模式

##### 3.1 显示模式种类

> + 块级元素：一行只能放置一个块级元素，可以设置宽高
> + 行内元素：一行可以放置多个行内元素，不可以直接设置宽高
> + 行内块元素：同行内元素特性，但是可以设置宽高；

##### 3.2 显示模式转换

```css
a {
  display:block; /*将行内元素修改为块级元素，使得宽和高的设置生效，单独一行显示*/
  width:300px;
  height:100px;
}
/*将行级元素修改为行块级元素*/
a {
  display:inline-block; /*将行内元素修改为行块级元素，使得宽和高的设置生效*/
  width:300px;
  height:100px;
}
```

#### 4、CSS的三大特性

##### 4.1 层叠性

```css
p{
  color:red;
}
/*如果出现重复定义会覆盖*/
p{
  color:blue;/*设置的颜色会覆盖red的设置*/
}
```

##### 4.2 继承性

```html
<html>
  <head>
    <style>
      div{
        color:red;
      }
    </style>
  </head>
  <body>
    <div>
      <p>
        p中的文本颜色会继承div中的设置
      </p>
    </div>
  </body>
</html>
```

##### 4.3 权重（优先级）

> 1. 继承或者通配符（*）权重： 0，0，0，0
>
> 2. 元素选择器权重：0，0，0，1
>
> 3. 类选择器权重：0，0，1，0
>
> 4. id选择器权重：0，1，0，0
>
> 5. 元素设置style权重：1，0，0，0
>
>    权重高的CSS样式会覆盖权重低设置的样式

#### 5、CSS盒子模型

> CSS 盒子模型 (Box Model) 规定了元素框处理：元素内容、内边距、边框和外边距的方式。

##### 5.1 内边距(padding)

> 控制内容与边框之间的距离

```html

```

##### 5.2 边框(border)

> 盒子的边框

##### 5.3 外边距(margin)

> 1. 控制盒子与盒子之间的距离
> 2. 开发中经常遇到的问题：（1）垂直外边距合并：解决方式只设置一个盒子的外边距 （2）嵌套块元素塌陷：解决方式设置父元素的上边框或者内边距或者设置父元素的overflow:hidden
>
