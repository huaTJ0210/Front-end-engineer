import 'dart:mirrors';

/*
  使用元数据可以为代码增加一些额外的信息；
  Dart提供类似Java注解一样的机制Metadata，通过Metadata可以实现与注解一样的功能
  1）如何使用反射（reflection）获取metadata
  dart引入了mirrors：

  2）需要理解注解的作用，为什么要使用注解
*/

main(List<String> args) {
  getWorkAnnotation();
}

void getWorkAnnotation() {
  ClassMirror classMirror = reflectClass(TestMixin);

  // 获取 class 上的元数据
  classMirror.metadata.forEach((metadata) {
    print(metadata.reflectee.who + ' ==> ' + metadata.reflectee.what);
  });

  // 获取 field 和 method 上的元数据
  classMirror.declarations.forEach((Symbol key, DeclarationMirror value) {
    if (value is MethodMirror) {
      if (value.simpleName == #getRequest) {
        value.metadata.forEach((metadata) {
          if (metadata.reflectee is Todo) {
            print(metadata.reflectee.who + ' ==> ' + metadata.reflectee.what);
          } else if (metadata.reflectee is TestAnnotation) {
            print(metadata.reflectee.id.toString() +
                ' ==> ' +
                (metadata.reflectee.name == null
                    ? 'null'
                    : metadata.reflectee.name));
          } else if (metadata.reflectee is GET) {
            print(metadata.reflectee.value);
          }
        });

        // 获取方法中参数上的元数据
        value.parameters.forEach((param) {
          param.metadata.forEach((metadata) {
            // if (metadata.reflectee is Query) {
            //   if (metadata.reflectee.value == null) {
            //     print(
            //         'args name ==> ' + MirrorSystem.getName(param.simpleName));
            //   } else {
            //     print(metadata.reflectee.value);
            //   }
            // }
          });
        });
      }
    }
  });
}

class TestAnnotation {
}

@Todo('wyndam', 'work')
abstract class TestMixin {
  // @GET(value: 'https://www.baidu.com/')
  // void getRequest(@Query(value: 'q') String param);
}

class GET {
  final String value;

  const GET({this.value});
}

class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);
}
