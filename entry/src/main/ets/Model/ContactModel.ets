/**
 * 通讯录联系人数据模型
 */
import DataGenerator from "../Utils/DataGenerator";
import { pinyin4js } from '@ohos/pinyin4js'

export class ContactModel {
  id: number;
  icon: Resource;
  name: string;
  phone: string;
  email: string;
  inital: string = '';

  constructor(id: number, name: string, icon: Resource, phone: string = '', email: string = '', inital: string = '') {
    // 可以添加初始化逻辑
    this.id = id;
    this.name = name;
    this.icon = icon;
    this.phone = phone;
    this.email = email;
    this.inital = inital;
  }
}

export class Contacts {
  private generatorContact: DataGenerator = new DataGenerator()

  generatorContacts(len: number): ContactModel[] {
    let contacts: ContactModel[] = []
    for (let i = 0; i < len; i++) {
      const icon = this.generatorContact.generatorRandomIcon()
      const name = this.generatorContact.generatorRandomName()
      const phoneNum = this.generatorContact.generatorRandomPhone()
      const email = this.generatorContact.generatorRandomEmail()

      contacts.push(new ContactModel(i, name, icon,
        phoneNum, email, this.getInital(name)))
      // console.log(contacts[i].inital);
    }
    return contacts
  }

  // 获取姓氏拼音首字母
  private getInital(name: string): string {
    const pinYin: string = pinyin4js.convertToPinyinString(name, ' ', pinyin4js.WITHOUT_TONE) // 汉字转拼音
    const inital: string = pinYin.charAt(0).toUpperCase() // 提取首字母并大写
    const isInital = /[A-Z]/.test(inital) // 判断是否是字母

    if (isInital) {
      return inital
    } else {
      return "#"
    }
  }
}

export default new Contacts()




