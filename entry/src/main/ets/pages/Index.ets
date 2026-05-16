import { Theme } from '../utils/Theme';
import { router } from '@kit.ArkUI';
import { ProjectItem, getSavedProjects } from '../models/Models';
import { BottomNav } from '../components/BottomNav';
import { CraftIcon } from '../components/CraftIcon';

interface QuickCard {
  name: string;
  desc: string;
  iconName: string;
  prompt: string;
}

const QUICK_CARDS: QuickCard[] = [
  { name: '登录页面', desc: '账号密码界面', iconName: 'login', prompt: '帮我做一个登录页面' },
  { name: '待办清单', desc: '任务管理界面', iconName: 'todo', prompt: '帮我做一个待办清单页面' },
  { name: '计数器', desc: '数字按钮演示', iconName: 'counter', prompt: '帮我做一个计数器' },
  { name: '新闻卡片', desc: '图文展示界面', iconName: 'news', prompt: '帮我做一个新闻卡片' },
  { name: '设置页面', desc: '开关选项界面', iconName: 'settings', prompt: '帮我做一个设置页面' },
  { name: '数据列表', desc: '表格展示界面', iconName: 'datalist', prompt: '帮我做一个数据列表页面' },
  { name: '音乐播放器', desc: '音频控制界面', iconName: 'templates', prompt: '帮我做一个音乐播放器' },
  { name: '聊天界面', desc: '消息对话界面', iconName: 'popular', prompt: '帮我做一个聊天界面' },
  { name: '天气卡片', desc: '温度预报界面', iconName: 'tag', prompt: '帮我做一个天气卡片' },
  { name: '个人中心', desc: '用户信息界面', iconName: 'profile', prompt: '帮我做一个个人中心页面' }
];

const MOCK_PROJECTS: ProjectItem[] = [
  { id: 'p1', name: '我的待办应用', type: '工具', updateTime: '今天 10:30', status: 'done' },
  { id: 'p2', name: '登录页面组件', type: '表单', updateTime: '昨天 18:20', status: 'done' },
  { id: 'p3', name: '新闻阅读卡片', type: '卡片', updateTime: '5月10日', status: 'done' }
];

interface ProjectCoverStyle {
  iconName: string;
  bgColor: string;
  accentColor: string;
  label: string;
}

function getProjectCoverStyle(name: string, type: string): ProjectCoverStyle {
  const lowerName: string = name.toLowerCase();
  if (lowerName.includes('待办') || type === '工具') {
    return { iconName: 'todo', bgColor: '#FAF0E8', accentColor: '#D4763E', label: '待办' };
  }
  if (lowerName.includes('登录') || type === '表单') {
    return { iconName: 'login', bgColor: '#F5EDE6', accentColor: '#B85C3D', label: '表单' };
  }
  if (lowerName.includes('新闻') || lowerName.includes('阅读')) {
    return { iconName: 'news', bgColor: '#F8F0EA', accentColor: '#C96B3D', label: '资讯' };
  }
  if (lowerName.includes('计数器')) {
    return { iconName: 'counter', bgColor: '#F5EDE6', accentColor: '#B85C3D', label: '工具' };
  }
  if (lowerName.includes('设置')) {
    return { iconName: 'settings', bgColor: '#FAF0E8', accentColor: '#D4763E', label: '设置' };
  }
  if (lowerName.includes('数据') || lowerName.includes('列表')) {
    return { iconName: 'datalist', bgColor: '#F5EDE6', accentColor: '#E89860', label: '列表' };
  }
  if (lowerName.includes('音乐') || lowerName.includes('播放器')) {
    return { iconName: 'templates', bgColor: '#F8F0EA', accentColor: '#E89860', label: '媒体' };
  }
  if (lowerName.includes('聊天') || lowerName.includes('消息')) {
    return { iconName: 'popular', bgColor: '#F5EDE6', accentColor: '#D4763E', label: '社交' };
  }
  if (lowerName.includes('天气')) {
    return { iconName: 'tag', bgColor: '#FAF0E8', accentColor: '#C96B3D', label: '天气' };
  }
  if (lowerName.includes('个人') || lowerName.includes('我的')) {
    return { iconName: 'profile', bgColor: '#F5EDE6', accentColor: '#D4763E', label: '个人' };
  }
  if (type === '卡片') {
    return { iconName: 'tag', bgColor: '#F8F0EA', accentColor: '#E89860', label: '卡片' };
  }
  if (type === '界面') {
    return { iconName: 'projects', bgColor: '#F2EDE6', accentColor: '#D4763E', label: '界面' };
  }
  return { iconName: 'projects', bgColor: '#F2EDE6', accentColor: '#9A8E84', label: '项目' };
}

@Entry
@Component
struct Index {
  @State projects: ProjectItem[] = MOCK_PROJECTS;
  @State pageOpacity: number = 0;

  onPageShow(): void {
    this.pageOpacity = 1;
    const saved: ProjectItem[] = getSavedProjects();
    if (saved.length > 0) {
      // 取最新的3个保存的项目展示
      const latest: ProjectItem[] = saved.slice(0, 3);
      this.projects = latest.concat(MOCK_PROJECTS).slice(0, 6);
    }
  }

  onPageHide(): void {
    this.pageOpacity = 0;
  }

  private startChat(prompt?: string): void {
    if (prompt && prompt.length > 0) {
      router.pushUrl({ url: 'pages/ChatPage', params: { prompt: prompt } });
    } else {
      router.pushUrl({ url: 'pages/ChatPage' });
    }
  }

  build() {
    Column({ space: 0 }) {
      // 主内容区
      Scroll() {
        Column({ space: 0 }) {
          // 品牌标题区
          Column({ space: 8 }) {
            Text('说出需求，生成界面')
              .fontSize(28)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.TEXT_PRIMARY)
              .textAlign(TextAlign.Center)
              .width('100%')
            // 日落渐变装饰条
            Column()
              .width(120)
              .height(3)
              .backgroundColor(Theme.GOLD)
              .borderRadius(2)
              .margin({ top: 4, bottom: 4 })
            Text('用自然语言描述你想要的界面，AI 实时生成代码')
              .fontSize(14)
              .fontColor(Theme.TEXT_SECONDARY)
              .textAlign(TextAlign.Center)
              .width('100%')
          }
          .padding({ top: 32, bottom: 24 })

          // 快捷模板网格 — 2列
          Column({ space: 12 }) {
            Row() {
              Text('快速创建')
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.TEXT_PRIMARY)
              Blank()
              Text('卡片工坊 ›')
                .fontSize(13)
                .fontColor(Theme.PRIMARY)
                .onClick(() => {
                  router.pushUrl({ url: 'pages/CardEditor' });
                })
            }
            .width('100%')
            .padding({ left: 16, right: 16 })

            Grid() {
              ForEach(QUICK_CARDS, (card: QuickCard) => {
                GridItem() {
                  Column({ space: 6 }) {
                    Column() {
                      CraftIcon({ iconName: card.iconName, iconSize: 28, color: Theme.TEXT_LIGHT })
                    }
                    .width(56)
                    .height(56)
                    .backgroundColor(Theme.PRIMARY)
                    .borderRadius(16)
                    .justifyContent(FlexAlign.Center)
                    Text(card.name)
                      .fontSize(14)
                      .fontWeight(FontWeight.Medium)
                      .fontColor(Theme.TEXT_PRIMARY)
                    Text(card.desc)
                      .fontSize(11)
                      .fontColor(Theme.TEXT_TERTIARY)
                  }
                  .width('100%')
                  .height(120)
                  .backgroundColor(Theme.BG_CARD)
                  .borderRadius(Theme.RADIUS_XL)
                  .border({ width: 1, color: Theme.BORDER })
                  .shadow({ radius: 4, color: Theme.SHADOW_SM, offsetY: 1 })
                  .justifyContent(FlexAlign.Center)
                  .onClick(() => {
                    this.startChat(card.prompt);
                  })
                }
              })
            }
            .columnsTemplate('1fr 1fr')
            .columnsGap(12)
            .rowsGap(12)
            .padding({ left: 16, right: 16 })
          }
          .width('100%')

          // 最近项目 — 横向滚动
          Column({ space: 12 }) {
            Row() {
              Text('最近项目')
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.TEXT_PRIMARY)
              Blank()
              Text('查看全部 ›')
                .fontSize(13)
                .fontColor(Theme.PRIMARY)
                .onClick(() => {
                  router.pushUrl({ url: 'pages/ProjectManage' });
                })
            }
            .width('100%')
            .padding({ left: 16, right: 16 })

            List({ space: 12 }) {
              ForEach(this.projects, (proj: ProjectItem) => {
                ListItem() {
                  Column({ space: 6 }) {
                    Column({ space: 4 }) {
                      Row() {
                        Circle()
                          .width(5)
                          .height(5)
                          .fill(getProjectCoverStyle(proj.name, proj.type).accentColor)
                          .opacity(0.5)
                      }
                      .width('100%')
                      .padding({ top: 6, left: 8 })

                      Blank()

                      CraftIcon({
                        iconName: getProjectCoverStyle(proj.name, proj.type).iconName,
                        iconSize: 26,
                        color: getProjectCoverStyle(proj.name, proj.type).accentColor
                      })

                      Text(getProjectCoverStyle(proj.name, proj.type).label)
                        .fontSize(9)
                        .fontColor(getProjectCoverStyle(proj.name, proj.type).accentColor)
                        .opacity(0.75)

                      Blank()
                    }
                    .width(112)
                    .height(80)
                    .backgroundColor(getProjectCoverStyle(proj.name, proj.type).bgColor)
                    .borderRadius({ topLeft: Theme.RADIUS_MD, topRight: Theme.RADIUS_MD })

                    Text(proj.name)
                      .fontSize(13)
                      .fontColor(Theme.TEXT_PRIMARY)
                      .maxLines(1)
                      .textOverflow({ overflow: TextOverflow.Ellipsis })
                      .width(100)
                      .textAlign(TextAlign.Center)

                    Text(proj.updateTime)
                      .fontSize(11)
                      .fontColor(Theme.TEXT_TERTIARY)
                  }
                  .width(112)
                  .height(140)
                  .backgroundColor(Theme.BG_CARD)
                  .borderRadius(Theme.RADIUS_LG)
                  .border({ width: 1, color: Theme.BORDER })
                  .shadow({ radius: 4, color: Theme.SHADOW_SM, offsetY: 1 })
                  .onClick(() => {
                    router.pushUrl({
                      url: 'pages/ProjectDetail',
                      params: {
                        projectId: proj.id,
                        projectName: proj.name,
                        projectType: proj.type,
                        updateTime: proj.updateTime
                      }
                    });
                  })
                }
              })
            }
            .width('100%')
            .height(156)
            .listDirection(Axis.Horizontal)
            .scrollBar(BarState.Off)
            .padding({ left: 16, right: 16 })
          }
          .width('100%')
          .padding({ top: 24 })

          // 底部占位（给FAB留空间）
          Column().height(100)
        }
        .width('100%')
      }
      .layoutWeight(1)
      .scrollBar(BarState.Auto)

      // FAB 浮动按钮
      Column() {
        Button() {
          CraftIcon({ iconName: 'add', iconSize: 28, color: Theme.TEXT_LIGHT })
        }
        .type(ButtonType.Circle)
        .width(56)
        .height(56)
        .backgroundColor(Theme.PRIMARY)
        .shadow({ radius: 16, color: 'rgba(212,118,62,0.35)', offsetY: 4 })
        .onClick(() => {
          router.pushUrl({ url: 'pages/ChatPage' });
        })
      }
      .width('100%')
      .height(80)
      .position({ x: 0, y: '100%' })
      .translate({ y: -136 })
      .padding({ right: 16 })
      .alignItems(HorizontalAlign.End)

      // 底部导航栏
      BottomNav({ activeTab: 0 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.BG_MAIN)
  }
}
