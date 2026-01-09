import { ContactGenerator, ContactPerson, GetPersonInfo } from '../ViewModel/PersonModel'
import { ContactGroup } from '../ViewModel/GroupModel'
import { GroupHelper } from '../Util/GroupHepler'

@Entry
@Component
struct Index {
  @Builder
  itemHead(title: string) {
    // 列表分组的头部组件，对应联系人分组A、B等位置的组件
    Text(title)
      .fontSize(20)
      .backgroundColor('#fff1f3f5')
      .width('100%')
      .padding(5)
  }

  @State groupedContacts: ContactGroup[] =
    GroupHelper.groupContacts(ContactGenerator.generate())

  @State perNum: number = GetPersonInfo.perNum

  build() {
    Column() {
      // 显示简要信息
      Column() {
        Text('联系人')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        Text(`${this.perNum}个联系人`)
          .fontSize(15)
          .fontColor('#ff6e6b6b')
          .padding({ top: 8, bottom: 10 })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(0)

      // 搜索框
      Column() {
        Search({ placeholder: '搜索联系人' })
      }
      .width('100%')
      .layoutWeight(0)

      // 联系人列表
      List() {
        // 组循环
        ForEach(this.groupedContacts, (group: ContactGroup) => {
          ListItemGroup({ header: this.itemHead(group.groupTitle) }) {
            // 成员列表
            ForEach(group.contacts, (contact: ContactPerson) => {
              ListItem() {
                Row() {
                  Image(contact.icon)
                    .width(40)
                    .height(40)
                    .margin(10)
                  Text(contact.name.toString())
                    .fontSize(20)
                    .fontWeight(FontWeight.Bold)
                }
              }
            })
          }
          .divider({
            strokeWidth: 1,
            startMargin: 50,
            color: '#ffc4c2c2'
          })
        })
      }
      // 分割线
      .width('100%')
      .height('100%')

      .layoutWeight(1)
    }
    .width('100%')
    // .height('100%')
    .justifyContent(FlexAlign.Center)
    .padding({ left: 20, right: 20 })
  }
}