package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.view.ViewCompat;

import android.content.Intent;
import android.os.Bundle;
import android.widget.TextView;

import java.util.ArrayList;

public class MainActivity3 extends AppCompatActivity {
    TextView lang, gend;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main3);

        lang = findViewById(R.id.textView8);
        gend = findViewById(R.id.textView9);

        Intent i2 = getIntent();

        String gender = i2.getStringExtra("gender");
        ArrayList<String> subjects = i2.getStringArrayListExtra("subjects");

        // Join subjects array into a comma separated string
        String subjectsStr = "";
        if (subjects != null && !subjects.isEmpty()) {
            subjectsStr = android.text.TextUtils.join("\n", subjects);
        }

        lang.setText(subjectsStr);
        gend.setText(gender);
    }
}