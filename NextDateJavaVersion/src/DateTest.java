/**
 * Created by mandyxue on 16/4/1.
 */
import com.csvreader.CsvReader;

import java.nio.charset.Charset;
import static org.junit.Assert.*;

public class DateTest {

    @org.junit.Before
    public void setUp() throws Exception {

    }

    @org.junit.Test
    public void testGetNextDate() throws Exception {
        // 边界值分析法测试用例
        CsvReader reader = new CsvReader("../TestCases/BoundaryValueAnalysis.csv", ',', Charset.forName("GBK"));
        reader.readHeaders();
        while (reader.readRecord()) {
            int year = Integer.parseInt(reader.get("year"));
            int month = Integer.parseInt(reader.get("month"));
            int day = Integer.parseInt(reader.get("day"));
            int nextyear = Integer.parseInt(reader.get("nextyear"));
            int nextmonth = Integer.parseInt(reader.get("nextmonth"));
            int nextday = Integer.parseInt(reader.get("nextday"));

            Date date = new Date(year, month, day);
            Date nextdate = new Date(nextyear, nextmonth, nextday);

//            System.out.println(year + "/" + month + "/" + day);
//            System.out.println("nextdate: " + nextdate.year + "/" + nextdate.month + "/" + nextdate.day);

            assertEquals(date.getNextDate(),nextdate);
        }
    }
}