import java.util.Stack;

public class SolutionOne {
    public boolean isValid(String s) {
        if (s.length()==0){
            return true;
        }
        // 1 将字符串拆分为字符数组
        String[] strings = s.split("");
        // 2 创建栈结构存储左侧括号
        Stack stack = new Stack();
        // 3 遍历字符串数组
        for (int i = 0 ;i<strings.length;i++){
            String c = strings[i];
            if (c.equals("(")||c.equals("[")||c.equals("{")){
                stack.push(c);
            }else{
                if (stack.isEmpty()){
                    return false;
                }
                String topChar = (String) stack.pop();
                if (c.equals(")")){
                    if (!topChar.equals("(")){
                        return false;
                    }
                } else if (c.equals("]")){
                    if (!topChar.equals("[")){
                        return false;
                    }
                } else if (c.equals("}")){
                    if (!topChar.equals("{")){
                        return false;
                    }
                }

            }
        }
        return stack.isEmpty();
    }

    public boolean isValidOne(String s){
        Stack<Character> stack = new Stack<>();
        for (int i = 0;i < s.length();i++){
            char c = s.charAt(i);
            if (c == '('|| c == '[' || c =='{'){
                stack.push(c);
            }else{
                if (stack.isEmpty()){
                    return false;
                }else{
                    char topChar = stack.pop();
                    if (c==')' && topChar!='('){
                        return false;
                    }
                    if (c==']' && topChar!='['){
                        return false;
                    }
                    if (c=='}' && topChar!='{'){
                        return false;
                    }
                }
            }
        }
        return stack.isEmpty();
    }

}
