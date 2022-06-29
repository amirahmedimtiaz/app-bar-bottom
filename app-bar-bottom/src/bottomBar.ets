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
  private onSelect: (() => void) = null

  private onClick() {
    animateTo({
      duration: 200,
    }, () => {
      this.model.showPopUp = !this.model.showPopUp
    })
    //      this.model.showAnimationDotMenu = !this.model.showAnimationDotMenu

  }

  build() {
    Row() {
      Stack() {

        Rect() // container
          .width('100%')
          .height('100%')
          .fill('rgb(145,0,255)')

        Image($r('app.media.menu')) // navigation icon
          .width('20vp')
          .height('16vp')
          .offset({ x: '-145vp', y: '0vp' })

        Stack() { // floating action button
          Rect()
            .width('56vp')
            .height('56vp')
            .fill(Color.Black)
            .radius('30vp')

          Image($r('app.media.plus'))
            .width('28vp')
            .height('28vp')

        }.offset({ x: '0vp', y: '-28vp' })

        Image($r('app.media.search')) // action item
          .width('24vp')
          .height('24vp')
          .offset({ x: '115vp', y: '0vp' })

        if (this.model.showPopUp) {
          Circle()
            .width('34vp')
            .height('34vp')
            .fill("rgba(0,0,0,0.3)")
            .offset({ x: '155vp', y: '0vp' })
            .onClick(() => this.onClick())
        }

        Image($r('app.media.dot_menu')) // overflow menu
          .width('5vp')
          .height('24vp')
          .offset({ x: '155vp', y: '0vp' })
          .onClick(() => this.onClick())


        if (this.model.showPopUp) {
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
        }


      }.width('100%')
      .height('56vp')
    }
    .width('100%')
    .height('100%')
    .alignItems(VerticalAlign.Bottom)
  }
}

export { BottomBarModel } from "./bottomBarModel";
