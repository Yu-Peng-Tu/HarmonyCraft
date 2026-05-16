import { Theme } from '../utils/Theme';
import { router, promptAction } from '@kit.ArkUI';
import { CraftIcon } from '../components/CraftIcon';

interface CardSizeOption {
  label: string;
  cols: number;
  rows: number;
}

interface CardElement {
  id: string;
  type: string;
  content: string;
  posX: number;
  posY: number;
  fontSize: number;
  textColor: string;
  bgColor: string;
  widthVal: number;
  heightVal: number;
}

interface ComponentType {
  type: string;
  label: string;
  icon: string;
  defaultContent: string;
  defaultWidth: number;
  defaultHeight: number;
}

const SIZE_OPTIONS: CardSizeOption[] = [
  { label: 'Micro', cols: 1, rows: 2 },
  { label: 'Small', cols: 2, rows: 2 },
  { label: 'Medium', cols: 2, rows: 4 },
  { label: 'Large', cols: 4, rows: 4 }
];

const COMPONENT_TYPES: ComponentType[] = [
  { type: 'text', label: '文本', icon: 'search', defaultContent: '新文本', defaultWidth: 80, defaultHeight: 24 },
  { type: 'button', label: '按钮', icon: 'check', defaultContent: '按钮', defaultWidth: 60, defaultHeight: 28 },
  { type: 'image', label: '图片', icon: 'templates', defaultContent: '', defaultWidth: 48, defaultHeight: 48 }
];

const BG_COLORS: string[] = ['#D4763E', '#FFFFFF', '#B85C3D', '#4A9B6B', '#6B5D54', '#2D2420'];
const TEXT_COLORS: string[] = ['#FFFFFF', '#2D2420', '#D4763E', '#B85C3D', '#4A9B6B'];

@Entry
@Component
struct CardEditor {
  @State selectedSizeIndex: number = 2;
  @State canvasBg: string = '#D4763E';
  @State elements: CardElement[] = [];
  @State selectedElementId: string = '';

  private getCanvasWidth(): number {
    return SIZE_OPTIONS[this.selectedSizeIndex].cols * 80;
  }

  private getCanvasHeight(): number {
    return SIZE_OPTIONS[this.selectedSizeIndex].rows * 80;
  }

  private getSelectedElement(): CardElement | undefined {
    for (let i: number = 0; i < this.elements.length; i++) {
      if (this.elements[i].id === this.selectedElementId) {
        return this.elements[i];
      }
    }
    return undefined;
  }

  private addComponent(compType: ComponentType): void {
    const canvasW: number = this.getCanvasWidth();
    const canvasH: number = this.getCanvasHeight();
    const newEl: CardElement = {
      id: 'el_' + Date.now().toString(),
      type: compType.type,
      content: compType.defaultContent,
      posX: Math.floor((canvasW - compType.defaultWidth) / 2),
      posY: Math.floor((canvasH - compType.defaultHeight) / 2),
      fontSize: compType.type === 'button' ? 12 : 14,
      textColor: '#FFFFFF',
      bgColor: compType.type === 'button' ? Theme.PRIMARY : 'transparent',
      widthVal: compType.defaultWidth,
      heightVal: compType.defaultHeight
    };
    this.elements.push(newEl);
    this.selectedElementId = newEl.id;
  }

  private updateSelectedContent(val: string): void {
    const el: CardElement | undefined = this.getSelectedElement();
    if (!el) return;
    const idx: number = this.elements.indexOf(el);
    if (idx < 0) return;
    const updated: CardElement = {
      id: el.id,
      type: el.type,
      content: val,
      posX: el.posX,
      posY: el.posY,
      fontSize: el.fontSize,
      textColor: el.textColor,
      bgColor: el.bgColor,
      widthVal: el.widthVal,
      heightVal: el.heightVal
    };
    this.elements[idx] = updated;
  }

  private updateSelectedFontSize(val: number): void {
    const el: CardElement | undefined = this.getSelectedElement();
    if (!el) return;
    const idx: number = this.elements.indexOf(el);
    if (idx < 0) return;
    const updated: CardElement = {
      id: el.id,
      type: el.type,
      content: el.content,
      posX: el.posX,
      posY: el.posY,
      fontSize: val,
      textColor: el.textColor,
      bgColor: el.bgColor,
      widthVal: el.widthVal,
      heightVal: el.heightVal
    };
    this.elements[idx] = updated;
  }

  private updateSelectedTextColor(val: string): void {
    const el: CardElement | undefined = this.getSelectedElement();
    if (!el) return;
    const idx: number = this.elements.indexOf(el);
    if (idx < 0) return;
    const updated: CardElement = {
      id: el.id,
      type: el.type,
      content: el.content,
      posX: el.posX,
      posY: el.posY,
      fontSize: el.fontSize,
      textColor: val,
      bgColor: el.bgColor,
      widthVal: el.widthVal,
      heightVal: el.heightVal
    };
    this.elements[idx] = updated;
  }

  private updateSelectedPosX(val: number): void {
    const el: CardElement | undefined = this.getSelectedElement();
    if (!el) return;
    const idx: number = this.elements.indexOf(el);
    if (idx < 0) return;
    const updated: CardElement = {
      id: el.id,
      type: el.type,
      content: el.content,
      posX: val,
      posY: el.posY,
      fontSize: el.fontSize,
      textColor: el.textColor,
      bgColor: el.bgColor,
      widthVal: el.widthVal,
      heightVal: el.heightVal
    };
    this.elements[idx] = updated;
  }

  private updateSelectedPosY(val: number): void {
    const el: CardElement | undefined = this.getSelectedElement();
    if (!el) return;
    const idx: number = this.elements.indexOf(el);
    if (idx < 0) return;
    const updated: CardElement = {
      id: el.id,
      type: el.type,
      content: el.content,
      posX: el.posX,
      posY: val,
      fontSize: el.fontSize,
      textColor: el.textColor,
      bgColor: el.bgColor,
      widthVal: el.widthVal,
      heightVal: el.heightVal
    };
    this.elements[idx] = updated;
  }

  private updateSelectedWidth(val: number): void {
    const el: CardElement | undefined = this.getSelectedElement();
    if (!el) return;
    const idx: number = this.elements.indexOf(el);
    if (idx < 0) return;
    const updated: CardElement = {
      id: el.id,
      type: el.type,
      content: el.content,
      posX: el.posX,
      posY: el.posY,
      fontSize: el.fontSize,
      textColor: el.textColor,
      bgColor: el.bgColor,
      widthVal: val,
      heightVal: el.heightVal
    };
    this.elements[idx] = updated;
  }

  private updateSelectedHeight(val: number): void {
    const el: CardElement | undefined = this.getSelectedElement();
    if (!el) return;
    const idx: number = this.elements.indexOf(el);
    if (idx < 0) return;
    const updated: CardElement = {
      id: el.id,
      type: el.type,
      content: el.content,
      posX: el.posX,
      posY: el.posY,
      fontSize: el.fontSize,
      textColor: el.textColor,
      bgColor: el.bgColor,
      widthVal: el.widthVal,
      heightVal: val
    };
    this.elements[idx] = updated;
  }

  private deleteSelected(): void {
    if (this.selectedElementId.length === 0) return;
    const newElements: CardElement[] = [];
    for (let i: number = 0; i < this.elements.length; i++) {
      if (this.elements[i].id !== this.selectedElementId) {
        newElements.push(this.elements[i]);
      }
    }
    this.elements = newElements;
    this.selectedElementId = '';
  }

  build() {
    Column({ space: 0 }) {
      // 顶部AppBar
      Row() {
        Button() {
          CraftIcon({ iconName: 'back', iconSize: 22, color: Theme.TEXT_PRIMARY })
        }
        .type(ButtonType.Circle)
        .width(40)
        .height(40)
        .backgroundColor(Theme.BG_INPUT)
        .onClick(() => router.back())

        Text('编辑卡片')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.TEXT_PRIMARY)
          .layoutWeight(1)

        Button() {
          Text('保存')
            .fontSize(13)
            .fontColor(Theme.PRIMARY)
        }
        .type(ButtonType.Capsule)
        .backgroundColor(Theme.USER_BUBBLE_BG)
        .height(32)
        .padding({ left: 14, right: 14 })
        .onClick(() => {
          promptAction.showToast({ message: '卡片保存成功', duration: 2000 });
        })
      }
      .width('100%')
      .height(56)
      .padding({ left: 16, right: 16 })
      .backgroundColor(Theme.BG_CARD)
      .border({ width: { bottom: 1 }, color: Theme.BORDER })

      Scroll() {
        Column({ space: 16 }) {
          // 尺寸选择器
          Column({ space: 8 }) {
            Text('卡片尺寸')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .fontColor(Theme.TEXT_SECONDARY)
              .width('100%')
            Grid() {
              ForEach(SIZE_OPTIONS, (size: CardSizeOption, index: number) => {
                GridItem() {
                  Column({ space: 4 }) {
                    Column() {
                      Column()
                        .width(size.cols * 10)
                        .height(size.rows * 10)
                        .backgroundColor(this.selectedSizeIndex === index ? Theme.PRIMARY : Theme.BG_INPUT)
                        .borderRadius(4)
                        .border({ width: 1, color: this.selectedSizeIndex === index ? Theme.PRIMARY : Theme.BORDER })
                    }
                    .width(52)
                    .height(52)
                    .justifyContent(FlexAlign.Center)
                    .backgroundColor(Theme.BG_CARD)
                    .borderRadius(12)
                    .border({ width: this.selectedSizeIndex === index ? 2 : 1, color: this.selectedSizeIndex === index ? Theme.PRIMARY : Theme.BORDER })

                    Text(size.label)
                      .fontSize(11)
                      .fontColor(this.selectedSizeIndex === index ? Theme.PRIMARY : Theme.TEXT_TERTIARY)
                    Text('(' + size.cols.toString() + '×' + size.rows.toString() + ')')
                      .fontSize(9)
                      .fontColor(Theme.TEXT_TERTIARY)
                  }
                  .width('100%')
                  .height(84)
                  .justifyContent(FlexAlign.Center)
                  .onClick(() => { this.selectedSizeIndex = index; })
                }
              })
            }
            .columnsTemplate('1fr 1fr 1fr 1fr')
            .columnsGap(8)
            .rowsGap(8)
          }
          .width('100%')
          .padding({ left: 16, right: 16 })

          // 画布预览区
          Column({ space: 8 }) {
            Text('预览画布')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .fontColor(Theme.TEXT_SECONDARY)
              .width('100%')

            Scroll() {
              Stack({ alignContent: Alignment.TopStart }) {
                Column()
                  .width(this.getCanvasWidth())
                  .height(this.getCanvasHeight())
                  .backgroundColor(this.canvasBg)
                  .borderRadius(Theme.RADIUS_XL)
                  .shadow({ radius: 8, color: 'rgba(45,36,32,0.1)', offsetY: 2 })

                ForEach(this.elements, (el: CardElement) => {
                  if (el.type === 'text') {
                    Text(el.content)
                      .fontSize(el.fontSize)
                      .fontColor(el.textColor)
                      .position({ x: el.posX, y: el.posY })
                      .width(el.widthVal)
                      .height(el.heightVal)
                      .backgroundColor(el.bgColor)
                      .borderRadius(4)
                      .textAlign(TextAlign.Center)
                      .border({
                        width: this.selectedElementId === el.id ? 2 : 0,
                        color: Theme.GOLD
                      })
                      .padding(2)
                      .onClick(() => { this.selectedElementId = el.id; })
                  } else if (el.type === 'button') {
                    Button(el.content)
                      .fontSize(el.fontSize)
                      .fontColor(el.textColor)
                      .backgroundColor(el.bgColor)
                      .position({ x: el.posX, y: el.posY })
                      .width(el.widthVal)
                      .height(el.heightVal)
                      .borderRadius(Theme.RADIUS_MD)
                      .border({
                        width: this.selectedElementId === el.id ? 2 : 0,
                        color: Theme.GOLD
                      })
                      .onClick(() => { this.selectedElementId = el.id; })
                  } else if (el.type === 'image') {
                    Column()
                      .width(el.widthVal)
                      .height(el.heightVal)
                      .backgroundColor(Theme.BG_INPUT)
                      .position({ x: el.posX, y: el.posY })
                      .borderRadius(8)
                      .border({
                        width: this.selectedElementId === el.id ? 2 : 0,
                        color: Theme.GOLD
                      })
                      .onClick(() => { this.selectedElementId = el.id; })
                  }
                }, (el: CardElement) => el.id)
              }
              .width(this.getCanvasWidth())
              .height(this.getCanvasHeight())
            }
            .width('100%')
            .height(180)
            .scrollBar(BarState.Auto)
            .backgroundColor(Theme.BG_CANVAS)
            .borderRadius(Theme.RADIUS_LG)
          }
          .width('100%')
          .padding({ left: 16, right: 16 })

          // 组件库
          Column({ space: 8 }) {
            Text('添加组件')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .fontColor(Theme.TEXT_SECONDARY)
              .width('100%')
            Row({ space: 8 }) {
              ForEach(COMPONENT_TYPES, (comp: ComponentType) => {
                Button() {
                  Row({ space: 4 }) {
                    CraftIcon({ iconName: comp.icon, iconSize: 14, color: Theme.TEXT_LIGHT })
                    Text(comp.label)
                      .fontSize(12)
                      .fontColor(Theme.TEXT_LIGHT)
                  }
                }
                .type(ButtonType.Capsule)
                .backgroundColor(Theme.PRIMARY)
                .height(36)
                .layoutWeight(1)
                .onClick(() => this.addComponent(comp))
              })
            }
            .width('100%')
          }
          .width('100%')
          .padding({ left: 16, right: 16 })

          // 背景颜色
          Column({ space: 10 }) {
            Text('背景颜色')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .fontColor(Theme.TEXT_SECONDARY)
              .width('100%')

            Row({ space: 12 }) {
              ForEach(BG_COLORS, (color: string) => {
                Column()
                  .width(36)
                  .height(36)
                  .backgroundColor(color)
                  .borderRadius(18)
                  .border({
                    width: this.canvasBg === color ? 3 : 0,
                    color: Theme.PRIMARY
                  })
                  .onClick(() => { this.canvasBg = color; })
              })
            }
            .width('100%')
            .justifyContent(FlexAlign.Center)
          }
          .width('100%')
          .padding({ left: 16, right: 16, top: 12, bottom: 12 })
          .backgroundColor(Theme.BG_CARD)
          .borderRadius(Theme.RADIUS_LG)
          .margin({ left: 16, right: 16 })

          // 属性面板
          if (this.selectedElementId.length > 0) {
            Column({ space: 12 }) {
              Row() {
                Text('属性面板')
                  .fontSize(16)
                  .fontWeight(FontWeight.Bold)
                  .fontColor(Theme.TEXT_PRIMARY)
                  .layoutWeight(1)
                Button() {
                  CraftIcon({ iconName: 'close', iconSize: 16, color: Theme.ERROR })
                }
                .type(ButtonType.Circle)
                .width(28)
                .height(28)
                .backgroundColor('rgba(196,75,75,0.1)')
                .onClick(() => this.deleteSelected())
              }
              .width('100%')

              // 内容
              Column({ space: 4 }) {
                Text('内容')
                  .fontSize(13)
                  .fontColor(Theme.TEXT_SECONDARY)
                  .width('100%')
                TextInput({ text: this.getSelectedElement()?.content || '' })
                  .height(40)
                  .fontSize(14)
                  .backgroundColor(Theme.BG_INPUT)
                  .borderRadius(8)
                  .onChange((val: string) => this.updateSelectedContent(val))
              }
              .width('100%')

              // 字体大小
              Column({ space: 4 }) {
                Text('字体大小')
                  .fontSize(13)
                  .fontColor(Theme.TEXT_SECONDARY)
                  .width('100%')
                Slider({
                  value: this.getSelectedElement()?.fontSize || 14,
                  min: 10,
                  max: 32,
                  step: 1
                })
                  .width('100%')
                  .onChange((val: number) => this.updateSelectedFontSize(val))
              }
              .width('100%')

              // 文字颜色
              Column({ space: 4 }) {
                Text('文字颜色')
                  .fontSize(13)
                  .fontColor(Theme.TEXT_SECONDARY)
                  .width('100%')
                Row({ space: 8 }) {
                  ForEach(TEXT_COLORS, (color: string) => {
                    Column()
                      .width(28)
                      .height(28)
                      .backgroundColor(color)
                      .borderRadius(14)
                      .border({
                        width: this.getSelectedElement()?.textColor === color ? 3 : 0,
                        color: Theme.PRIMARY
                      })
                      .onClick(() => this.updateSelectedTextColor(color))
                  })
                }
              }
              .width('100%')

              // 位置 X
              Column({ space: 4 }) {
                Text('位置 X')
                  .fontSize(13)
                  .fontColor(Theme.TEXT_SECONDARY)
                  .width('100%')
                Slider({
                  value: this.getSelectedElement()?.posX || 0,
                  min: 0,
                  max: this.getCanvasWidth() - (this.getSelectedElement()?.widthVal || 0),
                  step: 1
                })
                  .width('100%')
                  .onChange((val: number) => this.updateSelectedPosX(val))
              }
              .width('100%')

              // 位置 Y
              Column({ space: 4 }) {
                Text('位置 Y')
                  .fontSize(13)
                  .fontColor(Theme.TEXT_SECONDARY)
                  .width('100%')
                Slider({
                  value: this.getSelectedElement()?.posY || 0,
                  min: 0,
                  max: this.getCanvasHeight() - (this.getSelectedElement()?.heightVal || 0),
                  step: 1
                })
                  .width('100%')
                  .onChange((val: number) => this.updateSelectedPosY(val))
              }
              .width('100%')

              // 宽度
              Column({ space: 4 }) {
                Text('宽度')
                  .fontSize(13)
                  .fontColor(Theme.TEXT_SECONDARY)
                  .width('100%')
                Slider({
                  value: this.getSelectedElement()?.widthVal || 60,
                  min: 20,
                  max: this.getCanvasWidth(),
                  step: 1
                })
                  .width('100%')
                  .onChange((val: number) => this.updateSelectedWidth(val))
              }
              .width('100%')

              // 高度
              Column({ space: 4 }) {
                Text('高度')
                  .fontSize(13)
                  .fontColor(Theme.TEXT_SECONDARY)
                  .width('100%')
                Slider({
                  value: this.getSelectedElement()?.heightVal || 28,
                  min: 16,
                  max: this.getCanvasHeight(),
                  step: 1
                })
                  .width('100%')
                  .onChange((val: number) => this.updateSelectedHeight(val))
              }
              .width('100%')
            }
            .width('100%')
            .padding(16)
            .backgroundColor(Theme.BG_CARD)
            .borderRadius(Theme.RADIUS_LG)
            .margin({ left: 16, right: 16 })
          }

          // 发布按钮
          Button() {
            Text('发布卡片')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.TEXT_LIGHT)
          }
          .type(ButtonType.Capsule)
          .backgroundColor(Theme.PRIMARY)
          .width('100%')
          .height(52)
          .shadow({ radius: 8, color: 'rgba(212,118,62,0.25)', offsetY: 2 })
          .margin({ left: 16, right: 16 })
          .onClick(() => {
            promptAction.showToast({ message: '卡片发布成功', duration: 2000 });
          })

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
