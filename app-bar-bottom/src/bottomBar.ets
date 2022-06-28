/*
 * Copyright (c) 2022 Application Library Engineering Group.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import SwitchModel from "./switchModel"

@Component
export struct Switch {
  @State model: SwitchModel.Model = new SwitchModel.Model();
  private onSelect: ((id: number, isOn: boolean) => void) = null

  private onClick() {
    if (this.onSelect != null) {
      this.onSelect(this.model.getSwitchId(),!this.model.getIsOn());
    }
    if (this.model.getDisabled() == false) {
      this.model.setShowAnimation(true)
      animateTo({
        duration: 100,
        onFinish: () => {
          this.model.setShowAnimation(false)
        }
      }, () => {
        if (this.model.getIsOn() == false) {
          this.model.setIsOn(true)
        }
        else {
          this.model.setIsOn(false)
        }
      })
    }

  }

  build() {
    Shape() {
      Button()
        .width('52vp')
        .height('32vp')
        .backgroundColor(this.model.getIsOn() ? this.model.getOnBackgroundColor() : this.model.getOffBackgroundColor())
        .borderColor(this.model.getIsOn() ? this.model.getOnBorderColor() : this.model.getOffBorderColor())
        .borderWidth('2vp')
        .borderRadius('2vp')

      if (this.model.getShowAnimation()) {
        Circle()
          .width('38vp').height('38vp').fill("rgba(0,0,0,0.3)")
          .offset({ x: this.model.getIsOn() ? '17vp' : '-3.5vp', y: '-3vp' })
      }
      Circle()
        .width(this.model.getShowAnimation() ? '28vp' :
          (this.model.getIsOn ? '24vp' : '16vp'))
        .height(this.model.getShowAnimation() ? '28vp' :
          (this.model.getIsOn ? '24vp' : '16vp'))
        .offset({
          x: this.model.getShowAnimation() ?
            (this.model.getIsOn() ? '20vp' : '2vp')
                                           :
            (this.model.getIsOn() ? '23vp' : '5vp'),
          y: this.model.getShowAnimation() ? '2vp' : ((16 - (Number((this.model.getIsOn ? '24vp' : '16vp')
            .substring(0, 2))) / 2).toString() + 'vp')
        })
        .fill(this.model.getIsOn() ? this.model.getOnCircleColor() : this.model.getOffCircleColor())
      if (this.model.getWithIcon()) {
        Image(this.model.getIcon())
          .width('10')
          .height('10')
          .offset({ x: this.model.getIsOn() ? '30vp' : '11vp', y: '11vp' })
      }
    }.onClick(() => this.onClick()).padding('5vp').opacity(this.model.getDisabled() ? 0.5 : 1)
  }
}

export { SwitchModel } from "./switchModel";
