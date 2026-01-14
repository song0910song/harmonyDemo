/**
 联系人列表
 **/

@Preview
@Component
export default struct ContactList {
  build() {
    Column() {
      Text('联系人')
        .width('100%')
        .margin({
          top: 25,
          bottom: 10
        })
        .fontWeight(FontWeight.Bold)
        .fontSize('25fp')
      Text('6个联系人')
        .width('100%')
        .margin({bottom: 20})
        .fontWeight(FontWeight.Bold)
        .fontSize('10fp')
        .fontColor('#999999')

      // 联系人列表
      List() {
        ListItem() {
          Row() {
            Image($r('app.media.startIcon'))
              .width(30)
              .height(30)
              .borderRadius(15)
              .margin({right: 15})
            Text('宋海同')
              .fontWeight(FontWeight.Medium)
              .fontSize('12fp')
          }
          .width('100%')
          .height(50)
          .padding({
            left: 15,
            right: 20
          })
          // .backgroundColor(Color.Black)
        }
      }
    }
    .width('100%')
    .height('100%')
  }
}