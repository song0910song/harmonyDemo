@Entry
@Component
struct ContactBooks {
  @State message: string = 'Hello World';
  build() {
    Column() {

      // 显示简要信息
      Column(){
        Text('联系人')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        Text('6个联系人')
          .fontSize(15)
          .fontColor('#ff6e6b6b')
          .padding({top:8, bottom:10})
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
      // 搜索框
      Column(){
        Search({placeholder:'搜索联系人'})
      }
      .width('100%')

      // .backgroundColor(Color.Red)

      // 联系人列表
      Column(){
        List() {

        }
      }
      .width('100%')
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .padding({left:20, right:20})
  }
}