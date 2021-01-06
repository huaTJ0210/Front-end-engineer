/*
  ipv4地址:4个0~255的十进制数组通过“.”链接而成的
  192.16.0.21
  不合法的情况：十进制数除0外，首位不能出现0
  192.16.0.021 [不合法] 
*/

const isIPV4 = ipString=> { 
  const ipNodes = ipString.split('.');
  if (ipNodes.length !== 4) { 
    return false;
  }
  for (let i = 0; i < ipNodes.length; i++) {
    // 先转换为字符串然后再比较是否相等 可以过滤掉 1e1 00这种情况
    if (ipNodes[i] !== parseInt(ipNodes[i], 10).toString()) {
      return false;
    }
    // 判断是都在 0~255之间
    if (+ipNodes[i] < 0 || +ipNodes[i] > 255) { 
      return false;
    }
  }
  return true;
}

/*
  ipv6地址：8组16进制的数字来表示；
  每组16个比特，长度为4，使用“:”进行连接，
  每组的组成可以是0~9、a~f,A~F组成
*/
const isIPV6 = ipString => {
  const ipNodes = ipString.split(':');
  if (ipNodes.length !== 8) { 
    return false;
  }
  for (let i = 0; i < ipNodes.length; i++) { 
    if (ipNodes[i].length > 4 || ipNodes[i].length < 0) { 
      return false
    }
    for (const c of ipNodes[i]) { 
      // 获取每个字符对应的数字编码
      let value = c.charCodeAt(0);
      // 97-102 a-f
      // 65-70 A-F
      // 48-57 0-9
      if (isNaN(value) || !(
          value > 96 && value < 103 || 
          value > 64 && value < 71 || 
          value > 47 && value < 58)
      ) {
          return false;
      }
    }
  }
  return true;
}