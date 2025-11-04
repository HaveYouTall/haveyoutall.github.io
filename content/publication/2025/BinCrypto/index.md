---
title: "Binary Cryptographic Function Identification via Similarity Analysis with Path-Insensitive Emulation"
authors:
- Yikun Hu
- yituo                    # 使用yituo表示自己
- Wenyu He
- Haoran Li
- Yubo Zhao
- Shuai Wang
- Dawu Gu
# author_notes:
# - "第一作者"               # 可选：作者注释
# - "通讯作者"

date: "2025-02-25T00:00:00Z"
publishDate: "2025-10-26T00:00:00Z"  # 页面发布日期
doi: "10.1145/3720415"        # DOI号码

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

publication: "2025 Proceedings of the ACM on Programming Languages, OOPSLA1"    # 期刊名称（斜体用*包围）
publication_short: "OOPSLA 2025"                  # 期刊简称

abstract: "It becomes an essential requirement to identify cryptographic functions in binaries due to their widespread application in modern software. The technology fundamentally supports numerous software security analyses, such as malware analysis, blockchain forensics, etc. Unfortunately, the existing methods still struggle to strike a balance between analysis accuracy, efficiency, and code coverage, which hampers their practical application. In this paper, we propose BinCrypto, a method of emulation-based code similarity analysis on the interval domain, to identify cryptographic functions in binary files. It produces accurate results because it relies on the behavior-related code features collected during emulation. On the other hand, the emulation is performed in a path-insensitive manner, where the emulated values are all represented as intervals. As such, it is able to analyze every basic block only once, accomplishing the identification efficiently, and achieve complete block coverage simultaneously. We conduct the experiments with nine real-world cryptographic libraries. The results show that BinCrypto achieves the average accuracy of 83.2%, nearly twice that of WheresCrypto, the state-of-the-art method. BinCrypto is also able to successfully complete the tasks, including statically-linked library analysis, cross-library analysis, obfuscated code analysis, and malware analysis, demonstrating its potential for practical applications."

summary: ""

tags:
- Program Analysis
- Cryptographic Function Identicication
- Similarity Analysis
featured: true             # 是否为重点论文（会在首页突出显示）

# Custom links (uncomment lines below)
# links:
# - name: Website
#   url: https://pqcrypto.dev/
# - name: "Bibtex"
#   url: "/publication/my-paper/cite.bib"
#   icon_pack: fas  
#   icon: quote-right

# 重要链接 - 所有链接都是可选的
url_pdf: '/uploads/publication/hu-2025-bincrypto.pdf'          # PDF链接（arXiv或期刊）
# url_code: 'https://github.com/pqcrypto-cn/PQMagic'   # 代码仓库链接
# url_dataset: 'https://doi.org/10.1145/3720415'                # 数据集链接
# url_poster: '/uploads/poster.pdf'                   # 海报链接（放在static目录）
# url_slides: '/uploads/slides.pdf'                   # 演示文稿链接
# url_video: 'https://youtube.com/watch?v=xxx'        # 视频链接
url_source: 'https://doi.org/10.1145/3720415'       # 期刊源链接

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
