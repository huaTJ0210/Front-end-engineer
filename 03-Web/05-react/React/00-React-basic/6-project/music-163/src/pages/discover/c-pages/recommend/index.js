import React, { memo } from 'react';
import HZTopBanner from './c-cpns/top-banner/index';
import HZHotRecommend from './c-cpns/hot-recommend';
import {
  RecommendWraper,
  Content,
  RecommendLeft,
  RecommendRight,
} from './style';

function HZRecommend(props) {
  return (
    <RecommendWraper>
      <HZTopBanner />
      <Content className='wrap-v2'>
        <RecommendLeft>
          <HZHotRecommend />
        </RecommendLeft>
        <RecommendRight></RecommendRight>
      </Content>
    </RecommendWraper>
  );
}

export default memo(HZRecommend);

/*
function HZRecommend(props) {
  const { getBanners } = props;
  useEffect(() => {
    getBanners();
  }, [getBanners]);
  return (
    <div>
      <h2>HZRecommend</h2>
      <h2>{props.topBanners.length}</h2>
    </div>
  );
}

const mapStateToProps = (state) => ({ topBanners: state.recommend.topBanner });
const mapDispatchToProps = (dispatch) => ({
  getBanners: () => {
    dispatch(getTopBannersAction());
  },
});
export default connect(mapStateToProps, mapDispatchToProps)(memo(HZRecommend));
*/
