# 网站使用指南

这个指南将帮助你管理和维护你的学术网站。网站基于Hugo Blox Builder框架构建，支持Markdown格式的内容编写。

## 目录结构

```
new-blog-dir/
├── config/
│   └── _default/
│       ├── hugo.yaml          # 网站基本配置
│       ├── menus.yaml         # 导航菜单配置
│       ├── params.yaml        # 参数配置
│       └── languages.yaml     # 语言配置
├── content/
│   ├── _index.md              # 主页内容
│   ├── authors/               # 作者信息
│   ├── blog/                  # 博客文章
│   ├── publication/           # 发表文章
│   ├── project/               # 项目展示
│   ├── experience.md          # 经历页面
│   ├── projects.md            # 项目总览页面
│   └── links.md               # 链接页面
├── assets/                    # 静态资源
├── static/                    # 静态文件
└── public/                    # 生成的网站文件
```

## 1. 个人信息管理

### 更新个人简介
编辑 `content/authors/admin/_index.md` 文件：

```yaml
---
# Display name
title: "你的姓名"

# Username (this should match the folder name and the username in content/_index.md)
authors:
  - admin

# Is this the primary user of the site?
superuser: true

# Role/position/tagline
role: 你的职位/角色

# Organizations/Affiliations to display in Biography blurb
organizations:
  - name: 你的机构
    url: "https://example.com/"

# Short bio (displayed in user profile at end of posts)
bio: 你的简短介绍

# Social/Academic Networking
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

你的详细个人介绍写在这里...
```

### 更新头像
替换 `content/authors/admin/avatar.jpg` 文件为你的照片。

## 2. 网站左上角打字机效果和头像

### 设置滚动显示的名字

网站左上角会显示你的头像和一个打字机效果的名字滚动。你可以通过以下方式自定义：

#### 修改显示的名字列表
编辑 `layouts/partials/hooks/head-end/typewriter.html` 文件中的配置：

```javascript
const config = {
  names: ['Yituo', '何弈拓', 'HaveYouTall'], // 在这里修改要显示的名字
  typing_speed: 100,    // 打字速度 (毫秒)
  deleting_speed: 50,   // 删除速度 (毫秒)  
  pause_duration: 2000  // 每个名字显示完后的停留时间 (毫秒)
};
```

#### 效果说明
- 名字会按照数组顺序循环显示
- 每个名字会以打字机效果逐字符出现
- 显示完成后停留指定时间，然后逐字符删除
- 删除完成后显示下一个名字
- 支持中英文混合

#### 调整效果参数
- `typing_speed`: 数值越小，打字越快
- `deleting_speed`: 数值越小，删除越快  
- `pause_duration`: 每个名字完整显示后的停留时间

### 头像设置
头像会自动读取 `content/authors/admin/avatar.jpg` 文件。确保这个文件存在且是正方形图片以获得最佳效果。

**重要提示**：
- 头像会同时显示在网站左上角和用作浏览器标签页图标
- 建议使用正方形、高清晰度的图片
- 图片文件会被自动复制到 `static/authors/admin/` 目录供网页使用

### 布局优化
- 打字机文本区域设置了固定的最小宽度 (140px)，防止长名字挤压导航菜单项
- 导航品牌区域设置了最小宽度 (180px) 和防压缩属性
- 在移动设备上会自动调整为较小的尺寸

## 3. 浏览器图标(Favicon)设置

### 自动图标设置

**好消息**：现在头像会自动用作网站图标！当你更新 `content/authors/admin/avatar.jpg` 时，它会自动复制为所有尺寸的图标文件。

### 手动准备图标文件（可选）

如果你想使用不同于头像的图标，可以手动准备以下尺寸的图标文件，放置在 `static/media/icons/` 目录中：

#### 必需的图标文件：
- `favicon.ico` - 传统的ico格式图标 (16x16, 32x32)
- `favicon-16x16.png` - 16x16像素PNG格式
- `favicon-32x32.png` - 32x32像素PNG格式
- `apple-touch-icon.png` - 180x180像素，用于Apple设备
- `android-chrome-192x192.png` - 192x192像素，用于Android设备
- `android-chrome-512x512.png` - 512x512像素，用于Android设备
- `mstile-150x150.png` - 150x150像素，用于Windows磁贴

### 图标生成工具推荐

#### 在线工具：
1. [Favicon.io](https://favicon.io/) - 免费的favicon生成器
2. [RealFaviconGenerator](https://realfavicongenerator.net/) - 专业的多平台图标生成
3. [Favicon Generator](https://www.favicon-generator.org/) - 简单易用的生成工具

#### 使用方法：
1. 准备一张正方形的高质量图片（建议至少512x512像素）
2. 上传到在线工具
3. 下载生成的所有图标文件
4. 将文件放置到 `static/media/icons/` 目录

### 自定义配置

如果需要修改图标配置，可以编辑以下文件：

#### Web应用清单 (`static/media/icons/site.webmanifest`)：
```json
{
    "name": "你的网站完整名称",
    "short_name": "简短名称", 
    "description": "网站描述",
    "theme_color": "#ffffff",
    "background_color": "#ffffff"
}
```

#### Windows磁贴配置 (`static/media/icons/browserconfig.xml`)：
```xml
<tile>
    <square150x150logo src="/media/icons/mstile-150x150.png"/>
    <TileColor>#ffffff</TileColor> <!-- 修改磁贴背景色 -->
</tile>
```

### 验证图标设置

部署网站后，可以通过以下方式验证图标是否正确设置：

1. 查看浏览器标签页图标
2. 添加到收藏夹查看图标
3. 在移动设备上添加到主屏幕
4. 使用在线工具检测：[Favicon Checker](https://realfavicongenerator.net/favicon_checker)

## 4. 导航菜单管理

### 修改导航菜单
编辑 `config/_default/menus.yaml`：

```yaml
main:
  - name: Bio
    url: /
    weight: 10
  - name: Publications
    url: /#publications
    weight: 20
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

### 添加新的导航项目
在 `main:` 下添加新项目：

```yaml
  - name: 新页面名称
    url: /new-page/
    weight: 70  # 数字越大，越靠右显示
```

### 删除导航项目
直接删除对应的菜单项即可。

## 5. 页面管理

### 添加新页面

#### 方法1：创建简单页面
1. 在 `content/` 目录下创建 `new-page.md` 文件
2. 添加内容：

```yaml
---
title: "新页面标题"
date: 2024-01-01
---

这里是页面内容，支持Markdown格式。

## 二级标题

- 列表项1
- 列表项2

**粗体文字**

[链接文本](https://example.com)
```

#### 方法2：创建复杂页面（类似主页）
1. 创建目录 `content/new-page/`
2. 创建 `content/new-page/_index.md`
3. 使用sections结构：

```yaml
---
title: "页面标题"
type: landing

sections:
  - block: markdown
    content:
      title: '标题'
      text: |
        Markdown内容
  - block: collection
    content:
      title: 集合标题
      filters:
        folders:
          - folder-name
---
```

### 删除页面
1. 删除对应的内容文件（如 `content/page-name.md`）
2. 从 `config/_default/menus.yaml` 中删除对应的菜单项

## 6. 博客管理

### 添加新博客文章

#### 步骤1：创建博客目录
在 `content/blog/` 下创建新目录，目录名使用英文（将成为URL的一部分）：

```bash
mkdir content/blog/your-post-title/
```

#### 步骤2：创建内容文件
在新创建的目录中创建 `index.md`：

```yaml
---
title: "博客文章标题"
authors:
  - admin
date: '2024-01-01'  # 发布日期
summary: '文章摘要，会显示在博客列表中'
tags:
  - 标签1
  - 标签2
  - 标签3

# Featured image
image:
  placement: 1
  focal_point: ''
  preview_only: false
---

这里是博客内容，支持完整的Markdown语法。

## 二级标题

### 三级标题

你可以包含：

- **粗体文字**
- *斜体文字*
- `代码片段`
- [链接](https://example.com)

### 代码块

```python
def hello_world():
    print("Hello, World!")
    return "Success"
```

### 数学公式

内联公式：$E = mc^2$

块级公式：
$$\int_{-\infty}^{\infty} e^{-x^2} dx = \sqrt{\pi}$$

### 引用

> 这是一个引用块

### 列表

1. 有序列表项1
2. 有序列表项2

- 无序列表项1
- 无序列表项2
```

#### 步骤3：添加图片
1. 将图片文件放在博客文章的同一目录中
2. 推荐的图片文件名：
   - `featured.jpg/png` - 特色图片（会显示在文章顶部和列表中）
   - `image1.jpg` - 文章中的其他图片

#### 步骤4：在文章中引用图片

```markdown
![图片描述](image1.jpg)

或者使用featured图片：
![特色图片](featured.jpg)
```

### 博客文章示例目录结构

```
content/blog/my-first-post/
├── index.md           # 文章内容
├── featured.png       # 特色图片
├── diagram.jpg        # 文章中的图片1
└── screenshot.png     # 文章中的图片2
```

### 博客标签管理
- 标签会自动生成页面，无需手动创建
- 标签使用中英文均可
- 建议使用一致的标签命名

### 删除博客文章
直接删除整个博客文章目录即可。

## 7. 发表文章(Publications)管理

### 添加新发表文章

#### 步骤1：创建目录
在 `content/publication/` 下创建新目录：

```bash
mkdir content/publication/paper-name/
```

#### 步骤2：创建内容文件
创建 `content/publication/paper-name/index.md`：

```yaml
---
title: "论文标题"
authors:
- admin
- 合作者姓名

date: "2024-01-01T00:00:00Z"
doi: "10.1000/journal.doi"

# Publication type.
# Legend: 0 = Uncategorized; 1 = Conference paper; 2 = Journal article;
# 3 = Preprint / Working Paper; 4 = Report; 5 = Book; 6 = Book section;
# 7 = Thesis; 8 = Patent
publication_types: ["2"]

# Publication name and optional abbreviated publication name.
publication: "期刊或会议名称"
publication_short: "简称"

abstract: "论文摘要..."

# Summary. An optional shortened abstract.
summary: "论文简要总结"

tags:
- Research
- Machine Learning

# Display this page in the Featured widget?
featured: true

# Custom links (uncomment lines below)
links:
- name: PDF
  url: 'conference-paper.pdf'

url_pdf: 'conference-paper.pdf'
url_code: 'https://github.com/your-username/code-repo'
url_dataset: ''
url_poster: ''
url_project: ''
url_slides: ''
url_source: ''
url_video: ''

# Associated Projects (optional).
projects: []
---

论文的详细介绍可以写在这里...
```

#### 步骤3：添加文件
- `conference-paper.pdf` - 论文PDF文件
- `cite.bib` - BibTeX引用
- `featured.jpg` - 特色图片

## 8. 项目管理

### 添加新项目
在 `content/project/` 下创建项目目录和 `index.md` 文件，结构类似博客文章。

### 项目模板

```yaml
---
title: 项目名称
summary: 项目简要描述
tags:
- 项目标签1
- 项目标签2
date: "2024-01-01T00:00:00Z"

# Optional external URL for project (replaces project detail page).
external_link: ""

image:
  focal_point: Smart

links:
- name: GitHub
  url: https://github.com/your-username/project
url_code: ""
url_pdf: ""
url_slides: ""
url_video: ""
---

项目详细描述...
```

## 9. Recent News

  Recent News 的内容来源: content/post/ 文件夹

  Recent News 显示的是从 content/post/ 目录中读取的文章，按日期倒序排列，最多显示5篇。

  如何修改 Recent News 内容

  方法1：修改现有文章

  编辑 content/post/ 目录下的文章，比如：
  - content/post/get-started/index.md
  - content/post/second-brain/index.md
  - content/post/project-management/index.md

  方法2：添加新的 News 条目

  在 content/post/ 创建新目录，例如：

  mkdir content/post/latest-research-update/

  然后创建 index.md：

  ---
  title: "最新研究进展"
  date: '2024-08-19'
  summary: '我们的论文被顶级会议接收了！'
  authors:
    - admin
  tags:
    - Research
    - News
  ---

  这里写详细内容...

  方法3：调整显示设置

  在 content/_index.md 中可以调整：
  - count: 5 - 显示文章数量
  - page_type: post - 内容来源类型
  - order: desc - 排序方式

## 10. 网站部署

### 本地预览
```bash
cd new-blog-dir
hugo server -D
```
然后访问 `http://localhost:1313`

### 生成静态文件
```bash
hugo
```
生成的文件在 `public/` 目录中

### 部署到GitHub Pages
1. 将 `new-blog-dir/public/` 目录的内容推送到你的 `username.github.io` 仓库
2. 或者使用GitHub Actions自动部署

### 更新网站配置
编辑 `config/_default/hugo.yaml`：

```yaml
title: 你的网站标题
baseURL: 'https://your-username.github.io/'
```

## 11. 常见问题

### 如何更改网站主题色？
编辑 `config/_default/params.yaml` 中的theme设置。

### 如何添加Google Analytics？
在 `config/_default/params.yaml` 中添加：

```yaml
analytics:
  google_analytics: 'G-XXXXXXXXXX'
```

### 如何添加评论系统？
在 `config/_default/params.yaml` 中配置Disqus或其他评论系统。

### 如何修改字体？
在 `config/_default/params.yaml` 中修改font设置。

## 12. 文件备份建议

1. 定期备份整个 `new-blog-dir/` 目录
2. 使用Git版本控制
3. 将源码推送到GitHub私有仓库

## 13. 获取帮助

- [Hugo Blox官方文档](https://docs.hugoblox.com/)
- [Hugo官方文档](https://gohugo.io/documentation/)
- [Markdown语法指南](https://www.markdownguide.org/)

---

*这个指南会根据需要持续更新。如果遇到问题，请参考官方文档或寻求技术支持。*