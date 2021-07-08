import 'package:cgsapp/framework/widgets/toast/toast_widget.dart';
import 'package:cgsapp/pages/cheguansuo/buiness/models/business_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HandleTypeWidget extends StatefulWidget {
  HandleTypeWidget({Key key, this.list, this.businessModel}) : super(key: key);
  final List<BusinessHandleType> list;
  final BusinessModel businessModel;

  @override
  _HandleTypeWidgetState createState() => _HandleTypeWidgetState();
}

class _HandleTypeWidgetState extends State<HandleTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 44,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.list.length,
            itemBuilder: (BuildContext context, int index) {
              var handleType = widget.list[index];
              return Container(
                height: 44,
                width: 150,
                child: Listener(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        (index ==
                                widget.businessModel
                                    ?.defaultSelectHandleTypeIndex)
                            ? 'images/${handleType.selectedIcon}'
                            : 'images/${handleType.defaultIcon}',
                        width: 24,
                        height: 24,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          '${handleType.name}',
                          style: TextStyle(
                              fontSize: 14,
                              height: 1.5,
                              color: (index ==
                                      widget.businessModel
                                          ?.defaultSelectHandleTypeIndex)
                                  ? Color(0xFF4D68F0)
                                  : Color(0xFF5C5C6B)),
                        ),
                      )
                    ],
                  ),
                  onPointerDown: (event) {
                    if (widget.businessModel.businessId == -1) {
                      ToastWidget.show(msg: '请先选择需要办理的业务');
                    } else {
                      setState(() {
                        widget.businessModel.defaultSelectHandleTypeIndex =
                            index;
                      });
                    }
                  },
                ),
              );
            }));
  }
}
