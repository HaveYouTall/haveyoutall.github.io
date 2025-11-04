---
title: "RGDroid: Detecting Android Malware with Graph Convolutional Networks against Structural Attacks"
authors:
- Yakang Li
- Yikun Hu
- Yizhuo Wang
- yituo                    # 使用yituo表示自己
- Haining Lu
- Dawu Gu
# author_notes:
# - "第一作者"               # 可选：作者注释
# - "通讯作者"

date: "2023-03-21T00:00:00Z"
publishDate: "2025-05-15T00:00:00Z"  # 页面发布日期
doi: "10.1109/SANER56733.2023.00065"        # DOI号码

# 发表类型 - 使用CSL标准
publication_types: ["paper-conference"]
# 其他类型：
# ["paper-conference"]     # 会议论文
# ["article-journal"]  # 期刊文章
# ["chapter"]              # 书籍章节
# ["book"]                 # 书籍
# ["thesis"]               # 学位论文
# ["report"]               # 技术报告
# ["preprint"]             # 预印本

publication: "2023 IEEE International Conference on Software Analysis, Evolution and Reengineering (SANER)"    # 期刊名称（斜体用*包围）
publication_short: "SANER 2023"                  # 期刊简称

abstract: "The rapid growth of Android malware calls for anti-malware systems to detect malware automatically. Detecting malware effectively is a non-trivial problem due to the high overlap in behaviors between malware and benign apps. Most existing automated Android malware detection methods use statistic features extracted from apps or graphs generated from method calls to identify malware. However, the methods that only use statistic features lead to false positives due to ignoring program semantics. Existing graph-based approaches suffer scalability problems due to the heavy-weight program analysis and timeconsuming graph matching. In addition, graph-based approaches could be evaded by modifying dependencies among method calls. As a result, crafted malicious apps resemble the benign ones."

summary: ""

tags:
- Program Analysis
- Software Security
- Android
featured: true             # 是否为重点论文（会在首页突出显示）

# Custom links (uncomment lines below)
# 自定义链接 - 可添加任意链接
# links:
# - name: Website
#   url: https://pqcrypto.dev/
# - name: "Bibtex"
#   url: "/publication/my-paper/cite.bib"
#   icon_pack: fas  
#   icon: quote-right

# 重要链接 - 所有链接都是可选的
url_pdf: '/uploads/publication/li-2023-rgdroid.pdf'          # PDF链接（arXiv或期刊）
# url_code: 'https://github.com/pqcrypto-cn/PQMagic'   # 代码仓库链接
# url_dataset: 'https://ieeexplore.ieee.org/document/10123544'                # 数据集链接
# url_poster: '/uploads/poster.pdf'                   # 海报链接（放在static目录）
# url_slides: '/uploads/slides.pdf'                   # 演示文稿链接
# url_video: 'https://youtube.com/watch?v=xxx'        # 视频链接
url_source: 'https://ieeexplore.ieee.org/document/10123544'       # 期刊源链接

# 特色图片
image:
  caption: 'Figure 1: Overview of our proposed method'
  focal_point: "Center"     # Smart/Center/TopLeft/Top/TopRight/Left/Right/BottomLeft/Bottom/BottomRight
  preview_only: false       # false=在文章页面显示，true=只在列表预览

# # 关联项目（可选）
# projects: 
# - pqmagic        # 项目文件夹名称

# # 关联幻灯片（可选）
# slides: example            # 幻灯片文件夹名称
---

<!-- {{% callout note %}}
点击上方的 *Cite* 按钮可以导入文献引用信息到参考文献管理软件。
{{% /callout %}} -->

<!-- {{% callout note %}}
点击 *Slides* 按钮查看相关演示文稿。
{{% /callout %}} -->

<!-- [PQMagic](https://pqcrypto.dev) is the first high-performance post-quantum cryptographic algorithm library in China. It outperforms the current leading libraries. We are honored to present this work at ACNS-SCI 2025.

![ML-DSA-87](pic/PQMagic-pre.jpg)

PQMagic outperforms the current leading open source implementation, liboqs, with approximately a 2x improvement in performance.

### Benchmark Platform
  
  | Platform | CPU               | OS        |
  |:--------:|:-----------------:|:---------:|
  | X86      | AMD Ryzen 5 9600x  | Debian 12 |

### ML-DSA-87

![ML-DSA-87](pic/PQMagic-performance-ml-dsa-87.png)
  
### ML-KEM-1024

![ML-KEM-1024](pic/PQMagic-performance-ml-kem-1024.png)

Please refer to our website (https://pqcrypto.dev/benchmarking/) to see more details about performance of PQMagic-std and PQMagic-adv. -->

<!-- {{% callout warning %}}
重要提示内容
{{% /callout %}} -->
