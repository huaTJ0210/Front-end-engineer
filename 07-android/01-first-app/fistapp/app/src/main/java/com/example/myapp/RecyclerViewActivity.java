package com.example.myapp;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;

import java.util.ArrayList;
import java.util.List;

public class RecyclerViewActivity extends AppCompatActivity {

    private List<Fruit> fruitList = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_recycler_view);
        initFruit();
        RecyclerView recyclerView = (RecyclerView)findViewById(R.id.recycle_view);
        LinearLayoutManager linearLayoutManager = new LinearLayoutManager(this);
        recyclerView.setLayoutManager(linearLayoutManager);
        FruitAdapter fruitAdapter = new FruitAdapter(fruitList);
        recyclerView.setAdapter(fruitAdapter);
    }

    private void initFruit(){
        for (int i = 0; i < 5; i++){
            Fruit apple = new Fruit("apple",R.drawable.image1);
            fruitList.add(apple);
            Fruit banana = new Fruit("banana",R.drawable.image2);
            fruitList.add(banana);
            Fruit orange = new Fruit("orange",R.drawable.image1);
            fruitList.add(orange);
            Fruit pear = new Fruit("pear",R.drawable.image2);
            fruitList.add(pear);
        }
    }
}