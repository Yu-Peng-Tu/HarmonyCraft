@Entry
@Component
struct FormCard {
  build() {
    Column({ space: 8 }) {
      Text('HarmonyCraft')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor('#D4763E')
      Text('AI 生成卡片')
        .fontSize(12)
        .fontColor('#6B5D54')
      Text('Speak it, Build it')
        .fontSize(10)
        .fontColor('#9A8E84')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#FAF6F1')
  }
}
