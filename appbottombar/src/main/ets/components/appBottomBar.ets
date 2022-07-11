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

import { NavigationIcon } from './navigationIcon'
import { FloatingActionButton } from './floatingActionButton'
import { OptionMenu } from './optionMenu'


@Component
struct AppBar {
  @State private model: AppBar.Model = new AppBar.Model()

  private buildUI(): boolean {
    return this.model != undefined && this.model != null && this.model.buildUI()
  }

  build() {
    if (this.buildUI()) {
      Row() {
        Stack() {
          Rect() // container
            .width('100%')
            .height('100%')
            .fill(this.model.getBackgroundColor())
          if (this.model.getBottomBarDesignRight()) {
            Stack() { // left icon list
              Flex({
                direction: FlexDirection.Row,
                justifyContent: FlexAlign.SpaceAround,
                alignItems: ItemAlign.Start
              }) {
                ForEach(this.model.getOptions(), item => {
                  Image(item.getIcon())
                    .width(item.getWidth())
                    .height(item.getHeight())
                })
              }.width((40 * this.model.getOptions().length).toString() + 'vp')
            }
            .width('140vp')
            .offset({ x: '-90vp', y: '5vp' })
          }
          else {
            NavigationIcon({
              model: this.model.getNavigationIcon(),
              navigationListener: this.model.getNavigationListener()
            })

            OptionMenu({
              options: this.model.getOptions(),
              optionClickListener: this.model.getOptionListener()
            })
          }
          FloatingActionButton({
            model: this.model.getFabModel(),
            fabClickListener: this.model.getFabListener()
          })
        }.width('100%')
        .height(this.model.getElevation())
      }
    }
  }
}

namespace AppBar {
  export class Model {
    private navigationIcon: NavigationIcon.Model = undefined

    private floatingActionButton: FloatingActionButton.Model = undefined

    private options: OptionMenu.Model [] = []

    private backgroundColor: string | Resource | Color = Color.Blue
    private bottomBarDesignRight: boolean = false
    private elevation: string = '56vp'

    private navigationClickListener: () => void = undefined
    private fabClickListener: () => void = undefined
    private optionClickListener: (option: OptionMenu.Model) => void = undefined

    buildUI(): boolean {
      return this.showNavigationIcon() || this.hasFab() || this.hasOptions()
    }

    getBackgroundColor(): string | ResourceColor {
      return this.backgroundColor
    }

    setBackgroundColor(color: string | ResourceColor): Model {
      if (color == undefined || color == null) {
        this.backgroundColor = Color.Blue
      } else {
        this.backgroundColor = color
      }
      return this
    }

    getElevation(): string  {
      return this.elevation
    }

    setElevation(elevation: string ): Model {
      if (elevation != null && elevation != undefined) {
        this.elevation = elevation
      } else {
        this.elevation = this.bottomBarDesignRight? '92vp':'56vp'
      }
      return this
    }

    getBottomBarDesignRight(): boolean {
      return this.bottomBarDesignRight
    }

    setBottomBarDesignRight(bottomBarDesignRight:boolean): Model {
      if (bottomBarDesignRight != null && bottomBarDesignRight != undefined) {
        this.bottomBarDesignRight = bottomBarDesignRight
        this.setElevation('92vp')
      } else {
        this.bottomBarDesignRight = false
      }
      return this
    }

    /* Navigation */

    showNavigationIcon(): boolean {
      return this.navigationIcon != undefined && this.navigationIcon != null
    }

    getNavigationIcon(): NavigationIcon.Model {
      return this.navigationIcon
    }

    setNavigationIcon(icon: NavigationIcon.Model): Model {
      this.navigationIcon = icon
      return this
    }

    addNavigationListener(listener: () => void): Model {
      this.navigationClickListener = listener
      return this
    }

    getNavigationListener(): () => void {
      return this.navigationClickListener
    }

    /* Floating Action Button */

    hasFab(): boolean {
      return this.floatingActionButton != undefined && this.floatingActionButton != null
    }

    getFabModel(): FloatingActionButton.Model {
      return this.floatingActionButton
    }

    setFabModel(model: FloatingActionButton.Model): Model {
      this.floatingActionButton = model
      return this
    }

    addFabListener(listener: () => void): Model {
      this.fabClickListener = listener
      return this
    }

    getFabListener(): () => void {
      return this.fabClickListener
    }

    /* Options */

    hasOptions(): boolean {
      return this.options != undefined && this.options != null && this.options.length > 0
    }

    getOptions(): OptionMenu.Model [] {
      return this.options
    }

    setOptions(options: OptionMenu.Model []): Model {
      if (options == undefined || options == null) {
        this.options = []
      } else {
        this.options = options
      }
      return this
    }

    addOptionListener(listener: (option: OptionMenu.Model) => void): Model {
      this.optionClickListener = listener
      return this
    }

    getOptionListener(): (option: OptionMenu.Model) => void {
      return this.optionClickListener
    }
  }
}

export {
  AppBar, FloatingActionButton, OptionMenu, NavigationIcon
}