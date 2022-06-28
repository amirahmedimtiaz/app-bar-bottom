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
class colorConstants {
  defaultOnBackgroundColor: string | Color | Resource = "rgba(55,136,62,1.0)"
  defaultOffBackgroundColor: string | Color | Resource = "rgba(216,216,216,1.0)"
  defaultOnCircleColor: string | Color | Resource = Color.White
  defaultOffCircleColor: string | Color | Resource = "rgba(117,126,118,1.0)"
  defaultOnBorderColor: string | Color | Resource = "rgba(55,136,62,1.0)"
  defaultOffBorderColor: string | Color | Resource = "rgba(117,126,118,1.0)"
}

export namespace SwitchModel {
  export class Model {
    private switchId: number = 0
    private withIcon: boolean = false
    private showAnimation: boolean = false
    private isOn: boolean = false
    private icon: Resource = $r('app.media.tick')
    private disabled: boolean = false
    private colorConstant = new colorConstants();
    private onBackgroundColor: string | Color | Resource = this.colorConstant.defaultOnBackgroundColor
    private offBackgroundColor: string | Color | Resource = this.colorConstant.defaultOffBackgroundColor
    private onCircleColor: string | Color | Resource= this.colorConstant.defaultOnCircleColor
    private offCircleColor: string | Color | Resource= this.colorConstant.defaultOffCircleColor
    private onBorderColor: string | Color | Resource= this.colorConstant.defaultOnBorderColor
    private offBorderColor: string | Color | Resource= this.colorConstant.defaultOffBorderColor

    getOnBackgroundColor(): string | Resource | Color {
      return this.onBackgroundColor
    }

    setOnBackgroundColor(onBackgroundColor: string | Color | Resource): Model {
      if (onBackgroundColor != null && onBackgroundColor != undefined) {
        this.onBackgroundColor = onBackgroundColor
      } else {
        this.onBackgroundColor = this.colorConstant.defaultOnBackgroundColor
      }
      return this
    }

    getOffBackgroundColor(): string | Resource | Color {
      return this.offBackgroundColor
    }

    setOffBackgroundColor(offBackgroundColor: string | Color | Resource): Model {
      if (offBackgroundColor != null && offBackgroundColor != undefined) {
        this.offBackgroundColor = offBackgroundColor
      } else {
        this.offBackgroundColor = this.colorConstant.defaultOffBackgroundColor
      }
      return this
    }

    getOnCircleColor(): string | Resource | Color {
      return this.onCircleColor
    }

    setOnCircleColor(onCircleColor: string | Color | Resource): Model {
      if (onCircleColor != null && onCircleColor != undefined) {
        this.onCircleColor = onCircleColor
      } else {
        this.onCircleColor = this.colorConstant.defaultOnCircleColor
      }
      return this
    }

    getOffCircleColor(): string | Resource | Color {
      return this.offCircleColor
    }

    setOffCircleColor(offCircleColor: string | Color | Resource): Model {
      if (offCircleColor != null && offCircleColor != undefined) {
        this.offCircleColor = offCircleColor
      } else {
        this.offCircleColor = this.colorConstant.defaultOffCircleColor
      }
      return this
    }

    getOnBorderColor(): string | Resource | Color {
      return this.onBorderColor
    }

    setOnBorderColor(onBorderColor: string | Color | Resource): Model {
      if (onBorderColor != null && onBorderColor != undefined) {
        this.onBorderColor = onBorderColor
      } else {
        this.onBorderColor = this.colorConstant.defaultOnBorderColor
      }
      return this
    }

    getOffBorderColor(): string | Resource | Color {
      return this.offBorderColor
    }

    setOffBorderColor(offBorderColor: string | Color | Resource): Model {
      if (offBorderColor != null && offBorderColor != undefined) {
        this.offBorderColor = offBorderColor
      } else {
        this.offBorderColor = this.colorConstant.defaultOffBorderColor
      }
      return this
    }

    getDisabled(): boolean{
      return this.disabled
    }

    setDisabled(disabled: boolean): Model{
      if (disabled == null || disabled == undefined) {
        this.disabled = false
      }
      else this.disabled = disabled
      return this
    }

    getSwitchId(): number {
      return this.switchId
    }

    setSwitchId(switchId: number): Model {
      if (switchId != null && switchId > -1 && switchId != undefined) {
        this.switchId = switchId
      } else {
        this.switchId = 0
      }
      return this
    }

    getWithIcon(): boolean {
      return this.withIcon
    }

    setWithIcon(withIcon: boolean): Model {
      if (withIcon != null && withIcon != undefined) {
        this.withIcon = withIcon
      } else {
        this.withIcon = false
      }
      return this
    }

    getShowAnimation(): boolean {
      return this.showAnimation
    }

    setShowAnimation(showAnimation: boolean): Model {
      if (showAnimation != null && showAnimation != undefined) {
        this.showAnimation = showAnimation
      } else {
        this.showAnimation = false
      }
      return this
    }

    getIsOn(): boolean {
      return this.isOn
    }

    setIsOn(isOn: boolean): Model {
      if (isOn != null && isOn != undefined) {
        this.isOn = isOn
      } else {
        this.isOn = false
      }
      return this
    }

    getIcon(): Resource {
      return this.icon
    }

    setIcon(icon: Resource): Model {
      if (icon != null && icon != undefined) {
        this.icon = icon
      }
      else {
        this.icon = $r('app.media.tick')
      }
      return this
    }

    reset(): Model {
      this.switchId = 0
      this.withIcon = false
      this.showAnimation = false
      this.isOn = false
      this.icon = $r('app.media.tick')
      this.disabled = false
      this.onBackgroundColor = this.colorConstant.defaultOnBackgroundColor
      this.offBackgroundColor = this.colorConstant.defaultOffBackgroundColor
      this.onCircleColor = this.colorConstant.defaultOnCircleColor
      this.offCircleColor = this.colorConstant.defaultOffCircleColor
      this.onBorderColor = this.colorConstant.defaultOnBorderColor
      this.offBorderColor = this.colorConstant.defaultOffBorderColor
      return this
    }
  }
}


export default SwitchModel
