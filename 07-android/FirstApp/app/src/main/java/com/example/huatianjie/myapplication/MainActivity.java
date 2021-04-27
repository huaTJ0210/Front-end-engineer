package com.example.huatianjie.myapplication;

import android.Manifest;
import android.annotation.SuppressLint;
import android.content.Intent;
import android.net.Uri;
import android.support.annotation.NonNull;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.widget.Button;
import android.widget.RemoteViews;
import android.widget.Toast;

import java.util.UUID;

import permissions.dispatcher.NeedsPermission;
import permissions.dispatcher.OnNeverAskAgain;
import permissions.dispatcher.OnPermissionDenied;
import permissions.dispatcher.OnShowRationale;
import permissions.dispatcher.PermissionRequest;
import permissions.dispatcher.RuntimePermissions;

@RuntimePermissions
public class MainActivity extends AppCompatActivity {

    private static final String TAG = "MainActivity";

    private boolean isAllowPermissions = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Log.d(TAG, "onCreate: execute");

        Log.d(TAG, UUID.randomUUID().toString());

        Button button = (Button)findViewById(R.id.testBtn);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(MainActivity.this, "onClickTest", Toast.LENGTH_SHORT).show();
            }
        });

    }

    public void startFirstActivity(View v){
        Intent intent = new Intent(MainActivity.this,FruitListViewActivity.class);
//        intent.putExtra("key","123");// 使用intent向另外一个界面传递参数
////        startActivity(intent);

        Log.d(TAG, UUID.randomUUID().toString());

    }

    @NeedsPermission(Manifest.permission.CALL_PHONE)
    void callPhone(){
        isAllowPermissions = true;

        Intent intent = new Intent(Intent.ACTION_CALL);
        Uri data = Uri.parse("tel:10086");
        intent.setData(data);
        startActivity(intent);
    }
    @OnShowRationale(Manifest.permission.CALL_PHONE)
    void showWhy(final PermissionRequest request){

    }
    @OnPermissionDenied(Manifest.permission.CALL_PHONE)
    void showDenied(){
        Toast.makeText(this, "无法使用权限", Toast.LENGTH_SHORT).show();
    }
    @OnNeverAskAgain(Manifest.permission.CALL_PHONE)
    void showNerverAskAgain(){

    }

    /*
    *  权限的回调
    * */

    @SuppressLint("NeedOnRequestPermissionsResult")
    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        MainActivityPermissionsDispatcher.onRequestPermissionsResult(MainActivity.this,requestCode,grantResults);
    }

    public void startActivity(View v) {
        // 显示使用Intent打开activity
//        Intent intent = new Intent(MainActivity.this,CameraPermissions.class);
//        startActivityForResult(intent,1);

//        // 需要打电话的权限
//        if (!isAllowPermissions){
//            MainActivityPermissionsDispatcher.callPhoneWithPermissionCheck(MainActivity.this);
//        } else {
//            callPhone();
//        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        switch(requestCode){
            case 1:
                if (resultCode == RESULT_OK){
                    String returnedData = data.getStringExtra("data_return");
                    Toast.makeText(this, returnedData, Toast.LENGTH_SHORT).show();
                }
                break;
            default:
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.main,menu);
        return true;
    }
}
