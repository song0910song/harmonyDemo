import { ContactModel } from './ContactModel'

/**
 * 联系人分组数据模型
 */
export class ContactGroup {
  readonly title: string;
  readonly contacts: ContactModel[];
  readonly count: number;

  constructor(title: string, contacts: ContactModel[]) {
    this.title = title;
    this.contacts = contacts;
    this.count = contacts.length;
  }
}

/**
 * 分组服务类 - 负责联系人分组逻辑
 */
export class GroupingService {
  /**
   * 按首字母分组联系人
   */
  static groupByInitial(contacts: ContactModel[]): ContactGroup[] {
    if (!contacts || contacts.length === 0) {
      return [];
    }
    // 按首字母分组
    const groupedMap = GroupingService.createGroupMap(contacts);
    // 转换为有序分组数组
    return GroupingService.convertToOrderedGroups(groupedMap);
  }

  /**
   * 创建首字母分组映射
   */
  private static createGroupMap(contacts: ContactModel[]): Map<string, ContactModel[]> {
    const groupMap = new Map<string, ContactModel[]>();

    for (const contact of contacts) {
      const initial = contact.inital || '#';

      if (!groupMap.has(initial)) {
        groupMap.set(initial, [contact]);
      } else {
        groupMap.get(initial)!.push(contact);
      }
    }

    return groupMap;
  }

  /**
   * 转换为有序的分组数组
   */
  private static convertToOrderedGroups(groupMap: Map<string, ContactModel[]>): ContactGroup[] {
    // 按字母顺序排序分组标题
    const sortedTitles = Array.from(groupMap.keys()).sort((a, b) => {
      // 特殊字符放在最后
      if (a === '#') {
        return 1;
      }
      if (b === '#') {
        return -1;
      }
      return a.localeCompare(b);
    });

    // 创建有序的分组数组
    return sortedTitles.map(title => {
      const contacts = groupMap.get(title) || [];
      return new ContactGroup(title, contacts);
    });
  }

  /**
   * 获取所有分组的标题
   */
  static getGroupTitles(groups: ContactGroup[]): string[] {
    return groups.map(group => group.title);
  }

  /**
   * 计算总联系人数量
   */
  static getTotalContactsCount(groups: ContactGroup[]): number {
    return groups.reduce((total, group) => total + group.count, 0);
  }

  /**
   * 查找特定首字母的分组
   */
  static findGroupByTitle(groups: ContactGroup[], title: string): ContactGroup | undefined {
    return groups.find(group => group.title === title);
  }
}

/**
 * 联系人分组管理器 - 主入口类
 */
export default class ContactGroupManager {
  private contacts: ContactModel[];
  private groups: ContactGroup[] = [];

  constructor(contacts: ContactModel[]) {
    this.contacts = contacts;
    this.regroup();
  }

  /**
   * 重新分组（当联系人数据变化时调用）
   */
  regroup(): void {
    this.groups = GroupingService.groupByInitial(this.contacts);
  }

  /**
   * 获取所有分组
   */
  getGroups(): ContactGroup[] {
    return this.groups;
  }

  /**
   * 获取分组标题列表
   */
  getGroupTitles(): string[] {
    return GroupingService.getGroupTitles(this.groups);
  }

  /**
   * 获取总联系人数量
   */
  getTotalContactsCount(): number {
    return GroupingService.getTotalContactsCount(this.groups);
  }

  /**
   * 获取特定分组
   */
  getGroupByTitle(title: string): ContactGroup | undefined {
    return GroupingService.findGroupByTitle(this.groups, title);
  }

  /**
   * 添加联系人并重新分组
   */
  addContact(contact: ContactModel): void {
    this.contacts.push(contact);
    this.regroup();
  }

  /**
   * 移除联系人并重新分组
   */
  removeContact(contactId: string): boolean {
    const index = this.contacts.findIndex(contact => contact.id === contactId);
    if (index !== -1) {
      this.contacts.splice(index, 1);
      this.regroup();
      return true;
    }
    return false;
  }
}