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
        // 基本边界值法
//        CsvReader reader = new CsvReader("../TestCases/BoundaryValueAnalysis1.csv", ',', Charset.forName("GBK"));
        // 最坏情况边界值法
//        CsvReader reader = new CsvReader("../TestCases/BoundaryValueAnalysis2.csv", ',', Charset.forName("GBK"));
        // 健壮性边界值法
//        CsvReader reader = new CsvReader("../TestCases/BoundaryValueAnalysis3.csv", ',', Charset.forName("GBK"));
        // 健壮最坏边界值法
//        CsvReader reader = new CsvReader("../TestCases/BoundaryValueAnalysis4.csv", ',', Charset.forName("GBK"));
        // 弱一般等价类
//        CsvReader reader = new CsvReader("../TestCases/EquivalenceClass1.csv", ',', Charset.forName("GBK"));
        // 强一般等价类
        CsvReader reader = new CsvReader("../TestCases/EquivalenceClass2.csv", ',', Charset.forName("GBK"));
        reader.readHeaders();
        while (reader.readRecord()) {
            int year = Integer.parseInt(reader.get("year"));
            int month = Integer.parseInt(reader.get("month"));
            int day = Integer.parseInt(reader.get("day"));
            int nextyear = Integer.parseInt(reader.get("nextyear"));
            int nextmonth = Integer.parseInt(reader.get("nextmonth"));
            int nextday = Integer.parseInt(reader.get("nextday"));

            Date date = new Date(year, month, day);
            Date expectedResult = new Date(nextyear, nextmonth, nextday);
            Date actualResult = date.getNextDate();

            if (!actualResult.equals(expectedResult)) {
                System.out.println("date: " + date.year + "/" + date.month + "/" + date.day);
                System.out.println("expected: " + expectedResult.year + "/" + expectedResult.month + "/" + expectedResult.day);
                System.out.println("actual: " + actualResult.year + "/" + actualResult.month + "/" + actualResult.day);
            }
            assertEquals(actualResult, expectedResult);
        }
    }
}