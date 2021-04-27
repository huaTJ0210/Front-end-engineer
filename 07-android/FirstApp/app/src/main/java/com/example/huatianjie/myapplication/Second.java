
package com.example.huatianjie.myapplication;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.Toast;

public class Second extends AppCompatActivity {

    private EditText editText;
    private ImageView imageView;
    private ProgressBar progressBar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_second);

        // 从上一个控制器获取值
        Intent intent = getIntent();
        String data =  intent.getStringExtra("data");
        Toast.makeText(this, data, Toast.LENGTH_SHORT).show();

        // 为按钮添加点击事件 :匿名类方式注册监听器
        Button button = (Button) findViewById(R.id.second_button);
        editText = (EditText) findViewById(R.id.second_editText);
        imageView = (ImageView) findViewById(R.id.second_image);
        progressBar = (ProgressBar)findViewById(R.id.progress_bar);

        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String text = editText.getText().toString().trim();
                imageView.setImageResource(R.drawable.image2);// 给图片更换显示图片

                if (progressBar.getVisibility() == View.GONE){
                    progressBar.setVisibility(View.VISIBLE);
                }else{
                    progressBar.setVisibility(View.GONE);
                }

                Toast.makeText(Second.this, "button onClick", Toast.LENGTH_SHORT).show();
            }
        });

        // 设置控件是否显示  visibility : visible invisible gone
    }

    private void openFirstActivity(){
        Intent intent = new Intent(Second.this,FirstActivity.class);
        intent.putExtra("data","");
        startActivity(intent);
    }


    // 监听回退按钮的事件
    @Override
    public void onBackPressed() {
        super.onBackPressed();
    }
}
