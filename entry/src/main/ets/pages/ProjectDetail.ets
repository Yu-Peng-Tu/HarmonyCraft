import router from '@ohos.router';
import { Theme } from '../utils/Theme';
import { CraftIcon } from '../components/CraftIcon';
import { ProjectItem, CodePreviewParams, ProjectVersion, getProjectVersions, saveProjectVersion } from '../models/Models';

interface ProjectDetailParams {
  projectId?: string;
  projectName?: string;
  projectType?: string;
  updateTime?: string;
}

@Entry
@Component
export struct ProjectDetailPage {
  @State projectName: string = '';
  @State projectType: string = '';
  @State updateTime: string = '';
  @State codeContent: string = '';
  @State projectId: string = '';
  @State showVersions: boolean = false;
  @State versions: ProjectVersion[] = [];

  private mockCodeMap: Map<string, string> = new Map([
    ['计数器', `import { Theme } from '../utils/Theme';

@Entry
@Component
export struct CounterPage {
  @State count: number = 0;
  build() {
    Column() {
      Text(String(this.count))
        .fontSize(56)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.PRIMARY);
      Row() {
        Button('-').onClick(() => this.count--);
        Button('+').onClick(() => this.count++);
      }.gap(20);
    }.width('100%').height('100%').justifyContent(FlexAlign.Center);
  }
}`],
    ['登录页', `@Entry
@Component
export struct LoginPage {
  @State username: string = '';
  @State password: string = '';
  build() {
    Column() {
      Text('登录').fontSize(28).fontWeight(FontWeight.Bold);
      TextInput({ placeholder: '用户名' }).onChange(v => this.username = v);
      TextInput({ placeholder: '密码' }).type(InputType.Password).onChange(v => this.password = v);
      Button('登录');
    }.padding(24).gap(16);
  }
}`],
    ['待办清单', `@Entry
@Component
export struct TodoPage {
  @State tasks: string[] = [];
  @State input: string = '';
  build() {
    Column() {
      Text('待办清单').fontSize(24).fontWeight(FontWeight.Bold);
      Row() {
        TextInput({ placeholder: '新任务' }).onChange(v => this.input = v).layoutWeight(1);
        Button('添加').onClick(() => { if (this.input) this.tasks.push(this.input); });
      }.gap(12);
      List() {
        ForEach(this.tasks, (task: string) => {
          ListItem() { Text(task).fontSize(16); }.padding(12);
        }, (task: string) => task);
      }.layoutWeight(1);
    }.padding(20);
  }
}`],
    ['新闻列表', `@Entry
@Component
export struct NewsPage {
  private news: Array<{ title: string; summary: string }> = [
    { title: 'HarmonyOS NEXT 发布', summary: '全新的分布式操作系统...' },
    { title: 'AI 编程助手', summary: '智能代码生成工具...' },
  ];
  build() {
    List() {
      ForEach(this.news, (item: { title: string; summary: string }) => {
        ListItem() {
          Column() {
            Text(item.title).fontSize(16).fontWeight(FontWeight.Bold);
            Text(item.summary).fontSize(13).fontColor(Theme.TEXT_SECONDARY).margin({ top: 4 });
          }.padding(16).backgroundColor(Theme.BG_CARD).borderRadius(Theme.RADIUS_MD);
        }.margin({ bottom: 12 });
      }, (item: { title: string; summary: string }) => item.title);
    }.padding(20);
  }
}`],
    ['设置', `@Entry
@Component
export struct SettingsPage {
  @State darkMode: boolean = false;
  @State notifications: boolean = true;
  build() {
    Column() {
      Text('设置').fontSize(24).fontWeight(FontWeight.Bold).margin({ bottom: 20 });
      Row() { Text('深色模式'); Toggle({ type: ToggleType.Switch, isOn: this.darkMode }); }.width('100%').justifyContent(FlexAlign.SpaceBetween).padding(16).backgroundColor(Theme.BG_CARD).borderRadius(Theme.RADIUS_MD).margin({ bottom: 12 });
      Row() { Text('通知'); Toggle({ type: ToggleType.Switch, isOn: this.notifications }); }.width('100%').justifyContent(FlexAlign.SpaceBetween).padding(16).backgroundColor(Theme.BG_CARD).borderRadius(Theme.RADIUS_MD);
    }.padding(20).gap(8);
  }
}`],
    ['数据列表', `@Entry
@Component
export struct DataListPage {
  private data: Array<{ name: string; value: number }> = [
    { name: '一月', value: 120 }, { name: '二月', value: 200 },
    { name: '三月', value: 150 }, { name: '四月', value: 280 },
  ];
  build() {
    Column() {
      Text('数据列表').fontSize(24).fontWeight(FontWeight.Bold).margin({ bottom: 16 });
      List() {
        ForEach(this.data, (item: { name: string; value: number }) => {
          ListItem() {
            Row() {
              Text(item.name).fontSize(15).fontColor(Theme.TEXT_PRIMARY);
              Text(String(item.value)).fontSize(15).fontColor(Theme.PRIMARY).fontWeight(FontWeight.Bold);
            }.width('100%').justifyContent(FlexAlign.SpaceBetween).padding(16);
          }.backgroundColor(Theme.BG_CARD).borderRadius(Theme.RADIUS_MD).margin({ bottom: 8 });
        }, (item: { name: string; value: number }) => item.name);
      }.layoutWeight(1);
    }.padding(20);
  }
}`],
    ['音乐播放器', `@Entry
@Component
export struct MusicPage {
  @State playing: boolean = false;
  @State progress: number = 35;
  build() {
    Column() {
      Column().width(200).height(200).backgroundColor(Theme.PRIMARY).borderRadius(Theme.RADIUS_XL).margin({ bottom: 32 });
      Text('夏日微风').fontSize(20).fontWeight(FontWeight.Bold).margin({ bottom: 8 });
      Text('创作者 · HarmonyOS').fontSize(14).fontColor(Theme.TEXT_SECONDARY).margin({ bottom: 24 });
      Slider({ value: this.progress, min: 0, max: 100 }).width('80%').margin({ bottom: 24 });
      Row() {
        Button('⏮').backgroundColor(Color.Transparent).fontColor(Theme.TEXT_SECONDARY);
        Button(this.playing ? '⏸' : '▶').backgroundColor(Theme.PRIMARY).fontColor(Theme.TEXT_LIGHT).width(56).height(56).borderRadius(28);
        Button('⏭').backgroundColor(Color.Transparent).fontColor(Theme.TEXT_SECONDARY);
      }.width('60%').justifyContent(FlexAlign.SpaceEvenly);
    }.width('100%').height('100%').justifyContent(FlexAlign.Center).backgroundColor(Theme.BG_MAIN);
  }
}`],
    ['聊天界面', `@Entry
@Component
export struct ChatRoomPage {
  @State message: string = '';
  private messages: string[] = ['你好！', '这是一个聊天界面模板。', '支持发送文字消息。'];
  build() {
    Column() {
      Text('聊天').fontSize(20).fontWeight(FontWeight.Bold).padding(16);
      List() {
        ForEach(this.messages, (msg: string) => {
          ListItem() {
            Column() {
              Text(msg).fontSize(15).fontColor(Theme.TEXT_PRIMARY).padding(12).backgroundColor(Theme.BG_CARD).borderRadius(Theme.RADIUS_MD);
            }.alignItems(HorizontalAlign.Start).width('100%').padding({ horizontal: 16, vertical: 6 });
          };
        }, (msg: string) => msg);
      }.layoutWeight(1);
      Row() {
        TextInput({ placeholder: '输入消息' }).onChange(v => this.message = v).layoutWeight(1).height(44);
        Button('发送').height(44).onClick(() => { if (this.message) this.messages.push(this.message); });
      }.padding(12).gap(8).backgroundColor(Theme.BG_CARD);
    }.width('100%').height('100%').backgroundColor(Theme.BG_MAIN);
  }
}`],
    ['天气卡片', `@Entry
@Component
export struct WeatherPage {
  private weather: { city: string; temp: number; condition: string } = { city: '深圳', temp: 28, condition: '晴' };
  build() {
    Column() {
      Text(this.weather.city).fontSize(18).fontColor('rgba(255,255,255,0.9)');
      Text(String(this.weather.temp) + '°').fontSize(64).fontWeight(FontWeight.Bold).fontColor(Theme.TEXT_LIGHT).margin({ vertical: 8 });
      Text(this.weather.condition).fontSize(16).fontColor('rgba(255,255,255,0.8)');
      Row() {
        Column() { Text('湿度').fontSize(12).fontColor('rgba(255,255,255,0.7)'); Text('65%').fontSize(14).fontColor(Theme.TEXT_LIGHT).margin({ top: 4 }); };
        Column() { Text('风速').fontSize(12).fontColor('rgba(255,255,255,0.7)'); Text('3级').fontSize(14).fontColor(Theme.TEXT_LIGHT).margin({ top: 4 }); };
        Column() { Text('气压').fontSize(12).fontColor('rgba(255,255,255,0.7)'); Text('1013').fontSize(14).fontColor(Theme.TEXT_LIGHT).margin({ top: 4 }); };
      }.width('100%').justifyContent(FlexAlign.SpaceEvenly).margin({ top: 20 });
    }.width('100%').height('100%').padding(32).backgroundColor(Theme.PRIMARY).justifyContent(FlexAlign.Center);
  }
}`],
    ['个人中心', `@Entry
@Component
export struct ProfileCenterPage {
  build() {
    Column() {
      Column().width(80).height(80).backgroundColor(Theme.PRIMARY).borderRadius(40).margin({ top: 40, bottom: 16 });
      Text('用户名称').fontSize(20).fontWeight(FontWeight.Bold).margin({ bottom: 4 });
      Text('ID: 88021234').fontSize(13).fontColor(Theme.TEXT_SECONDARY).margin({ bottom: 32 });
      Column() {
        this.ProfileRow('我的订单', '12');
        this.ProfileRow('我的收藏', '5');
        this.ProfileRow('浏览历史', '128');
        this.ProfileRow('地址管理', '');
        this.ProfileRow('客服中心', '');
      }.width('100%').padding(16).backgroundColor(Theme.BG_CARD).borderRadius(Theme.RADIUS_LG);
    }.width('100%').height('100%').padding(20).backgroundColor(Theme.BG_MAIN).alignItems(HorizontalAlign.Center);
  }

  @Builder
  ProfileRow(label: string, value: string): void {
    Row() {
      Text(label).fontSize(15).fontColor(Theme.TEXT_PRIMARY);
      Row() {
        if (value) { Text(value).fontSize(13).fontColor(Theme.TEXT_TERTIARY); }
        CraftIcon({ iconName: 'more', iconSize: 16, color: Theme.TEXT_TERTIARY });
      }.gap(4);
    }.width('100%').justifyContent(FlexAlign.SpaceBetween).padding({ vertical: 14 }).border({ width: { bottom: 1 }, color: Theme.BORDER });
  }
}`]
  ]);

  onPageShow(): void {
    const params = router.getParams() as ProjectDetailParams;
    if (params) {
      this.projectName = params.projectName || '未命名项目';
      this.projectType = params.projectType || '组件';
      this.updateTime = params.updateTime || '';
      this.projectId = params.projectId || '';
      const code = this.mockCodeMap.get(this.projectName);
      this.codeContent = code || this.mockCodeMap.get('计数器') || '';
      this.versions = getProjectVersions(this.projectId);
    }
  }

  build() {
    Column() {
      // Header
      Row() {
        Row() {
          CraftIcon({ iconName: 'back', iconSize: 22, color: Theme.TEXT_PRIMARY });
        }
        .width(36)
        .height(36)
        .backgroundColor(Theme.BG_INPUT)
        .borderRadius(Theme.RADIUS_MD)
        .justifyContent(FlexAlign.Center)
        .onClick(() => router.back());

        Text('项目详情')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.TEXT_PRIMARY);

        Blank();

        Row() {
          CraftIcon({ iconName: 'more', iconSize: 20, color: Theme.TEXT_PRIMARY });
        }
        .width(36)
        .height(36)
        .backgroundColor(Theme.BG_INPUT)
        .borderRadius(Theme.RADIUS_MD)
        .justifyContent(FlexAlign.Center);
      }
      .width('100%')
      .height(56)
      .padding({ left: 16, right: 16 });

      // Project info card
      Column() {
        Row() {
          Column() {
            Text(this.projectName)
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.TEXT_PRIMARY);
            Text(`${this.projectType} · ${this.updateTime}`)
              .fontSize(13)
              .fontColor(Theme.TEXT_SECONDARY)
              .margin({ top: 4 });
          }
          .alignItems(HorizontalAlign.Start)
          .layoutWeight(1);

          Row() {
            Text('已完成')
              .fontSize(12)
              .fontColor(Theme.SUCCESS)
              .padding({ left: 10, right: 10, top: 4, bottom: 4 })
              .backgroundColor('rgba(74,155,107,0.12)')
              .borderRadius(Theme.RADIUS_SM);
          };
        }
        .width('100%')
        .margin({ bottom: 16 });

        // Preview area
        Column() {
          Text('预览')
            .fontSize(13)
            .fontColor(Theme.TEXT_TERTIARY)
            .margin({ bottom: 12 })
            .alignSelf(ItemAlign.Start);
          Column() {
            Text('实时预览区域')
              .fontSize(14)
              .fontColor(Theme.TEXT_TERTIARY);
          }
          .width('100%')
          .height(160)
          .backgroundColor(Theme.BG_CANVAS)
          .borderRadius(Theme.RADIUS_MD)
          .justifyContent(FlexAlign.Center);
        }
        .width('100%')
        .margin({ bottom: 16 });

        // Code preview
        Column() {
          Text('源码')
            .fontSize(13)
            .fontColor(Theme.TEXT_TERTIARY)
            .margin({ bottom: 12 })
            .alignSelf(ItemAlign.Start);
          Column() {
            Text(this.codeContent)
              .fontSize(11)
              .fontColor(Theme.CODE_TEXT)
              .fontFamily('monospace')
              .maxLines(8)
              .textOverflow({ overflow: TextOverflow.Ellipsis });
          }
          .width('100%')
          .padding(12)
          .backgroundColor(Theme.CODE_EDITOR_BG)
          .borderRadius(Theme.RADIUS_MD);
        }
        .width('100%');
      }
      .width('92%')
      .padding(20)
      .backgroundColor(Theme.BG_CARD)
      .borderRadius(Theme.RADIUS_LG)
      .shadow({ radius: 8, color: Theme.SHADOW_MD, offsetY: 2 })
      .margin({ top: 8, bottom: 16 });

      // Action buttons
      Row() {
        Button('编辑源码')
          .fontSize(14)
          .fontColor(Theme.TEXT_LIGHT)
          .backgroundColor(Theme.PRIMARY)
          .borderRadius(Theme.RADIUS_MD)
          .layoutWeight(1)
          .height(44)
          .onClick(() => {
            const previewParams: CodePreviewParams = { code: this.codeContent };
            router.pushUrl({ url: 'pages/CodePreview', params: previewParams });
          });

        Button('保存版本')
          .fontSize(14)
          .fontColor(Theme.PRIMARY)
          .backgroundColor(Theme.BG_INPUT)
          .borderRadius(Theme.RADIUS_MD)
          .layoutWeight(1)
          .height(44)
          .margin({ left: 12 })
          .onClick(() => {
            if (this.projectId.length > 0 && this.codeContent.length > 0) {
              saveProjectVersion(this.projectId, this.codeContent, '手动保存');
              this.versions = getProjectVersions(this.projectId);
            }
          });
      }
      .width('92%')
      .height(60);

      // 版本历史面板
      Column({ space: 0 }) {
        Row() {
          Text('版本历史')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.TEXT_PRIMARY)
          Blank()
          Text(this.showVersions ? '收起' : '展开')
            .fontSize(13)
            .fontColor(Theme.PRIMARY)
          CraftIcon({
            iconName: this.showVersions ? 'close' : 'more',
            iconSize: 16,
            color: Theme.PRIMARY
          })
        }
        .width('92%')
        .height(48)
        .onClick(() => { this.showVersions = !this.showVersions; });

        if (this.showVersions) {
          if (this.versions.length === 0) {
            Text('暂无版本记录')
              .fontSize(13)
              .fontColor(Theme.TEXT_TERTIARY)
              .padding(16)
          } else {
            Column({ space: 8 }) {
              ForEach(this.versions, (ver: ProjectVersion, index: number) => {
                Row({ space: 12 }) {
                  Column({ space: 2 }) {
                    Text('v' + String(this.versions.length - index))
                      .fontSize(14)
                      .fontWeight(FontWeight.Bold)
                      .fontColor(Theme.PRIMARY)
                    Text(this.formatTime(ver.timestamp))
                      .fontSize(11)
                      .fontColor(Theme.TEXT_TERTIARY)
                  }
                  .alignItems(HorizontalAlign.Start)
                  .layoutWeight(1);

                  Text(ver.note)
                    .fontSize(12)
                    .fontColor(Theme.TEXT_SECONDARY)
                    .layoutWeight(1);

                  Button('查看')
                    .fontSize(11)
                    .fontColor(Theme.PRIMARY)
                    .backgroundColor(Theme.BG_INPUT)
                    .borderRadius(Theme.RADIUS_SM)
                    .height(28)
                    .padding({ left: 10, right: 10 })
                    .onClick(() => {
                      const previewParams: CodePreviewParams = { code: ver.code };
                      router.pushUrl({ url: 'pages/CodePreview', params: previewParams });
                    });
                }
                .width('92%')
                .padding(12)
                .backgroundColor(Theme.BG_CARD)
                .borderRadius(Theme.RADIUS_MD)
              }, (ver: ProjectVersion) => ver.versionId)
            }
            .width('100%')
            .padding({ bottom: 16 })
          }
        }
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center);

      Blank();
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.BG_MAIN);
  }

  private formatTime(ts: number): string {
    const d: Date = new Date(ts);
    const h: number = d.getHours();
    const m: number = d.getMinutes();
    const hs: string = h < 10 ? '0' + h.toString() : h.toString();
    const ms: string = m < 10 ? '0' + m.toString() : m.toString();
    return hs + ':' + ms;
  }
}
