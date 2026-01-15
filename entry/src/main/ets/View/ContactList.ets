/**
 联系人列表
 **/

import { ContactModel } from '../Model/ContactModel'
import { ContactGroup,} from '../Model/ContactGroup'
import generatorData from '../Model/ContactModel'
import ContactGroupManager from '../Model/ContactGroup'

@Preview
@Component
export default struct ContactList {
  // 定义生成联系人的数量，并分组
  private contactGroupManger: ContactGroupManager =
    new ContactGroupManager(generatorData.generatorContacts(10))
  private contactGroups = this.contactGroupManger.getGroups()
  private totalContacts = this.contactGroupManger.getTotalContactsCount()

  // 列表组件
  @Builder
  contactListItemCell(item: ContactModel) {
    Row() {
      Image(item.icon)
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

  // 分组组件
  @Builder
  groupSortCell(inital: string) {
    Text(inital)
      .fontSize(20)
      .backgroundColor($r('sys.color.container_modal_unfocus_background'))
      .width('100%')
      .padding(5)
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
      Text(`${this.totalContacts.toString()}个联系人`)
        .width('100%')
        .margin({ bottom: 20 })
        .fontWeight(FontWeight.Bold)
        .fontSize('10fp')
        .fontColor('#999999')

      // 联系人列表
      List() {
        ForEach(this.contactGroups, (group: ContactGroup) => {
          ListItemGroup({ header: this.groupSortCell(group.title) }) {
            ForEach(group.contacts, (contact: ContactModel) => {
              ListItem() {
                this.contactListItemCell(contact)
              }
              .height(60)
            })
          }
          .divider({strokeWidth:5, endMargin: 10, color: Color.Black})
        })


      }
    }
    .width('100%')
    .height('100%')
  }
}