### 1、初始化项目

#### 1.1 项目初始化

```shell
# 引入项目模板框架
```

#### 1.2 代码规范

> ESLint 

#### 1.3 引入组件库

> ElementUI等基础组件库

```shell
npm i element-ui -S # 安装组件库
```

#### 1.4 VSCode自动保存与ESLint冲突

> VSCode安装一下插件
>
> eslint
>
> Vetur
>
> Prettier

#####   将下面配置写到VScode setting.json 里面【重复的去除即可】

```json
  
"eslint.codeActionsOnSave": true, // 每次保存的时候将代码按eslint格式进行修复
    "editor.codeActionsOnSave": {
       "source.fixAll.eslint": true
    },
    "editor.formatOnSave": true,
    "editor.formatOnType": true,
    "eslint.nodePath": "",
    "prettier.eslintIntegration": true, //让prettier使用eslint的代码格式进行校验
    "prettier.semi": false, //去掉代码结尾的分号
    "prettier.singleQuote": true, //使用带引号替代双引号
    "javascript.format.insertSpaceBeforeFunctionParenthesis": true, //让函数(名)和后面的括号之间加个空格
    "vetur.format.defaultFormatter.html": "js-beautify-html", //格式化.vue中html
    "vetur.format.defaultFormatter.js": "vscode-typescript", //让vue中的js按编辑器自带的ts格式进行格式化
    "vetur.format.defaultFormatterOptions": {
        "js-beautify-html": {
            "wrap_attributes": "force-aligned" //属性强制折行对齐
        }
    },
```

