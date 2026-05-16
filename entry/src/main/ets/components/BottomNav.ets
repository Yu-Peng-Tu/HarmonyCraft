import { Theme } from '../utils/Theme';
import { router } from '@kit.ArkUI';
import { CraftIcon } from './CraftIcon';

interface NavItem {
  iconName: string;
  label: string;
  page: string;
}

const NAV_ITEMS: NavItem[] = [
  { iconName: 'home', label: '首页', page: 'pages/Index' },
  { iconName: 'templates', label: '模板', page: 'pages/TemplateMarket' },
  { iconName: 'projects', label: '作品', page: 'pages/ProjectManage' },
  { iconName: 'profile', label: '我的', page: 'pages/Profile' }
];

@Component
export struct BottomNav {
  @Prop activeTab: number = 0;

  private switchTab(index: number): void {
    if (index === this.activeTab) return;
    const item: NavItem = NAV_ITEMS[index];
    router.replaceUrl({ url: item.page });
  }

  build() {
    Row({ space: 0 }) {
      ForEach(NAV_ITEMS, (item: NavItem, index: number) => {
        Column({ space: 2 }) {
          CraftIcon({
            iconName: item.iconName,
            iconSize: 24,
            color: index === this.activeTab ? Theme.PRIMARY : Theme.TEXT_TERTIARY
          })
          Text(item.label)
            .fontSize(11)
            .fontColor(index === this.activeTab ? Theme.PRIMARY : Theme.TEXT_TERTIARY)
        }
        .width('25%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .animation({
          duration: 200,
          curve: Curve.EaseOut
        })
        .onClick(() => this.switchTab(index))
      })
    }
    .width('100%')
    .height(56)
    .backgroundColor(Theme.BG_CARD)
    .border({ width: { top: 1 }, color: Theme.BORDER })
  }
}
