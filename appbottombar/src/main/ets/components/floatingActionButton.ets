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
export struct FloatingActionButton {
  private model: FloatingActionButton.Model = undefined
  private fabClickListener: () => void = undefined

  private onClick() {
    if (this.fabClickListener != undefined && this.fabClickListener != null) {
      this.fabClickListener()
    }
  }

  build() {
    if (this.model != undefined && this.model != null) {
      Stack() {
        Rect()
          .width(this.model.getFabWidth())
          .height(this.model.getFabHeight())
          .fill(Color.Black)
          .radius(this.model.getFabPositionRight() ? '18vp' : '30vp')
        Image(this.model.getFabIcon())
          .width(this.model.getFabIconWidth())
          .height(this.model.getFabIconHeight())

      }
      .offset({
        x: '0vp',
        y: this.model.getFabPositionRight() ? '0vp' : '-' + (Number(this.model.getFabElevation()
          .slice(0, -2)) - 28).toString() + 'vp'
      })
      .onClick(() => this.onClick())
    }
  }
}

export namespace FloatingActionButton {
  export class Model {
    private fabHeight: string = '56vp'
    private fabWidth: string = '56vp'
    private fabPositionRight: boolean = false
    private fabElevation: string = this.fabPositionRight ? '92vp' : '56vp'
    private fabIcon: Resource = $r('app.media.plus')
    private fabIconWidth: string = '28vp'
    private fabIconHeight: string = '28vp'

    getFabIcon(): Resource{
      return this.fabIcon
    }

    setFabIcon(fabIcon: Resource): Model{
      if (fabIcon != null && fabIcon != undefined) {
        this.fabIcon = fabIcon
      } else {
        this.fabIcon = $r('app.media.plus')
      }
      return this
    }

    getFabIconHeight(): string  {
      return this.fabIconWidth
    }

    setFabIconHeight(fabIconHeight: string): Model {
      if (fabIconHeight != null && fabIconHeight != undefined) {
        this.fabIconHeight = fabIconHeight
      } else {
        this.fabIconHeight = '28vp'
      }
      return this
    }

    getFabIconWidth(): string  {
      return this.fabIconWidth
    }

    setFabIconWidth(fabIconWidth: string): Model {
      if (fabIconWidth != null && fabIconWidth != undefined) {
        this.fabIconWidth = fabIconWidth
      } else {
        this.fabIconWidth = '28vp'
      }
      return this
    }

    getFabPositionRight(): boolean {
      return this.fabPositionRight
    }

    setFabPositionRight(fabPositionRight: boolean): Model {
      if (fabPositionRight != null && fabPositionRight != undefined) {
        this.fabPositionRight = fabPositionRight
        this.setFabElevation('92vp')
      } else {
        this.fabPositionRight = false
      }
      return this
    }

    getFabHeight(): string  {
      return this.fabHeight
    }

    setFabHeight(fabHeight: string): Model {
      if (fabHeight != null && fabHeight != undefined) {
        this.fabHeight = fabHeight
      } else {
        this.fabHeight = '56vp'
      }
      return this
    }

    getFabWidth(): string  {
      return this.fabWidth
    }

    setFabWidth(fabWidth: string): Model {
      if (fabWidth != null && fabWidth != undefined) {
        this.fabWidth = fabWidth
      } else {
        this.fabWidth = '56vp'
      }
      return this
    }

    getFabElevation(): string  {
      return this.fabElevation
    }

    setFabElevation(fabElevation: string): Model {
      if (fabElevation != null && fabElevation != undefined) {
        this.fabElevation = fabElevation
      } else {
        this.fabElevation = this.fabPositionRight ? '92vp' : '56vp'
      }
      return this
    }
  }
}
