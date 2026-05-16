# HarmonyCraft · 鸿蒙AI应用工坊

<p align="center">
  <img src="entry/src/main/resources/base/media/icon.png" width="80" alt="HarmonyCraft Logo">
</p>

<p align="center">
  <strong>Speak it, Build it —— 说出你的想法，构建你的应用</strong>
</p>

<p align="center">
  <a href="#"><img src="https://img.shields.io/badge/HarmonyOS-6.0.2-orange" alt="HarmonyOS"></a>
  <a href="#"><img src="https://img.shields.io/badge/API-22-blue" alt="API 22"></a>
  <a href="#"><img src="https://img.shields.io/badge/Language-ArkTS-blue" alt="ArkTS"></a>
  <a href="#"><img src="https://img.shields.io/badge/License-MIT-green" alt="License"></a>
</p>

---

## 📖 项目简介

**HarmonyCraft** 是鸿蒙生态首个对话式元服务生成工具。用户通过自然语言对话描述应用需求，AI完成意图解析→模板匹配→ArkTS代码生成→实时预览渲染的全链路，最终输出可运行的鸿蒙元服务。

**核心价值**：让不具备编程能力的用户，在5分钟内通过对话创建一个可运行的鸿蒙应用。

## ✨ 核心功能

### 🤖 AI对话生成
- 自然语言描述需求，AI 4步思考链实时展示（理解→分析→生成→优化）
- 支持10种场景：计数器、登录页、待办清单、新闻阅读、设置页、数据列表、音乐播放器、聊天界面、天气卡片、个人中心
- 语音输入支持，降低操作门槛

### 🎨 实时预览引擎
- 代码/预览双Tab切换
- 代码区带行号、深色背景、横向滚动
- 预览区可真实交互（计数、勾选、播放等）

### 📋 模板市场
- 15个高质量预置模板
- 7大分类筛选：表单、列表、导航、卡片、弹窗、完整页面
- 一键使用模板，自动进入对话修改

### 📁 项目管理
- 项目CRUD、搜索、版本历史
- 数据通过AppStorage持久化
- 支持重命名、删除、查看详情

### 🃏 万能卡片
- 支持1×2/2×2/2×4三种尺寸添加到桌面
- 可视化卡片编辑器，支持文本/按钮/图片组件叠加
- FormExtensionAbility驱动，支持动态刷新

## 🏗️ 技术架构

```
HarmonyCraft/
├── entry/src/main/ets/
│   ├── pages/           # 9个页面
│   │   ├── Index.ets          # 首页
│   │   ├── ChatPage.ets       # AI对话页
│   │   ├── CodePreview.ets    # 代码预览页
│   │   ├── TemplateMarket.ets # 模板市场
│   │   ├── ProjectManage.ets  # 项目管理
│   │   ├── ProjectDetail.ets  # 项目详情
│   │   ├── CardEditor.ets     # 卡片编辑器
│   │   ├── Profile.ets        # 个人中心
│   │   └── SettingPage.ets    # 设置页
│   ├── components/      # 7个通用组件
│   │   ├── BottomNav.ets      # 底部导航
│   │   ├── CraftIcon.ets      # 矢量图标（24个）
│   │   ├── AIAvatar.ets       # AI头像
│   │   ├── EmptyState.ets     # 空状态
│   │   ├── Skeleton.ets       # 骨架屏
│   │   ├── PreviewRenderer.ets # 预览渲染器
│   │   └── FormCard.ets       # 卡片组件
│   ├── models/          # 数据模型+持久化
│   ├── utils/           # 主题+工具
│   ├── services/        # 卡片服务
│   └── entryability/    # 入口Ability
```

## 🚀 快速开始

### 环境要求
- DevEco Studio 5.0+
- HarmonyOS SDK API 22 (6.0.2)
- Node.js 18+

### 构建运行

```bash
# 克隆项目
git clone <repository-url>
cd HarmonyCraft

# 使用DevEco Studio打开项目
# 或命令行构建
cd entry && hvigorw assembleHap
```

### 安装到设备

```bash
# 真机安装（需开启开发者模式）
hdc install entry/build/default/outputs/default/entry-default-unsigned.hap
```

## 🎨 设计系统

### 暖色调品牌体系

| Token | 色值 | 用途 |
|-------|------|------|
| Primary | `#D4763E` | 主按钮、图标选中态 |
| Accent | `#B85C3D` | 次级按钮、标签 |
| Primary Light | `#E89860` | 悬停态、渐变 |
| Background | `#FAF6F1` | 页面背景 |
| Card | `#FFFDF9` | 卡片背景 |
| Text Primary | `#2D2420` | 标题、正文 |
| Text Secondary | `#6B5D54` | 描述文字 |

### 矢量图标

24个统一风格图标，纯Shape+Path代码绘制：
- 统一1.75px描边
- 圆角端点/连接
- 24×24视口
- 覆盖：home/templates/projects/profile/send/mic/search/back/close/add/check/more/login/todo/counter/news/settings/datalist/copy/download/phone/tablet/pc/tag/popular

## 📦 参赛信息

- **赛事**：2025华为开发者大赛 · HarmonyOS创新赛
- **赛道**：应用赛道 / 极客赛道
- **目标API**：API 22（HarmonyOS 6.0.2）
- **代码规模**：约4500行ArkTS，9页+7组件
- **包体大小**：约870KB（未签名hap）

## 📄 参赛资料

详见 [`参赛资料/`](参赛资料/) 目录：

| 文件 | 说明 |
|------|------|
| [`作品介绍.md`](参赛资料/作品介绍.md) | 核心参赛文档（≤1200字） |
| [`演示视频脚本.md`](参赛资料/演示视频脚本.md) | 1-3分钟视频分镜脚本 |
| [`技术亮点.md`](参赛资料/技术亮点.md) | 详细技术实现说明 |
| [`截图说明.md`](参赛资料/截图说明.md) | 功能截图清单与拍摄指南 |

## 📝 开发日志

| 阶段 | 周期 | 内容 |
|------|------|------|
| P0 | 第1周 | 核心链路：首页→对话→预览→代码 |
| P1 | 第2周 | 功能扩展：模板市场+项目管理+卡片编辑器 |
| P2 | 第3周 | 体验增强：转场动画+图标体系+深色模式预留+万能卡片 |

## 📜 许可证

MIT License © 2025 HarmonyCraft Team

---

<p align="center">
  <sub>Built with ❤️ for HarmonyOS</sub>
</p>
