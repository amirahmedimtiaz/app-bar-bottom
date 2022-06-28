@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Stack() {
        Stack() {
          Rect()
            .width('100%')
            .height('100%')
            .fill('rgb(145,0,255)')
            .radius('7vp')
          Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Start }) {
            Text('Settings')
              .fontColor(Color.White)
              .fontWeight(600)
              .fontSize('16vp')
            Text('Send Feedback')
              .fontColor(Color.White)
              .fontWeight(600)
              .fontSize('16vp')
            Text('Help')
              .fontColor(Color.White)
              .fontWeight(600)
              .fontSize('16vp')
          }
        }
        .width('140vp')
        .height('123vp')
        .offset({ x: '90vp', y: '-150vp' })
        Rect()
          .width('100%')
          .height('100%')
          .fill('rgb(145,0,255)')

        Stack() {

          Rect()
            .width('56vp')
            .height('56vp')
            .fill(Color.Black)
            .radius('30vp')

          Image($r('app.media.plus'))
            .width('28vp')
            .height('28vp')

        }.offset({ x: '0vp', y: '-28vp' })

        Image($r('app.media.menu'))
          .width('20vp')
          .height('16vp')
          .offset({ x: '-145vp', y: '0vp' })

        Image($r('app.media.search'))
          .width('24vp')
          .height('24vp')
          .offset({ x: '115vp', y: '0vp' })

        Image($r('app.media.dot_menu'))
          .width('5vp')
          .height('24vp')
          .offset({ x: '155vp', y: '0vp' })

      }.width('100%')
      .height('56vp')
    }
    .width('100%')
    .height('100%')
    .alignItems(VerticalAlign.Bottom)
  }
}