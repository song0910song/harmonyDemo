
/**
 联系人列表
 **/
import ItemData from "../ViewModel/ItemData"
import MainViewModel from "../ViewModel/MainViewModel"

@Preview
@Component
export default struct ContactList {
  // 简化重复布局
  @Builder
  contactListItemCell(item: ItemData) {
    Row() {
      Image(item.img)
        .width(30)
        .height(30)
        .borderRadius(15)
        .margin({ right: 15 })
      Text(item.name)
        .fontWeight(FontWeight.Medium)
        .fontSize('12fp')
    }
    .width('100%')
    .height(50)
    .padding({
      left: 15,
      right: 20
    })
  }

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
        .margin({ bottom: 20 })
        .fontWeight(FontWeight.Bold)
        .fontSize('10fp')
        .fontColor('#999999')

      // 联系人列表
      List() {
        ForEach(MainViewModel.getContactListData(), (item: ItemData, index: number) =>{
          ListItem() {
            this.contactListItemCell(item)
          }
          .height(60)
        })
      }
    }
    .width('100%')
    .height('100%')
  }
}