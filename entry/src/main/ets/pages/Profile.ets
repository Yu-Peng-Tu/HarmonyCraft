import router from '@ohos.router';
import { Theme } from '../utils/Theme';
import { CraftIcon } from '../components/CraftIcon';
import { BottomNav } from '../components/BottomNav';
import { getSavedProjects } from '../models/Models';

interface StatItem {
  value: string;
  label: string;
}

interface MenuItem {
  icon: string;
  title: string;
  subtitle: string;
}

@Entry
@Component
export struct ProfilePage {
  @State projectCount: number = 0;
  private stats: StatItem[] = [
    { value: '0', label: '项目数' },
    { value: '12', label: '模板数' },
    { value: '3', label: '连续天' },
    { value: 'Lv.1', label: '等级' }
  ];
  private menuItems: MenuItem[] = [
    { icon: 'settings', title: '设置', subtitle: '偏好、通知、通用' },
    { icon: 'projects', title: '我的项目', subtitle: '管理已创建项目' },
    { icon: 'templates', title: '收藏模板', subtitle: '已收藏 5 个' }
  ];

  onPageShow(): void {
    const projects = getSavedProjects();
    this.projectCount = projects.length;
    this.stats[0].value = String(this.projectCount);
  }

  build() {
    Column() {
      // Header
      Stack({ alignContent: Alignment.Bottom }) {
        Column()
          .width('100%')
          .height(180)
          .backgroundColor(Theme.PRIMARY)
          .borderRadius({ bottomLeft: Theme.RADIUS_XL, bottomRight: Theme.RADIUS_XL });

        Row() {
          // Avatar
          Column() {
            Text('小匠')
              .fontSize(36)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.TEXT_LIGHT)
          }
          .width(72)
          .height(72)
          .backgroundColor('rgba(255,255,255,0.2)')
          .borderRadius(36)
          .justifyContent(FlexAlign.Center);

          Column() {
            Text('AI 应用工坊')
              .fontSize(22)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.TEXT_LIGHT);
            Text('ID: hmos_dev_2026')
              .fontSize(13)
              .fontColor('rgba(255,255,255,0.8)')
              .margin({ top: 4 });
          }
          .alignItems(HorizontalAlign.Start)
          .margin({ left: 16 });

          Blank();

          CraftIcon({ iconName: 'settings', iconSize: 24, color: Theme.TEXT_LIGHT });
        }
        .width('100%')
        .padding({ left: 24, right: 24, top: 20, bottom: 40 });
      }
      .width('100%');

      // Stats card
      Row() {
        ForEach(this.stats, (item: StatItem) => {
          Column() {
            Text(item.value)
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.PRIMARY);
            Text(item.label)
              .fontSize(13)
              .fontColor(Theme.TEXT_SECONDARY)
              .margin({ top: 4 });
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Center);
        }, (item: StatItem) => item.label);
      }
      .width('92%')
      .padding(20)
      .margin({ top: -30, bottom: 16 })
      .backgroundColor(Theme.BG_CARD)
      .borderRadius(Theme.RADIUS_LG)
      .shadow({ radius: 8, color: Theme.SHADOW_MD, offsetY: 2 });

      // Menu list
      Scroll() {
        Column() {
          ForEach(this.menuItems, (item: MenuItem, index: number) => {
            this.MenuRowBuilder(item, index);
          }, (item: MenuItem) => item.title);
        }
        .width('100%');
      }
      .width('100%')
      .layoutWeight(1)
      .padding({ left: 16, right: 16 });

      // 底部导航栏
      BottomNav({ activeTab: 3 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.BG_MAIN);
  }

  private handleMenuClick(item: MenuItem): void {
    if (item.title === '设置') {
      router.pushUrl({ url: 'pages/SettingPage' });
    } else if (item.title === '我的项目') {
      router.pushUrl({ url: 'pages/ProjectManage' });
    } else if (item.title === '收藏模板') {
      router.pushUrl({ url: 'pages/TemplateMarket' });
    }
  }

  @Builder
  MenuRowBuilder(item: MenuItem, index: number): void {
    Row() {
      Column() {
        CraftIcon({ iconName: item.icon, iconSize: 22, color: Theme.PRIMARY });
      }
      .width(40)
      .height(40)
      .backgroundColor(Theme.BG_INPUT)
      .borderRadius(Theme.RADIUS_MD)
      .justifyContent(FlexAlign.Center);

      Column() {
        Text(item.title)
          .fontSize(15)
          .fontColor(Theme.TEXT_PRIMARY);
        Text(item.subtitle)
          .fontSize(13)
          .fontColor(Theme.TEXT_TERTIARY)
          .margin({ top: 2 });
      }
      .alignItems(HorizontalAlign.Start)
      .margin({ left: 12 })
      .layoutWeight(1);

      CraftIcon({ iconName: 'more', iconSize: 18, color: Theme.TEXT_TERTIARY });
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Theme.BG_CARD)
    .borderRadius(Theme.RADIUS_MD)
    .margin({ bottom: index < this.menuItems.length - 1 ? 12 : 24 })
    .shadow({ radius: 6, color: Theme.SHADOW_SM, offsetY: 1 })
    .onClick(() => this.handleMenuClick(item));
  }
}
