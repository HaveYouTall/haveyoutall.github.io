#!/bin/bash
# 简化的图片更新脚本 - 按照最终配置

echo "🖼️ 网站图片更新工具"
echo "=================="

show_usage() {
    echo "用法:"
    echo "  $0 bio <图片文件>     # 更新Bio头像"
    echo "  $0 icon <图片文件>    # 更新网站图标(打字机+浏览器)"
    echo ""
    echo "示例:"
    echo "  $0 bio ~/Downloads/my-photo.jpg"
    echo "  $0 icon ~/Downloads/my-icon.jpg"
}

if [ $# -lt 2 ]; then
    show_usage
    exit 1
fi

TYPE="$1"
IMAGE_FILE="$2"

# 检查文件是否存在
if [ ! -f "$IMAGE_FILE" ]; then
    echo "❌ 错误: 图片文件 $IMAGE_FILE 不存在"
    exit 1
fi

case "$TYPE" in
    "bio")
        echo "📷 更新Bio头像..."
        cp "$IMAGE_FILE" content/authors/admin/avatar.jpg
        echo "✅ Bio头像已更新: content/authors/admin/avatar.jpg"
        ;;
    "icon")
        echo "🎨 更新网站图标..."
        cp "$IMAGE_FILE" assets/media/icons/icon.jpg
        cp "$IMAGE_FILE" static/media/icons/icon.jpg
        echo "✅ 网站图标已更新:"
        echo "   • assets/media/icons/icon.jpg (Hugo处理)"
        echo "   • static/media/icons/icon.jpg (直接访问)"
        
        # 清理缓存
        echo "🧹 清理Hugo缓存..."
        rm -rf resources/_gen/
        ;;
    *)
        echo "❌ 错误: 不支持的类型 '$TYPE'"
        show_usage
        exit 1
        ;;
esac

echo ""
echo "🚀 下一步:"
echo "   运行: hugo server -D"
echo "   访问: http://localhost:1313"
echo ""
echo "💡 如果浏览器图标没有更新，请清除浏览器缓存"