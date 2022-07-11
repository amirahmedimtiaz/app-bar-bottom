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

@Component
export struct OptionMenu {
  private options: OptionMenu.Model [] = []
  private optionClickListener: (option: OptionMenu.Model) => void = undefined
  @State private showPopUp: boolean = false
  @State private opacityValue: number = 0

  private onDotMenuClick() {
    this.showPopUp = !this.showPopUp
    animateTo({
      duration: 300,
    }, () => {
      if (this.opacityValue == 0) this.opacityValue = 1
      else this.opacityValue = 0
    })
  }

  private onOptionClick(option: OptionMenu.Model) {
    if (this.optionClickListener != undefined && this.optionClickListener != null) {
      this.optionClickListener(option)
    }
  }

  build() {
    if (this.options.length == 1) {
      Image(this.options[0].getIcon())
        .width(this.options[0].getWidth())
        .height(this.options[0].getHeight())
        .onClick(()=>this.onOptionClick(this.options[0]))
        .offset({ x: '115vp', y: '0vp' })
    }
    else if (this.options.length == 2) {
      Image(this.options[0].getIcon())
        .width(this.options[0].getWidth())
        .height(this.options[0].getHeight())
        .onClick(()=>this.onOptionClick(this.options[0]))
        .offset({ x: '115vp', y: '0vp' })

      Image(this.options[1].getIcon())
        .width(this.options[1].getWidth())
        .height(this.options[1].getHeight())
        .onClick(()=>this.onOptionClick(this.options[1]))
        .offset({ x: '155vp', y: '0vp' })
    }
    else {
      Image(this.options[0].getIcon())
        .width(this.options[0].getWidth())
        .height(this.options[0].getHeight())
        .onClick(()=>this.onOptionClick(this.options[0]))
        .offset({ x: '115vp', y: '0vp' })
      if (this.showPopUp) {
        Circle()
          .width('34vp')
          .height('34vp')
          .fill("rgb(167,51,255)")
          .offset({ x: '155vp', y: '0vp' })
          .opacity(this.opacityValue)
          .onClick(() => this.onDotMenuClick())
      }

      Image($r('app.media.dot_menu'))
        .width('6vp')
        .height('24vp')
        .offset({ x: '155vp', y: '0vp' })
        .onClick(() => this.onDotMenuClick())


      if (this.showPopUp) {
        Stack() {
          Rect()
            .width('100%')
            .height('100%')
            .fill('rgb(145,0,255)')
            .radius('7vp')
          Flex({
            direction: FlexDirection.Column,
            justifyContent: FlexAlign.SpaceAround,
            alignItems: ItemAlign.Start
          }) {
            ForEach(this.options.slice(1, this.options.length), item => {
              Text(item.getText())
                .fontColor(Color.White)
                .fontWeight(600)
                .fontSize('17vp')
                .margin({left: '10vp',right: '10vp'})
            })
          }.onClick(()=>this.onDotMenuClick())
        }
        .width('145vp')
        .height((41 * this.options.length).toString() + 'vp')
        .opacity(this.opacityValue)
        .offset({ x: '90vp', y: '-' + (150 + 41 * (this.options.length - 3)).toString() + 'vp' })
      }
    }
  }
}

export namespace OptionMenu {
  export class Model {
    private id: string | number = undefined
    private label: string | Resource = ''

    private text: string = ''
    private icon: Resource = undefined

    private width: string | number = '24vp'
    private height: string | number = '24vp'
    private menuWidth: string | number = '145vp'

    constructor(id, label) {
      this.id = id
      this.label = label
    }

    buildUI(): boolean {
      return (this.id != undefined && this.id != null) &&
      (this.label != undefined && this.label != null)
    }

    getId(): string | number {
      return this.id
    }

    setId(id: string | number): Model {
      this.id = id
      return this
    }

    getLabel(): string | Resource {
      return this.label
    }

    getText(): string{
      return this.text
    }

    setText(text: string): Model {
      if (text == undefined || text == null) {
        this.text = ''
      } else {
        this.text = text
      }
      return this
    }

    setLabel(label: string | Resource): Model {
      if (label == undefined || label == null) {
        this.label = ''
      } else {
        this.label = label
      }
      return this
    }

    hasIcon(): boolean {
      return this.icon != undefined && this.icon != null
    }

    getIcon(): Resource {
      return this.icon
    }

    setIcon(icon: Resource): Model {
      this.icon = icon
      return this
    }

    getWidth(): string | number {
      return this.width
    }

    setWidth(width: string | number): Model {
      if (width == undefined || width == null) {
        this.width = '24vp'
      } else {
        this.width = width
      }
      return this
    }

    getHeight(): string | number {
      return this.height
    }

    setHeight(height: string | number): Model {
      if (height == undefined || height == null) {
        this.height = '24vp'
      } else {
        this.height = height
      }
      return this
    }

  }
}