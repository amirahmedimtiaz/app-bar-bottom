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


export namespace BottomBarModel {
  export class Model {
    private bottomBarColor: string | Color | Resource = 'rgb(145,0,255)'
    private navigationIcon: Resource = $r('app.media.menu')
    private navigationIconWidth: string = '20vp'
    private navigationIconHeight: string = '16vp'
    private removeNavigationIcon: boolean = false
    private removeFab: boolean = false
    private fabHeight: string = '56vp'
    private fabWidth: string = '56vp'
    private showPopUp: boolean = false
    private bottomBarDesignRight: boolean = false
    private elevation: string = this.bottomBarDesignRight? '92vp':'56vp'
    private leftIconsList: any = [
      { 'text':'Brush' ,'image': $r('app.media.search'),'height': '24vp', 'width': '24vp'},
      { 'text':'Check_box' ,'image': $r('app.media.check_box'), 'height': '25vp', 'width': '25vp' },
      { 'text':'Images' ,'image': $r('app.media.images'), 'height': '25vp', 'width': '25vp' },
      { 'text':'Mic' ,'image': $r('app.media.mic'), 'height': '25vp', 'width': '25vp' },
    ]
    private optionIconsMenu: any = [
      { 'text':'Search' ,'image': $r('app.media.search'),'height': '24vp', 'width': '24vp'},
      { 'text':'Plus' ,'image': $r('app.media.plus'), 'height': '25vp', 'width': '25vp' },
      { 'text':'Plus' ,'image': $r('app.media.plus'), 'height': '25vp', 'width': '25vp' },
      { 'text':'Icon' ,'image': $r('app.media.icon'), 'height': '25vp', 'width': '25vp' },
      { 'text':'Search' ,'image': $r('app.media.search'),'height': '25vp', 'width': '25vp'},
      { 'text':'Plus' ,'image': $r('app.media.plus'), 'height': '25vp', 'width': '25vp' },
    ]

    getBottomBarColor(): string | Resource | Color {
      return this.bottomBarColor
    }

    setBottomBarColor(bottomBarColor: string | Color | Resource): Model {
      if (bottomBarColor != null && bottomBarColor != undefined) {
        this.bottomBarColor = bottomBarColor
      } else {
        this.bottomBarColor = 'rgb(145,0,255)'
      }
      return this
    }

    getNavigationIcon():  Resource  {
      return this.navigationIcon
    }

    setNavigationIcon(navigationIcon:  Resource): Model {
      if (navigationIcon != null && navigationIcon != undefined) {
        this.navigationIcon = navigationIcon
      } else {
        this.navigationIcon = $r('app.media.menu')
      }
      return this
    }

    getNavigationIconWidth(): string  {
      return this.navigationIconWidth
    }

    setOnBackgroundColor(navigationIconWidth: string): Model {
      if (navigationIconWidth != null && navigationIconWidth != undefined) {
        this.navigationIconWidth = navigationIconWidth
      } else {
        this.navigationIconWidth = '20vp'
      }
      return this
    }

    getNavigationIconHeight(): string  {
      return this.navigationIconHeight
    }

    setNavigationIconHeight(navigationIconHeight: string): Model {
      if (navigationIconHeight != null && navigationIconHeight != undefined) {
        this.navigationIconHeight = navigationIconHeight
      } else {
        this.navigationIconHeight = '16vp'
      }
      return this
    }

    getRemoveNavigationIcon(): boolean {
      return this.removeNavigationIcon
    }

    setRemoveNavigationIcon(removeNavigationIcon: boolean): Model {
      if (removeNavigationIcon != null && removeNavigationIcon != undefined) {
        this.removeNavigationIcon = removeNavigationIcon
      } else {
        this.removeNavigationIcon = false
      }
      return this
    }

    getRemoveFab(): boolean {
      return this.removeFab
    }

    setRemoveFab(removeFab: boolean): Model {
      if (removeFab != null && removeFab != undefined) {
        this.removeFab = removeFab
      } else {
        this.removeFab = false
      }
      return this
    }

    getFabHeight(): string  {
      return this.fabHeight
    }

    setFabHeight(fabHeight: string ): Model {
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

    setFabWidth(fabWidth: string ): Model {
      if (fabWidth != null && fabWidth != undefined) {
        this.fabWidth = fabWidth
      } else {
        this.fabWidth = '56vp'
      }
      return this
    }

    getShowPopUp(): boolean {
      return this.showPopUp
    }

    setShowPopUp(showPopUp:boolean): Model {
      if (showPopUp != null && showPopUp != undefined) {
        this.showPopUp = showPopUp
      } else {
        this.showPopUp = false
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

    getLeftIconsList(): any {
      return this.leftIconsList
    }

    setLeftIconList(leftIconsList:any): Model {
      if (leftIconsList != null && leftIconsList != undefined) {
        this.leftIconsList = leftIconsList
      } else {
        this.leftIconsList = [
          { 'text':'Brush' ,'image': $r('app.media.search'),'height': '24vp', 'width': '24vp'},
          { 'text':'Check_box' ,'image': $r('app.media.check_box'), 'height': '25vp', 'width': '25vp' },
          { 'text':'Images' ,'image': $r('app.media.images'), 'height': '25vp', 'width': '25vp' },
          { 'text':'Mic' ,'image': $r('app.media.mic'), 'height': '25vp', 'width': '25vp' },
        ]
      }
      return this
    }

    getOptionIconsMenu(): any {
      return this.optionIconsMenu
    }

    setOptionIconsMenu(optionIconsMenu:any): Model {
      if (optionIconsMenu != null && optionIconsMenu != undefined) {
        this.optionIconsMenu = optionIconsMenu
      } else {
        this.optionIconsMenu = [
          { 'text':'Search' ,'image': $r('app.media.search'),'height': '24vp', 'width': '24vp'},
          { 'text':'Plus' ,'image': $r('app.media.plus'), 'height': '25vp', 'width': '25vp' },
          { 'text':'Plus' ,'image': $r('app.media.plus'), 'height': '25vp', 'width': '25vp' },
          { 'text':'Icon' ,'image': $r('app.media.icon'), 'height': '25vp', 'width': '25vp' },
          { 'text':'Search' ,'image': $r('app.media.search'),'height': '25vp', 'width': '25vp'},
          { 'text':'Plus' ,'image': $r('app.media.plus'), 'height': '25vp', 'width': '25vp' },
        ]
      }
      return this
    }

    reset(): Model {
      this.bottomBarColor = 'rgb(145,0,255)'
      this.showPopUp = false
      this.fabHeight = '56vp'
      this.fabWidth = '56vp'
      this.optionIconsMenu = [
        { 'text':'Search' ,'image': $r('app.media.search'),'height': '24vp', 'width': '24vp'},
        { 'text':'Plus' ,'image': $r('app.media.plus'), 'height': '25vp', 'width': '25vp' },
        { 'text':'Plus' ,'image': $r('app.media.plus'), 'height': '25vp', 'width': '25vp' },
        { 'text':'Icon' ,'image': $r('app.media.icon'), 'height': '25vp', 'width': '25vp' },
        { 'text':'Search' ,'image': $r('app.media.search'),'height': '25vp', 'width': '25vp'},
        { 'text':'Plus' ,'image': $r('app.media.plus'), 'height': '25vp', 'width': '25vp' },
        { 'text':'Brush' ,'image': $r('app.media.brush'),'height': '24vp', 'width': '24vp'},
        { 'text':'Check_box' ,'image': $r('app.media.check_box'), 'height': '25vp', 'width': '25vp' },
        { 'text':'Images' ,'image': $r('app.media.images'), 'height': '25vp', 'width': '25vp' },
        { 'text':'Mic' ,'image': $r('app.media.mic'), 'height': '25vp', 'width': '25vp' },
      ]
      this.leftIconsList = [
        { 'text':'Check_box' ,'image': $r('app.media.check_box'), 'height': '24vp', 'width': '24vp' },
        { 'text':'Brush' ,'image': $r('app.media.brush'),'height': '23.2vp', 'width': '24vp'},
        { 'text':'Images' ,'image': $r('app.media.images'), 'height': '24vp', 'width': '24vp' },
        { 'text':'Mic' ,'image': $r('app.media.mic'), 'height': '24vp', 'width': '17.58vp' },
      ]
      this.bottomBarDesignRight = false
      this.elevation = this.bottomBarDesignRight? '92vp':'56vp'
      this.navigationIcon = $r('app.media.menu')
      this.navigationIconWidth = '20vp'
      this.navigationIconHeight= '16vp'
      this.removeNavigationIcon = false
      this.removeFab = false
      return this
    }
  }
}

export default BottomBarModel
