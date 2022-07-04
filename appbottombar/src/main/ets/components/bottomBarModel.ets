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
    bottomBarColor: string | Color | Resource = 'rgb(145,0,255)'
    showPopUp: boolean = false
    elevation: string = '56vp'
    fabHeight: string = '56vp'
    fabWidth: string = '56vp'
    bottomBarDesignRight: boolean = false
    leftIconsList: any = [
      { 'text':'Brush' ,'image': $r('app.media.search'),'height': '24vp', 'width': '24vp'},
      { 'text':'Check_box' ,'image': $r('app.media.check_box'), 'height': '25vp', 'width': '25vp' },
      { 'text':'Images' ,'image': $r('app.media.images'), 'height': '25vp', 'width': '25vp' },
      { 'text':'Mic' ,'image': $r('app.media.mic'), 'height': '25vp', 'width': '25vp' },
    ]
    optionIconsMenu: any = [
      { 'text':'Search' ,'image': $r('app.media.search'),'height': '24vp', 'width': '24vp'},
      { 'text':'Plus' ,'image': $r('app.media.plus'), 'height': '25vp', 'width': '25vp' },
      { 'text':'Plus' ,'image': $r('app.media.plus'), 'height': '25vp', 'width': '25vp' },
      { 'text':'Icon' ,'image': $r('app.media.icon'), 'height': '25vp', 'width': '25vp' },
      { 'text':'Search' ,'image': $r('app.media.search'),'height': '25vp', 'width': '25vp'},
      { 'text':'Plus' ,'image': $r('app.media.plus'), 'height': '25vp', 'width': '25vp' },
    ]
    reset(): Model {
      this.bottomBarColor = 'rgb(145,0,255)'
      this.showPopUp = false
      this.elevation = '56vp'
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
        { 'text':'Brush' ,'image': $r('app.media.brush'),'height': '24vp', 'width': '24vp'},
        { 'text':'Check_box' ,'image': $r('app.media.check_box'), 'height': '25vp', 'width': '25vp' },
        { 'text':'Images' ,'image': $r('app.media.images'), 'height': '25vp', 'width': '25vp' },
        { 'text':'Mic' ,'image': $r('app.media.mic'), 'height': '25vp', 'width': '25vp' },
      ]
      this.bottomBarDesignRight = false
      return this
    }
  }
}

export default BottomBarModel
