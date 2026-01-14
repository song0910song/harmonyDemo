import ItemData from './ItemData'

/**
 * 主页面所有数据源
 */

export class MainViewModel {
  getContactListData(): ItemData[] {
    let contactListData: ItemData[] = [
      new ItemData(0, '宋海同', $r('app.media.startIcon')),
      new ItemData(1, '宋海同', $r('app.media.startIcon')),
      new ItemData(2, '宋海同', $r('app.media.startIcon')),
      new ItemData(3, '宋海同', $r('app.media.startIcon')),
      new ItemData(4, '宋海同', $r('app.media.startIcon')),
    ]

    return contactListData
  }
}

export default new MainViewModel()