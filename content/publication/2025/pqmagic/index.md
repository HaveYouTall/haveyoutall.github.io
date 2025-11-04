---
title: "PQMagic: Towards Secure and Efficient Post Quantum Cryptography Implementations"
authors:
- yituo                    # 使用yituo表示自己
- Xinpeng Hao
- Juanru Li
- Yu Yu
# author_notes:
# - "第一作者"               # 可选：作者注释
# - "通讯作者"

date: "2025-04-10T00:00:00Z"
publishDate: "2025-10-26T00:00:00Z"  # 页面发布日期
doi: "10.1007/978-3-032-01806-9_9"        # DOI号码

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

publication: "23rd International Conference on Applied Cryptography and Network Security"    # 期刊名称（斜体用*包围）
publication_short: "ACNS-SCI 2025"                  # 期刊简称

abstract: "Quantum computing threatens current public-key cryptosystems, driving the need for post-quantum cryptography (PQC). However, PQC implementations face additional risks. We find implementation issues in existing PQC libraries (e.g., pq-crystals and liboqs), while they also fail to fully leverage modern processors. To address these issues, we propose four optimization strategies: Branch Optimization, Register Allocation, Vectorized Execution, and Secure and Efficient Pipelining. These strategies minimize execution branches, instruction counts, and memory accesses while enhancing security, mitigating the implementation from side-channel attack risk. We implement these in PQMagic, a high-performance PQC library for ML-KEM and ML-DSA, and it significantly outperforms state-of-the-art libraries. For ML-KEM-1024, it achieves efficiency gains of up to 1.77x, 1.79x, and 1.52x for Keygen, Encaps, and Decaps, while reducing instruction counts and memory access overhead by up to 47.1% and 60.1%. For ML-DSA-87, it improves Keygen, Sign, and Verify by up to 2.24x, 1.89x, and 2.04x, with instruction counts and memory access reduced by up to 44.4% and 64.5%. Additionally, PQMagic eliminates up to 90.9% of branch operations in matrix expansion for ML-DSA. Besides, PQMagic also outperforms traditional cryptographic algorithm combinations (RSA-2048/ECDSA-256 + ECDH) selected from OpenSSL. It only has a slight gap at the highest level L5 compared to ECDSA-256 + ECDH combination. Our work shows that combining modern hardware capabilities with careful instruction scheduling enables secure and efficient PQC implementations, paving the way for post-quantum cryptographic migration."

summary: "PQMagic is the first high-performance post-quantum cryptographic algorithm library in China. It outperforms the current leading libraries."

tags:
- Post Quantum Cryptograph
- High Performance Implementation
- Cryptographic Engneering
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
url_pdf: '/uploads/publication/he-2025-PQMagic.pdf'          # PDF链接（arXiv或期刊）
url_code: 'https://github.com/pqcrypto-cn/PQMagic'   # 代码仓库链接
# url_dataset: 'https://doi.org/10.1007/978-3-032-01806-9_9'                # 数据集链接
# url_poster: '/uploads/poster.pdf'                   # 海报链接（放在static目录）
# url_slides: '/uploads/slides.pdf'                   # 演示文稿链接
# url_video: 'https://youtube.com/watch?v=xxx'        # 视频链接
url_source: 'https://doi.org/10.1007/978-3-032-01806-9_9'       # 期刊源链接

# 特色图片
image:
  caption: 'Figure 1: Overview of our proposed method'
  focal_point: "Center"     # Smart/Center/TopLeft/Top/TopRight/Left/Right/BottomLeft/Bottom/BottomRight
  preview_only: false       # false=在文章页面显示，true=只在列表预览

# 关联项目（可选）
projects: 
- pqmagic        # 项目文件夹名称

# # 关联幻灯片（可选）
# slides: example            # 幻灯片文件夹名称
---

{{% callout note %}}
点击上方的 *Cite* 按钮可以导入文献引用信息到参考文献管理软件。
{{% /callout %}}

<!-- {{% callout note %}}
点击 *Slides* 按钮查看相关演示文稿。
{{% /callout %}} -->

[PQMagic](https://pqcrypto.dev) is the first high-performance post-quantum cryptographic algorithm library in China. It outperforms the current leading libraries. We are honored to present this work at ACNS-SCI 2025.

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

Please refer to our website (https://pqcrypto.dev/benchmarking/) to see more details about performance of PQMagic-std and PQMagic-adv.

<!-- {{% callout warning %}}
重要提示内容
{{% /callout %}} -->
