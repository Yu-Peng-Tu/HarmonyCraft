import { Theme } from '../utils/Theme';

@Component
export struct SkeletonRect {
  @Prop widthVal: Length = '100%';
  @Prop heightVal: Length = 16;
  @Prop radius: number = 4;
  @State shimmerOpacity: number = 0.4;

  aboutToAppear(): void {
    this.shimmerOpacity = 0.7;
  }

  build() {
    Column()
      .width(this.widthVal)
      .height(this.heightVal)
      .backgroundColor(Theme.BG_INPUT)
      .borderRadius(this.radius)
      .opacity(this.shimmerOpacity)
      .animation({
        duration: 1200,
        curve: Curve.EaseInOut,
        iterations: -1,
        playMode: PlayMode.Alternate
      })
  }
}

@Component
export struct SkeletonCircle {
  @Prop diameter: number = 40;
  @State shimmerOpacity: number = 0.4;

  aboutToAppear(): void {
    this.shimmerOpacity = 0.7;
  }

  build() {
    Column()
      .width(this.diameter)
      .height(this.diameter)
      .backgroundColor(Theme.BG_INPUT)
      .borderRadius(this.diameter / 2)
      .opacity(this.shimmerOpacity)
      .animation({
        duration: 1200,
        curve: Curve.EaseInOut,
        iterations: -1,
        playMode: PlayMode.Alternate
      })
  }
}

@Component
export struct SkeletonCard {
  build() {
    Column({ space: 12 }) {
      SkeletonRect({ widthVal: '100%', heightVal: 120, radius: Theme.RADIUS_MD })
      SkeletonRect({ widthVal: '70%', heightVal: 16, radius: 4 })
      SkeletonRect({ widthVal: '40%', heightVal: 12, radius: 4 })
    }
    .width('100%')
    .padding(12)
    .backgroundColor(Theme.BG_CARD)
    .borderRadius(Theme.RADIUS_LG)
    .border({ width: 1, color: Theme.BORDER })
  }
}

@Component
export struct SkeletonList {
  @Prop count: number = 3;

  build() {
    Column({ space: 12 }) {
      ForEach(Array.from({ length: this.count }), (_: object, index: number) => {
        Row({ space: 12 }) {
          SkeletonCircle({ diameter: 40 })
          Column({ space: 8 }) {
            SkeletonRect({ widthVal: '60%', heightVal: 14, radius: 4 })
            SkeletonRect({ widthVal: '40%', heightVal: 12, radius: 4 })
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Start)
        }
        .width('100%')
        .padding(12)
        .backgroundColor(Theme.BG_CARD)
        .borderRadius(Theme.RADIUS_MD)
      }, (_: object, index: number) => String(index))
    }
    .width('100%')
    .padding(16)
  }
}
