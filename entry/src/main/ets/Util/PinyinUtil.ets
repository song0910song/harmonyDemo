import { i18n } from '@kit.LocalizationKit'

export class PinyinUtil {
  static getInitial(name: string): string {
    // 转换汉字为带音标拼音
    const transliterator1 = i18n.Transliterator.getInstance('Any-Latn');
    // console.log("transliterator1" + transliterator1)
    const pinyinWithTone = transliterator1.transform(name);

    // console.log(pinyinWithTone)

    // 去除音标
    const transliterator2 = i18n.Transliterator.getInstance('Latin-ASCII');
    const cleanPinyin = transliterator2.transform(pinyinWithTone);

    // 提取首字母并大写
    return cleanPinyin.split(' ')
      .map(word => word.charAt(0).toUpperCase())
      .join('');
  }
}