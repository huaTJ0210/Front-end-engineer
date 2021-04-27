package com.hz.androiddemo;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;

import io.flutter.facade.Flutter;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        View FlutterView = Flutter.createView(this,getLifecycle(),"defaultRoute");
        
        setContentView(FlutterView);
    }
}
