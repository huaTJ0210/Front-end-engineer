package com.example.huatianjie.myapplication;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

public class FruitListViewActivity extends AppCompatActivity {

    private List<Fruit> fruitList = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_fruit_list_view);

        initFruits();
        FruitAdapter adapter = new FruitAdapter(FruitListViewActivity.this,R.layout.fruit_item,fruitList);
        ListView listView = (ListView)findViewById(R.id.fruit_listView);
        listView.setAdapter(adapter);
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Fruit fruit = fruitList.get(position);
                Toast.makeText(FruitListViewActivity.this, fruit.getName(), Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void initFruits(){
        for(int i = 0; i < 5;i++){
            Fruit apple = new Fruit("Apple",R.drawable.fruit);
            fruitList.add(apple);
            Fruit banana = new Fruit("Banana",R.drawable.fruit);
            fruitList.add(banana);
            Fruit orange = new Fruit("Orange",R.drawable.fruit);
            fruitList.add(orange);
            Fruit watermelon = new Fruit("Watermelon",R.drawable.fruit);
            fruitList.add(watermelon);
        }
    }
}
