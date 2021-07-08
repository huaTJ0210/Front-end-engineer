import React, { PureComponent } from 'react';
import { connect } from 'react-redux';

import {
  TopBannerWrapper,
  TopBannerLeft,
  TopBannerRight,
  BannerControl,
} from './style';
import { getTopBannersAction } from '../../store/actionCreators';
import { Carousel } from 'antd';

class HXTopBanner extends PureComponent {

  constructor(props) {
    super(props);
    this.state = {
      currentIndex: 0,
    };
    this.bannerRef = React.createRef();
  }
  componentDidMount() {
    this.props.getbanner();
  }
  bannerChange(from, to) {
    // 渲染存在闪动问题
    setTimeout(() => {
      this.setState({
        currentIndex: to,
      });
    }, 0);
  }
  render() {
    const banners = this.props.banners;
    const { currentIndex } = this.state;
    const bgImage =
      banners[currentIndex] &&
      banners[currentIndex].imageUrl + '?imageView&blur=40x20';
    return (
      <TopBannerWrapper bgImage={bgImage}>
        <div className='banner wrap-v2'>
          <TopBannerLeft>
            <Carousel
              autoplay
              effect='fade'
              beforeChange={(from, to) => {
                this.bannerChange(from, to);
              }}
              ref={this.bannerRef}
            >
              {banners.map((item, index) => {
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
          </TopBannerLeft>
          <TopBannerRight></TopBannerRight>
          <BannerControl className='control'>
            <button
              className='btn left'
              onClick={(e) => this.bannerRef.current.prev()}
            ></button>
            <button
              className='btn right'
              onClick={(e) => this.bannerRef.current.next()}
            ></button>
          </BannerControl>
        </div>
      </TopBannerWrapper>
    );
  }
}

const mapStateToProps = (state) => ({
  banners: state.getIn(['recommend', 'topBanners']),
});
const mapDispatchToProps = (dispatch) => ({
  getbanner: () => dispatch(getTopBannersAction()),
});

export default connect(mapStateToProps, mapDispatchToProps)(HXTopBanner);
