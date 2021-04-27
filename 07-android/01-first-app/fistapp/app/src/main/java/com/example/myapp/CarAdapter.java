package com.example.myapp;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.List;

public class CarAdapter extends RecyclerView.Adapter<CarAdapter.ViewHold>{

    private List<Car> mCarList;

    static class ViewHold extends RecyclerView.ViewHolder{
        ImageView imageView;
        TextView textView;
        public ViewHold(@NonNull View itemView) {
            super(itemView);
            imageView = (ImageView)itemView.findViewById(R.id.car_image_view);
            textView = (TextView)itemView.findViewById(R.id.car_text_view);
        }
    }

    public CarAdapter(List<Car> list){
        this.mCarList = list;
    }

    @NonNull
    @Override
    public ViewHold onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.car_layout,parent,false);
        ViewHold viewHold = new ViewHold(view);
        return viewHold;
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHold holder, int position) {
        Car car = mCarList.get(position);
        holder.imageView.setImageResource(car.getImageId());
        holder.textView.setText(car.getName());
    }


    @Override
    public int getItemCount() {
        return mCarList.size();
    }
}
