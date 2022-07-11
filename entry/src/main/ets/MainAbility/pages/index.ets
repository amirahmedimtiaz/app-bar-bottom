import prompt from '@system.prompt';
import { AppBar, NavigationIcon, FloatingActionButton, OptionMenu } from "@ohos/app-bottom-bar"
//{ BottomBar, BottomBarModel }  from "@ohos/app-bottom-bar"

@Entry
@Component
struct Index {
  private bottomBarModel1: AppBar.Model = new AppBar.Model();
  private bottomBarModel2: AppBar.Model = new AppBar.Model();

  public aboutToAppear(): void {
    this.buildFirstBottomBar()
    this.buildSecondBottomBar()
  }

  private navigationIconClick() {
    prompt.showToast({
      message: 'Navigation Button'
    })
  }
  private fabClick() {
    prompt.showToast({
      message: 'Floating Action Button'
    })
  }

  private optionClick(option: OptionMenu.Model) {
    prompt.showToast({
      message: 'Option:: ' + option.getLabel()
    })
  }


  private buildFirstBottomBar() {
    let navigationIcon = new NavigationIcon.Model()
      .setIcon($r('app.media.menu'))

    let floatingActionButton = new FloatingActionButton.Model()
      .setFabIcon($r('app.media.plus'))

    let options = [
      new OptionMenu.Model(1, "search")
        .setIcon($r('app.media.search'))
        .setText('search'),
      new OptionMenu.Model(2, "settings")
        .setIcon($r('app.media.settings'))
        .setText('Settings'),
      new OptionMenu.Model(3, "feedback")
        .setIcon($r('app.media.feedback'))
        .setText('Send Feedback'),
      new OptionMenu.Model(3, "help")
        .setIcon($r('app.media.help'))
        .setText('Help')
    ]

    this.bottomBarModel1
      .setNavigationIcon(navigationIcon)
      .setFabModel(floatingActionButton)
      .setOptions(options)
      .setBackgroundColor('rgb(145,0,255)')
      .addNavigationListener(this.navigationIconClick)
      .addFabListener(this.fabClick)
      .addOptionListener(this.optionClick)
  }
  private buildSecondBottomBar() {
    let navigationIcon = new NavigationIcon.Model()
      .setIcon($r('app.media.menu'))

    let floatingActionButton = new FloatingActionButton.Model()
      .setFabPositionRight(true)
      .setFabIcon($r('app.media.plus'))

    let options = [
      new OptionMenu.Model(1, "check_box")
        .setIcon($r('app.media.check_box'))
        .setText("check_box"),
      new OptionMenu.Model(2, "brush")
        .setIcon($r('app.media.brush'))
        .setText('brush'),
      new OptionMenu.Model(3, "mic")
        .setIcon($r('app.media.mic'))
        .setText('mic')
        .setWidth('16vp'),
      new OptionMenu.Model(3, "images")
        .setIcon($r('app.media.images'))
        .setText('mic')
    ]

    this.bottomBarModel2
      .setBottomBarDesignRight(true)
      .setNavigationIcon(navigationIcon)
      .setFabModel(floatingActionButton)
      .setOptions(options)
      .setBackgroundColor('rgb(145,0,255)')
      .addNavigationListener(this.navigationIconClick)
      .addFabListener(this.fabClick)
      .addOptionListener(this.optionClick)
  }


  build() {
    Column() {

      Text('Bottom Bar 1').fontSize('24fp').width('100%')
        .margin({ left: '24vp', top: '24vp', bottom: '200vp' })

      AppBar({ model: this.bottomBarModel1 })

      Text('Bottom Bar 2').fontSize('24fp').width('100%')
        .margin({ left: '24vp', top: '100vp', bottom: '200vp' })

      AppBar({ model: this.bottomBarModel2 })

    }

  }
}