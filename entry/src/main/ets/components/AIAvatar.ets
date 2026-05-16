import { Theme } from '../utils/Theme';

@Component
export struct AIAvatar {
  @Prop avatarSize: number = 28;

  build() {
    Stack({ alignContent: Alignment.Center }) {
      // 身体（圆角矩形，琥珀色）
      Column()
        .width(this.avatarSize * 0.6)
        .height(this.avatarSize * 0.4)
        .backgroundColor(Theme.PRIMARY)
        .borderRadius(this.avatarSize * 0.1)
        .offset({ y: this.avatarSize * 0.22 })

      // 头部（圆形，浅琥珀色）
      Column()
        .width(this.avatarSize * 0.55)
        .height(this.avatarSize * 0.55)
        .backgroundColor(Theme.PRIMARY_LIGHT)
        .borderRadius(this.avatarSize * 0.275)
        .offset({ y: -this.avatarSize * 0.08 })

      // 护目镜条（陶土色）
      Column()
        .width(this.avatarSize * 0.42)
        .height(this.avatarSize * 0.1)
        .backgroundColor(Theme.ACCENT)
        .borderRadius(this.avatarSize * 0.05)
        .offset({ y: -this.avatarSize * 0.08 })

      // 左眼
      Column()
        .width(this.avatarSize * 0.08)
        .height(this.avatarSize * 0.08)
        .backgroundColor(Theme.TEXT_LIGHT)
        .borderRadius(this.avatarSize * 0.04)
        .offset({ x: -this.avatarSize * 0.1, y: -this.avatarSize * 0.08 })

      // 右眼
      Column()
        .width(this.avatarSize * 0.08)
        .height(this.avatarSize * 0.08)
        .backgroundColor(Theme.TEXT_LIGHT)
        .borderRadius(this.avatarSize * 0.04)
        .offset({ x: this.avatarSize * 0.1, y: -this.avatarSize * 0.08 })

      // 小嘴（微笑弧线）
      Shape() {
        Path()
          .commands('M10 14 Q12 16 14 14')
          .stroke(Theme.TEXT_LIGHT)
          .strokeWidth(1)
          .strokeLineCap(LineCapStyle.Round)
          .fill(Color.Transparent)
      }
      .viewPort({ width: 24, height: 24 })
      .width(this.avatarSize * 0.5)
      .height(this.avatarSize * 0.5)
      .offset({ y: -this.avatarSize * 0.02 })
    }
    .width(this.avatarSize)
    .height(this.avatarSize * 1.25)
  }
}
