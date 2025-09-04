---
title: Links
date: 2024-01-01
type: landing

design:
  spacing: "4rem"

sections:
  - block: markdown
    content:
      title: '友链'
      subtitle: '与我交流的朋友们'
      text: "{{< readfile file=\"content/links/friends.md\" >}}"
    design:
      columns: '2'
      spacing:
        padding: ["4rem", 0, 0, 0]

  - block: markdown
    content:
      title: 'Useful Links'
      subtitle: 'A collection of links I find helpful'
      text: "{{< readfile file=\"content/links/useful-links.md\" >}}"
    design:
      columns: '1'
      
---