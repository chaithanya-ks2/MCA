package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.view.ViewCompat;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;

public class MainActivity2 extends AppCompatActivity {
    TextView t2;
    CheckBox c1, c2, c3;
    RadioGroup rg1;
    RadioButton r1, r2, r3;
    Button b1;
    String subject[]=new String[3];
    String gender;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);

        t2=(TextView) findViewById(R.id.textView6);

        c1=(CheckBox) findViewById(R.id.checkBox);
        c2=(CheckBox) findViewById(R.id.checkBox2);
        c3=(CheckBox) findViewById(R.id.checkBox3);

        rg1=(RadioGroup) findViewById(R.id.radioGroup);

        r1=(RadioButton) findViewById(R.id.radioButton);
        r2=(RadioButton) findViewById(R.id.radioButton2);
        r3=(RadioButton) findViewById(R.id.radioButton3);

        b1=(Button) findViewById(R.id.button2);

        Intent i = getIntent();
        String var=i.getStringExtra("user");

        t2.setText("Hai "+var);

        if(c1.isChecked()) {
            subject[0]=c1.getText().toString();
        } if(c2.isChecked()) {
            subject[1]=c2.getText().toString();
        } if(c3.isChecked()) {
            subject[2]=c3.getText().toString();
        }

        rg1.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(RadioGroup radioGroup, int checkedId) {
                if (checkedId==R.id.radioButton) {
                    gender=r1.getText().toString();
                } else {
                    gender=r2.getText().toString();
                }
            }
        });

        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                // Collect selected subjects here
                ArrayList<String> selectedSubjects = new ArrayList<>();
                if (c1.isChecked()) selectedSubjects.add(c1.getText().toString());
                if (c2.isChecked()) selectedSubjects.add(c2.getText().toString());
                if (c3.isChecked()) selectedSubjects.add(c3.getText().toString());

                // Collect selected gender
                int selectedId = rg1.getCheckedRadioButtonId();
                String gender = "";
                if (selectedId != -1) {
                    RadioButton selectedRadio = findViewById(selectedId);
                    gender = selectedRadio.getText().toString();
                }

                if (selectedSubjects.size() == 0) {
                    Toast.makeText(MainActivity2.this, "Please select at least one subject", Toast.LENGTH_SHORT).show();
                    return; // Don't proceed if no subjects selected
                }

                if (gender.isEmpty()) {
                    Toast.makeText(MainActivity2.this, "Please select your gender", Toast.LENGTH_SHORT).show();
                    return; // Don't proceed if gender not selected
                }

                Toast.makeText(MainActivity2.this, "Submitted", Toast.LENGTH_SHORT).show();

                Intent i = new Intent(MainActivity2.this, MainActivity3.class);
                i.putExtra("gender", gender);
                i.putStringArrayListExtra("subjects", selectedSubjects);
                startActivity(i);
            }
        });

    }
}
