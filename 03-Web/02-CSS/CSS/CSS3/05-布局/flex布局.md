### 开发布局场景

#### 1、九宫格布局方式

> 需求：一行排列3个，中间间距相等，居左对齐

![屏幕快照 2020-07-16 下午3.23.42](../res/屏幕快照 2020-07-16 下午3.23.42.png)

```css
.illegal-images{
    /*容器布局*/ 
      display: flex;
       flex-wrap:wrap;
      flex-direction: row;
 }
  .illegal-images img{
    /*动态计算每个item的宽度*/ 
      width: calc((100% - 16px * 4) / 3 );
      height: 72px;
      margin-top: 8px;
      margin-left: 16px;

 }
```

