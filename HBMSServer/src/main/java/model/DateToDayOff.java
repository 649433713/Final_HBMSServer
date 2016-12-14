/**
 * 
 */
package model;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @author 凡
 *
 */
public class DateToDayOff {

	public static String dateToDatOff(Date date) {
		Calendar c1 = Calendar.getInstance();
        Calendar c2 = Calendar.getInstance();
        
        c1.setTime(new java.util.Date());
        c2.setTime(date);

        int difference = c2.get(Calendar.DAY_OF_YEAR) - c1.get(Calendar.DAY_OF_YEAR);
        DecimalFormat decimalFormat = new DecimalFormat("00");
        String dayOff = "day"+decimalFormat.format(difference);
        return dayOff;
	}
}
