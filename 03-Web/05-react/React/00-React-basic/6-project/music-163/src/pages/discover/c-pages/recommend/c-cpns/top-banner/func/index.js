import React, { memo, useEffect, useCallback, useState, useRef } from 'react';
import { useDispatch, useSelector, shallowEqual } from 'react-redux';

import { getTopBannersAction } from '../../../store/actionCreators';

import { Carousel } from 'antd';
import { BannerWrapper, BannerLeft, BannerRight, BannerControl } from './style';

export default memo(function HZTopBanner() {
  const [currentIndex, setCurrentIndex] = useState(0);

  const dispatch = useDispatch();
  const state = useSelector(
    (state) => ({
      // state.get('recommand').get('topBanners')
      banners: state.getIn(['recommend', 'topBanners']),
    }),
    shallowEqual
  );
  //  创建ref
  const bannerRef = useRef();
  useEffect(() => {
    dispatch(getTopBannersAction());
  }, [dispatch]);

  // useCallBack使得函数有记忆，
  const bannerChange = useCallback((from, to) => {
    setTimeout(() => {
      setCurrentIndex(to);
    }, 0);
  }, []);

  const bgImage =
    state.banners[currentIndex] &&
    state.banners[currentIndex].imageUrl + '?imageView&blur=40x20';

  return (
    <BannerWrapper bgImage={bgImage}>
      <div className='banner wrap-v2'>
        <BannerLeft>
          <Carousel
            autoplay
            effect='fade'
            beforeChange={bannerChange}
            ref={bannerRef}
          >
            {state.banners.map((item, index) => {
              return (
                <div className='banner-item' key={item.imageUrl}>
                  <img
                    className='image'
                    src={item.imageUrl}
                    alt={item.typeTitle}
                  />
                </div>
              );
            })}
          </Carousel>
        </BannerLeft>
        <BannerRight></BannerRight>
        <BannerControl className='control'>
          <button
            className='btn left'
            onClick={(e) => bannerRef.current.prev()}
          ></button>
          <button
            className='btn right'
            onClick={(e) => bannerRef.current.next()}
          ></button>
        </BannerControl>
      </div>
    </BannerWrapper>
  );
});
