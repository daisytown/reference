package com.hsbc.gbm.grt.recon;

import com.hsbc.test.common.Reflection2;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.FileOutputStream;

import junit.framework.Assert;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellReference;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;

/**
 * Created by Daisy on 07-July-17.
 */
public class RAVENvsPTSReconPoiTest {

    @Test
    public void testPoiSXSSF() throws Exception {
        // create a new file
        FileOutputStream out = new FileOutputStream("sxssf.xlsx");//C:\Users\44018803\Documents\Github\mtmsc-batch
        
        // create a new workbook
        SXSSFWorkbook wb = new SXSSFWorkbook(100); // keep 100 rows in memory, exceeding rows will be flushed to disk        
        // create a new sheet
        
        Sheet sh = wb.createSheet();        
        
        for(int rownum = 0; rownum < 1000; rownum++){
            Row row = sh.createRow(rownum);
            for(int cellnum = 0; cellnum < 10; cellnum++){
                Cell cell = row.createCell(cellnum);
                String address = new CellReference(cell).formatAsString();
                cell.setCellValue(address);
            }}
            wb.write(out);
            out.close();
         // dispose of temporary files backing this workbook on disk
            wb.dispose();
    }
}
                     