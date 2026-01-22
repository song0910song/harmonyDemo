import router from '@ohos.router'
import { ContactModel } from '../Model/ContactModel'
import DetailRow from '../View/DetailRow'

interface RouterParams {
  contact: ContactModel
}

@Entry
@Component
struct Detail {
  // 加载联系人信息
  @State params: RouterParams = router.getParams() as RouterParams
  // console.log(JSON.stringify(params.contact))
  @State contact: ContactModel = this.params.contact

  @Builder
  headerSection() {
    Column() {
      // 顶部背景区域
      Column() {
      }
      .width('100%')
      .height(140)
      .backgroundColor(this.contact.color)

      // 头像和基本信息区域
      Column() {
        // 头像
        Column() {
          Text(this.contact.name[2] == undefined ? this.contact.name[1] : this.contact.name[2])
            .height(120)
            .width(120)
            .textAlign(TextAlign.Center)
            .font({ weight: 700, size: 60, })
            .fontColor(Color.White)
            .backgroundColor(this.contact.color)
            .borderRadius(60)
        }
        .width(128)
        .height(128)
        .borderRadius(64)
        .borderWidth(5)
        .borderColor(Color.White)
        .margin({ top: -64 })

        // 姓名
        Text(this.contact.name)
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Black)
          .margin({ top: 20, bottom: 8 })

        // 电话号码
        Text(this.contact.phone)
          .fontSize(18)
          .fontColor('#666666')
          .margin({ bottom: 30 })

        // 快速操作按钮
        Row({ space: 30 }) {
          // 拨号按钮
          Column() {
            Image($r('app.media.phone'))
              .width(40)
              .height(40)
            Text('拨号')
              .fontSize(14)
              .fontColor('#007DFF')
              .margin({ top: 8 })
          }

          // 消息按钮
          Column() {
            Image($r('app.media.message'))
              .width(40)
              .height(40)
            Text('消息')
              .fontSize(14)
              .fontColor('#007DFF')
              .margin({ top: 8 })
          }

          // 视频通话按钮
          Column() {
            Image($r('app.media.video'))
              .width(40)
              .height(40)
            Text('视频')
              .fontSize(14)
              .fontColor('#007DFF')
              .margin({ top: 8 })
          }
        }
        .padding({ top: 20, bottom: 30 })
      }
      .width('100%')
      .backgroundColor(Color.White)
      .alignItems(HorizontalAlign.Center)
    }
  }

  @Builder
  infoSection() {
    Column() {
      // 基本信息卡片
      Column() {
        DetailRow({
          title: '手机',
          content: this.contact.phone,
          showDivider: true,
          canCall: true
        })

        DetailRow({
          title: '电子邮件',
          content: this.contact.email,
          showDivider: true,
          canEmail: true
        })

        DetailRow({
          title: '备注',
          content: '这是一个示例备注信息',
          showDivider: false
        })
      }
      .width('100%')
      .backgroundColor(Color.White)
      .borderRadius(12)
      .margin({ top: 10, bottom: 20 })
      .shadow({
        radius: 8,
        color: '#20000000',
        offsetX: 0,
        offsetY: 2
      })

      // 更多信息卡片
      Column() {
        DetailRow({
          title: '公司',
          content: this.contact.company,
          showDivider: true
        })

        DetailRow({
          title: '职位',
          content: this.contact.position,
          showDivider: true
        })

        DetailRow({
          title: '住址',
          content: this.contact.address,
          showDivider: false
        })
      }
      .width('100%')
      .backgroundColor(Color.White)
      .borderRadius(12)
      .shadow({
        radius: 8,
        color: '#20000000',
        offsetX: 0,
        offsetY: 2
      })
    }
    .padding({ left: 16, right: 16 })
  }

  build() {
    Column() {
      // 标题栏
      Row() {
        Image($r('app.media.back'))
          .width(24)
          .height(24)
          .margin({ left: 16 })
          .onClick(() => {
            // 返回上一页
            console.log('返回');
            router.back()
          })

        Text('联系人详情')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)

        Image($r('app.media.more'))
          .width(24)
          .height(24)
          .margin({ right: 16 })
          .onClick(() => {
            // 更多操作
            console.log('更多操作');
          })
      }
      .width('100%')
      .height(56)
      .backgroundColor(Color.White)
      .alignItems(VerticalAlign.Center)

      // 内容区域
      Scroll() {
        Column() {
          this.headerSection()
          this.infoSection()
        }
      }
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}