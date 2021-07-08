import 'package:cgsapp/framework/widgets/toast/toast_widget.dart';

import 'package:cgsapp/pages/cheguansuo/buiness/business_handle_instruction_page.dart';
import 'package:cgsapp/pages/cheguansuo/buiness/models/business_model.dart';
import 'package:flutter/material.dart';

import 'business_handle_type_widget.dart';

class BusinessWidget extends StatelessWidget {
  const BusinessWidget({Key key, this.model, this.selectedBusinessAction})
      : super(key: key);
  final BusinessModel model;
  final Function selectedBusinessAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 120,
          margin: EdgeInsets.only(left: 16, right: 16),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.grey[200]))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 0, top: 20, bottom: 24),
                  child: Text('车管业务',
                      style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF5C5C6B),
                          height: 1.5))),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      width: 230,
                      child: Listener(
                        onPointerDown: (event) async {
                          var businessModel = await Navigator.pushNamed(
                              context, 'businessListPage');
                          // 将选择的数据返回给首页
                          selectedBusinessAction(businessModel);
                        },
                        child: Text('${model.businessName}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF12123E),
                                height: 1.4,
                                fontWeight: FontWeight.w700)),
                      ),
                      padding: EdgeInsets.only(right: 0),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 22),
                      child: Icon(Icons.chevron_right_sharp)),
                  Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Text('|',
                          style: TextStyle(
                              color: Color.fromARGB(92, 92, 107, 1),
                              fontSize: 12))),
                  Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: Listener(
                      onPointerDown: (event) {
                        if (model.businessId != -1) {
                          Navigator.pushNamed(context, 'businessDetailPage');
                        } else {
                          // 此时未选择具体业务，无法查看详情
                          ToastWidget.show(msg: '请先选择需要办理的业务');
                        }
                      },
                      child: Text('详情',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF5C5C6B), fontSize: 12)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 120,
          margin: EdgeInsets.only(left: 16, right: 16),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.grey[200]))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 0, top: 20, bottom: 20),
                  child: Text(
                    '办理方式',
                    style: TextStyle(
                        fontSize: 13, color: Color(0xFF5C5C6B), height: 1.5),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: HandleTypeWidget(
                  list: model.handleTypeList,
                  businessModel: model,
                ),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 20, left: 16, right: 16),
          width: double.infinity,
          child: RaisedButton(
            padding: EdgeInsets.only(top: 14, bottom: 14),
            color: Color(0xFF1F73FF),
            onPressed: () {
              if (model.businessId != -1 &&
                  model.defaultSelectHandleTypeIndex != -1) {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return HandleInstructionsPage(model: model);
                  },
                ));
              } else {
                if (model.businessId == -1) {
                  ToastWidget.show(msg: '请先选择需要办理的业务');
                } else if (model.defaultSelectHandleTypeIndex == -1) {
                  ToastWidget.show(msg: '请先选择办理方式');
                }
              }
            },
            child: Text('下一步',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 15,
                    fontWeight: FontWeight.w700)),
          ),
        )
      ],
    );
  }
}
