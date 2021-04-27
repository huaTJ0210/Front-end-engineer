package com.example.myapp;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;

import java.util.ArrayList;
import java.util.List;

public class CarListActivity extends AppCompatActivity {

    private List<Car> carList = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_car_list);
        initCarList();
        RecyclerView recyclerView  = (RecyclerView)findViewById(R.id.car_recycler_view);
        LinearLayoutManager linearLayoutManager = new LinearLayoutManager(this);
        linearLayoutManager.setOrientation(LinearLayoutManager.HORIZONTAL);
        recyclerView.setLayoutManager(linearLayoutManager);
        CarAdapter carAdapter = new CarAdapter(carList);
        recyclerView.setAdapter(carAdapter);

    }

    private void initCarList(){
        for(int i = 0; i < 5;i++){
            Car car1 = new Car("car1",R.drawable.image1);
            carList.add(car1);
            Car car2 = new Car("car2",R.drawable.image2);
            carList.add(car2);
            Car car3 = new Car("car3",R.drawable.image1);
            carList.add(car3);
            Car car4 = new Car("car4",R.drawable.image2);
            carList.add(car4);
        }
    }
}