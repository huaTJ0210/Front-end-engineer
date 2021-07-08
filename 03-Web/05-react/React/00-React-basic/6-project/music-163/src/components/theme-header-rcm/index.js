import React, { PureComponent } from 'react';
// 自定义组件限制props内部属性类型的
import PropTypes from 'prop-types';
import { Link } from 'react-router-dom';

import {
  ThemeHeaderRCMWrapper,
  ThemeHeaderLeft,
  ThemeHeaderRight,
} from './style';

class ThemeHeaderRCM extends PureComponent {
  render() {
    const { title, keywords, moreLink, keywordClick } = this.props;
    return (
      <ThemeHeaderRCMWrapper className='sprite_02'>
        <ThemeHeaderLeft>
          <h3 className='title'>{title}</h3>
          <ul className='keywords'>
            {keywords.map((item, index) => {
              return (
                <li
                  className='keyword-item'
                  key={item}
                  onClick={(index) => {
                    keywordClick(item);
                  }}
                >
                  {item}
                </li>
              );
            })}
          </ul>
        </ThemeHeaderLeft>
        <ThemeHeaderRight>
          <Link to={moreLink}>更多</Link>
          <i className='icon sprite_02'></i>
        </ThemeHeaderRight>
      </ThemeHeaderRCMWrapper>
    );
  }
}

ThemeHeaderRCM.defaultProps = {
  keywords: [],
};

ThemeHeaderRCM.propTypes = {
  title: PropTypes.string.isRequired,
  keywords: PropTypes.array,
};

export default ThemeHeaderRCM;
