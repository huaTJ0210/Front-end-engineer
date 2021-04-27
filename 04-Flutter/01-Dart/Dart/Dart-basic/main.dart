

void printInfo(){
  print("hello dart!");
}

void enableFlag({bool blod,bool hidden}) => print('$blod,$hidden');

void enableFlag1(bool blod,[bool hidden]) => print('$blod,$hidden');

void main(List<String> args) {
  enableFlag(blod: true,hidden: false);

  enableFlag1(true,false);
}