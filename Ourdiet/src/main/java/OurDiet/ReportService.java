package OurDiet;
import java.util.ArrayList;
import java.time.LocalDate;
import java.util.List;

public class ReportService {
	private ReportDao reportdao;
	public ReportService(ReportDao reportdao) {
		this.reportdao = reportdao;
	}
}
