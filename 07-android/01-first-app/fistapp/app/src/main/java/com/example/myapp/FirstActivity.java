package com.example.myapp;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;

public class FirstActivity extends AppCompatActivity {

    private static final String TAG = "FirstActivity";

    // （0）启动活动的最佳实践:【清晰明了的解决启动FirstActivity】
    public static  void actionStart(Context context,String data1,String data2){
        Intent intent = new Intent(context,FirstActivity.class);
        intent.putExtra("param1",data1);
        intent.putExtra("param2",data2);
        context.startActivity(intent);
    }


    // (1) 活动第一次创建时调用：加载布局、绑定事件
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_first);
        Intent intent = getIntent();
        String data = intent.getStringExtra("data");
        Log.d(TAG, data);

        Button button2 = (Button)findViewById(R.id.firstActivity_button);
        button2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent();
                intent.putExtra("data_return","data from firstActivity");
                setResult(RESULT_OK,intent);
                finish();
            }
        });
    }

    // (2)活动由不可见变为可见
    @Override
    protected void onStart() {
        super.onStart();
        Log.d(TAG, "onStart: ----------");
    }
    // (3)该方法表示活动可以与用户进行交互，并且位于导航栈的顶端
    @Override
    protected void onResume() {
        super.onResume();
        Log.d(TAG, "onResume: --------");
    }
    // (4) 该方法在系统准备启动或者恢复另外一个活动时调用
    @Override
    protected void onPause() {
        super.onPause();
        Log.d(TAG, "onPause: ---------");
    }
    //(5) 该方法在活动完全不可见的时候调用
    @Override
    protected void onStop() {
        super.onStop();
        Log.d(TAG, "onStop: -------");
    }
    //(6) 活动被销毁前调用
    @Override
    protected void onDestroy() {
        super.onDestroy();
        Log.d(TAG, "onDestroy: -----");
    }
   // (7) 活动由停止状态变为运行状态时调用
    @Override
    protected void onRestart() {
        super.onRestart();
        Log.d(TAG, "onRestart: -----");
    }
    // (8) 监听回退案件
    @Override
    public void onBackPressed() {
        super.onBackPressed();
        // 重写onBackPressed 防止用户按下Back键回到FirstActivity
        Intent intent = new Intent();
        intent.putExtra("data_return","data from firstActivity");
        setResult(RESULT_OK,intent);
        finish();
    }
    /*
    *   (9) 活动的启动模式
    *   1： standard : 标准模式，创建活动就会在导航栈中添加新创建的活动（不会判断是否之前已存在）
    *   2： singleTop: 类似标准模式，但是在创建活动的时候会判断栈顶活动和当前活动是否一样，不一样就创建新的活动
    *   3： singleTask: 能够解决在导航栈中重复创建活动的问题；A->B->C->D->A :结果导航栈中就只有A一个活动
    *   4： singleInstance:
     * */
}