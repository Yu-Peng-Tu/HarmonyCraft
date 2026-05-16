import router from '@ohos.router';
import { Theme } from '../utils/Theme';
import { CraftIcon } from '../components/CraftIcon';
import { promptAction } from '@kit.ArkUI';

interface SettingItem {
  icon: string;
  title: string;
  type: string;
  key: string;
}

@Entry
@Component
export struct SettingPage {
  @State darkMode: boolean = false;
  @State notifications: boolean = true;

  onPageShow(): void {
    const darkStored: string | undefined = AppStorage.get('dark_mode');
    this.darkMode = darkStored === 'true';
    const notifyStored: string | undefined = AppStorage.get('notifications');
    this.notifications = notifyStored !== 'false';
  }

  private toggleDarkMode(val: boolean): void {
    this.darkMode = val;
    AppStorage.setOrCreate('dark_mode', val ? 'true' : 'false');
    promptAction.showToast({ message: val ? '深色模式已开启' : '深色模式已关闭', duration: 1500 });
  }

  private toggleNotifications(val: boolean): void {
    this.notifications = val;
    AppStorage.setOrCreate('notifications', val ? 'true' : 'false');
    promptAction.showToast({ message: val ? '通知已开启' : '通知已关闭', duration: 1500 });
  }

  private clearCache(): void {
    AppStorage.setOrCreate('saved_projects', '[]');
    AppStorage.setOrCreate('project_versions', '[]');
    promptAction.showToast({ message: '缓存已清除', duration: 2000 });
  }

  build() {
    Column({ space: 0 }) {
      // Header
      Row() {
        Button() {
          CraftIcon({ iconName: 'back', iconSize: 22, color: Theme.TEXT_PRIMARY })
        }
        .type(ButtonType.Circle)
        .width(40)
        .height(40)
        .backgroundColor(Theme.BG_INPUT)
        .onClick(() => router.back())

        Text('设置')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.TEXT_PRIMARY)
          .layoutWeight(1)

        Blank()
      }
      .width('100%')
      .height(56)
      .padding({ left: 16, right: 16 })
      .backgroundColor(Theme.BG_CARD)
      .border({ width: { bottom: 1 }, color: Theme.BORDER })

      Scroll() {
        Column({ space: 16 }) {
          // 外观设置
          Column({ space: 0 }) {
            Text('外观')
              .fontSize(13)
              .fontColor(Theme.TEXT_TERTIARY)
              .width('100%')
              .padding({ left: 16, bottom: 8 })

            Row({ space: 12 }) {
              Column() {
                CraftIcon({ iconName: 'templates', iconSize: 20, color: Theme.PRIMARY });
              }
              .width(36)
              .height(36)
              .backgroundColor(Theme.BG_INPUT)
              .borderRadius(Theme.RADIUS_MD)
              .justifyContent(FlexAlign.Center)

              Text('深色模式')
                .fontSize(15)
                .fontColor(Theme.TEXT_PRIMARY)
                .layoutWeight(1)

              Toggle({ type: ToggleType.Switch, isOn: this.darkMode })
                .selectedColor(Theme.PRIMARY)
                .onChange((val: boolean) => this.toggleDarkMode(val))
            }
            .width('100%')
            .height(56)
            .padding({ left: 16, right: 16 })
            .backgroundColor(Theme.BG_CARD)
            .borderRadius(Theme.RADIUS_LG)
          }
          .width('100%')
          .padding({ left: 16, right: 16 })

          // 通知设置
          Column({ space: 0 }) {
            Text('通知')
              .fontSize(13)
              .fontColor(Theme.TEXT_TERTIARY)
              .width('100%')
              .padding({ left: 16, bottom: 8 })

            Row({ space: 12 }) {
              Column() {
                CraftIcon({ iconName: 'send', iconSize: 20, color: Theme.PRIMARY });
              }
              .width(36)
              .height(36)
              .backgroundColor(Theme.BG_INPUT)
              .borderRadius(Theme.RADIUS_MD)
              .justifyContent(FlexAlign.Center)

              Text('消息通知')
                .fontSize(15)
                .fontColor(Theme.TEXT_PRIMARY)
                .layoutWeight(1)

              Toggle({ type: ToggleType.Switch, isOn: this.notifications })
                .selectedColor(Theme.PRIMARY)
                .onChange((val: boolean) => this.toggleNotifications(val))
            }
            .width('100%')
            .height(56)
            .padding({ left: 16, right: 16 })
            .backgroundColor(Theme.BG_CARD)
            .borderRadius(Theme.RADIUS_LG)
          }
          .width('100%')
          .padding({ left: 16, right: 16 })

          // 存储管理
          Column({ space: 0 }) {
            Text('存储')
              .fontSize(13)
              .fontColor(Theme.TEXT_TERTIARY)
              .width('100%')
              .padding({ left: 16, bottom: 8 })

            Row({ space: 12 }) {
              Column() {
                CraftIcon({ iconName: 'close', iconSize: 20, color: Theme.ERROR });
              }
              .width(36)
              .height(36)
              .backgroundColor(Theme.BG_INPUT)
              .borderRadius(Theme.RADIUS_MD)
              .justifyContent(FlexAlign.Center)

              Text('清除缓存')
                .fontSize(15)
                .fontColor(Theme.TEXT_PRIMARY)
                .layoutWeight(1)

              CraftIcon({ iconName: 'more', iconSize: 18, color: Theme.TEXT_TERTIARY })
            }
            .width('100%')
            .height(56)
            .padding({ left: 16, right: 16 })
            .backgroundColor(Theme.BG_CARD)
            .borderRadius(Theme.RADIUS_LG)
            .onClick(() => this.clearCache())
          }
          .width('100%')
          .padding({ left: 16, right: 16 })

          // 关于
          Column({ space: 0 }) {
            Text('关于')
              .fontSize(13)
              .fontColor(Theme.TEXT_TERTIARY)
              .width('100%')
              .padding({ left: 16, bottom: 8 })

            Column({ space: 12 }) {
              Row({ space: 12 }) {
                Column() {
                  CraftIcon({ iconName: 'home', iconSize: 20, color: Theme.PRIMARY });
                }
                .width(36)
                .height(36)
                .backgroundColor(Theme.BG_INPUT)
                .borderRadius(Theme.RADIUS_MD)
                .justifyContent(FlexAlign.Center)

                Column() {
                  Text('HarmonyCraft')
                    .fontSize(15)
                    .fontColor(Theme.TEXT_PRIMARY)
                  Text('版本 1.0.0 · HarmonyOS NEXT')
                    .fontSize(12)
                    .fontColor(Theme.TEXT_SECONDARY)
                    .margin({ top: 2 })
                }
                .alignItems(HorizontalAlign.Start)
                .layoutWeight(1)
              }
              .width('100%')

              Text('Speak it, Build it. 基于 HarmonyOS NEXT 的 AI 界面设计工具。')
                .fontSize(13)
                .fontColor(Theme.TEXT_SECONDARY)
                .width('100%')
                .lineHeight(20)

              Text('© 2026 HarmonyCraft Team')
                .fontSize(12)
                .fontColor(Theme.TEXT_TERTIARY)
                .width('100%')
            }
            .width('100%')
            .padding(16)
            .backgroundColor(Theme.BG_CARD)
            .borderRadius(Theme.RADIUS_LG)
          }
          .width('100%')
          .padding({ left: 16, right: 16 })

          Column().height(40)
        }
        .width('100%')
        .padding({ top: 16, bottom: 16 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Auto)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.BG_MAIN)
  }
}
