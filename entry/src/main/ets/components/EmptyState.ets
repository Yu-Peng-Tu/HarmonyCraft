import { Theme } from '../utils/Theme';

@Component
export struct EmptyState {
  @Prop title: string = '暂无内容';
  @Prop subtitle: string = '这里还没有任何内容';
  @Prop actionText: string = '';
  private onAction?: () => void;

  build() {
    Column({ space: 16 }) {
      // 插图：打开的空盒子
      Stack({ alignContent: Alignment.Center }) {
        // 背景圆
        Circle()
          .width(140)
          .height(140)
          .fill(Theme.BG_INPUT)

        // 盒子主体
        Shape() {
          // 盒身
          Path()
            .commands('M28 50 L28 90 L92 90 L92 50')
            .stroke(Theme.TEXT_TERTIARY)
            .strokeWidth(2)
            .fill(Color.Transparent)
            .strokeLineJoin(LineJoinStyle.Round)
            .strokeLineCap(LineCapStyle.Round)
          // 盒盖左半
          Path()
            .commands('M28 50 L60 32')
            .stroke(Theme.TEXT_TERTIARY)
            .strokeWidth(2)
            .fill(Color.Transparent)
            .strokeLineCap(LineCapStyle.Round)
          // 盒盖右半
          Path()
            .commands('M92 50 L60 32')
            .stroke(Theme.TEXT_TERTIARY)
            .strokeWidth(2)
            .fill(Color.Transparent)
            .strokeLineCap(LineCapStyle.Round)
          // 盒盖顶线
          Path()
            .commands('M45 38 L60 28 L75 38')
            .stroke(Theme.TEXT_TERTIARY)
            .strokeWidth(2)
            .fill(Color.Transparent)
            .strokeLineJoin(LineJoinStyle.Round)
            .strokeLineCap(LineCapStyle.Round)
          // 内部装饰横线1
          Path()
            .commands('M40 62 L80 62')
            .stroke(Theme.BORDER)
            .strokeWidth(2)
            .strokeLineCap(LineCapStyle.Round)
            .fill(Color.Transparent)
          // 内部装饰横线2
          Path()
            .commands('M45 74 L75 74')
            .stroke(Theme.BORDER)
            .strokeWidth(2)
            .strokeLineCap(LineCapStyle.Round)
            .fill(Color.Transparent)
          // 小圆点装饰
          Circle()
            .width(6)
            .height(6)
            .fill(Theme.PRIMARY_LIGHT)
            .offset({ x: 35, y: 82 })
          Circle()
            .width(4)
            .height(4)
            .fill(Theme.GOLD)
            .offset({ x: 78, y: 85 })
        }
        .viewPort({ width: 120, height: 120 })
        .width(120)
        .height(120)
      }
      .width(140)
      .height(140)

      Text(this.title)
        .fontSize(17)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.TEXT_PRIMARY)

      Text(this.subtitle)
        .fontSize(13)
        .fontColor(Theme.TEXT_SECONDARY)
        .textAlign(TextAlign.Center)
        .width('80%')
        .lineHeight(20)

      if (this.actionText.length > 0) {
        Button(this.actionText)
          .fontSize(14)
          .fontColor(Theme.TEXT_LIGHT)
          .backgroundColor(Theme.PRIMARY)
          .borderRadius(Theme.RADIUS_MD)
          .height(40)
          .padding({ left: 24, right: 24 })
          .margin({ top: 8 })
          .onClick(() => {
            if (this.onAction) {
              this.onAction();
            }
          })
      }
    }
    .width('100%')
    .padding(32)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}
