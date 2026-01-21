import ContactList from '../View/ContactList'

@Entry
@Component
struct Index {
  private tabsController: TabsController = new TabsController();

  build() {
    Column() {
      Text('拟合')
        .fontSize(40)
      Tabs({
        controller: this.tabsController
      }) {
        TabContent() {
          ContactList()
        }

        TabContent() {
          ContactList()
        }
      }
      .margin({ bottom: '64vp' })
      .width('100%')
      .height('100%')
      .barHeight('80vp')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}
