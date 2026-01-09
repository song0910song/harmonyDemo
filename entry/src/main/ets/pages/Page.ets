import { pinyin4js } from '@ohos/pinyin4js'

let rawText = '小明'
let tran:string = pinyin4js.convertToPinyinString(rawText, " ", pinyin4js.WITHOUT_TONE)
console.info(tran)

@Entry
@Component
struct Page {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      Text()
        .id('PageHelloWorld')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          this.message = 'Welcome';
        })
    }
    .height('100%')
    .width('100%')
  }
}