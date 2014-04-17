/**
 *  @version 1.1 (28.01.2013)
 *  http://english.cxem.net/arduino/arduino5.php
 *  @author Koltykov A.V. (Колтыков А.В.)
 * 
 */

package com.example.bluetooth2;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Comparator;
import java.util.UUID;
import java.util.concurrent.TimeUnit;
 
import com.example.bluetooth2.R;
import com.example.bluetooth2.R.layout;
 
import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;
 
public class MainActivity extends Activity {
  private static final String TAG = "bluetooth2";
   
  Button btnOn, btnOff,btnSend;
  SeekBar seek1,seek2,seek3,seek4,seek5,seek6,seek7,seek8,seek9,seek10,seek11,seek12,seek13;
  TextView txtArduino,text1, text2,text3,text4,text5,text6,text7,text8,text9,text10,text11,text12,text1_1;
  Handler h;
  
  final int RECIEVE_MESSAGE = 1;		// Status  for Handler
  private BluetoothAdapter btAdapter = null;
  private BluetoothSocket btSocket = null;
  private StringBuilder sb = new StringBuilder();
  
  private ConnectedThread mConnectedThread;
   
  // SPP UUID service
  private static final UUID MY_UUID = UUID.fromString("00001101-0000-1000-8000-00805F9B34FB");
 
  // MAC-address of Bluetooth module (you must edit this line)
  private static String address = "00:14:01:24:15:34";
   
  /** Called when the activity is first created. */
  @Override
  public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    
    
    
    setContentView(R.layout.activity_main);
    SeekBar seek1 = (SeekBar)findViewById(R.id.seekBar1);
    seek1.setProgress(0);
    //seek1.incrementProgressBy(1);
    seek1.setMax(10);
    
    
    SeekBar seek2 = (SeekBar)findViewById(R.id.seekBar2);
    seek2.setProgress(0);
    //seek2.incrementProgressBy(1);
    seek2.setMax(10);
    
    SeekBar seek3 = (SeekBar)findViewById(R.id.seekBar3);
    seek3.setProgress(0);
   // seek3.incrementProgressBy(1);
    seek3.setMax(10);
    
    SeekBar seek4 = (SeekBar)findViewById(R.id.seekBar4);
    seek4.setProgress(0);
    //seek4.incrementProgressBy(1);
    seek4.setMax(10);
    
    SeekBar seek5 = (SeekBar)findViewById(R.id.seekBar5);
    seek5.setProgress(0);
    //seek5.incrementProgressBy(1);
    seek5.setMax(10);
    
    SeekBar seek6 = (SeekBar)findViewById(R.id.seekBar6);
    seek6.setProgress(0);
    //seek6.incrementProgressBy(1);
    seek6.setMax(10);
    
    SeekBar seek7 = (SeekBar)findViewById(R.id.seekBar7);
    seek7.setProgress(0);
   // seek7.incrementProgressBy(1);
    seek7.setMax(10);
    
    SeekBar seek8 = (SeekBar)findViewById(R.id.seekBar8);
    seek8.setProgress(0);
   // seek8.incrementProgressBy(1);
    seek8.setMax(10);
    
    SeekBar seek9 = (SeekBar)findViewById(R.id.seekBar9);
    seek9.setProgress(0);
    //seek9.incrementProgressBy(1);
    seek9.setMax(10);
    
    SeekBar seek10 = (SeekBar)findViewById(R.id.seekBar10);
    seek10.setProgress(0);
   // seek10.incrementProgressBy(1);
    seek10.setMax(10);
    
    SeekBar seek11 = (SeekBar)findViewById(R.id.seekBar11);
    seek11.setProgress(0);
   // seek11.incrementProgressBy(1);
    seek11.setMax(10);
    
    SeekBar seek12 = (SeekBar)findViewById(R.id.seekBar12);
    seek12.setProgress(0);
    //seek12.incrementProgressBy(1);
    seek12.setMax(10);
    
    btnSend = (Button) findViewById(R.id.button1);
    
   // btnOn = (Button) findViewById(R.id.btnOn);					// button LED ON
   // btnOff = (Button) findViewById(R.id.btnOff);				// button LED OFF
   // txtArduino = (TextView) findViewById(R.id.txtArduino);		// for display the received data from the Arduino
    
    h = new Handler() {
    	public void handleMessage(android.os.Message msg) {
    		switch (msg.what) {
            case RECIEVE_MESSAGE:													// if receive massage
            	byte[] readBuf = (byte[]) msg.obj;
            	String strIncom = new String(readBuf, 0, msg.arg1);					// create string from bytes array
            	sb.append(strIncom);												// append string
            	int endOfLineIndex = sb.indexOf("\r\n");							// determine the end-of-line
            	if (endOfLineIndex > 0) { 											// if end-of-line,
            		String sbprint = sb.substring(0, endOfLineIndex);				// extract string
                    sb.delete(0, sb.length());										// and clear
                	txtArduino.setText("Data from Arduino: " + sbprint); 	        // update TextView
                	btnOff.setEnabled(true);
                	btnOn.setEnabled(true); 
                	
                	if (Integer.valueOf(sbprint) > 300)
                	{Intent i = new Intent(Intent.ACTION_SEND);
                	i.setType("message/rfc822");
                	i.putExtra(Intent.EXTRA_EMAIL  , new String[]{"ravithejay@yahoo.com"});
                	i.putExtra(Intent.EXTRA_SUBJECT, "Diagnostic test");
                	i.putExtra(Intent.EXTRA_TEXT   , "The vaulue on the LED was" + sbprint);
                	try {
                	    startActivity(Intent.createChooser(i, "Send mail..."));
                	} catch (android.content.ActivityNotFoundException ex) {
                	    Toast.makeText(MainActivity.this, "There are no email clients installed.", Toast.LENGTH_SHORT).show();
                	}}
                	
                }
            	//Log.d(TAG, "...String:"+ sb.toString() +  "Byte:" + msg.arg1 + "...");
            	break;
    		}
        };
	};
     
    btAdapter = BluetoothAdapter.getDefaultAdapter();		// get Bluetooth adapter
    checkBTState();
 
    seek1.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){

        public void onProgressChanged(SeekBar seek1, int progress, boolean fromUser) {
           // progress = progress / 10;
           // progress = progress * 10;
        	System.out.println(progress);

        	  TextView text1 = (TextView)findViewById(R.id.text1);
        	text1.setText(String.valueOf(progress)+"0%");   
        switch (progress){
        case 0: mConnectedThread.write("020"); break;
        case 1: mConnectedThread.write("021"); break;
        case 2: mConnectedThread.write("022"); break;
        case 3: mConnectedThread.write("023"); break;
        case 4: mConnectedThread.write("024"); break;
        case 5: mConnectedThread.write("025"); break;
        case 6: mConnectedThread.write("026"); break;
        case 7: mConnectedThread.write("027"); break;
        case 8: mConnectedThread.write("028"); break;
        case 9: mConnectedThread.write("029"); break;
        case 10: mConnectedThread.write("02o"); break;
        }
        	
        
        }

        public void onStartTrackingTouch(SeekBar seek1) {

        }

        public void onStopTrackingTouch(SeekBar seek1) {

        }
    });
    
    seek2.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){

        public void onProgressChanged(SeekBar seek2, int progress, boolean fromUser) {
           // progress = progress / 10;
           // progress = progress * 10;
        	 TextView text2 = (TextView)findViewById(R.id.text2);
         	text2.setText(String.valueOf(progress)+"0%"); 
        switch (progress){
        case 0: mConnectedThread.write("030"); break;
        case 1: mConnectedThread.write("031"); break;
        case 2: mConnectedThread.write("032"); break;
        case 3: mConnectedThread.write("033"); break;
        case 4: mConnectedThread.write("034"); break;
        case 5: mConnectedThread.write("035"); break;
        case 6: mConnectedThread.write("036"); break;
        case 7: mConnectedThread.write("037"); break;
        case 8: mConnectedThread.write("038"); break;
        case 9: mConnectedThread.write("039"); break;
        case 10: mConnectedThread.write("03o"); break;
        }
        	
        
        }

        public void onStartTrackingTouch(SeekBar seek2) {

        }

        public void onStopTrackingTouch(SeekBar seek2) {

        }
    });
    
    seek3.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){

        public void onProgressChanged(SeekBar seek3, int progress, boolean fromUser) {
           // progress = progress / 10;
           // progress = progress * 10;
        	 TextView text3 = (TextView)findViewById(R.id.text3);
         	text3.setText(String.valueOf(progress)+"0%");
        switch (progress){
        case 0: mConnectedThread.write("040"); break;
        case 1: mConnectedThread.write("041"); break;
        case 2: mConnectedThread.write("042"); break;
        case 3: mConnectedThread.write("043"); break;
        case 4: mConnectedThread.write("044"); break;
        case 5: mConnectedThread.write("045"); break;
        case 6: mConnectedThread.write("046"); break;
        case 7: mConnectedThread.write("047"); break;
        case 8: mConnectedThread.write("048"); break;
        case 9: mConnectedThread.write("049"); break;
        case 10: mConnectedThread.write("04o"); break;
        }
        	
        
        }

        public void onStartTrackingTouch(SeekBar seek3) {

        }

        public void onStopTrackingTouch(SeekBar seek3) {

        }
    });
    
    seek4.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){

        public void onProgressChanged(SeekBar seek4, int progress, boolean fromUser) {
           // progress = progress / 10;
           // progress = progress * 10;
        	 TextView text4 = (TextView)findViewById(R.id.text4);
         	text4.setText(String.valueOf(progress)+"0%");
        switch (progress){
        case 0: mConnectedThread.write("050"); break;
        case 1: mConnectedThread.write("051"); break;
        case 2: mConnectedThread.write("052"); break;
        case 3: mConnectedThread.write("053"); break;
        case 4: mConnectedThread.write("054"); break;
        case 5: mConnectedThread.write("055"); break;
        case 6: mConnectedThread.write("056"); break;
        case 7: mConnectedThread.write("057"); break;
        case 8: mConnectedThread.write("058"); break;
        case 9: mConnectedThread.write("059"); break;
        case 10: mConnectedThread.write("05o"); break;
        }
        	
        
        }

        public void onStartTrackingTouch(SeekBar seek4) {

        }

        public void onStopTrackingTouch(SeekBar seek4) {

        }
    });
    
    seek5.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){

        public void onProgressChanged(SeekBar seek1, int progress, boolean fromUser) {
           // progress = progress / 10;
           // progress = progress * 10;
        	 TextView text5 = (TextView)findViewById(R.id.text5);
         	text5.setText(String.valueOf(progress)+"0%");
        switch (progress){
        case 0: mConnectedThread.write("060"); break;
        case 1: mConnectedThread.write("061"); break;
        case 2: mConnectedThread.write("062"); break;
        case 3: mConnectedThread.write("063"); break;
        case 4: mConnectedThread.write("064"); break;
        case 5: mConnectedThread.write("065"); break;
        case 6: mConnectedThread.write("066"); break;
        case 7: mConnectedThread.write("067"); break;
        case 8: mConnectedThread.write("068"); break;
        case 9: mConnectedThread.write("069"); break;
        case 10: mConnectedThread.write("06o"); break;
        }
        	
        
        }

        public void onStartTrackingTouch(SeekBar seek5) {

        }

        public void onStopTrackingTouch(SeekBar seek5) {

        }
    });
    
    seek6.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){

        public void onProgressChanged(SeekBar seek6, int progress, boolean fromUser) {
           // progress = progress / 10;
           // progress = progress * 10;
        	 TextView text6 = (TextView)findViewById(R.id.text6);
         	text6.setText(String.valueOf(progress)+"0%");
        switch (progress){
        case 0: mConnectedThread.write("070"); break;
        case 1: mConnectedThread.write("071"); break;
        case 2: mConnectedThread.write("072"); break;
        case 3: mConnectedThread.write("073"); break;
        case 4: mConnectedThread.write("074"); break;
        case 5: mConnectedThread.write("075"); break;
        case 6: mConnectedThread.write("076"); break;
        case 7: mConnectedThread.write("077"); break;
        case 8: mConnectedThread.write("078"); break;
        case 9: mConnectedThread.write("079"); break;
        case 10: mConnectedThread.write("07o"); break;
        }
        	
        
        }

        public void onStartTrackingTouch(SeekBar seek6) {

        }

        public void onStopTrackingTouch(SeekBar seek6) {

        }
    });
    
    seek7.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){

        public void onProgressChanged(SeekBar seek7, int progress, boolean fromUser) {
           // progress = progress / 10;
           // progress = progress * 10;
        	 TextView text7 = (TextView)findViewById(R.id.text7);
         	text7.setText(String.valueOf(progress)+"0%"); 
        switch (progress){
        case 0: mConnectedThread.write("080"); break;
        case 1: mConnectedThread.write("081"); break;
        case 2: mConnectedThread.write("082"); break;
        case 3: mConnectedThread.write("083"); break;
        case 4: mConnectedThread.write("084"); break;
        case 5: mConnectedThread.write("085"); break;
        case 6: mConnectedThread.write("086"); break;
        case 7: mConnectedThread.write("087"); break;
        case 8: mConnectedThread.write("088"); break;
        case 9: mConnectedThread.write("089"); break;
        case 10: mConnectedThread.write("08o"); break;
        }
        	
        
        }

        public void onStartTrackingTouch(SeekBar seek7) {

        }

        public void onStopTrackingTouch(SeekBar seek7) {

        }
    });
    
    seek8.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){

        public void onProgressChanged(SeekBar seek8, int progress, boolean fromUser) {
           // progress = progress / 10;
           // progress = progress * 10;
        	 TextView text8 = (TextView)findViewById(R.id.text8);
         	text8.setText(String.valueOf(progress)+"0%"); 
        switch (progress){
        case 0: mConnectedThread.write("090"); break;
        case 1: mConnectedThread.write("091"); break;
        case 2: mConnectedThread.write("092"); break;
        case 3: mConnectedThread.write("093"); break;
        case 4: mConnectedThread.write("094"); break;
        case 5: mConnectedThread.write("095"); break;
        case 6: mConnectedThread.write("096"); break;
        case 7: mConnectedThread.write("097"); break;
        case 8: mConnectedThread.write("098"); break;
        case 9: mConnectedThread.write("099"); break;
        case 10: mConnectedThread.write("09o"); break;
        }
        	
        
        }

        public void onStartTrackingTouch(SeekBar seek8) {

        }

        public void onStopTrackingTouch(SeekBar seek8) {

        }
    });
    
    seek9.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){

        public void onProgressChanged(SeekBar seek9, int progress, boolean fromUser) {
           // progress = progress / 10;
           // progress = progress * 10;
        	 TextView text9 = (TextView)findViewById(R.id.text9);
         	text9.setText(String.valueOf(progress)+"0%");
        switch (progress){
        case 0: mConnectedThread.write("100"); break;
        case 1: mConnectedThread.write("101"); break;
        case 2: mConnectedThread.write("102"); break;
        case 3: mConnectedThread.write("103"); break;
        case 4: mConnectedThread.write("104"); break;
        case 5: mConnectedThread.write("105"); break;
        case 6: mConnectedThread.write("106"); break;
        case 7: mConnectedThread.write("107"); break;
        case 8: mConnectedThread.write("108"); break;
        case 9: mConnectedThread.write("109"); break;
        case 10: mConnectedThread.write("10o"); break;
        }
        	
        
        }

        public void onStartTrackingTouch(SeekBar seek9) {

        }

        public void onStopTrackingTouch(SeekBar seek9) {

        }
    });
    
    seek10.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){

        public void onProgressChanged(SeekBar seek10, int progress, boolean fromUser) {
           // progress = progress / 10;
           // progress = progress * 10;
        	 TextView text10 = (TextView)findViewById(R.id.text10);
         	text10.setText(String.valueOf(progress)+"0%");
        switch (progress){
        case 0: mConnectedThread.write("110"); break;
        case 1: mConnectedThread.write("111"); break;
        case 2: mConnectedThread.write("112"); break;
        case 3: mConnectedThread.write("113"); break;
        case 4: mConnectedThread.write("114"); break;
        case 5: mConnectedThread.write("115"); break;
        case 6: mConnectedThread.write("116"); break;
        case 7: mConnectedThread.write("117"); break;
        case 8: mConnectedThread.write("118"); break;
        case 9: mConnectedThread.write("119"); break;
        case 10: mConnectedThread.write("11o"); break;
        }
        	
        
        }

        public void onStartTrackingTouch(SeekBar seek10) {

        }

        public void onStopTrackingTouch(SeekBar seek10) {

        }
    });
    
    
    seek11.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){

        public void onProgressChanged(SeekBar seek11, int progress, boolean fromUser) {
           // progress = progress / 10;
           // progress = progress * 10;
        	 TextView text11 = (TextView)findViewById(R.id.text11);
         	text11.setText(String.valueOf(progress)+"0%");
        switch (progress){
        case 0: mConnectedThread.write("120"); break;
        case 1: mConnectedThread.write("121"); break;
        case 2: mConnectedThread.write("122"); break;
        case 3: mConnectedThread.write("123"); break;
        case 4: mConnectedThread.write("124"); break;
        case 5: mConnectedThread.write("125"); break;
        case 6: mConnectedThread.write("126"); break;
        case 7: mConnectedThread.write("127"); break;
        case 8: mConnectedThread.write("128"); break;
        case 9: mConnectedThread.write("129"); break;
        case 10: mConnectedThread.write("12o"); break;
        }
        	
        
        }

        public void onStartTrackingTouch(SeekBar seek11) {

        }

        public void onStopTrackingTouch(SeekBar seek11) {

        }
    });
    
    seek12.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){

        public void onProgressChanged(SeekBar seek12, int progress, boolean fromUser) {
           // progress = progress / 10;
           // progress = progress * 10;
        	 TextView text12 = (TextView)findViewById(R.id.text12);
         	text12.setText(String.valueOf(progress)+"0%");
        switch (progress){
        case 0: mConnectedThread.write("130"); break;
        case 1: mConnectedThread.write("131"); break;
        case 2: mConnectedThread.write("132"); break;
        case 3: mConnectedThread.write("133"); break;
        case 4: mConnectedThread.write("134"); break;
        case 5: mConnectedThread.write("135"); break;
        case 6: mConnectedThread.write("136"); break;
        case 7: mConnectedThread.write("137"); break;
        case 8: mConnectedThread.write("138"); break;
        case 9: mConnectedThread.write("139"); break;
        case 10: mConnectedThread.write("13o"); break;
        }
        	
        
        }

        public void onStartTrackingTouch(SeekBar seek12) {

        }

        public void onStopTrackingTouch(SeekBar seek12) {

        }
    });
    
    btnSend.setOnClickListener(new OnClickListener() {
        public void onClick(View v) {
      	
      	
        String totaltime= ((TextView) findViewById(R.id.editText13))
         			.getText().toString();
          	
        String time13= ((TextView) findViewById(R.id.editText12))
     			.getText().toString();
      	String time12= ((TextView) findViewById(R.id.editText11))
     			.getText().toString();
      	String time11= ((TextView) findViewById(R.id.editText10))
     			.getText().toString();
      	String time10= ((TextView) findViewById(R.id.editText9))
     			.getText().toString();
      	String time9= ((TextView) findViewById(R.id.editText8))
     			.getText().toString();
      	String time8= ((TextView) findViewById(R.id.editText7))
     			.getText().toString();
      	String time7= ((TextView) findViewById(R.id.editText6))
     			.getText().toString();
      	String time6= ((TextView) findViewById(R.id.editText5))
     			.getText().toString();
      	String time5= ((TextView) findViewById(R.id.editText4))
     			.getText().toString();
      	String time4= ((TextView) findViewById(R.id.editText3))
     			.getText().toString();
      	String time3= ((TextView) findViewById(R.id.editText2))
     			.getText().toString();
      	String time2= ((TextView) findViewById(R.id.editText1))
     			.getText().toString();
      	String cycles= ((TextView) findViewById(R.id.editText14))
     			.getText().toString();
      	
      	
      	
      	Integer time13_num = Integer.parseInt(time13);
      	Integer time12_num = Integer.parseInt(time12);
      	Integer time11_num = Integer.parseInt(time11);
      	Integer time10_num = Integer.parseInt(time10);
      	Integer time9_num = Integer.parseInt(time9);
      	Integer time8_num = Integer.parseInt(time8);
      	Integer time7_num = Integer.parseInt(time7);
      	Integer time6_num = Integer.parseInt(time6);
      	Integer time5_num = Integer.parseInt(time5);
      	Integer time4_num = Integer.parseInt(time4);
      	Integer time3_num = Integer.parseInt(time3);
      	Integer time2_num = Integer.parseInt(time2);
      	Integer totaltime_num = Integer.parseInt(totaltime);
      	Integer cycles_num = Integer.parseInt(cycles);
      	
      	
      	Integer [][] arraytime = {{2,time2_num},{3,time3_num},{4,time4_num},{5,time5_num},{6,time6_num},{7,time7_num},{8,time8_num},{9,time9_num},{10,time10_num},{11,time11_num},{12,time12_num},{13,time13_num}};

      	
		Arrays.sort(arraytime, new Comparator<Integer[]>() {
      	    public int compare(Integer[] int1, Integer[] int2) {
      	        Integer numOfKeys1 = int1[1];
      	        Integer numOfKeys2 = int2[1];
      	        return numOfKeys1.compareTo(numOfKeys2);
      	    }
      	});
      	

		for(Integer i= 0;i<cycles_num;i++)
		{
      	mConnectedThread.write("13o"); 
      	try {
      	        	  
      	    TimeUnit.MILLISECONDS.sleep(200);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	
      	mConnectedThread.write("12o"); 
      	try {
      	        	  
      	    TimeUnit.MILLISECONDS.sleep(200);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	mConnectedThread.write("11o"); 
      	try {
      	        	  
      	    TimeUnit.MILLISECONDS.sleep(200);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	mConnectedThread.write("10o"); 
      	try {
      	        	  
      	    TimeUnit.MILLISECONDS.sleep(200);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	mConnectedThread.write("09o"); 
      	try {
      	        	  
      	    TimeUnit.MILLISECONDS.sleep(200);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	mConnectedThread.write("08o"); 
      	try {
      	        	  
      	    TimeUnit.MILLISECONDS.sleep(200);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	mConnectedThread.write("07o"); 
      	try {
      	        	  
      	    TimeUnit.MILLISECONDS.sleep(200);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	mConnectedThread.write("06o"); 
      	try {
      	        	  
      	    TimeUnit.MILLISECONDS.sleep(200);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	mConnectedThread.write("05o"); 
      	try {
      	        	  
      	    TimeUnit.MILLISECONDS.sleep(200);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	mConnectedThread.write("04o"); 
      	try {
      	        	  
      	    TimeUnit.MILLISECONDS.sleep(200);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	mConnectedThread.write("03o"); 
      	try {
      	        	  
      	    TimeUnit.MILLISECONDS.sleep(200);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	mConnectedThread.write("02o"); 
      	try {
      	        	  
      	    TimeUnit.MILLISECONDS.sleep(200);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	

      	
      	
      	
      	
      	try {
        	  
      	    TimeUnit.SECONDS.sleep(arraytime[0][1]);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	
      	
      	
      	switch (arraytime[0][0]){
       case 2: mConnectedThread.write("02f"); break;
        case 3: mConnectedThread.write("03f"); break;
        case 4: mConnectedThread.write("04f"); break;
        case 5: mConnectedThread.write("05f"); break;
        case 6: mConnectedThread.write("06f"); break;
        case 7: mConnectedThread.write("07f"); break;
        case 8: mConnectedThread.write("08f"); break;
        case 9: mConnectedThread.write("09f"); break;
        case 10: mConnectedThread.write("10f"); break;
        case 11: mConnectedThread.write("11f"); break;
        case 12: mConnectedThread.write("12f"); break;
        case 13: mConnectedThread.write("13f"); break;
        }
      	
      	try {
        	  
      	    TimeUnit.MILLISECONDS.sleep(200);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	
      	try {
        	  
      	    TimeUnit.SECONDS.sleep(arraytime[1][1]-arraytime[0][1]);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	switch (arraytime[1][0]){
        case 2: mConnectedThread.write("02f"); break;
         case 3: mConnectedThread.write("03f"); break;
         case 4: mConnectedThread.write("04f"); break;
         case 5: mConnectedThread.write("05f"); break;
         case 6: mConnectedThread.write("06f"); break;
         case 7: mConnectedThread.write("07f"); break;
         case 8: mConnectedThread.write("08f"); break;
         case 9: mConnectedThread.write("09f"); break;
         case 10: mConnectedThread.write("10f"); break;
         case 11: mConnectedThread.write("11f"); break;
         case 12: mConnectedThread.write("12f"); break;
         case 13: mConnectedThread.write("13f"); break;
         }
      	
    	try {
      	  
      	    TimeUnit.MILLISECONDS.sleep(200);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	
      	try {
        	  
      	    TimeUnit.SECONDS.sleep(arraytime[2][1]-arraytime[1][1]);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	switch (arraytime[2][0]){
        case 2: mConnectedThread.write("02f"); break;
         case 3: mConnectedThread.write("03f"); break;
         case 4: mConnectedThread.write("04f"); break;
         case 5: mConnectedThread.write("05f"); break;
         case 6: mConnectedThread.write("06f"); break;
         case 7: mConnectedThread.write("07f"); break;
         case 8: mConnectedThread.write("08f"); break;
         case 9: mConnectedThread.write("09f"); break;
         case 10: mConnectedThread.write("10f"); break;
         case 11: mConnectedThread.write("11f"); break;
         case 12: mConnectedThread.write("12f"); break;
         case 13: mConnectedThread.write("13f"); break;
         }
      	
      	
      	
      	try {
        	  
      	    TimeUnit.MILLISECONDS.sleep(200);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	
      	try {
        	  
      	    TimeUnit.SECONDS.sleep(arraytime[3][1]-arraytime[2][1]);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	switch (arraytime[3][0]){
        case 2: mConnectedThread.write("02f"); break;
         case 3: mConnectedThread.write("03f"); break;
         case 4: mConnectedThread.write("04f"); break;
         case 5: mConnectedThread.write("05f"); break;
         case 6: mConnectedThread.write("06f"); break;
         case 7: mConnectedThread.write("07f"); break;
         case 8: mConnectedThread.write("08f"); break;
         case 9: mConnectedThread.write("09f"); break;
         case 10: mConnectedThread.write("10f"); break;
         case 11: mConnectedThread.write("11f"); break;
         case 12: mConnectedThread.write("12f"); break;
         case 13: mConnectedThread.write("13f"); break;
         }
      	
      	
      	
      	try {
        	  
      	    TimeUnit.MILLISECONDS.sleep(200);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	
      	try {
        	  
      	    TimeUnit.SECONDS.sleep(arraytime[4][1]-arraytime[3][1]);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	switch (arraytime[4][0]){
        case 2: mConnectedThread.write("02f"); break;
         case 3: mConnectedThread.write("03f"); break;
         case 4: mConnectedThread.write("04f"); break;
         case 5: mConnectedThread.write("05f"); break;
         case 6: mConnectedThread.write("06f"); break;
         case 7: mConnectedThread.write("07f"); break;
         case 8: mConnectedThread.write("08f"); break;
         case 9: mConnectedThread.write("09f"); break;
         case 10: mConnectedThread.write("10f"); break;
         case 11: mConnectedThread.write("11f"); break;
         case 12: mConnectedThread.write("12f"); break;
         case 13: mConnectedThread.write("13f"); break;
         }
      	
      	
      	
      	
      	try {
        	  
      	    TimeUnit.MILLISECONDS.sleep(200);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	
      	try {
        	  
      	    TimeUnit.SECONDS.sleep(arraytime[5][1]-arraytime[4][1]);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	switch (arraytime[5][0]){
        case 2: mConnectedThread.write("02f"); break;
         case 3: mConnectedThread.write("03f"); break;
         case 4: mConnectedThread.write("04f"); break;
         case 5: mConnectedThread.write("05f"); break;
         case 6: mConnectedThread.write("06f"); break;
         case 7: mConnectedThread.write("07f"); break;
         case 8: mConnectedThread.write("08f"); break;
         case 9: mConnectedThread.write("09f"); break;
         case 10: mConnectedThread.write("10f"); break;
         case 11: mConnectedThread.write("11f"); break;
         case 12: mConnectedThread.write("12f"); break;
         case 13: mConnectedThread.write("13f"); break;
         }
      	
      	
      	
      	
      	
      	try {
        	  
      	    TimeUnit.MILLISECONDS.sleep(200);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	
      	try {
        	  
      	    TimeUnit.SECONDS.sleep(arraytime[6][1]-arraytime[5][1]);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	switch (arraytime[6][0]){
        case 2: mConnectedThread.write("02f"); break;
         case 3: mConnectedThread.write("03f"); break;
         case 4: mConnectedThread.write("04f"); break;
         case 5: mConnectedThread.write("05f"); break;
         case 6: mConnectedThread.write("06f"); break;
         case 7: mConnectedThread.write("07f"); break;
         case 8: mConnectedThread.write("08f"); break;
         case 9: mConnectedThread.write("09f"); break;
         case 10: mConnectedThread.write("10f"); break;
         case 11: mConnectedThread.write("11f"); break;
         case 12: mConnectedThread.write("12f"); break;
         case 13: mConnectedThread.write("13f"); break;
         }
      	
      	
      	
      	try {
        	  
      	    TimeUnit.MILLISECONDS.sleep(200);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	
      	try {
        	  
      	    TimeUnit.SECONDS.sleep(arraytime[7][1]-arraytime[6][1]);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	switch (arraytime[7][0]){
        case 2: mConnectedThread.write("02f"); break;
         case 3: mConnectedThread.write("03f"); break;
         case 4: mConnectedThread.write("04f"); break;
         case 5: mConnectedThread.write("05f"); break;
         case 6: mConnectedThread.write("06f"); break;
         case 7: mConnectedThread.write("07f"); break;
         case 8: mConnectedThread.write("08f"); break;
         case 9: mConnectedThread.write("09f"); break;
         case 10: mConnectedThread.write("10f"); break;
         case 11: mConnectedThread.write("11f"); break;
         case 12: mConnectedThread.write("12f"); break;
         case 13: mConnectedThread.write("13f"); break;
         }
      	
      	
      	try {
        	  
      	    TimeUnit.MILLISECONDS.sleep(200);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	
      	try {
        	  
      	    TimeUnit.SECONDS.sleep(arraytime[8][1]-arraytime[7][1]);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	switch (arraytime[8][0]){
        case 2: mConnectedThread.write("02f"); break;
         case 3: mConnectedThread.write("03f"); break;
         case 4: mConnectedThread.write("04f"); break;
         case 5: mConnectedThread.write("05f"); break;
         case 6: mConnectedThread.write("06f"); break;
         case 7: mConnectedThread.write("07f"); break;
         case 8: mConnectedThread.write("08f"); break;
         case 9: mConnectedThread.write("09f"); break;
         case 10: mConnectedThread.write("10f"); break;
         case 11: mConnectedThread.write("11f"); break;
         case 12: mConnectedThread.write("12f"); break;
         case 13: mConnectedThread.write("13f"); break;
         }
      	
      	
      	
      	try {
        	  
      	    TimeUnit.MILLISECONDS.sleep(200);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	
      	try {
        	  
      	    TimeUnit.SECONDS.sleep(arraytime[9][1]-arraytime[8][1]);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	switch (arraytime[9][0]){
        case 2: mConnectedThread.write("02f"); break;
         case 3: mConnectedThread.write("03f"); break;
         case 4: mConnectedThread.write("04f"); break;
         case 5: mConnectedThread.write("05f"); break;
         case 6: mConnectedThread.write("06f"); break;
         case 7: mConnectedThread.write("07f"); break;
         case 8: mConnectedThread.write("08f"); break;
         case 9: mConnectedThread.write("09f"); break;
         case 10: mConnectedThread.write("10f"); break;
         case 11: mConnectedThread.write("11f"); break;
         case 12: mConnectedThread.write("12f"); break;
         case 13: mConnectedThread.write("13f"); break;
         }
      	
      	
      	try {
        	  
      	    TimeUnit.MILLISECONDS.sleep(200);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	
      	try {
        	  
      	    TimeUnit.SECONDS.sleep(arraytime[10][1]-arraytime[9][1]);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	switch (arraytime[10][0]){
        case 2: mConnectedThread.write("02f"); break;
         case 3: mConnectedThread.write("03f"); break;
         case 4: mConnectedThread.write("04f"); break;
         case 5: mConnectedThread.write("05f"); break;
         case 6: mConnectedThread.write("06f"); break;
         case 7: mConnectedThread.write("07f"); break;
         case 8: mConnectedThread.write("08f"); break;
         case 9: mConnectedThread.write("09f"); break;
         case 10: mConnectedThread.write("10f"); break;
         case 11: mConnectedThread.write("11f"); break;
         case 12: mConnectedThread.write("12f"); break;
         case 13: mConnectedThread.write("13f"); break;
         }
      	
      	
      	try {
        	  
      	    TimeUnit.MILLISECONDS.sleep(200);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	
      	try {
        	  
      	    TimeUnit.SECONDS.sleep(arraytime[11][1]-arraytime[10][1]);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	switch (arraytime[11][0]){
        case 2: mConnectedThread.write("02f"); break;
         case 3: mConnectedThread.write("03f"); break;
         case 4: mConnectedThread.write("04f"); break;
         case 5: mConnectedThread.write("05f"); break;
         case 6: mConnectedThread.write("06f"); break;
         case 7: mConnectedThread.write("07f"); break;
         case 8: mConnectedThread.write("08f"); break;
         case 9: mConnectedThread.write("09f"); break;
         case 10: mConnectedThread.write("10f"); break;
         case 11: mConnectedThread.write("11f"); break;
         case 12: mConnectedThread.write("12f"); break;
         case 13: mConnectedThread.write("13f"); break;
         }
      	
      	try {
        	  
      	    TimeUnit.MILLISECONDS.sleep(200);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	
      	/*
      	try {
        	  
      	    TimeUnit.SECONDS.sleep(arraytime[12][1]-arraytime[11][1]);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
      	switch (arraytime[12][0]){
        case 2: mConnectedThread.write("02f"); break;
         case 3: mConnectedThread.write("03f"); break;
         case 4: mConnectedThread.write("04f"); break;
         case 5: mConnectedThread.write("05f"); break;
         case 6: mConnectedThread.write("06f"); break;
         case 7: mConnectedThread.write("07f"); break;
         case 8: mConnectedThread.write("08f"); break;
         case 9: mConnectedThread.write("09f"); break;
         case 10: mConnectedThread.write("10f"); break;
         case 11: mConnectedThread.write("11f"); break;
         case 12: mConnectedThread.write("12f"); break;
         case 13: mConnectedThread.write("13f"); break;
         }
      	*/
      	
      	
      	
      	
      	
      	
      	try {
      	  
      	    TimeUnit.SECONDS.sleep(totaltime_num-arraytime[11][1]);
      	    
      	} catch (InterruptedException e) {
      	    //Handle exception
      	}
		}
      	
      	//mConnectedThread.write("1");	// Send "1" via Bluetooth
          //Toast.makeText(getBaseContext(), "Turn on LED", Toast.LENGTH_SHORT).show();
        }
      });
   
     }
  
  private BluetoothSocket createBluetoothSocket(BluetoothDevice device) throws IOException {
      if(Build.VERSION.SDK_INT >= 10){
          try {
              final Method  m = device.getClass().getMethod("createInsecureRfcommSocketToServiceRecord", new Class[] { UUID.class });
              return (BluetoothSocket) m.invoke(device, MY_UUID);
          } catch (Exception e) {
              Log.e(TAG, "Could not create Insecure RFComm Connection",e);
          }
      }
      return  device.createRfcommSocketToServiceRecord(MY_UUID);
  }
   
  @Override
  public void onResume() {
    super.onResume();
 
    Log.d(TAG, "...onResume - try connect...");
   
    // Set up a pointer to the remote node using it's address.
    BluetoothDevice device = btAdapter.getRemoteDevice(address);
   
    // Two things are needed to make a connection:
    //   A MAC address, which we got above.
    //   A Service ID or UUID.  In this case we are using the
    //     UUID for SPP.
    
	try {
		btSocket = createBluetoothSocket(device);
	} catch (IOException e) {
		errorExit("Fatal Error", "In onResume() and socket create failed: " + e.getMessage() + ".");
	}
    
    /*try {
      btSocket = device.createRfcommSocketToServiceRecord(MY_UUID);
    } catch (IOException e) {
      errorExit("Fatal Error", "In onResume() and socket create failed: " + e.getMessage() + ".");
    }*/
   
    // Discovery is resource intensive.  Make sure it isn't going on
    // when you attempt to connect and pass your message.
    btAdapter.cancelDiscovery();
   
    // Establish the connection.  This will block until it connects.
    Log.d(TAG, "...Connecting...");
    try {
      btSocket.connect();
      Log.d(TAG, "....Connection ok...");
    } catch (IOException e) {
      try {
        btSocket.close();
      } catch (IOException e2) {
        errorExit("Fatal Error", "In onResume() and unable to close socket during connection failure" + e2.getMessage() + ".");
      }
    }
     
    // Create a data stream so we can talk to server.
    Log.d(TAG, "...Create Socket...");
   
    mConnectedThread = new ConnectedThread(btSocket);
    mConnectedThread.start();
  }
 
  @Override
  public void onPause() {
    super.onPause();
 
    Log.d(TAG, "...In onPause()...");
  
    try     {
      btSocket.close();
    } catch (IOException e2) {
      errorExit("Fatal Error", "In onPause() and failed to close socket." + e2.getMessage() + ".");
    }
  }
   
  private void checkBTState() {
    // Check for Bluetooth support and then check to make sure it is turned on
    // Emulator doesn't support Bluetooth and will return null
    if(btAdapter==null) { 
      errorExit("Fatal Error", "Bluetooth not support");
    } else {
      if (btAdapter.isEnabled()) {
        Log.d(TAG, "...Bluetooth ON...");
      } else {
        //Prompt user to turn on Bluetooth
        Intent enableBtIntent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
        startActivityForResult(enableBtIntent, 1);
      }
    }
  }
 
  private void errorExit(String title, String message){
    Toast.makeText(getBaseContext(), title + " - " + message, Toast.LENGTH_LONG).show();
    finish();
  }
 
  private class ConnectedThread extends Thread {
	    private final InputStream mmInStream;
	    private final OutputStream mmOutStream;
	 
	    public ConnectedThread(BluetoothSocket socket) {
	        InputStream tmpIn = null;
	        OutputStream tmpOut = null;
	 
	        // Get the input and output streams, using temp objects because
	        // member streams are final
	        try {
	            tmpIn = socket.getInputStream();
	            tmpOut = socket.getOutputStream();
	        } catch (IOException e) { }
	 
	        mmInStream = tmpIn;
	        mmOutStream = tmpOut;
	    }
	 
	    public void run() {
	        byte[] buffer = new byte[256];  // buffer store for the stream
	        int bytes; // bytes returned from read()

	        // Keep listening to the InputStream until an exception occurs
	        while (true) {
	        	try {
	                // Read from the InputStream
	                bytes = mmInStream.read(buffer);		// Get number of bytes and message in "buffer"
                    h.obtainMessage(RECIEVE_MESSAGE, bytes, -1, buffer).sendToTarget();		// Send to message queue Handler
	            } catch (IOException e) {
	                break;
	            }
	        }
	    }
	 
	    /* Call this from the main activity to send data to the remote device */
	    public void write(String message) {
	    	Log.d(TAG, "...Data to send: " + message + "...");
	    	byte[] msgBuffer = message.getBytes();
	    	try {
	            mmOutStream.write(msgBuffer);
	        } catch (IOException e) {
	            Log.d(TAG, "...Error data send: " + e.getMessage() + "...");     
	          }
	    }
	}
}