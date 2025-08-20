# 学术网站完整配置和使用指南

> 📍 **文档位置**: `new-blog-dir/COMPLETE_WEBSITE_GUIDE.md`

## 🎯 网站概述

这是一个基于Hugo Blox Builder框架的学术个人网站，包含以下功能：
- 个人简介展示
- 发表文章管理  
- 新闻动态
- 项目展示
- 博客系统
- 链接收藏

## 📁 目录结构

```
new-blog-dir/
├── content/                    # 网站内容
│   ├── _index.md              # 首页配置
│   ├── authors/admin/         # 个人信息
│   │   ├── _index.md          # 个人资料
│   │   └── avatar.jpg         # 🖼️ Bio头像 (主要)
│   ├── blog/                  # 博客文章
│   ├── news/                  # 新闻页面
│   ├── publications/          # 发表文章页面
│   ├── post/                  # 新闻内容
│   ├── publication/           # 发表文章内容
│   ├── project/               # 项目内容
│   ├── experience.md          # 经历页面
│   ├── projects.md            # 项目总览
│   └── links.md               # 链接页面
├── assets/media/icons/
│   └── icon.jpg               # 🖼️ 网站图标源 (打字机+浏览器)
├── static/media/icons/
│   └── icon.jpg               # 🖼️ 网站图标 (静态访问)
├── config/_default/           # 网站配置
│   ├── hugo.yaml              # 基本设置
│   ├── menus.yaml             # 导航菜单
│   └── params.yaml            # 参数配置
└── layouts/partials/hooks/head-end/
    ├── favicon.html           # 浏览器图标配置
    └── typewriter.html        # 打字机效果
```

## 🖼️ 图片配置 (最重要)

### 图片用途分配

| 用途 | 文件位置 | 要求 | 显示位置 |
|------|----------|------|----------|
| **Bio头像** | `content/authors/admin/avatar.jpg` | 正方形, 512px+ | 首页bio、About页 |
| **打字机图标** | `assets/media/icons/icon.jpg` | 正方形, 512px+ | 左上角导航栏 |
| **浏览器图标** | `assets/media/icons/icon.jpg` | 同上 | 浏览器标签页 |

### 更换图片步骤

#### 更换Bio头像 (个人简介页面)
```bash
# 替换个人头像
cp your-new-photo.jpg content/authors/admin/avatar.jpg
```

#### 更换网站图标 (打字机+浏览器标签页)
```bash
# 替换网站图标
cp your-icon.jpg assets/media/icons/icon.jpg
cp your-icon.jpg static/media/icons/icon.jpg

# 清理缓存
rm -rf resources/_gen/

# 重新生成
hugo server -D
```

## 📝 内容管理

### 1. 个人信息修改

**文件**: `content/authors/admin/_index.md`

```yaml
---
title: "你的姓名"
authors: [admin]
superuser: true
role: 你的职位/角色

organizations:
  - name: 你的机构
    url: "https://example.com/"

bio: 简短的个人介绍

interests:
  - 研究兴趣1
  - 研究兴趣2

education:
  courses:
    - course: 学位名称
      institution: 学校名称
      year: 年份

social:
  - icon: envelope
    icon_pack: fas
    link: 'mailto:your-email@example.com'
  - icon: google-scholar
    icon_pack: ai
    link: https://scholar.google.com/your-profile
  - icon: github
    icon_pack: fab
    link: https://github.com/your-username
---

详细的个人介绍...
```

### 2. 导航菜单配置

**文件**: `config/_default/menus.yaml`

```yaml
main:
  - name: Bio
    url: /
    weight: 10
  - name: Publications
    url: /publications/
    weight: 20
  - name: Recent News
    url: /news/
    weight: 25
  - name: Experience
    url: experience/
    weight: 30
  - name: Projects
    url: projects/
    weight: 40
  - name: Blog
    url: /blog/
    weight: 50
  - name: Links
    url: /links/
    weight: 60
```

**添加新导航项**:
```yaml
  - name: 新页面名称
    url: /new-page/
    weight: 70
```

### 3. 打字机效果配置

**文件**: `layouts/partials/hooks/head-end/typewriter.html`

修改第6行的名字列表：
```javascript
names: ['Yituo', '何弈拓', 'HaveYouTall', 'tty5'], // 在这里修改名字
```

配置参数：
```javascript
typing_speed: 100,    // 打字速度 (毫秒)
deleting_speed: 50,   // 删除速度 (毫秒)  
pause_duration: 2000  // 停留时间 (毫秒)
```

## 📰 内容发布

### 1. 添加新闻 (Recent News)

**位置**: `content/post/your-news-title/index.md`

```bash
# 创建新闻目录
mkdir content/post/latest-research-update/

# 创建内容文件
cat > content/post/latest-research-update/index.md << 'EOF'
---
title: "最新研究进展"
date: '2024-08-20'
summary: '我们的论文被顶级会议接收了！'
authors:
  - admin
tags:
  - Research
  - News
---

详细的新闻内容...
EOF
```

### 2. 添加发表文章 (Publications)

**位置**: `content/publication/paper-name/index.md`

```bash
# 创建发表文章目录
mkdir content/publication/my-paper/

# 创建内容文件
cat > content/publication/my-paper/index.md << 'EOF'
---
title: "论文标题"
authors:
- admin
- 合作者姓名

date: "2024-08-20T00:00:00Z"
doi: "10.1000/journal.doi"

publication_types: ["2"]  # 1=会议, 2=期刊, 3=预印本

publication: "期刊或会议名称"
publication_short: "简称"

abstract: "论文摘要..."
summary: "论文简要总结"

tags:
- Research
- Machine Learning

featured: true  # 是否为精选文章

links:
- name: PDF
  url: 'paper.pdf'

url_pdf: 'paper.pdf'
url_code: 'https://github.com/your-username/code-repo'
---

论文的详细介绍...
EOF

# 添加PDF文件
cp your-paper.pdf content/publication/my-paper/paper.pdf
```

### 3. 添加博客文章

**位置**: `content/blog/blog-title/index.md`

```bash
# 创建博客目录
mkdir content/blog/my-first-blog/

# 创建内容文件
cat > content/blog/my-first-blog/index.md << 'EOF'
---
title: "博客标题"
authors:
  - admin
date: '2024-08-20'
summary: '博客摘要'
tags:
  - Tutorial
  - Research

image:
  placement: 1
  focal_point: ''
---

博客内容...

## 二级标题

可以包含：
- 代码块
- 图片
- 数学公式
- 引用

```python
def hello():
    print("Hello World!")
```

EOF

# 添加特色图片
cp your-image.jpg content/blog/my-first-blog/featured.jpg
```

### 4. 添加项目

**位置**: `content/project/project-name/index.md`

```bash
# 创建项目目录
mkdir content/project/awesome-project/

# 创建内容文件
cat > content/project/awesome-project/index.md << 'EOF'
---
title: 项目名称
summary: 项目简要描述
tags:
- 项目标签1
- 项目标签2
date: "2024-08-20T00:00:00Z"

image:
  focal_point: Smart

links:
- name: GitHub
  url: https://github.com/your-username/project
url_code: "https://github.com/your-username/project"
---

项目详细描述...
EOF

# 添加项目图片
cp project-image.png content/project/awesome-project/featured.png
```

## 🎨 页面管理

### 添加新页面

#### 方法1: 简单页面
```bash
# 创建新页面
cat > content/new-page.md << 'EOF'
---
title: "新页面标题"
date: 2024-08-20
---

页面内容...
EOF
```

#### 方法2: 复杂页面 (类似首页)
```bash
# 创建页面目录
mkdir content/new-section/

# 创建页面文件
cat > content/new-section/_index.md << 'EOF'
---
title: "页面标题"
type: landing

design:
  spacing: "6rem"

sections:
  - block: markdown
    content:
      title: '标题'
      text: |
        页面内容...
EOF
```

### 删除页面
1. 删除对应的内容文件
2. 从 `config/_default/menus.yaml` 删除导航项

## 🔧 网站配置

### 基本设置

**文件**: `config/_default/hugo.yaml`

```yaml
title: 你的网站标题
baseURL: 'https://your-username.github.io/'
```

### 主题和外观

**文件**: `config/_default/params.yaml`

```yaml
appearance:
  mode: system  # system/light/dark
  color: emerald  # 主题色

header:
  navbar:
    enable: true
    show_search: true
    show_theme_chooser: true
    logo:
      text: "显示的文字"
      filename: "media/icons/icon.jpg"  # 图标路径
```

## 🚀 网站部署

### 本地预览
```bash
cd new-blog-dir
hugo server -D
# 访问 http://localhost:1313
```

### 生成静态文件
```bash
hugo
# 文件生成到 public/ 目录
```

### GitHub Pages 部署
1. 将 `public/` 目录内容推送到 `username.github.io` 仓库
2. 或使用 GitHub Actions 自动部署

## 🔧 常见操作

### 1. 修改网站标题和描述
**文件**: `config/_default/hugo.yaml` + `config/_default/params.yaml`

### 2. 更改主题色
**文件**: `config/_default/params.yaml`
```yaml
appearance:
  color: emerald  # 可选: emerald, ocean, forest, dark, minimal等
```

### 3. 添加Google Analytics
**文件**: `config/_default/params.yaml`
```yaml
marketing:
  analytics:
    google_analytics: 'G-XXXXXXXXXX'
```

### 4. 自定义CSS
创建文件: `assets/scss/custom.scss`
```scss
// 自定义样式
.my-custom-class {
  color: #your-color;
}
```

### 5. 备份和版本控制
```bash
# 初始化git仓库
git init
git add .
git commit -m "Initial commit"

# 添加远程仓库
git remote add origin https://github.com/your-username/your-website-source.git
git push -u origin main
```

## 🛠️ 故障排除

### 图片不显示
1. 检查文件路径是否正确
2. 确认文件存在且可读
3. 清理缓存: `rm -rf resources/_gen/`

### 页面不更新
1. 检查front matter格式
2. 确认日期格式正确
3. 重新生成: `hugo server -D`

### 打字机效果不工作
1. 检查JavaScript语法
2. 查看浏览器控制台错误
3. 确认图片路径正确

## 📚 文件清单

### 必需文件
- ✅ `content/authors/admin/avatar.jpg` - Bio头像
- ✅ `assets/media/icons/icon.jpg` - 网站图标源文件
- ✅ `static/media/icons/icon.jpg` - 网站图标静态文件

### 配置文件
- ✅ `config/_default/hugo.yaml` - 基本配置
- ✅ `config/_default/menus.yaml` - 导航配置
- ✅ `config/_default/params.yaml` - 参数配置
- ✅ `layouts/partials/hooks/head-end/favicon.html` - 浏览器图标
- ✅ `layouts/partials/hooks/head-end/typewriter.html` - 打字机效果

### 页面文件
- ✅ `content/_index.md` - 首页
- ✅ `content/news/_index.md` - 新闻页面
- ✅ `content/publications/_index.md` - 发表文章页面
- ✅ `content/blog/_index.md` - 博客页面
- ✅ `content/links.md` - 链接页面
- ✅ `content/experience.md` - 经历页面

## 🎯 快速开始检查单

建议按照这个顺序配置网站：

1. [ ] 替换个人头像: `content/authors/admin/avatar.jpg`
2. [ ] 替换网站图标: `assets/media/icons/icon.jpg` 和 `static/media/icons/icon.jpg`
3. [ ] 修改个人信息: `content/authors/admin/_index.md`
4. [ ] 配置打字机名字: `layouts/partials/hooks/head-end/typewriter.html`
5. [ ] 添加真实的发表文章: `content/publication/`
6. [ ] 添加新闻动态: `content/post/`
7. [ ] 修改网站标题: `config/_default/hugo.yaml`
8. [ ] 本地测试: `hugo server -D`
9. [ ] 部署到GitHub Pages

---

📍 **这个完整指南位于**: `new-blog-dir/COMPLETE_WEBSITE_GUIDE.md`

通过遵循这个指南，你可以完全掌控网站的各个方面，从内容发布到样式定制，从图片管理到部署上线。