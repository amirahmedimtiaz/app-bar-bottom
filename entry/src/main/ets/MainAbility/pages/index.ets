import prompt from '@system.prompt';
import { BottomBar, BottomBarModel }  from "@ohos/app-bottom-bar"

@Entry
@Component
struct Index {
  private bottomBarModel: BottomBarModel.Model = new BottomBarModel.Model();

  public aboutToAppear(): void {
    this.bottomBarModel.reset()
  }

  build() {
    Stack() {
      Text('Hello world').fontWeight(600).fontSize(50)
      BottomBar({
        model: this.bottomBarModel,
        onSelect: () => {
          //          prompt.showToast({
          //            message: "bottom-bar"
          //          })
        }
      })
    }

  }
}