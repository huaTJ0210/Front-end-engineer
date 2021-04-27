package com.example.myapp;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

public class MainActivity extends BaseActivity {

    private static final String TAG = "MainActivity";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // 获取活动被系统回收前的数据
        if (savedInstanceState != null){
            String data = savedInstanceState.getString("data_key");
            Log.d(TAG, "onCreate: "+ data);
        }

        setContentView(R.layout.activity_main);
        Log.d("data", "onCreate: (1)");
//        Log.i(TAG, "onCreate: ");

        Button button1 = (Button)findViewById(R.id.first_button);
        button1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // (1) 使用Toast进行提示
//                Toast.makeText(MainActivity.this,"you click Button",Toast.LENGTH_SHORT).show();
                // (2) 显示的Intent进行提示
                Intent intent = new Intent(MainActivity.this,FirstActivity.class);
                intent.putExtra("data","data from mainActivity");
//                startActivity(intent);
                startActivityForResult(intent,100);

            }
        });

        // (1) 打开基本UI活动
        Button buttonUI = (Button)findViewById(R.id.second_button);
        buttonUI.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this,UIWidgetActivity.class);
                startActivity(intent);
            }
        });

        // (2) 打开recyclerView
        Button buttonRecycler = (Button)findViewById(R.id.third_button);
        buttonRecycler.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this,RecyclerViewActivity.class);
                startActivity(intent);
            }
        });

        // (3) 打开recyclerView
        Button horizontalRecycler = (Button)findViewById(R.id.fourth_button);
        horizontalRecycler.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this,CarListActivity.class);
                startActivity(intent);
            }
        });

        // (4) 消息列表
        Button messageList = (Button)findViewById(R.id.msg_button);
        messageList.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this,MessageListActivity.class);
                startActivity(intent);
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


    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        switch(requestCode){
            case 100:
                if (resultCode == RESULT_OK){
                    String returnedData = data.getStringExtra("data_return");
                    Log.d(TAG, "onActivityResult: " + returnedData);
                }
        }
    }

    // （8） 活动被系统清理的时候，用于保存临时数据
    @Override
    protected void onSaveInstanceState(@NonNull Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putString("data_key","history data");
    }
}