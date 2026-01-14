/**
 * 联系人列表实体类
 */

export default class ItemData {
  /**
   * 列表的id，便于计数
   */
  id: number;

  /**
   * 列表中的姓名
   */
  name: string;

  /**
   * 列表中的图片
   */
  img: Resource;

  constructor(id: number, name: string, img: Resource) {
    this.id = id;
    this.name = name;
    this.img = img;
  }
}