package com.example.huatianjie.myapplication;

import android.content.Context;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

public class FirstActivity extends AppCompatActivity {

    private static final String TAG = "FirstActivity";
    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.first_layout);

        // 从保存的状态中获取数据
        if (savedInstanceState!=null){
            String tempData = savedInstanceState.getString("data_key");
            Log.d(TAG, "onCreate: " + tempData);
        }

        Button btn1 = (Button)findViewById(R.id.button_1);
        btn1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent();
                intent.putExtra("data_return","data from first activity");
                setResult(RESULT_OK,intent);
                finish();
            }
        });

        // 获取上一个界面的传值
        Intent intent = getIntent();
        String data = intent.getStringExtra("key");
        Toast.makeText(this, data, Toast.LENGTH_SHORT).show();

        // 获取res/values/strings.xml
//        String app_name = R.string.app_name;
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        // 这个方法在活动被销毁之前调用，之后活动的状态变为销毁状态
    }


    @Override
    protected void onStart() {
        super.onStart();
        // 这个活动由不可见变成可见
    }

    @Override
    protected void onStop() {
        super.onStop();
        // 这个方法在活动完全不可见的情况下调用（如果是对话框--则调用onPause()）
    }



    @Override
    protected void onResume() {
        super.onResume();
        // 这个方法在活动准备好与用户进行交互时调用，此时活动一定位于返回栈的顶部，并且处于运行状态
    }

    @Override
    protected void onPause() {
        super.onPause();
        // 这个方法在系统准备去启动或者恢复另一个活动的时候调用【将消耗CPU的资源释放掉，保存一些关键数据】
    }



    @Override
    protected void onRestart() {
        super.onRestart();
        // 活动由停止状态变为运行状态之前调用，活动被重新启动
    }


    // 监听back按钮的事件
    @Override
    public void onBackPressed() {
        super.onBackPressed();
        Intent intent = new Intent();
        intent.putExtra("data_return","data from first activity");
        setResult(RESULT_OK,intent);
        finish();
    }


    // 如果activity被回收，那么活动中的一些数据要保存下来

    @Override
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        String tempData = "Something you just typed";
        outState.putString("data_key",tempData);
    }


    // 启动FirstActivity的方法 [便于]
    public static void onStartFirstActivity(Context context,String data1,String data2){
        Intent intent = new Intent(context,FirstActivity.class);
        intent.putExtra("param1",data1);
        intent.putExtra("param2",data2);
        context.startActivity(intent);
    }

    public void backToMainActivity(){
        /*
        *  如果intent对象包含FLAG_ACTIVITY_CLEAR_TOP 标记，
        *  当目标task中已存在与接收该intent对象的 activity类型相同的activity实例存在时，
        *  所有位于该activity对象上面的activity将被清空，这样接收该intent的 activity就位于栈顶，
        *  可以响应到来的intent对象。
        *  如果目标activity的运行模式为standard（默认），则目标activtiy也会被清空。
        *  因为当运行模式为standard时，总会创建新的activity对象来接收到来的intent对象
        * */
        Intent intent = new Intent(FirstActivity.this,MainActivity.class);
        intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
        startActivity(intent);

    }
}
