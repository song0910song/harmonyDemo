import { ContactGenerator, ContactPerson } from '../ViewModel/PersonModel'
import { ContactGroup } from '../ViewModel/GroupModel'
import { GroupHelper } from '../Util/GroupHepler'

@Entry
@Component
struct Index {

  @Builder
  itemHead(title: string){
    // 列表分组的头部组件，对应联系人分组A、B等位置的组件
    Text(title)
      .fontSize(20)
      .backgroundColor('#fff1f3f5')
      .width('100%')
      .padding(5)
  }

  @State groupedContacts: ContactGroup[] =
    GroupHelper.groupContacts(ContactGenerator.generate())


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

      // 联系人列表
      Column(){
        // List() {
        //   ForEach(this.groupedContacts, (group: ContactGroup) => {
        //     ListItemGroup({header: this.itemHead(group.groupTitle)}) {
        //       // 成员列表
        //       ForEach(group.contacts, (contact: ContactPerson) => {
        //         ListItem(){
        //           Row() {
        //             Image(contact.icon)
        //               .width(40)
        //               .height(40)
        //               .margin(10)
        //             Text(contact.name.toString())
        //               .fontSize(20)
        //               .fontWeight(FontWeight.Bold)
        //           }
        //         }
        //       })
        //     }
        //   })
        //   // ForEach(this.contacts, (item: ContactPerson, index) => {
        //   //   ListItem(){
        //   //     Row(){
        //   //       Image(item.icon)
        //   //         .width(40)
        //   //         .height(40)
        //   //         .margin(10)
        //   //       Text(item.name.toString())
        //   //         .fontSize(20)
        //   //         .fontWeight(FontWeight.Bold)
        //   //     }
        //   //   }
        //   // }, (item: ContactPerson) => JSON.stringify(item))
        // }
        // .height('100%')
        // .width('100%')
        // // 分割线
        // .divider({strokeWidth: 1, startMargin: 10, endMargin: 10, color: Color.Gray})
      }
      .width('100%')
    }

    .width('100%')
    .justifyContent(FlexAlign.Center)
    .padding({left:20, right:20})
  }
}