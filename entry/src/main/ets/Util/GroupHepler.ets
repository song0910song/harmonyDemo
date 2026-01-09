import {ContactPerson} from '../ViewModel/PersonModel'
import {ContactGroup} from '../ViewModel/GroupModel'

export class GroupHelper {
  // 更新分组排序逻辑
  static groupContacts(contacts: ContactPerson[]): ContactGroup[] {
    const groups = new Map<string, ContactGroup>();

    contacts.forEach(contact => {
      const initial = contact.initial;
      if (!groups.has(initial)) {
        groups.set(initial, new ContactGroup(initial));
      }
      groups.get(initial)?.contacts.push(contact);
    });

    return Array.from(groups.values())
      .sort((a, b) => {
        if (a.groupTitle === '#') {
          return 1;
        }
        if (b.groupTitle === '#') {
          return -1;
        }
        return a.groupTitle.localeCompare(b.groupTitle);
      })
      .map(group => {
        group.contacts.sort((a, b) => a.name.localeCompare(b.name));
        return group;
      });
  }
}