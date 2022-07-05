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

import BottomBarModel from "./bottomBarModel"

@Component
export struct BottomBar {
  @State model: BottomBarModel.Model = new BottomBarModel.Model();
  @State opacityValue: number = 0
  private onSelect: (() => void) = null

  private onClick() {
    if (this.onSelect != null) {
      this.onSelect();
    }
    this.model.setShowPopUp(!this.model.getShowPopUp())
    animateTo({
      duration: 300,
    }, () => {
      if (this.opacityValue == 0) this.opacityValue = 1
      else this.opacityValue = 0
    })
  }

  build() {
    Row() {
      Stack() {
        Rect() // container
          .width('100%')
          .height('100%')
          .fill(this.model.getBottomBarColor())
        if (this.model.getBottomBarDesignRight()) {
          Stack() { // left icon list
            Flex({
              direction: FlexDirection.Row,
              justifyContent: FlexAlign.SpaceAround,
              alignItems: ItemAlign.Start
            }) {
              ForEach(this.model.getLeftIconsList(), item => {
                Image(item.image)
                  .width(item.width)
                  .height(item.height)
              })
            }.width(40 * this.model.getLeftIconsList().length.toString() + 'vp')
          }
          .width('140vp')
          .offset({ x: '-90vp', y: '5vp' })
        }
        else {
          if(this.model.getRemoveNavigationIcon()!=true){
            Image(this.model.getNavigationIcon()) // navigation icon
              .width(this.model.getNavigationIconWidth())
              .height(this.model.getNavigationIconHeight())
              .offset({ x: '-145vp', y: '0vp' })
          }

          if (this.model.getOptionIconsMenu().length == 1) {
            Image(this.model.getOptionIconsMenu()[0].image) // action item
              .width(this.model.getOptionIconsMenu()[0].width)
              .height(this.model.getOptionIconsMenu()[0].height)
              .offset({ x: '115vp', y: '0vp' })
          }
          else if (this.model.getOptionIconsMenu().length == 2) {
            Image(this.model.getOptionIconsMenu()[0].image) // action item
              .width(this.model.getOptionIconsMenu()[0].width)
              .height(this.model.getOptionIconsMenu()[0].height)
              .offset({ x: '115vp', y: '0vp' })

            Image(this.model.getOptionIconsMenu()[1].image) // action item
              .width(this.model.getOptionIconsMenu()[1].width)
              .height(this.model.getOptionIconsMenu()[1].height)
              .offset({ x: '155vp', y: '0vp' })
          }
          else {
            Image(this.model.getOptionIconsMenu()[0].image) // action item
              .width(this.model.getOptionIconsMenu()[0].width)
              .height(this.model.getOptionIconsMenu()[0].height)
              .offset({ x: '115vp', y: '0vp' })
            if (this.model.getShowPopUp()) { // overflow menu shadow
              Circle()
                .width('34vp')
                .height('34vp')
                .fill("rgb(167,51,255)")
                .offset({ x: '155vp', y: '0vp' })
                .opacity(this.opacityValue)
                .onClick(() => this.onClick())
            }

            Image($r('app.media.dot_menu')) // overflow menu
              .width('6vp')
              .height('24vp')
              .offset({ x: '155vp', y: '0vp' })
              .onClick(() => this.onClick())


            if (this.model.getShowPopUp()) {
              Stack() { // overflow pop-up
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
                  ForEach(this.model.getOptionIconsMenu().slice(1, this.model.getOptionIconsMenu().length), item => {
                    Text(item.text)
                      .fontColor(Color.White)
                      .fontWeight(600)
                      .fontSize('17vp')
                  })
                }
              }
              .width('140vp')
              .height((41 * this.model.getOptionIconsMenu().length).toString() + 'vp')
              .opacity(this.opacityValue)
              .offset({ x: '90vp', y: '-' + (150 + 41 * (this.model.getOptionIconsMenu().length - 3)).toString() + 'vp' })
            }
          }
        }
        if(this.model.getRemoveFab()!=true){
          Stack() { // floating action button
            Rect()
              .width(this.model.getFabWidth())
              .height(this.model.getFabHeight())
              .fill(Color.Black)
              .radius(this.model.getBottomBarDesignRight() ? '18vp' : '30vp')

            Image($r('app.media.plus'))
              .width('28vp')
              .height('28vp')

          }.offset({
            x: this.model.getBottomBarDesignRight() ? '135vp' : '0vp',
            y: this.model.getBottomBarDesignRight() ? '0vp' : '-' + (Number(this.model.getElevation().slice(0, -2)) - 28).toString() + 'vp'
          })
        }
      }.width('100%')
      .height(this.model.getElevation())
    }
    .width('100%')
    .height('100%')
    .alignItems(VerticalAlign.Bottom)
  }
}

export { BottomBarModel } from "./bottomBarModel";
