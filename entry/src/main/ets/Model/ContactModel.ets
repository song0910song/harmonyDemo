/**
 * 通讯录联系人数据模型
 */
export default class ContactModel {
  id: number = 0;
  name: string = '';
  phone: string = '';
  email: string = '';
  
  // 可选字段，用于扩展功能
  address?: string = '';
  company?: string = '';
  position?: string = '';
  notes?: string = '';
  
  constructor() {
    // 可以添加初始化逻辑
  }
}