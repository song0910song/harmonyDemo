import { pinyin4js } from '@ohos/pinyin4js'

export class PinyinUtil {
  static getInitial(name: string): string {
    // 转换汉字为带音标拼音
    const cleanPinyin: string  = pinyin4js.convertToPinyinString(name, ' ', pinyin4js.WITHOUT_TONE)

    // 提取首字母并大写
    return cleanPinyin.split(' ')
      .map(word => word.charAt(0).toUpperCase())
      .join('');
  }
}