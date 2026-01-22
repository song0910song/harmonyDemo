@Component
export default struct DetailRow {
  title: string = ''
  content: string = ''
  showDivider: boolean = true
  canCall: boolean = false
  canEmail: boolean = false
  build() {
    Column() {
      Row() {
        Column() {
          Text(this.title)
            .fontSize(16)
            .fontColor('#666666')
            .fontWeight(FontWeight.Medium)

          Text(this.content)
            .fontSize(18)
            .fontColor(Color.Black)
            .fontWeight(FontWeight.Normal)
            .margin({ top: 4 })
        }
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Start)

        if (this.canCall) {
          Image($r('app.media.phone'))
            .width(24)
            .height(24)
            .margin({ left: 10 })
        }

        if (this.canEmail) {
          Image($r('app.media.message'))
            .width(24)
            .height(24)
            .margin({ left: 10 })
        }
      }
      .width('100%')
      .height(60)
      .padding({ left: 16, right: 16 })
      .alignItems(VerticalAlign.Center)

      if (this.showDivider) {
        Divider()
          .strokeWidth(1)
          .color('#F0F0F0')
          .margin({ left: 16, right: 16 })
      }
    }
  }
}