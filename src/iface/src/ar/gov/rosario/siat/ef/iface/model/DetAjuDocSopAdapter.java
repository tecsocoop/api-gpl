//Copyright (c) 2011 Municipalidad de Rosario and Coop. de Trabajo Tecso Ltda.
//This file is part of SIAT. SIAT is licensed under the terms
//of the GNU General Public License, version 3.
//See terms in COPYING file or <http://www.gnu.org/licenses/gpl.txt>

package ar.gov.rosario.siat.ef.iface.model;

import java.util.ArrayList;
import java.util.List;

import ar.gov.rosario.siat.base.iface.model.SiatAdapterModel;
import ar.gov.rosario.siat.ef.iface.util.EfSecurityConstants;
import coop.tecso.demoda.iface.model.ReportVO;

/**
 * Adapter del DetAjuDocSop
 * 
 * @author tecso
 */
public class DetAjuDocSopAdapter extends SiatAdapterModel{
	
	private static final long serialVersionUID = 1L;
	
	public static final String NAME = "detAjuDocSopAdapterVO";
	
    private DetAjuDocSopVO detAjuDocSop = new DetAjuDocSopVO();
    
    private List<DocSopVO>   listDocSop = new ArrayList<DocSopVO>();
    
    // Constructores
    public DetAjuDocSopAdapter(){
    	super(EfSecurityConstants.ABM_DETAJUDOCSOP);
    }
    
    //  Getters y Setters
	public DetAjuDocSopVO getDetAjuDocSop() {
		return detAjuDocSop;
	}

	public void setDetAjuDocSop(DetAjuDocSopVO detAjuDocSopVO) {
		this.detAjuDocSop = detAjuDocSopVO;
	}
	
	public List<DocSopVO> getListDocSop() {
		return listDocSop;
	}

	public void setListDocSop(List<DocSopVO> listDocSop) {
		this.listDocSop = listDocSop;
	}

	public String getName(){
		return NAME;
	}
			
	public void prepareReport(Long format) {
		 
		 ReportVO report = this.getReport(); // no instanciar una nueva
		 report.setReportFormat(format);	
		 report.setReportTitle("Reporte de DetAjuDocSop");     
		 report.setReportBeanName("DetAjuDocSop");
		 report.setReportFileName(this.getClass().getName());
		 
		// carga de filtros: ninguno
		// Order by: no 
		 
		 ReportVO reportDetAjuDocSop = new ReportVO();
		 reportDetAjuDocSop.setReportTitle("Datos del DetAjuDocSop");
		 // carga de datos
	     
	     //C�digo
		 reportDetAjuDocSop.addReportDato("C�digo", "codDetAjuDocSop");
		 //Descripci�n
		 reportDetAjuDocSop.addReportDato("Descripci�n", "desDetAjuDocSop");
	     
		 report.getListReport().add(reportDetAjuDocSop);
	
	}
	
	// View getters
}
