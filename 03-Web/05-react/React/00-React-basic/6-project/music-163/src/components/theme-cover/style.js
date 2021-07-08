import styled from 'styled-components';

export const ThemeCoverWrapper = styled.div`
  display: flex;
  flex-direction: column;
  margin-top: 15px;

  .cover-top {
    position: relative;
    width: 140px;
    height: 140px;
    background-color: pink;
    background-image: url(${(props) => props.bgImage});

    .overlay {
      display: flex;
      justify-content: space-between;
      align-items: center;
      position: absolute;
      left: 0;
      right: 0;
      bottom: 0;
      height: 30px;
      background-color: rgba(0, 0, 0, 0.7);
      padding: 0 10px;
      color: #cccccc;

      .erji {
        margin-right: 10px;
        display: inline-block;
        width: 14px;
        height: 11px;
        background-position: 0 -24px;
      }

      .play {
        display: inline-block;
        width: 16px;
        height: 17px;
        background-position: 0 0;
      }
    }
  }

  .cover-bottom {
    height: 38px;
    width: 140px;
    color: #000;
    font-size: 14px;
  }
  .cover-bottom:hover {
    text-decoration: underline;
  }
`;
