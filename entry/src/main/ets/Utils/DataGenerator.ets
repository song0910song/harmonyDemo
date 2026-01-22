// 公司信息接口
export interface MoreInfo {
  company: string;
  position: string;
  address: string;
}

export default class DataGenerator {
  // 30个常用姓氏
  private COMMON_SURNAMES: string[] = [
    '李', '王', '张', '刘', '陈', '杨', '黄', '赵', '吴', '周',
    '徐', '孙', '马', '朱', '胡', '林', '郭', '何', '高', '罗',
    '郑', '梁', '谢', '宋', '唐', '许', '韩', '冯', '邓', '曹'
  ];
  // 常用姓名 - 包含单字和双字名字
  private COMMON_NAME_CHARACTERS: string[] = [
    // 单字名字常用字
    '伟', '芳', '娜', '秀英', '敏', '静', '磊', '洋', '勇', '艳',
    '军', '杰', '娟', '强', '霞', '平', '刚', '燕', '辉', '玲',
    '华', '明', '丽', '建', '红', '玉', '志', '文', '云', '飞',
    '兰', '金', '春', '小', '海', '琴', '桂', '英', '梅', '德',
    '成', '庆', '新', '俊', '龙', '雪', '健', '荣', '永', '亮',

    // 双字名字常用字
    '子轩', '浩然', '博文', '宇轩', '子涵', '梓轩', '俊杰', '天宇',
    '俊熙', '文博', '子豪', '宇航', '泽宇', '俊宇', '皓轩', '文轩',
    '嘉豪', '俊豪', '家豪', '文昊', '雨泽', '昊然', '明哲', '浩然',
    '子睿', '文杰', '俊杰', '志明', '文强', '天翔', '文浩', '俊朗',
    '欣怡', '诗涵', '雨涵', '梓涵', '梦瑶', '思雨', '雨婷', '佳怡',
    '雅静', '欣妍', '雨欣', '思琪', '雨萱', '梦洁', '雪儿', '佳琪',
    '美琳', '梦婷', '晓婷', '雅婷', '晓雨', '晓雪', '晓晴', '晓月',
    '晓燕', '晓丽', '晓慧', '晓敏', '晓雯', '晓菲', '晓蕾', '晓琳',
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
  // 公司名称相关数据
  private COMPANY_PREFIXES: string[] = [
    '华为', '阿里巴巴', '腾讯', '字节跳动', '百度', '京东', '美团', '滴滴', '小米', '联想',
    '中兴', '网易', '搜狐', '新浪', '携程', '拼多多', '快手', '哔哩哔哩', '爱奇艺', '优酷'
  ]
  private COMPANY_SUFFIXES: string[] = [
    '科技有限公司', '信息技术有限公司', '网络技术有限公司', '智能科技有限公司', '数据技术有限公司',
    '软件有限公司', '互联网有限公司', '电子商务有限公司', '集团有限公司', '股份有限公司'
  ]
  // 职位名称数据
  private POSITION_PREFIXES: string[] = [
    '高级', '资深', '首席', '初级', '中级', '助理', '实习', '项目', '产品', '技术',
    '前端', '后端', '全栈', '移动端', '测试', '运维', '数据', '算法', 'UI', 'UX'
  ]
  private POSITION_SUFFIXES: string[] = [
    '工程师', '开发工程师', '架构师', '设计师', '产品经理', '项目经理', '测试工程师', '运维工程师',
    '数据分析师', '算法工程师', '研究员', '专员', '主管', '总监', '专家', '顾问'
  ]
  // 地址相关数据
  private PROVINCES: string[] = [
    '北京市', '上海市', '天津市', '重庆市', '河北省', '山西省', '辽宁省', '吉林省', '黑龙江省',
    '江苏省', '浙江省', '安徽省', '福建省', '江西省', '山东省', '河南省', '湖北省', '湖南省',
    '广东省', '海南省', '四川省', '贵州省', '云南省', '陕西省', '甘肃省', '青海省', '台湾省',
    '内蒙古自治区', '广西壮族自治区', '西藏自治区', '宁夏回族自治区', '新疆维吾尔自治区', '香港特别行政区', '澳门特别行政区'
  ]
  private CITIES: string[] = [
    '朝阳区', '海淀区', '西城区', '东城区', '浦东新区', '徐汇区', '黄浦区', '静安区',
    '南山区', '福田区', '罗湖区', '宝安区', '西湖区', '上城区', '下城区', '江干区',
    '天河区', '越秀区', '海珠区', '荔湾区', '武侯区', '锦江区', '青羊区', '金牛区'
  ]
  private STREETS: string[] = [
    '人民路', '中山路', '解放路', '建设路', '新华路', '文化路', '科技路', '创业路',
    '和平路', '民主路', '自由路', '幸福路', '和谐路', '发展路', '创新路', '梦想路'
  ]

  // 使用时间戳基础的唯一标识符
  generatorID() {
    const timestamp = new Date().getTime().toString()
    const randomPart = Math.random().toString(36).substring(2, 9)
    return `${timestamp}-${randomPart}`
  }

  generatorRandomName() {
    // 随机选择一个姓氏
    const randomSurname = this.COMMON_SURNAMES[this.random(this.COMMON_SURNAMES.length)]
    // 名字
    let givenName = this.COMMON_NAME_CHARACTERS[this.random(this.COMMON_NAME_CHARACTERS.length)]
    return randomSurname + givenName
  }

  // 随机生成16进制颜色值
  generatorRandomColor() {
    const hexDigits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'e', 'f', 'g']
    let color = '#'

    for (let i = 0; i < 6; i++) {
      color += hexDigits[this.random(16)]
    }

    return color

  }

  // 随机电话号码
  generatorRandomPhone() {
    const prefix = this.MOBILE_PREFIXES[this.random(this.MOBILE_PREFIXES.length)]
    const suffix: string = Array.from<number, number>({ length: 8 }, (): number => this.random(10)).join('')

    return prefix + suffix
  }

  // 随机邮箱
  generatorRandomEmail(name: string) {
    const domain = this.COMMON_DOMAINS[this.random(this.COMMON_DOMAINS.length)]

    return name + '@' + domain
  }

  // 随机生成公司名称
  generatorRandomCompany(): string {
    const prefix = this.COMPANY_PREFIXES[this.random(this.COMPANY_PREFIXES.length)]
    const suffix = this.COMPANY_SUFFIXES[this.random(this.COMPANY_SUFFIXES.length)]
    return prefix + suffix
  }

  // 随机生成职位名称
  generatorRandomPosition(): string {
    // 随机决定是否添加前缀
    const hasPrefix = this.random(2) === 1
    let position = ''

    if (hasPrefix) {
      const prefix = this.POSITION_PREFIXES[this.random(this.POSITION_PREFIXES.length)]
      position += prefix
    }

    const suffix = this.POSITION_SUFFIXES[this.random(this.POSITION_SUFFIXES.length)]
    position += suffix

    return position
  }

  // 随机生成地址
  generatorRandomAddress(): string {
    const province = this.PROVINCES[this.random(this.PROVINCES.length)]
    const city = this.CITIES[this.random(this.CITIES.length)]
    const street = this.STREETS[this.random(this.STREETS.length)]
    const buildingNumber = (this.random(200) + 1).toString()

    return `${province}${city}${street}${buildingNumber}号`
  }

  // 生成完整的公司信息对象
  generatorRandomMoreInfo(): MoreInfo {
    return {
      company: this.generatorRandomCompany(),
      position: this.generatorRandomPosition(),
      address: this.generatorRandomAddress()
    }
  }

  // 产生随机数
  private random(length: number = 1) {
    return Math.floor(Math.random() * length)
  }
}
