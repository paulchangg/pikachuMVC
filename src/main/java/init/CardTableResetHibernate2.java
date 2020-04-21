package init;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.sql.Blob;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.pikachuMVC.model.CardBean;



// 本程式建立CARDS的表格

public class CardTableResetHibernate2 {
//	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元

	public static void main(String args[]) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
	
		String line = "";
		int count = 0;
		File file = new File("data/card0405.csv");
		try (FileInputStream fis = new FileInputStream(file);
				InputStreamReader isr = new InputStreamReader(fis, "BIG5");
				BufferedReader br = new BufferedReader(isr);) {
			while ((line = br.readLine()) != null) {
				count++;
				if (count < 2) {
					continue;
				}
				System.out.println("line=" + line);

				String[] token = line.split("<");

				CardBean cb = new CardBean();
//				cb.setC_id();
				cb.setC_name(token[1]);
				token[2] =  token[1].substring(0, token[1].indexOf(" ")); 
				cb.setBank(token[2]);
				cb.setAnnlfee(token[3]);
				String imgname = "data/imgs/" + token[1] + ".jpg";
				Blob c_img = GlobalService.fileToBlob(imgname);
				cb.setC_img(c_img);

				if (token[5]== null || token[5].trim().length() == 0) {
					token[5] = "0";
				}
				token[5] = token[5].replace("%", "");
				cb.setFcb(Double.parseDouble(token[5].trim()));

				if (token[6]== null || token[6].trim().length() == 0) {
					token[6] = "0";
				}

				token[6] = token[6].replace("%", "");
				cb.setDcb(Double.parseDouble(token[6].trim()));
				cb.setFcb_n(token[7]);
				cb.setDcb_n(token[8]);
				cb.setFma(token[9]);
				cb.setDma(token[10]);
				cb.setFma_n(token[11]);
				cb.setDma_n(token[12]);

				if (token[13]== null || token[13].trim().length() == 0) {
					token[13] = "0";
				}
				cb.setRefuel_cb(Double.parseDouble(token[13].trim()));

				cb.setRefuel_dis(token[14]);
				cb.setRefuel_cb_n(token[15]);
				cb.setRefuel_dis_n(token[16]);
				cb.setWkdmoviedis(token[17]);
				cb.setMoviedis(token[18]);
				cb.setWkdmoviedis_n(token[19]);
				cb.setMoviedis_n(token[20]);
				cb.setDitigalfb(token[21]);
				cb.setOnlinefb(token[22]);
				cb.setDitigalfb_n(token[23]);
				cb.setOnlinefb_n(token[24]);
				cb.setZeroins(token[25]);
				cb.setMinins(token[26]);
				cb.setZeroins_n(token[27]);
				cb.setMinins_n(token[28]);
				cb.setMileagefb(token[29]);
				cb.setCashfb(token[30]);
				cb.setMileagefb_n(token[31]);
				cb.setCashfb_n(token[32]);

				if (token[33]== null || token[33].trim().length() == 0) {
					token[33] = "0";
				}
				cb.setAnnual_income(Integer.parseInt(token[33].trim()));
				cb.setC_type(token[34]);

				try {
					tx = session.beginTransaction();
					// 設外鍵
//					CompanyBean companyBean = 
//							session.get(CompanyBean.class, Integer.parseInt(token[4].trim()));
//					book.setCompanyBean(companyBean);

					session.save(cb);
					tx.commit();
					System.out.println("1234567890!!!!!!!!!!!!!!!!!");
				} catch (Exception ex) {
					if (tx != null)
						tx.rollback();
				}
				System.out.println("新增一筆Cards紀錄");
			}
			System.out.println("Cards資料新增成功");
		} catch (Exception e) {
			System.err.println("新建Cards表格時發生IO例外: " + e.getMessage());
		}

	}

}