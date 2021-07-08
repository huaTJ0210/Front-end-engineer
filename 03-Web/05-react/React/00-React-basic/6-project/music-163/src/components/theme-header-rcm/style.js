import styled from 'styled-components';

export const ThemeHeaderRCMWrapper = styled.div`
  display: flex;
  justify-content: space-between;
  height: 35px;
  border-bottom: 2px solid #c10d0c;
  padding: 0 10px 4px 34px;
  background-position: -225px -156px;
`;

export const ThemeHeaderLeft = styled.div`
  display: flex;
  align-items: center;

  .title {
    font-size: 20px;
    font-family: 'Microsoft Yahei', Arial, Helvetica, sans-serif;
  }

  .keywords {
    display: flex;
    align-items: center;
    margin-left: 20px;
  }

  .keyword-item {
    padding-right: 20px;
  }

  .keyword-item::after {
    content: '|';
    margin-left: 20px;
    font-size: 12px;
    color: #ccc;
  }
`;

export const ThemeHeaderRight = styled.div`
  display: flex;
  align-items: center;
  .icon {
    display: inline-block;
    width: 12px;
    height: 12px;
    margin-left: 4px;
    background-position: 0 -240px;
  }
`;
