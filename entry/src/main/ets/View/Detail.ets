
@Preview
@Component
export default struct Detail {
  build() {
    Column() {

      Column(){
      }
      .width('100%')
      .height(140)
      .backgroundColor('#e9dee4')

      // 主体部分
      Column(){
        Column(){
          Image($r('app.media.startIcon'))
            .height(120)
            .width(120)
            .borderRadius(60)
        }
        .width(128)
        .height(128)
        .borderRadius(64)
        .borderWidth(5)
        .borderColor(Color.White)
      }
      .width('100%')
      .layoutWeight(1)
      .backgroundColor(Color.Black)

    }
    .height('100%')
    .width('100%')
    .background(Color.White)
  }
}