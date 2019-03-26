//Copyright (c) 2011 Municipalidad de Rosario and Coop. de Trabajo Tecso Ltda.
//This file is part of SIAT. SIAT is licensed under the terms
//of the GNU General Public License, version 3.
//See terms in COPYING file or <http://www.gnu.org/licenses/gpl.txt>

package ar.gov.rosario.siat.def.iface.model;


import ar.gov.rosario.siat.base.iface.model.SiatBussImageModel;

/**
 * Zona
 * @author tecso
 *
 */
public class ZonaVO extends SiatBussImageModel {

	private static final long serialVersionUID = 1L;

	public static final String NAME = "zonaVO";
	
	private String descripcion;

	//Constructores
	
	public ZonaVO(){
		super();
	}
	
	public ZonaVO(int id, String descripcion) {
		super(id);
		setDescripcion(descripcion);
	}
	
	//Getters Y Setters
	
	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
}
