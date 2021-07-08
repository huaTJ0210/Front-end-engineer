import React, { PureComponent } from 'react';

import { getSizeImage, getCount } from '@/utils/format-utils';

import { ThemeCoverWrapper } from './style';

export default class ThemeCover extends PureComponent {
  render() {
    const { info } = this.props;
    return (
      <ThemeCoverWrapper
        bgImage={getSizeImage(info.picUrl || info.coverImgUrl, 140)}
      >
        <div className='cover-top'>
          <div className='overlay'>
            <span>
              <i className='sprite_icon erji'></i>
              {getCount(info.playCount)}
            </span>
            <i className='sprite_icon play'></i>
          </div>
        </div>
        <div className='cover-bottom'>{info.name}</div>
      </ThemeCoverWrapper>
    );
  }
}
