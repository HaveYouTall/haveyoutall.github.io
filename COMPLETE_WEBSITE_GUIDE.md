# 学术网站完整配置和使用指南

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
│   └── icon.png               # 🖼️ 网站图标源 (打字机+浏览器)
├── config/_default/           # 网站配置
│   ├── hugo.yaml              # 基本设置
│   ├── menus.yaml             # 导航菜单
│   └── params.yaml            # 参数配置
└── layouts/partials/hooks/head-end/
    ├── favicon.html           # 浏览器图标配置
    └── typewriter.html        # 打字机效果
    ...
```

## 🖼️ 图片配置 (最重要)

### 图片用途分配

| 用途 | 文件位置 | 要求 | 显示位置 |
|------|----------|------|----------|
| **Bio头像** | `content/authors/admin/avatar.jpg` | 正方形, 512px+ | 首页bio、About页 |
| **打字机图标** | `assets/media/icons/icon.png` | 正方形, 512px+ | 左上角导航栏 |
| **浏览器图标** | `assets/media/icons/icon.png` | 同上 | 浏览器标签页 |

> NOTE: 其中浏览器图标通过 `layouts/partials/hooks/head-end/favicon.html` 文件可以修改选用的图片目录。
> 
> 例如修改 `{{ $icon := resources.Get "media/icons/icon.png" }}` 的路径可以修改动态生成的图片，其查找路径在 `assets/media/icons/icon.png`.
>
> ~~也可以修改后面的 `<link rel="icon" type="image/png" sizes="32x32" href="/media/icons/favicon-32x32.png">` 等路径，这些的查找路径是 `static/media/icons/icon.png`. (但是删除上面的动态配置之后进行测试后面的内容好像不起作用，还需要进一步研究)~~
>
> ~~当然最终动态的网页都是在 public 目录下找的，例如 `public/media/icons/icon.png`~~
>
> NOTE 2: 打字机图标通过 `layouts/partials/hooks/head-end/typewriter.html` 文件中的 `iconImg.src = '/media/icons/icon.png';` 内容进行修改，文件的查找路径是 `assets/media/icons/icon.png`

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
names: ['Yituo', 'HaveYouTall', 'tty5'], // 在这里修改名字
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

### 2. 添加发表文章 (Publications) - 详细指南

**位置**: `content/publication/paper-name/index.md`

#### 创建新Publication的完整模板
```bash
# 创建发表文章目录
mkdir content/publication/my-paper/

# 创建内容文件
cat > content/publication/my-paper/index.md << 'EOF'
---
title: "你的论文标题"
authors:
- admin                    # 使用admin表示自己
- "合作者姓名"
author_notes:
- "第一作者"               # 可选：作者注释
- "通讯作者"

date: "2024-01-01T00:00:00Z"
publishDate: "2024-01-01T00:00:00Z"  # 页面发布日期
doi: "10.1000/xxxx"        # DOI号码

# 发表类型 - 使用CSL标准
publication_types: ["article-journal"]  # 期刊文章
# 其他类型：
# ["paper-conference"]     # 会议论文
# ["chapter"]              # 书籍章节
# ["book"]                 # 书籍
# ["thesis"]               # 学位论文
# ["report"]               # 技术报告
# ["preprint"]             # 预印本

publication: "*Nature Communications*, 15(1)"    # 期刊名称（斜体用*包围）
publication_short: "Nat Commun"                  # 期刊简称

abstract: "你的论文摘要。详细描述研究背景、方法、结果和结论..."
summary: "简短总结，用于在列表中显示..."

tags:
- Machine Learning
- Computer Vision
- Deep Learning
featured: true             # 是否为重点论文（会在首页突出显示）

# 重要链接 - 所有链接都是可选的
url_pdf: 'https://arxiv.org/pdf/xxxx.pdf'          # PDF链接（arXiv或期刊）
url_code: 'https://github.com/your-username/code'   # 代码仓库链接
url_dataset: 'https://doi.org/xxxx'                # 数据集链接
url_poster: '/uploads/poster.pdf'                   # 海报链接（放在static目录）
url_slides: '/uploads/slides.pdf'                   # 演示文稿链接
url_video: 'https://youtube.com/watch?v=xxx'        # 视频链接
url_source: 'https://nature.com/articles/xxx'       # 期刊源链接

# 自定义链接 - 可添加任意链接
links:
- name: "Supplementary"
  url: "/uploads/supplementary.pdf"
  icon_pack: fas
  icon: file-pdf
- name: "Bibtex"
  url: "/publication/my-paper/cite.bib"
  icon_pack: fas  
  icon: quote-right

# 特色图片
image:
  caption: 'Figure 1: Overview of our proposed method'
  focal_point: "Center"     # Smart/Center/TopLeft/Top/TopRight/Left/Right/BottomLeft/Bottom/BottomRight
  preview_only: false       # false=在文章页面显示，true=只在列表预览

# 关联项目（可选）
projects: 
- internal-project        # 项目文件夹名称

# 关联幻灯片（可选）
slides: example            # 幻灯片文件夹名称
---

{{% callout note %}}
点击上方的 *Cite* 按钮可以导入文献引用信息到参考文献管理软件。
{{% /callout %}}

{{% callout note %}}
点击 *Slides* 按钮查看相关演示文稿。
{{% /callout %}}

## 论文详细描述

这里可以写论文的详细描述，包括：

### 背景介绍
研究背景和动机...

### 方法说明  
技术方法描述...

### 实验结果
实验设置和结果分析...

### 代码示例

# ```python
# # 示例代码
# def main():
#     print("Hello Research!")
# ```

### 补充材料

支持丰富的Markdown格式，包括：
- **粗体**、*斜体*
- [外部链接](http://example.com)
- 数学公式：$E = mc^2$
- 代码块、图片、表格等

{{% callout warning %}}
重要提示内容
{{% /callout %}}
EOF
```

#### 添加附件文件
```bash
# 添加PDF文件（如果不是外部链接）
cp your-paper.pdf content/publication/my-paper/paper.pdf

# 添加特色图片
cp featured-image.png content/publication/my-paper/featured.png

# 添加海报或幻灯片到static目录
cp poster.pdf static/uploads/poster.pdf
cp slides.pdf static/uploads/slides.pdf

# 添加BibTeX文件
cat > content/publication/my-paper/cite.bib << 'EOF'
@article{yourname2024paper,
  title={Your Paper Title},
  author={Your Name and Collaborator Name},
  journal={Nature Communications},
  volume={15},
  number={1},
  pages={1--10},
  year={2024},
  publisher={Nature Publishing Group}
}
EOF
```

#### Publication类型说明

| 类型 | CSL标准名称 | 说明 | 示例 |
|------|-------------|------|------|
| 期刊文章 | `article-journal` | 学术期刊发表的论文 | Nature, Science |
| 会议论文 | `paper-conference` | 会议发表的论文 | ICML, NeurIPS |
| 书籍章节 | `chapter` | 书籍中的一章 | 教科书章节 |
| 书籍 | `book` | 完整书籍 | 学术专著 |
| 学位论文 | `thesis` | 硕士/博士论文 | PhD Thesis |
| 技术报告 | `report` | 技术报告 | Tech Report |
| 预印本 | `preprint` | 未正式发表的预印本 | arXiv |

#### 链接类型说明

- `url_pdf`: PDF文件链接（优先级最高）
- `url_code`: 代码仓库（GitHub, GitLab等）
- `url_dataset`: 数据集链接（如Kaggle, Zenodo等）
- `url_poster`: 学术海报PDF
- `url_slides`: 演示幻灯片
- `url_video`: 演示视频（YouTube, Vimeo等）
- `url_source`: 期刊官方链接

#### 文件存放位置

**本地文件**（放在论文目录内）：
- `paper.pdf` - 论文PDF
- `featured.png/jpg` - 特色图片
- `cite.bib` - BibTeX引用

**静态文件**（放在`static/uploads/`）：
- 海报、幻灯片等大文件
- 补充材料
- 数据集文件

### 3. 添加Recent News (最新动态) - 详细指南

**创建新闻条目**
1. 在 `content/post/` 下创建新文件夹（如 `news-title/`）
2. 创建 `index.md` 文件：

```yaml
---
title: "新闻标题"
summary: "新闻简短摘要（显示在首页和列表中）"
date: 2024-01-01          # 发布日期
draft: false              # false=发布，true=草稿

# 特色图片（可选）
image:
  caption: '图片说明文字'
  focal_point: "Center"    # 焦点位置
  placement: 1             # 图片位置：1=文章顶部，2=文章中部，3=文章底部

authors:
  - admin

tags:
  - Research
  - News  
  - Award
  - Conference
  
categories:
  - News
---

新闻详细内容，支持完整的Markdown格式...

## 可以使用各种Markdown语法

### 列表
- 列表项1
- 列表项2
- 列表项3

### 强调
**重点内容** 和 *强调内容*

### 链接和图片
[外部链接](https://example.com)

![本地图片](image.jpg "图片说明")

### 引用块
> 这是一个引用块，可以用来引用重要信息。

### 代码
`行内代码` 或者：

# ```python
# # 代码块
# print("Hello World!")
# ```

{{% callout note %}}
这是一个提示框，可以用来突出重要信息。
{{% /callout %}}
```

### 4. 添加博客文章

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

# ```python
# def hello():
#     print("Hello World!")
# ```

EOF

# 添加特色图片
cp your-image.jpg content/blog/my-first-blog/featured.jpg
```

### 5. 添加项目 - 详细指南

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

## 🔧 网站详细配置

### 🎨 主题和外观配置

#### 基本外观设置 (`config/_default/params.yaml`)
```yaml
appearance:
  mode: system          # system/light/dark
  color: emerald        # 主题色彩：emerald/blue/green/pink/rose/slate/neutral/stone等
```

#### 网站基本信息 (`config/_default/hugo.yaml`)
```yaml
title: "你的姓名"              # 网站标题
baseURL: 'https://yoursite.com/'  # 网站URL
```

#### 网站标题和Logo设置 (`config/_default/params.yaml`)
```yaml
header:
  navbar:
    enable: true
    fixed_to_top: true
    show_search: true
    show_theme_chooser: true
    logo:
      text: "Yituo"                    # 导航栏显示文字
      filename: "icon.png"             # Logo文件名
```

#### SEO优化配置
```yaml
marketing:
  seo:
    site_type: Person
    description: '你的网站描述'
    twitter: 'your_twitter'   # Twitter用户名
  analytics:
    google_analytics: 'G-XXXXXXXXXX'  # Google Analytics ID
  verification:
    google: ''                # Google Search Console验证码
    baidu: ''                # 百度站长验证码
```

### 🧭 导航栏详细配置

#### 修改导航菜单 (`config/_default/menus.yaml`)
```yaml
main:
  - name: Bio              # 显示名称
    url: /                 # 链接地址
    weight: 10            # 排序权重（越小越靠前）
  - name: Publications
    url: /publications/
    weight: 20
  - name: Recent News
    url: /news/
    weight: 25
```

#### 增加导航项
在 `config/_default/menus.yaml` 中添加新条目：
```yaml
  - name: 新页面
    url: /new-page/
    weight: 35            # 设置合适的权重控制位置
```

#### 删除导航项
直接删除或注释掉对应的条目即可。

#### 导航栏样式调整
修改 `layouts/partials/hooks/head-end/typewriter.html` 中的CSS：
```css
.navbar-brand {
  min-width: 180px;        /* 调整最小宽度 */
  margin-left: 20px;       /* 调整左边距 */
}

.navbar {
  padding: 1rem 2rem;      /* 调整导航栏内边距 */
}
```

### 🖼️ 图片资源详细管理

#### 图片用途和位置详表
| 用途 | 文件位置 | 尺寸建议 | 说明 |
|------|----------|----------|------|
| Bio头像 | `content/authors/admin/avatar.jpg` | 400x400px | 个人简介页面显示 |
| 网站图标 | `assets/media/icons/icon.jpg` | 256x256px | 打字机效果+浏览器图标源 |
| 网站图标(静态) | `static/media/icons/icon.jpg` | 256x256px | 直接访问路径 |
| 浏览器图标 | `static/favicon.ico` | 32x32px | 浏览器标签页图标 |

#### 图片更新脚本使用
使用提供的脚本：
```bash
./update-website-images.sh bio ~/path/to/your-photo.jpg
./update-website-images.sh icon ~/path/to/your-icon.jpg
```

### ⚡ 打字机效果详细配置

#### 修改显示的名字 (`layouts/partials/hooks/head-end/typewriter.html`)
```javascript
const config = {
  names: ['Yituo', '何弈拓', 'HaveYouTall', 'tty5'], // 修改这里的名字数组
  typing_speed: 100,    // 打字速度 (毫秒)
  deleting_speed: 50,   // 删除速度 (毫秒)
  pause_duration: 2000  // 停留时间 (毫秒)
};
```

#### 调整打字机头像和样式
头像会自动加载 `/media/icons/icon.jpg`，样式可在CSS中调整：
```css
.typewriter-avatar {
  width: 32px;          /* 调整头像大小 */
  height: 32px;
  margin-right: 8px;    /* 调整与文字的间距 */
}

.typewriter-text {
  min-width: 140px;     /* 调整文字区域宽度 */
}
```

### 🏠 主页布局详细配置

#### 修改主页sections (`content/_index.md`)

```yaml
design:
  spacing: "6rem"           # 整体区块间距

sections:
  - block: resume-biography-3    # 个人简介区块
    content:
      username: admin            # 使用的用户配置
      text: ""                   # 额外文字
      button:                    # 下载简历按钮
        text: Download CV
        url: uploads/resume.pdf
    design:
      css_class: dark           # 样式类
      background:
        color: black            # 背景颜色
        image:
          filename: stacked-peaks.svg  # 背景图片
          filters:
            brightness: 1.0
          size: cover
          position: center
          parallax: false
      
  - block: collection          # 内容集合区块
    id: recentnews              # 区块ID
    content:
      title: Recent News       # 区块标题
      subtitle: ''             # 副标题
      page_type: post         # 显示的内容类型
      count: 5                # 显示数量（0=全部）
      order: desc             # 排序：desc/asc
      filters:                # 过滤条件
        author: ""
        category: ""
        tag: ""
        exclude_featured: false
    design:
      view: date-title-summary # 显示样式
      spacing:
        padding: ["4rem", 0, 0, 0]  # 内边距 [top, right, bottom, left]
```

#### 可用的区块类型
- `resume-biography-3` - 个人简介
- `collection` - 内容集合
- `markdown` - Markdown内容
- `features` - 特性展示
- `accomplishments` - 成就展示
- `contact` - 联系表单

#### 可用的显示样式（view）
- `date-title-summary` - 日期+标题+摘要
- `citation` - 引用格式（适合论文）
- `compact` - 紧凑格式
- `showcase` - 展示格式
- `masonry` - 瀑布流格式

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

## 🔧 高级配置选项

### 去除作者链接（保持作者名字显示）

#### 问题描述
在默认配置下，Hugo Blox会：
1. 为每个在 `content/authors/` 下有配置文件的作者生成链接
2. 合作作者即使没有配置文件，也会尝试生成链接（导致404）
3. 作者页面会聚合所有该作者的内容（publications、posts、blog等）

可能的问题：
- 合作作者没有对应的作者页面，点击后404
- 不希望作者名字有链接，只想显示纯文本

#### 正确的解决方案：覆盖作者显示模板

**❌ 错误方法**：注释掉 `taxonomies` 中的 `author: authors`
- 这会导致作者名字完全不显示
- 不是我们想要的效果

**✅ 正确方法**：创建本地的 `page_metadata_authors.html` partial

**步骤1**：创建本地覆盖文件

创建文件 `layouts/partials/page_metadata_authors.html`，内容如下：

```html
{{/* Display author list without links */}}

{{- $taxonomy := "authors" }}
{{ if .Param $taxonomy }}
  {{ range $index, $value := (.GetTerms $taxonomy) }}
    {{- /* Highlight the author's name? */ -}}
    {{- $highlight_name := .Page.Params.highlight_name | default false -}}

    {{- if gt $index 0 }}, {{ end -}}
    <span {{ if $highlight_name }}class="font-bold"{{end}}>
      {{/* Always display as plain text, never as a link */}}
      {{ .LinkTitle }}
    </span>
    {{- if isset $.Params "author_notes" -}}
      {{- with (index $.Params.author_notes $index) -}}
        <i class="author-notes fas fa-info-circle" data-toggle="tooltip" title="{{.}}"></i>
      {{- end -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
```

**关键改动**：
- 原始模板在第12-16行有条件判断：如果作者有页面就生成 `<a>` 链接
- 修改后的模板直接显示 `{{ .LinkTitle }}`，不生成任何链接

**步骤2**：保持 `config/_default/hugo.yaml` 配置不变

**重要**：不要修改 taxonomies 配置，保持原样：

```yaml
taxonomies:
  author: authors        # 保持这一行，不要注释
  tag: tags
  publication_type: publication_types
```

同时 `permalinks` 可以注释掉（可选）：

```yaml
# permalinks:
#   authors: '/author/:slug/'  # 可选：注释掉避免生成作者页面
```

**步骤3**：清理缓存并测试

```bash
# 清理Hugo缓存
rm -rf resources/_gen/

# 重新启动开发服务器
hugo server -D
```

#### 修改后的效果

**变化**：
- ✅ 所有作者名字正常显示为纯文本
- ✅ **不再有任何作者链接**（包括自己和合作者）
- ✅ 不会出现404错误
- ✅ 作者名字的高亮（`highlight_name`）仍然有效

**不受影响**：
- ✅ Publications列表正常显示
- ✅ Recent News列表正常显示
- ✅ Blog列表正常显示
- ✅ 首页的所有collection block正常工作
- ✅ 作者的 `author_notes` 注释仍然显示

**显示效果示例**：
```
Yituo He, Xinpeng Hao, Juanru Li, Yu Yu (2025).
PQMagic: Towards Secure and Efficient...
```
所有作者名字都是纯文本，没有下划线，无法点击。

#### 技术原理

Hugo Blox使用 `layouts/partials/page_metadata_authors.html` 来渲染作者列表。这个partial被多个view调用：
- `citation.html` - 引用格式（首页论文列表）
- 论文详情页
- 其他显示作者的地方

通过在本地创建同名文件，Hugo会优先使用本地版本，从而覆盖主题的默认行为。

#### 文件位置说明

- **主题原始文件**（只读，不要修改）：
  ```
  ~/.cache/hugo_cache/modules/.../blox-tailwind@v0.3.1/layouts/partials/page_metadata_authors.html
  ```

- **本地覆盖文件**（你创建的）：
  ```
  layouts/partials/page_metadata_authors.html
  ```

Hugo会自动使用本地文件优先。

---

📍 **这个完整指南位于**：`COMPLETE_WEBSITE_GUIDE.md`

通过遵循这个指南，你可以完全掌控网站的各个方面，从内容发布到样式定制，从图片管理到部署上线。