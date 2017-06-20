package zh.test;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

public class HibernateCoreAPITest {

	private static SessionFactory sf = null;

	@BeforeClass
	public static void beforeClass() {

		sf= new Configuration().configure().buildSessionFactory();
		
	}

	@AfterClass
	public static void afterClass() {
		sf.close();
	}

	@Test
	public void testSchemaExport(){
		new SchemaExport(new Configuration().configure()).create(true, true);
		
		
	}
	
	
	
	

}
