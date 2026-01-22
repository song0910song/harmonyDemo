/**
 联系人列表
 **/

import { ContactModel } from '../Model/ContactModel'
import { ContactGroup, } from '../Model/ContactGroup'
import generatorData from '../Model/ContactModel'
import ContactGroupManager from '../Model/ContactGroup'
import router from '@ohos.router';


@Entry
@Component
struct ContactList {
  // 定义生成联系人的数量，并分组
  private contactGroupManger: ContactGroupManager =
    new ContactGroupManager(generatorData.generatorContacts(10))
  private contactGroups = this.contactGroupManger.getGroups()
  private totalContacts = this.contactGroupManger.getTotalContactsCount()

  // 导航到详情页
  private navigateToDetail(contact: ContactModel) {
    console.log('导航到联系人详情页：' + contact.name);
    // 这里可以添加路由导航逻辑
    router.pushUrl({
      url: 'pages/Detail',
      params: { contact: contact }
    })
  }

  // 列表组件
  @Builder
  contactListItemCell(item: ContactModel) {
    Row() {
      Text(item.name[2] == undefined ? item.name[1] : item.name[2])
        .width(30)
        .height(30)
        .borderRadius(15)
        .margin({ right: 15 })
        .backgroundColor(item.color)
        .fontColor(Color.White)
        .fontSize(20)
        .textAlign(TextAlign.Center)
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
    .shadow(ShadowStyle.OUTER_DEFAULT_SM)
    .onClick(() => {
      this.navigateToDetail(item);
    })
  }

  // 分组组件
  @Builder
  groupSortCell(inital: string) {
    Text(inital)
      .fontSize(22)
      .fontWeight(FontWeight.Bold)
      .backgroundColor($r('sys.color.container_modal_unfocus_background'))
      .width('100%')
      .padding({ left: 10, bottom: 5 })
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
          .divider({
            strokeWidth: 1,
            color: '#F0F0F0',
            startMargin: 70,
            endMargin: 20
          })
        })
      }
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')

  }
}