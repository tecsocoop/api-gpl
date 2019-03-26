//Copyright (c) 2011 Municipalidad de Rosario and Coop. de Trabajo Tecso Ltda.
//This file is part of SIAT. SIAT is licensed under the terms
//of the GNU General Public License, version 3.
//See terms in COPYING file or <http://www.gnu.org/licenses/gpl.txt>

package ar.gov.rosario.siat.ef.iface.model;

import ar.gov.rosario.siat.base.iface.model.SiatBussImageModel;

/**
 * Value Object del TipoOrden
 * @author tecso
 *
 */
public class TipoOrdenVO extends SiatBussImageModel {

	private static final long serialVersionUID = 1L;

	public static final String NAME = "tipoOrdenVO";
	
	private String desTipoOrden;
	
	// Buss Flags
	
	
	// View Constants
	
	
	// Constructores
	public TipoOrdenVO() {
		super();
	}
	
	// Constructor para utilizar este VO en un combo como valor SELECCIONAR, TODOS, etc.
	public TipoOrdenVO(int id, String desc) {
		super();
		setId(new Long(id));
		setDesTipoOrden(desc);
	}
	
	// Getters y Setters

	public String getDesTipoOrden() {
		return desTipoOrden;
	}

	public void setDesTipoOrden(String desTipoOrden) {
		this.desTipoOrden = desTipoOrden;
	}

	// Buss flags getters y setters
	
	
	// View flags getters
	
	
	// View getters
	public String getDesTipoOrdenUpper() {
		return desTipoOrden.toUpperCase();
	}
}
