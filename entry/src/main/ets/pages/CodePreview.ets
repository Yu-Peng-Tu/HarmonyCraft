import { Theme } from '../utils/Theme';
import { router, promptAction } from '@kit.ArkUI';
import { CodePreviewParams, saveProjectToStorage } from '../models/Models';
import { CraftIcon } from '../components/CraftIcon';
import pasteboard from '@ohos.pasteboard';

const DEFAULT_CODE: string = `@Entry\n@Component\nstruct CounterPage {\n  @State count: number = 0\n\n  build() {\n    Column({ space: 20 }) {\n      Text('计数器')\n        .fontSize(24)\n        .fontWeight(FontWeight.Bold)\n      Text(this.count.toString())\n        .fontSize(48)\n        .fontColor(Theme.PRIMARY)\n      Button('点击 +1')\n        .type(ButtonType.Capsule)\n        .backgroundColor(Theme.PRIMARY)\n        .onClick(() => this.count++)\n    }\n    .width('100%')\n    .height('100%')\n    .justifyContent(FlexAlign.Center)\n  }\n}`;

@Component
struct PreviewRenderer {
  @Prop code: string = '';

  // CounterPage
  @State count: number = 0;

  // LoginPage
  @State username: string = '';
  @State password: string = '';

  // TodoPage
  @State todos: string[] = ['学习ArkTS', '写代码', '测试应用'];
  @State newTask: string = '';

  // SettingsPage
  @State notifyOn: boolean = true;
  @State darkMode: boolean = false;

  // MusicPage
  @State playing: boolean = false;
  @State progress: number = 35;

  // ChatRoomPage
  @State chatMessage: string = '';
  @State chatMessages: string[] = ['你好！', '这是一个聊天界面模板。', '支持发送文字消息。'];

  // WeatherPage
  @State weatherCity: string = '深圳';
  @State weatherTemp: number = 28;
  @State weatherCondition: string = '晴';

  // ProfileCenterPage
  @State orders: number = 12;
  @State favorites: number = 5;
  @State historyCount: number = 128;

  // DataListPage
  @State dataItems: string[][] = [
    ['项目', '状态', '进度'],
    ['首页开发', '进行中', '80%'],
    ['接口联调', '待开始', '0%'],
    ['UI优化', '已完成', '100%']
  ];

  build() {
    Column({ space: 20 }) {
      if (this.code.includes('CounterPage')) {
        this.CounterPreview()
      } else if (this.code.includes('LoginPage')) {
        this.LoginPreview()
      } else if (this.code.includes('TodoPage')) {
        this.TodoPreview()
      } else if (this.code.includes('NewsCardPage')) {
        this.NewsPreview()
      } else if (this.code.includes('SettingsPage')) {
        this.SettingsPreview()
      } else if (this.code.includes('DataListPage')) {
        this.DataListPreview()
      } else if (this.code.includes('MusicPage')) {
        this.MusicPreview()
      } else if (this.code.includes('ChatRoomPage')) {
        this.ChatPreview()
      } else if (this.code.includes('WeatherPage')) {
        this.WeatherPreview()
      } else if (this.code.includes('ProfileCenterPage')) {
        this.ProfilePreview()
      } else {
        this.CustomPreview()
      }
    }
    .width('100%')
    .layoutWeight(1)
    .justifyContent(FlexAlign.Center)
    .padding({ top: 16, bottom: 16 })
  }

  @Builder
  CounterPreview(): void {
    Column({ space: 20 }) {
      Text('计数器')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.TEXT_PRIMARY)
      Text(String(this.count))
        .fontSize(48)
        .fontColor(Theme.PRIMARY)
      Button('点击 +1')
        .type(ButtonType.Capsule)
        .backgroundColor(Theme.PRIMARY)
        .fontColor(Theme.TEXT_LIGHT)
        .height(44)
        .padding({ left: 32, right: 32 })
        .onClick(() => { this.count = this.count + 1; })
    }
  }

  @Builder
  LoginPreview(): void {
    Column({ space: 14 }) {
      Text('用户登录')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
      TextInput({ placeholder: '请输入用户名', text: $$this.username })
        .height(44)
        .backgroundColor(Theme.BG_INPUT)
        .borderRadius(10)
        .width('80%')
      TextInput({ placeholder: '请输入密码', text: $$this.password })
        .type(InputType.Password)
        .height(44)
        .backgroundColor(Theme.BG_INPUT)
        .borderRadius(10)
        .width('80%')
      Button('登录')
        .type(ButtonType.Capsule)
        .backgroundColor(Theme.PRIMARY)
        .width('80%')
        .height(44)
        .margin({ top: 8 })
        .onClick(() => {
          if (this.username.length > 0 && this.password.length > 0) {
            promptAction.showToast({ message: '登录成功', duration: 1500 });
          } else {
            promptAction.showToast({ message: '请填写用户名和密码', duration: 1500 });
          }
        })
    }
  }

  @Builder
  TodoPreview(): void {
    Column({ space: 10 }) {
      Text('待办清单')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .width('80%')
        .margin({ bottom: 4 })
      List({ space: 6 }) {
        ForEach(this.todos, (item: string) => {
          ListItem() {
            Text(item)
              .fontSize(14)
              .padding(10)
              .width('100%')
              .backgroundColor(Theme.BG_INPUT)
              .borderRadius(8)
          }
          .onClick(() => {
            const idx: number = this.todos.indexOf(item);
            if (idx >= 0) {
              const newTodos: string[] = [];
              for (let i: number = 0; i < this.todos.length; i++) {
                if (i !== idx) {
                  newTodos.push(this.todos[i]);
                }
              }
              this.todos = newTodos;
            }
          })
        }, (item: string) => item)
      }
      .width('80%')
      .height(120)

      Row({ space: 8 }) {
        TextInput({ placeholder: '新任务...', text: $$this.newTask })
          .layoutWeight(1)
          .height(40)
          .backgroundColor(Theme.BG_INPUT)
          .borderRadius(8)
        Button('+')
          .type(ButtonType.Circle)
          .backgroundColor(Theme.PRIMARY)
          .fontColor(Theme.TEXT_LIGHT)
          .width(40)
          .height(40)
          .onClick(() => {
            if (this.newTask.length > 0) {
              this.todos.push(this.newTask);
              this.newTask = '';
            }
          })
      }
      .width('80%')
    }
  }

  @Builder
  NewsPreview(): void {
    Column({ space: 8 }) {
      Text('鸿蒙生态蓬勃发展')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .maxLines(2)
        .width('80%')
      Text('HarmonyOS NEXT 正式发布，全新星盾安全架构助力万物互联。')
        .fontSize(12)
        .fontColor(Theme.TEXT_SECONDARY)
        .maxLines(3)
        .width('80%')
      Button('阅读全文 ›')
        .fontSize(12)
        .fontColor(Theme.PRIMARY)
        .backgroundColor(Color.Transparent)
        .onClick(() => {
          promptAction.showToast({ message: '跳转文章详情', duration: 1500 });
        })
    }
    .padding(14)
    .width('80%')
    .backgroundColor(Theme.BG_INPUT)
    .borderRadius(10)
  }

  @Builder
  SettingsPreview(): void {
    Column({ space: 8 }) {
      Text('设置')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .width('80%')
        .margin({ bottom: 4 })
      Row({ space: 12 }) {
        Text('消息通知')
          .fontSize(13)
          .layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: this.notifyOn })
          .selectedColor(Theme.PRIMARY)
          .width(40)
          .onChange((val: boolean) => { this.notifyOn = val; })
      }
      .width('80%')
      .height(40)
      Row({ space: 12 }) {
        Text('深色模式')
          .fontSize(13)
          .layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: this.darkMode })
          .selectedColor(Theme.PRIMARY)
          .width(40)
          .onChange((val: boolean) => { this.darkMode = val; })
      }
      .width('80%')
      .height(40)
    }
    .padding(14)
    .width('80%')
    .backgroundColor(Theme.BG_INPUT)
    .borderRadius(10)
  }

  @Builder
  DataListPreview(): void {
    Column({ space: 6 }) {
      Text('项目进度')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .width('80%')
        .margin({ bottom: 4 })
      Column({ space: 0 }) {
        Row() {
          Text('项目').fontSize(11).layoutWeight(1).textAlign(TextAlign.Center)
          Text('状态').fontSize(11).layoutWeight(1).textAlign(TextAlign.Center)
          Text('进度').fontSize(11).layoutWeight(1).textAlign(TextAlign.Center)
        }
        .width('80%')
        .height(30)
        .backgroundColor(Theme.BG_MAIN)
        ForEach(this.dataItems, (row: string[], idx: number) => {
          if (idx > 0) {
            ListItem() {
              Row() {
                ForEach(row, (cell: string) => {
                  Text(cell)
                    .fontSize(11)
                    .layoutWeight(1)
                    .textAlign(TextAlign.Center)
                }, (cell: string) => cell)
              }
              .width('80%')
              .height(30)
            }
          }
        }, (row: string[]) => row[0])
      }
    }
    .padding(14)
    .width('80%')
    .backgroundColor(Theme.BG_INPUT)
    .borderRadius(10)
  }

  @Builder
  MusicPreview(): void {
    Column({ space: 0 }) {
      Column()
        .width(80)
        .height(80)
        .backgroundColor(Theme.PRIMARY)
        .borderRadius(16)
        .margin({ bottom: 16 })
      Text('夏日微风')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 4 })
      Text('创作者 · HarmonyOS')
        .fontSize(11)
        .fontColor(Theme.TEXT_SECONDARY)
        .margin({ bottom: 12 })
      Slider({ value: this.progress, min: 0, max: 100 })
        .width('80%')
        .margin({ bottom: 12 })
        .onChange((val: number) => { this.progress = val; })
      Row({ space: 0 }) {
        Button('⏮')
          .backgroundColor(Color.Transparent)
          .fontColor(Theme.TEXT_SECONDARY)
          .fontSize(14)
        Button(this.playing ? '⏸' : '▶')
          .backgroundColor(Theme.PRIMARY)
          .fontColor(Theme.TEXT_LIGHT)
          .width(36)
          .height(36)
          .borderRadius(18)
          .onClick(() => { this.playing = !this.playing; })
        Button('⏭')
          .backgroundColor(Color.Transparent)
          .fontColor(Theme.TEXT_SECONDARY)
          .fontSize(14)
      }
      .width('80%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('80%')
    .padding(16)
  }

  @Builder
  ChatPreview(): void {
    Column({ space: 8 }) {
      Text('聊天')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .width('80%')
        .margin({ bottom: 4 })
      List({ space: 6 }) {
        ForEach(this.chatMessages, (msg: string) => {
          ListItem() {
            Text(msg)
              .fontSize(12)
              .padding(8)
              .backgroundColor(Theme.BG_INPUT)
              .borderRadius(8)
              .width('100%')
          }
        }, (msg: string) => msg)
      }
      .width('80%')
      .height(100)
      Row({ space: 6 }) {
        TextInput({ placeholder: '输入消息', text: $$this.chatMessage })
          .layoutWeight(1)
          .height(32)
          .fontSize(11)
          .backgroundColor(Theme.BG_INPUT)
          .borderRadius(8)
        Button('发送')
          .height(32)
          .fontSize(11)
          .backgroundColor(Theme.PRIMARY)
          .fontColor(Theme.TEXT_LIGHT)
          .onClick(() => {
            if (this.chatMessage.length > 0) {
              this.chatMessages.push(this.chatMessage);
              this.chatMessage = '';
            }
          })
      }
      .width('80%')
    }
    .width('80%')
    .height(220)
    .padding(12)
  }

  @Builder
  WeatherPreview(): void {
    Column({ space: 0 }) {
      Text(this.weatherCity)
        .fontSize(13)
        .fontColor('rgba(255,255,255,0.9)')
      Text(String(this.weatherTemp) + '°')
        .fontSize(36)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.TEXT_LIGHT)
        .margin({ top: 4, bottom: 4 })
      Text(this.weatherCondition)
        .fontSize(12)
        .fontColor('rgba(255,255,255,0.8)')
        .margin({ bottom: 8 })
      Button('切换城市')
        .fontSize(11)
        .fontColor(Theme.TEXT_LIGHT)
        .backgroundColor('rgba(255,255,255,0.2)')
        .borderRadius(Theme.RADIUS_MD)
        .height(28)
        .padding({ left: 12, right: 12 })
        .margin({ bottom: 12 })
        .onClick(() => {
          if (this.weatherCity === '深圳') {
            this.weatherCity = '北京';
            this.weatherTemp = 22;
            this.weatherCondition = '多云';
          } else {
            this.weatherCity = '深圳';
            this.weatherTemp = 28;
            this.weatherCondition = '晴';
          }
        })
      Row({ space: 0 }) {
        Column({ space: 2 }) {
          Text('湿度').fontSize(10).fontColor('rgba(255,255,255,0.7)')
          Text('65%').fontSize(11).fontColor(Theme.TEXT_LIGHT)
        }
        Column({ space: 2 }) {
          Text('风速').fontSize(10).fontColor('rgba(255,255,255,0.7)')
          Text('3级').fontSize(11).fontColor(Theme.TEXT_LIGHT)
        }
        Column({ space: 2 }) {
          Text('气压').fontSize(10).fontColor('rgba(255,255,255,0.7)')
          Text('1013').fontSize(11).fontColor(Theme.TEXT_LIGHT)
        }
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('80%')
    .padding(20)
    .backgroundColor(Theme.PRIMARY)
    .borderRadius(10)
  }

  @Builder
  ProfilePreview(): void {
    Column({ space: 0 }) {
      Column()
        .width(40)
        .height(40)
        .backgroundColor(Theme.PRIMARY)
        .borderRadius(20)
        .margin({ bottom: 8 })
      Text('用户名称')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 2 })
      Text('ID: 88021234')
        .fontSize(10)
        .fontColor(Theme.TEXT_SECONDARY)
        .margin({ bottom: 12 })
      Column({ space: 0 }) {
        this.ProfileRow('我的订单', String(this.orders))
        this.ProfileRow('我的收藏', String(this.favorites))
        this.ProfileRow('浏览历史', String(this.historyCount))
      }
      .width('80%')
      .padding(8)
      .backgroundColor(Theme.BG_INPUT)
      .borderRadius(10)
    }
    .width('80%')
    .padding(14)
  }

  @Builder
  ProfileRow(label: string, value: string): void {
    Row() {
      Text(label)
        .fontSize(12)
        .fontColor(Theme.TEXT_PRIMARY)
      Blank()
      if (value.length > 0) {
        Text(value)
          .fontSize(11)
          .fontColor(Theme.TEXT_TERTIARY)
      }
      Text('›')
        .fontSize(14)
        .fontColor(Theme.TEXT_TERTIARY)
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({ top: 8, bottom: 8 })
    .border({ width: { bottom: 1 }, color: Theme.BORDER })
  }

  @Builder
  CustomPreview(): void {
    Column({ space: 12 }) {
      CraftIcon({ iconName: 'templates', iconSize: 40, color: Theme.TEXT_TERTIARY })
      Text('自定义页面')
        .fontSize(14)
        .fontColor(Theme.TEXT_TERTIARY)
      Button('点击测试交互')
        .fontSize(13)
        .fontColor(Theme.TEXT_LIGHT)
        .backgroundColor(Theme.PRIMARY)
        .borderRadius(Theme.RADIUS_MD)
        .height(36)
        .padding({ left: 20, right: 20 })
        .onClick(() => {
          promptAction.showToast({ message: '预览交互正常', duration: 1500 });
        })
    }
  }
}

@Entry
@Component
struct CodePreview {
  @State displayCode: string = DEFAULT_CODE;
  @State activeTab: string = 'code';
  @State pageOpacity: number = 0;

  onPageShow(): void {
    this.pageOpacity = 1;
    const params: object | undefined = router.getParams();
    if (params) {
      const p: CodePreviewParams = params as CodePreviewParams;
      if (p.code && p.code.length > 0) {
        this.displayCode = p.code;
      }
    }
  }

  onPageHide(): void {
    this.pageOpacity = 0;
  }

  private getLineNumbers(): string {
    const lines: string[] = this.displayCode.split('\n');
    let result: string = '';
    const count: number = lines.length > 0 && lines[lines.length - 1].length === 0 ? lines.length - 1 : lines.length;
    for (let i: number = 0; i < count; i++) {
      result += (i + 1).toString();
      if (i < count - 1) {
        result += '\n';
      }
    }
    return result;
  }

  private getFileName(): string {
    const match: string[] | null = this.displayCode.match(/struct\s+(\w+)/);
    if (match && match[1]) {
      return match[1] + '.ets';
    }
    return 'Generated.ets';
  }

  private copyCode(): void {
    const pasteData: pasteboard.PasteData = pasteboard.createPlainTextData(this.displayCode);
    pasteboard.getSystemPasteboard().setPasteData(pasteData);
    promptAction.showToast({ message: '代码已复制到剪贴板', duration: 2000 });
  }

  private exportProject(): void {
    saveProjectToStorage(this.getFileName(), '界面', this.displayCode);
    promptAction.showToast({ message: '项目导出成功', duration: 2000 });
  }

  build() {
    Column({ space: 0 }) {
      // 顶部栏
      Row({ space: 12 }) {
        Button() {
          CraftIcon({ iconName: 'back', iconSize: 22, color: Theme.TEXT_PRIMARY })
        }
        .type(ButtonType.Circle)
        .width(40)
        .height(40)
        .backgroundColor(Theme.BG_INPUT)
        .onClick(() => router.back())

        Text(this.getFileName())
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.TEXT_PRIMARY)
          .layoutWeight(1)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })

        Button() {
          Row({ space: 4 }) {
            CraftIcon({ iconName: 'copy', iconSize: 16, color: Theme.PRIMARY })
            Text('复制')
              .fontSize(13)
              .fontColor(Theme.PRIMARY)
          }
        }
        .type(ButtonType.Capsule)
        .backgroundColor(Theme.USER_BUBBLE_BG)
        .height(32)
        .padding({ left: 12, right: 12 })
        .onClick(() => this.copyCode())
      }
      .width('100%')
      .height(56)
      .padding({ left: 16, right: 16 })
      .backgroundColor(Theme.BG_CARD)
      .border({ width: { bottom: 1 }, color: Theme.BORDER })

      // Tab 切换栏
      Row({ space: 0 }) {
        this.TabItemBuilder('代码', 'code')
        this.TabItemBuilder('预览', 'preview')
      }
      .width('100%')
      .height(44)
      .backgroundColor(Theme.BG_CARD)

      // 内容区
      if (this.activeTab === 'code') {
        this.CodeTabBuilder()
      } else {
        this.PreviewTabBuilder()
      }

      // 底部导出按钮
      Button() {
        Text('导出到 DevEco Studio')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.TEXT_LIGHT)
      }
      .type(ButtonType.Capsule)
      .backgroundColor(Theme.PRIMARY)
      .width('90%')
      .height(52)
      .margin({ top: 12, bottom: 12 })
      .shadow({ radius: 8, color: 'rgba(212,118,62,0.25)', offsetY: 2 })
      .onClick(() => this.exportProject())
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.BG_MAIN)
  }

  @Builder
  TabItemBuilder(label: string, tabKey: string): void {
    Column({ space: 4 }) {
      Text(label)
        .fontSize(15)
        .fontWeight(this.activeTab === tabKey ? FontWeight.Bold : FontWeight.Normal)
        .fontColor(this.activeTab === tabKey ? Theme.PRIMARY : Theme.TEXT_SECONDARY)
      Column()
        .width(24)
        .height(3)
        .backgroundColor(this.activeTab === tabKey ? Theme.PRIMARY : Color.Transparent)
        .borderRadius(2)
    }
    .width('50%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .onClick(() => { this.activeTab = tabKey; })
  }

  @Builder
  CodeTabBuilder(): void {
    Scroll() {
      Row({ space: 0 }) {
        Column() {
          Text(this.getLineNumbers())
            .fontSize(12)
            .fontColor(Theme.TEXT_TERTIARY)
            .fontFamily('monospace')
            .lineHeight(22)
            .padding({ left: 10, right: 10, top: 12 })
        }
        .width(40)
        .backgroundColor(Theme.CODE_EDITOR_BG)

        Scroll() {
          Row() {
            Text(this.displayCode)
              .fontSize(12)
              .fontFamily('monospace')
              .fontColor(Theme.CODE_TEXT)
              .lineHeight(22)
              .padding(12)
          }
        }
        .scrollable(ScrollDirection.Horizontal)
        .width('100%')
        .height('100%')
        .backgroundColor(Theme.CODE_EDITOR_BG)
      }
      .width('100%')
    }
    .width('100%')
    .layoutWeight(1)
    .backgroundColor(Theme.CODE_EDITOR_BG)
  }

  @Builder
  PreviewTabBuilder(): void {
    Scroll() {
      Column({ space: 0 }) {
        Column({ space: 0 }) {
          Row() {
            Text('9:41')
              .fontSize(10)
              .fontColor(Theme.TEXT_TERTIARY)
            Blank()
            Text('100%')
              .fontSize(10)
              .fontColor(Theme.TEXT_TERTIARY)
          }
          .width('100%')
          .height(24)
          .padding({ left: 16, right: 16 })

          PreviewRenderer({ code: this.displayCode })
        }
        .width('92%')
        .height(520)
        .backgroundColor(Theme.BG_CARD)
        .borderRadius(24)
        .border({ width: 3, color: Theme.TEXT_PRIMARY })
        .shadow({ radius: 16, color: Theme.SHADOW_LG, offsetY: 6 })
        .margin(16)
      }
      .width('100%')
      .padding({ top: 8, bottom: 8 })
    }
    .width('100%')
    .layoutWeight(1)
    .backgroundColor(Theme.BG_MAIN)
  }
}
