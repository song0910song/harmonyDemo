export default class DataGenerator {
  // 30个常用姓氏
  private COMMON_SURNAMES: string[] = [
    '李', '王', '张', '刘', '陈', '杨', '黄', '赵', '吴', '周',
    '徐', '孙', '马', '朱', '胡', '林', '郭', '何', '高', '罗',
    '郑', '梁', '谢', '宋', '唐', '许', '韩', '冯', '邓', '曹'
  ];
  // 常用姓名
  private COMMON_NAME_CHARACTERS: string[] = [
    // 单字名字常用字
    '伟', '芳', '娜', '秀英', '敏', '静', '磊', '洋', '勇', '艳',
    '军', '杰', '娟', '强', '霞', '平', '刚', '燕', '辉', '玲',
    '华', '明', '丽', '建', '红', '玉', '志', '文', '云', '飞',
    '兰', '金', '春', '小', '海', '琴', '桂', '英', '梅', '德',
    '成', '庆', '新', '俊', '龙', '雪', '健', '荣', '永', '亮',
  ]
  // 用户图片
  private ICON: Resource[] = [
    $r('app.media.startIcon'),
    $r('app.media.startIcon'),
    $r('app.media.startIcon'),
    $r('app.media.startIcon'),
    $r('app.media.startIcon'),
    $r('app.media.startIcon'),
    $r('app.media.startIcon'),

  ]
  // 手机号前缀
  private MOBILE_PREFIXES: string[] = [
    '134', '135', '136', '137', '138', '139', '147', '150', '151', '152', '157',
    '165', '172', '178', '182', '183', '184', '187', '188', '198', '158', '159',
  ]
  // 常用域名
  private COMMON_DOMAINS: string[] = [
    'gmail.com', 'yahoo.com', 'outlook.com', 'hotmail.com', 'qq.com',
    '163.com', '126.com', 'sina.com', 'mail.com',]

  generatorRandomName() {
    // 随机选择一个姓氏
    const randomSurname = this.COMMON_SURNAMES[this.random(this.COMMON_SURNAMES.length)]
    // 名字
    let givenName = this.COMMON_NAME_CHARACTERS[this.random(this.COMMON_NAME_CHARACTERS.length)]
    return randomSurname + givenName
  }

  generatorRandomIcon() {
    const randomIcon = this.ICON[this.random(this.ICON.length)]

    return randomIcon
  }

  generatorRandomPhone() {
    const prefix = this.MOBILE_PREFIXES[this.random(this.MOBILE_PREFIXES.length)]
    const suffix:string = Array.from<number, number>({ length: 8 }, (): number=> this.random(10)).join('')

    return prefix + suffix
  }

  generatorRandomEmail() {
    const domain = this.COMMON_DOMAINS[this.random(this.COMMON_DOMAINS.length)]

    return this.generatorRandomName() + '@' + domain
  }

  private random(length?: number) {
    if (length == undefined) {
      return Math.floor(Math.random())
    }else {
      return Math.floor(Math.random() * length)
    }
  }
}
