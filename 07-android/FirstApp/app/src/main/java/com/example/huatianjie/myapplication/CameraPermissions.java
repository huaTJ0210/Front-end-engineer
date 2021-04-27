package com.example.huatianjie.myapplication;

import android.Manifest;
import android.support.annotation.NonNull;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

import permissions.dispatcher.NeedsPermission;
import permissions.dispatcher.OnNeverAskAgain;
import permissions.dispatcher.OnPermissionDenied;
import permissions.dispatcher.OnShowRationale;
import permissions.dispatcher.PermissionRequest;
import permissions.dispatcher.RuntimePermissions;

// 在获取相机的类中添加注解
@RuntimePermissions
public class CameraPermissions extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_camera_permissions);
    }

    // 打开相机获取权限
    public void openCameraAction(View view){
      CameraPermissionsPermissionsDispatcher.openCameraWithPermissionCheck(CameraPermissions.this,view);
    }

    // 需要获取授权的方法
    @NeedsPermission({Manifest.permission.CAMERA,Manifest.permission.WRITE_EXTERNAL_STORAGE,Manifest.permission.READ_EXTERNAL_STORAGE, Manifest.permission.RECORD_AUDIO})
     void  openCamera(View view){
        Toast.makeText(this, "open camera", Toast.LENGTH_SHORT).show();
    }

    // 向用户说明为什么需要这些授权
    @OnShowRationale({Manifest.permission.CAMERA,Manifest.permission.WRITE_EXTERNAL_STORAGE,Manifest.permission.READ_EXTERNAL_STORAGE, Manifest.permission.RECORD_AUDIO})
    void showRationale(final PermissionRequest request){

    }

    // 用户拒绝授权的回调
    @OnPermissionDenied({Manifest.permission.CAMERA,Manifest.permission.WRITE_EXTERNAL_STORAGE,Manifest.permission.READ_EXTERNAL_STORAGE, Manifest.permission.RECORD_AUDIO})
    void showDenied(){

    }

    // 用户勾选了不要再提醒
    @OnNeverAskAgain({Manifest.permission.CAMERA,Manifest.permission.WRITE_EXTERNAL_STORAGE,Manifest.permission.READ_EXTERNAL_STORAGE, Manifest.permission.RECORD_AUDIO})
    void showNerverAskForCamera(){

    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        CameraPermissionsPermissionsDispatcher.onRequestPermissionsResult(this,requestCode,grantResults);
    }
}
