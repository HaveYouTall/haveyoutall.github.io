# 故障排除指南

## 打字机效果相关问题

### ❓ 左上角没有显示头像
**可能原因**：
- 头像文件路径不正确
- 头像文件不存在

**解决方案**：
1. 确认 `content/authors/admin/avatar.jpg` 文件存在
2. 运行以下命令重新复制头像：
   ```bash
   mkdir -p new-blog-dir/static/authors/admin
   cp new-blog-dir/content/authors/admin/avatar.jpg new-blog-dir/static/authors/admin/
   ```

### ❓ 打字机效果没有启动
**可能原因**：
- JavaScript 未正确加载
- 找不到导航栏元素

**解决方案**：
1. 打开浏览器开发者工具 (F12)
2. 查看 Console 标签页是否有错误信息
3. 确认页面完全加载后再检查效果

### ❓ 长名字挤压导航菜单
**已修复**：
- 打字机文本区域设置了最小宽度 140px
- 导航品牌区域设置了最小宽度 180px
- 如果仍有问题，可以在 CSS 中调整 `min-width` 值

## 浏览器图标相关问题

### ❓ 浏览器标签页没有显示图标
**解决方案**：
1. 清除浏览器缓存 (Ctrl+Shift+Delete)
2. 硬刷新页面 (Ctrl+F5)
3. 确认以下文件存在：
   - `static/media/icons/favicon.ico`
   - `static/media/icons/favicon-32x32.png`

### ❓ 图标显示不清晰
**解决方案**：
1. 使用高清晰度的正方形图片作为头像
2. 建议至少 512x512 像素
3. 使用专业工具生成各种尺寸的图标

## 导航相关问题

### ❓ 导航按钮点击后没有跳转到正确位置
**已修复**：
- Recent News 的锚点 ID 已设置为 `recentnews`
- Publications 的锚点 ID 已设置为 `publications`

### ❓ 移动设备上导航样式异常
**解决方案**：
- 已添加响应式 CSS 规则
- 在小屏幕上会自动调整尺寸

## 性能问题

### ❓ 页面加载缓慢
**优化建议**：
1. 压缩头像图片大小
2. 使用 WebP 格式图片（如支持）
3. 检查是否有不必要的大文件

### ❓ 打字机效果卡顿
**解决方案**：
1. 调整打字机速度配置：
   ```javascript
   typing_speed: 150,    // 增加数值降低速度
   deleting_speed: 75,   // 增加数值降低速度
   ```
2. 减少同时显示的名字数量

## 自定义问题

### ❓ 如何修改打字机颜色
**解决方案**：
在 `typewriter.html` 的 CSS 部分添加：
```css
.typewriter-text {
  color: #your-color-code;
}
```

### ❓ 如何修改头像大小
**解决方案**：
在 `typewriter.html` 中修改图片样式：
```javascript
width: 40px;  // 修改为想要的尺寸
height: 40px; // 修改为想要的尺寸
```

### ❓ 如何添加更多名字
**解决方案**：
编辑 `typewriter.html` 中的配置：
```javascript
names: ['Name1', 'Name2', 'Name3', '添加更多名字'], 
```

## 部署问题

### ❓ GitHub Pages 上图标不显示
**解决方案**：
1. 确认所有图标文件都在 `static/media/icons/` 目录中
2. 检查 GitHub Actions 构建日志
3. 确认 `baseURL` 设置正确

### ❓ 本地预览正常但部署后异常
**解决方案**：
1. 检查 `config/_default/hugo.yaml` 中的 `baseURL` 设置
2. 确认所有路径使用相对路径或正确的绝对路径
3. 清除浏览器缓存后重新访问

## 获取帮助

如果以上解决方案都无法解决问题：

1. 查看浏览器开发者工具的 Console 和 Network 标签页
2. 检查 `hugo server -D` 的控制台输出
3. 确认 Hugo 版本兼容性
4. 参考 [Hugo Blox 官方文档](https://docs.hugoblox.com/)

## 常用命令

### 重新生成网站
```bash
cd new-blog-dir
hugo server -D  # 本地预览
hugo             # 生成静态文件
```

### 清理缓存
```bash
hugo mod clean
rm -rf public/
rm -rf resources/
```

### 复制头像文件
```bash
# 复制到网页使用位置
mkdir -p static/authors/admin
cp content/authors/admin/avatar.jpg static/authors/admin/

# 复制到图标位置
cp content/authors/admin/avatar.jpg static/media/icons/favicon-32x32.png
cp content/authors/admin/avatar.jpg static/media/icons/apple-touch-icon.png
```