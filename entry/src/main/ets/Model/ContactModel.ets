/**
 * 通讯录联系人数据模型
 */
import DataGenerator from "../Utils/DataGenerator";

export class ContactModel {
  id: number;
  icon: Resource;
  name: string;
  phone: string;
  email: string;

  constructor(id: number, name: string, icon: Resource, phone: string = '', email: string = '') {
    // 可以添加初始化逻辑
    this.id = id;
    this.name = name;
    this.icon = icon;
    this.phone = phone;
    this.email = email;
  }
}

class Contacts {
  private generatorContact: DataGenerator = new DataGenerator()

  generatorContacts(len: number) {
    let contacts: ContactModel[] = []
    for (let i = 0; i < len; i++) {
      contacts.push(new ContactModel(
        i, this.generatorContact.generatorRandomName(),
        this.generatorContact.generatorRandomIcon(),
        this.generatorContact.generatorRandomPhone(),
        this.generatorContact.generatorRandomEmail()
      ))
    }
    return contacts
  }
}

export default new Contacts()




