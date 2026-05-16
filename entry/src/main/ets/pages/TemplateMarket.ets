import { Theme } from '../utils/Theme';
import { router } from '@kit.ArkUI';
import { TemplateItem } from '../models/Models';
import { BottomNav } from '../components/BottomNav';
import { CraftIcon } from '../components/CraftIcon';
import { EmptyState } from '../components/EmptyState';

interface CategoryTag {
  name: string;
}

const CATEGORIES: CategoryTag[] = [
  { name: '全部' },
  { name: '表单' },
  { name: '列表' },
  { name: '导航' },
  { name: '卡片' },
  { name: '弹窗' },
  { name: '完整页面' }
];

const TEMPLATES: TemplateItem[] = [
  { id: 't1', name: '用户登录页', desc: '包含账号密码输入和登录按钮的完整表单', category: '表单', useCount: 1250, prompt: '生成一个用户登录页面，包含账号密码输入和登录按钮' },
  { id: 't2', name: '待办清单', desc: '支持添加、完成、删除任务的管理页面', category: '列表', useCount: 980, prompt: '创建一个待办清单应用，支持添加任务和列表展示' },
  { id: 't3', name: '底部导航栏', desc: '包含4个Tab的底部导航组件', category: '导航', useCount: 860, prompt: '生成一个底部导航栏组件，包含4个Tab切换' },
  { id: 't4', name: '信息展示卡', desc: '图文混排的信息卡片，支持头像和描述', category: '卡片', useCount: 720, prompt: '创建一个图文混排的信息展示卡片组件' },
  { id: 't5', name: '确认对话框', desc: '带标题、内容和确认取消按钮的弹窗', category: '弹窗', useCount: 650, prompt: '生成一个确认对话框组件，包含标题内容和确认取消按钮' },
  { id: 't6', name: '个人中心页', desc: '包含头像、信息和设置入口的完整页面', category: '完整页面', useCount: 1100, prompt: '创建一个个人中心页面，包含头像信息和设置入口' },
  { id: 't7', name: '注册表单', desc: '手机号验证码注册的完整流程', category: '表单', useCount: 540, prompt: '生成一个手机号验证码注册表单页面' },
  { id: 't8', name: '商品列表', desc: '带图片、价格和购买按钮的商品展示', category: '列表', useCount: 890, prompt: '创建一个商品列表页面，带图片价格和购买按钮' },
  { id: 't9', name: '用户注册页', desc: '新用户注册页面，含用户名邮箱密码', category: '表单', useCount: 760, prompt: '生成一个新用户注册页面，包含用户名邮箱和密码输入' },
  { id: 't10', name: '联系表单', desc: '姓名邮箱留言提交的联系页面', category: '表单', useCount: 480, prompt: '创建一个联系表单页面，包含姓名邮箱和留言提交' },
  { id: 't11', name: '文章列表', desc: '图文列表带封面和摘要展示', category: '列表', useCount: 920, prompt: '创建一个文章列表页面，带封面图和摘要展示' },
  { id: 't12', name: '消息通知', desc: '消息通知列表带已读未读标记', category: '列表', useCount: 830, prompt: '创建一个消息通知列表页面，支持已读未读标记' },
  { id: 't13', name: '商品卡片', desc: '商品信息卡片含图片价格和标签', category: '卡片', useCount: 1050, prompt: '创建一个商品信息卡片组件，含图片价格和标签' },
  { id: 't14', name: '提示弹窗', desc: '操作成功或失败的提示弹窗组件', category: '弹窗', useCount: 680, prompt: '生成一个提示弹窗组件，支持成功和失败状态' },
  { id: 't15', name: '搜索页面', desc: '带搜索框和结果列表的完整页面', category: '完整页面', useCount: 970, prompt: '创建一个搜索页面，包含搜索框和结果列表' }
];

@Entry
@Component
struct TemplateMarket {
  @State selectedCategory: string = '全部';
  @State searchText: string = '';
  @State pageOpacity: number = 0;

  onPageShow(): void {
    this.pageOpacity = 1;
  }

  onPageHide(): void {
    this.pageOpacity = 0;
  }

  private getFilteredTemplates(): TemplateItem[] {
    let list: TemplateItem[] = TEMPLATES;
    if (this.selectedCategory !== '全部') {
      list = list.filter((t: TemplateItem) => t.category === this.selectedCategory);
    }
    if (this.searchText.length > 0) {
      list = list.filter((t: TemplateItem) => t.name.includes(this.searchText) || t.desc.includes(this.searchText));
    }
    return list;
  }

  build() {
    Column({ space: 0 }) {
      // 顶部栏
      Row() {
        Button() {
          CraftIcon({ iconName: 'back', iconSize: 22, color: Theme.TEXT_PRIMARY })
        }
        .type(ButtonType.Circle)
        .width(40)
        .height(40)
        .backgroundColor(Theme.BG_INPUT)
        .onClick(() => router.back())

        Text('设计模板')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.TEXT_PRIMARY)
          .layoutWeight(1)
      }
      .width('100%')
      .height(56)
      .padding({ left: 16, right: 16 })
      .backgroundColor(Theme.BG_CARD)
      .border({ width: { bottom: 1 }, color: Theme.BORDER })

      // 搜索栏
      Row() {
        CraftIcon({ iconName: 'search', iconSize: 16, color: Theme.TEXT_TERTIARY })
        TextInput({ placeholder: '搜索模板...', text: $$this.searchText })
          .placeholderColor(Theme.TEXT_TERTIARY)
          .fontSize(14)
          .height(44)
          .backgroundColor('transparent')
          .layoutWeight(1)
      }
      .width('100%')
      .height(44)
      .backgroundColor(Theme.BG_INPUT)
      .borderRadius(12)
      .padding({ left: 12, right: 12 })
      .margin({ left: 16, right: 16, top: 12 })

      // 分类标签 — 胶囊芯片
      List() {
        ForEach(CATEGORIES, (cat: CategoryTag) => {
          ListItem() {
            Button() {
              Text(cat.name)
                .fontSize(13)
                .fontColor(this.selectedCategory === cat.name ? Theme.TEXT_LIGHT : Theme.TEXT_SECONDARY)
            }
            .type(ButtonType.Capsule)
            .backgroundColor(this.selectedCategory === cat.name ? Theme.PRIMARY : Theme.BG_CARD)
            .border({ width: this.selectedCategory === cat.name ? 0 : 1, color: Theme.BORDER })
            .height(32)
            .padding({ left: 14, right: 14 })
            .onClick(() => { this.selectedCategory = cat.name; })
          }
        })
      }
      .width('100%')
      .height(44)
      .padding({ left: 12, right: 12 })
      .listDirection(Axis.Horizontal)
      .scrollBar(BarState.Off)

      // 模板网格 — 2列
      if (this.getFilteredTemplates().length === 0) {
        EmptyState({
          title: '未找到模板',
          subtitle: '尝试其他关键词或切换分类看看吧'
        })
          .layoutWeight(1)
      } else {
        Scroll() {
          Grid() {
            ForEach(this.getFilteredTemplates(), (tmpl: TemplateItem) => {
            GridItem() {
              Column({ space: 0 }) {
                // 预览区
                Stack({ alignContent: Alignment.Center }) {
                  Text(tmpl.category.substring(0, 1))
                    .fontSize(40)
                    .fontColor(Theme.PRIMARY)

                  // 暖色遮罩
                  Column()
                    .width('100%')
                    .height('100%')
                    .backgroundColor('rgba(212,118,62,0.03)')

                  // 手工类型标签
                  Text(tmpl.category)
                    .fontSize(10)
                    .fontColor(Theme.TEXT_LIGHT)
                    .backgroundColor(Theme.ACCENT)
                    .padding({ left: 6, right: 6, top: 2, bottom: 2 })
                    .borderRadius(4)
                    .position({ x: 8, y: 8 })

                  if (tmpl.useCount > 800) {
                    Text('Popular')
                      .fontSize(10)
                      .fontColor(Theme.TEXT_LIGHT)
                      .backgroundColor(Theme.WARNING)
                      .padding({ left: 6, right: 6, top: 2, bottom: 2 })
                      .borderRadius(4)
                      .position({ x: 8, y: 28 })
                  }
                }
                .width('100%')
                .height(120)
                .backgroundColor(Theme.BG_INPUT)
                .borderRadius({ topLeft: Theme.RADIUS_XL, topRight: Theme.RADIUS_XL })

                // 信息区
                Column({ space: 6 }) {
                  Text(tmpl.name)
                    .fontSize(15)
                    .fontWeight(FontWeight.Medium)
                    .fontColor(Theme.TEXT_PRIMARY)
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .width('100%')

                  Text(tmpl.desc)
                    .fontSize(12)
                    .fontColor(Theme.TEXT_SECONDARY)
                    .maxLines(2)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .width('100%')
                    .height(36)

                  Row() {
                    Text(tmpl.useCount.toString() + ' 次使用')
                      .fontSize(11)
                      .fontColor(Theme.PRIMARY)
                    Blank()
                    Button() {
                      Text('使用模板')
                        .fontSize(12)
                        .fontColor(Theme.TEXT_LIGHT)
                    }
                    .type(ButtonType.Capsule)
                    .backgroundColor(Theme.PRIMARY)
                    .height(28)
                    .padding({ left: 14, right: 14 })
                    .onClick(() => {
                      router.pushUrl({ url: 'pages/ChatPage', params: { prompt: tmpl.prompt } });
                    })
                  }
                  .width('100%')
                }
                .width('100%')
                .padding(12)
              }
              .width('100%')
              .height(260)
              .backgroundColor(Theme.BG_CARD)
              .borderRadius(Theme.RADIUS_XL)
              .border({ width: 1, color: Theme.BORDER })
              .shadow({ radius: 4, color: Theme.SHADOW_SM, offsetY: 1 })
            }
            })
          }
          .columnsTemplate('1fr 1fr')
          .columnsGap(12)
          .rowsGap(12)
          .padding(16)
        }
        .layoutWeight(1)
        .scrollBar(BarState.Auto)
      }

      // 底部导航栏
      BottomNav({ activeTab: 1 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.BG_MAIN)
    .opacity(this.pageOpacity)
    .animation({ duration: 250, curve: Curve.EaseOut })
  }
}
