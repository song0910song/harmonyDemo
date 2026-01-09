import { util } from '@kit.ArkTS'
import { PinyinUtil } from '../Util/PinyinUtil'

// 联系人实体类
export class ContactPerson {
  public key: string = util.generateRandomUUID(true)
  public name: string;
  public icon: Resource;
  public initial: string = '' // 增加首字母标识

  constructor(name: string, icon: Resource) {
    this.name = name;
    this.icon = icon;
    console.log(`正在处理联系人：${name}`);
    console.log(`生成拼音：${PinyinUtil.getInitial(name)}`);
    this.initial = this.normalizeInitial(PinyinUtil.getInitial(name));
    console.log(`生成首字母：${this.initial}`);
  }

  private normalizeInitial(initial: string): string {
    // 提取首字母的第一个字母
    const firstChar = initial.charAt(0);
    return /[A-Z]/.test(firstChar) ? firstChar : '#' // 非字母归到#组
  }
}

// 随机数据生成类
export class ContactGenerator {
  private static names: string[] = [
    '小明', '王芳', '李雷', '韩梅梅', '张伟',
    '刘洋', '陈强', '杨丽', '赵敏', '周杰'
  ]

  private static icons: Resource[] = [
    $r('app.media.person'),
    $r('app.media.person'),
    $r('app.media.person'),
    $r('app.media.person'),
    $r('app.media.person'),
    $r('app.media.person'),
    $r('app.media.person'),
    $r('app.media.person'),
    $r('app.media.person'),
    $r('app.media.person'),
    $r('app.media.person'),
  ]

  static generate(): ContactPerson[] {
    const ntactPersons: ContactPerson[] = [];
    const len: number = Math.min(ContactGenerator.names.length, ContactGenerator.icons.length);
    const names: string[] = ContactGenerator.names;
    const icons: Resource[] = ContactGenerator.icons;
    for (let index = 0; index < len; index++) {
      ntactPersons.push(new ContactPerson(names[index], icons[index]))
    }
    return ntactPersons;
  }
}


// 联系人信息实体类
export class GetPersonInfo {
  static perNum: number = ContactGenerator.generate().length;
}

