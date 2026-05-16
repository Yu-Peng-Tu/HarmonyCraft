#!/bin/bash
# HarmonyCraft 批量截图脚本
# 使用方法：确保模拟器/真机已连接，然后运行 ./screenshot.sh

SAVE_DIR="$HOME/Desktop/HarmonyCraft截图"
mkdir -p "$SAVE_DIR"

echo "========================================"
echo "  HarmonyCraft 截图工具"
echo "========================================"
echo ""
echo "请按顺序切换到以下页面，每准备好一个页面按回车截图"
echo "提示：提前准备好数据（创建3-4个项目、准备一段对话记录）"
echo ""

screenshots=(
  "01-首页|首页画面，确保最近项目区域有3-4个项目"
  "02-AI对话生成|ChatPage，提前发送一条需求，展示对话记录"
  "03-思考链过程|发送新需求后立即截图，捕获AI thinking状态"
  "04-代码预览-代码Tab|CodePreview页，点击代码Tab，展示行号和代码"
  "05-代码预览-预览Tab|CodePreview页，点击预览Tab，展示可交互组件"
  "06-模板市场|TemplateMarket，向下滑动展示多个模板卡片"
  "07-项目管理|ProjectManage，确保有4-6个项目卡片"
  "08-项目详情|ProjectDetail，点击第一个项目，展开版本历史"
  "09-卡片编辑器|CardEditor，提前添加1-2个组件，选中一个"
  "10-万能卡片桌面|桌面长按→服务卡片→添加HarmonyCraft 2x2卡片"
  "11-个人中心|Profile页，底部导航我的Tab"
  "12-设置页|SettingPage，从Profile点击进入"
)

for item in "${screenshots[@]}"; do
  IFS='|' read -r name desc <<< "$item"
  echo "----------------------------------------"
  echo "[$name]"
  echo "说明: $desc"
  echo ""
  read -p "页面准备好后按回车截图..."
  
  hdc shell snapshot_display -f "/data/screen_${name}.png" 2>/dev/null
  if [ $? -eq 0 ]; then
    hdc file recv "/data/screen_${name}.png" "$SAVE_DIR/" 2>/dev/null
    echo "✓ 已保存: $SAVE_DIR/${name}.png"
  else
    echo "✗ 截图失败，请检查设备连接 (hdc list targets)"
  fi
  echo ""
done

echo "========================================"
echo "  全部截图完成!"
echo "========================================"
echo "保存位置: $SAVE_DIR"
ls -la "$SAVE_DIR/"
