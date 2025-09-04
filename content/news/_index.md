---
title: "Recent News"
date: 2024-01-01
type: landing

design:
  spacing: "4rem"

sections:
  - block: collection
    content:
      title: Recent News
      subtitle: ''
      text: ''
      # 尝试通过这些参数控制标题样式
      title_align: left
      # Page type to display. E.g. post, talk, publication...
      page_type: post
      # Choose how many pages you would like to display (0 = all pages)
      count: 0
      # Filter on criteria
      filters:
        folders:
          - post
        author: ""
        category: ""
        tag: ""
        exclude_featured: false
        exclude_future: false
        exclude_past: false
        publication_type: ""
      # Choose how many pages you would like to offset by
      offset: 0
      # Page order: descending (desc) or ascending (asc) date.
      order: desc
    design:
      # Choose a layout view
      view: date-title-summary
---