//Copyright (c) 2011 Municipalidad de Rosario and Coop. de Trabajo Tecso Ltda.
//This file is part of SIAT. SIAT is licensed under the terms
//of the GNU General Public License, version 3.
//See terms in COPYING file or <http://www.gnu.org/licenses/gpl.txt>

package ar.gov.rosario.siat.bal.view.struts;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ar.gov.rosario.siat.bal.iface.model.EjercicioSearchPage;
import ar.gov.rosario.siat.bal.iface.service.BalServiceLocator;
import ar.gov.rosario.siat.bal.iface.util.BalSecurityConstants;
import ar.gov.rosario.siat.bal.view.util.BalConstants;
import ar.gov.rosario.siat.base.view.struts.BaseDispatchAction;
import ar.gov.rosario.siat.base.view.util.UserSession;
import coop.tecso.demoda.iface.helper.DemodaUtil;

public final class BuscarEjercicioDAction extends BaseDispatchAction {

	private Log log = LogFactory.getLog(BuscarEjercicioDAction.class);
		
	public ActionForward inicializar(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		String funcName = DemodaUtil.currentMethodName();
		String act = getCurrentAct(request);
		if (log.isDebugEnabled()) log.debug(funcName + ": enter");

		UserSession userSession = canAccess(request, mapping, BalSecurityConstants.ABM_EJERCICIO, act); 
		if (userSession==null) return forwardErrorSession(request);
		
		try {
			
			EjercicioSearchPage ejercicioSearchPageVO = BalServiceLocator.getDefinicionService().getEjercicioSearchPageInit(userSession);
			
			// Tiene errores recuperables
			if (ejercicioSearchPageVO.hasErrorRecoverable()) {
				log.error("recoverable error en: "  + funcName + ": " + ejercicioSearchPageVO.infoString()); 
				saveDemodaErrors(request, ejercicioSearchPageVO);
				return forwardErrorRecoverable(mapping, request, userSession, EjercicioSearchPage.NAME, ejercicioSearchPageVO);
			} 

			// Tiene errores no recuperables
			if (ejercicioSearchPageVO.hasErrorNonRecoverable()) {
				log.error("error en: "  + funcName + ": " + ejercicioSearchPageVO.errorString()); 
				return forwardErrorNonRecoverable(mapping, request, funcName, EjercicioSearchPage.NAME, ejercicioSearchPageVO);
			}
			
			// Si no tiene error
			baseInicializarSearchPage(mapping, request, userSession , EjercicioSearchPage.NAME, ejercicioSearchPageVO);
			
			return mapping.findForward(BalConstants.FWD_EJERCICIO_SEARCHPAGE);
			
		} catch (Exception exception) {
			return baseException(mapping, request, funcName, exception, EjercicioSearchPage.NAME);
		}
	}

	public ActionForward limpiar(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		String funcName = DemodaUtil.currentMethodName();
		return this.baseRefill(mapping, form, request, response, funcName, EjercicioSearchPage.NAME);
		
	}
	
	public ActionForward buscar(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		String funcName = DemodaUtil.currentMethodName();
		if (log.isDebugEnabled()) log.debug(funcName + ": enter");		
		UserSession userSession = getCurrentUserSession(request, mapping); 
		if (userSession == null) return forwardErrorSession(request);
		
		try {
			
			// Bajo el searchPage del userSession
			EjercicioSearchPage ejercicioSearchPageVO = (EjercicioSearchPage) userSession.get(EjercicioSearchPage.NAME);
			
			// Si es nulo no se puede continuar
			if (ejercicioSearchPageVO == null) {
				log.error("error en: "  + funcName + ": " + EjercicioSearchPage.NAME + " IS NULL. No se pudo obtener de la sesion");
				return forwardErrorSessionNullObject(mapping, request, funcName, EjercicioSearchPage.NAME); 
			}
			
			// si el buscar diparado desde la pagina de busqueda
			if (((String)userSession.get("reqAttIsSubmittedForm")).equals("true")) {
				// Recuperamos datos del form en el vo
				DemodaUtil.populateVO(ejercicioSearchPageVO, request);
				// Setea el PageNumber del PageModel				
				ejercicioSearchPageVO.setPageNumber(new Long((String)userSession.get("reqAttPageNumber")));
			}
			
            // Tiene errores recuperables
			if (ejercicioSearchPageVO.hasErrorRecoverable()) {
				log.error("recoverable error en: "  + funcName + ": " + ejercicioSearchPageVO.infoString()); 
				saveDemodaErrors(request, ejercicioSearchPageVO);
				return forwardErrorRecoverable(mapping, request, userSession, EjercicioSearchPage.NAME, ejercicioSearchPageVO);
			}
				
			// Llamada al servicio	
			ejercicioSearchPageVO = BalServiceLocator.getDefinicionService().getEjercicioSearchPageResult(userSession, ejercicioSearchPageVO);			

			// Tiene errores recuperables
			if (ejercicioSearchPageVO.hasErrorRecoverable()) {
				log.error("recoverable error en: "  + funcName + ": " + ejercicioSearchPageVO.infoString()); 
				saveDemodaErrors(request, ejercicioSearchPageVO);
				return forwardErrorRecoverable(mapping, request, userSession, EjercicioSearchPage.NAME, ejercicioSearchPageVO);
			}
			
			// Tiene errores no recuperables
			if (ejercicioSearchPageVO.hasErrorNonRecoverable()) {
				log.error("error en: "  + funcName + ": " + ejercicioSearchPageVO.errorString());
				return forwardErrorNonRecoverable(mapping, request, funcName, EjercicioSearchPage.NAME, ejercicioSearchPageVO);
			}
		
			// Envio el VO al request
			request.setAttribute(EjercicioSearchPage.NAME, ejercicioSearchPageVO);
			// Nuleo el list result
			// Subo en el el searchPage al userSession
			userSession.put(EjercicioSearchPage.NAME, ejercicioSearchPageVO);
			
			return mapping.findForward(BalConstants.FWD_EJERCICIO_SEARCHPAGE);
			
		} catch (Exception exception) {
			return baseException(mapping, request, funcName, exception, EjercicioSearchPage.NAME);
		}
	}

	public ActionForward ver(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		String funcName = DemodaUtil.currentMethodName();
		return forwardVerSearchPage(mapping, request, funcName, BalConstants.ACTION_ADMINISTRAR_EJERCICIO);

	}

	public ActionForward agregar(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		String funcName = DemodaUtil.currentMethodName();
		
		return forwardAgregarSearchPage(mapping, request, funcName, BalConstants.ACTION_ADMINISTRAR_EJERCICIO);
	}

	public ActionForward modificar(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		String funcName = DemodaUtil.currentMethodName();
		return forwardModificarSearchPage(mapping, request, funcName, BalConstants.ACTION_ADMINISTRAR_EJERCICIO);

	}

	public ActionForward eliminar(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		String funcName = DemodaUtil.currentMethodName();
		return forwardEliminarSearchPage(mapping, request, funcName, BalConstants.ACTION_ADMINISTRAR_EJERCICIO);

	}
	
	public ActionForward activar(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
		throws Exception {
		
		String funcName = DemodaUtil.currentMethodName();
		return forwardActivarSearchPage(mapping, request, funcName, BalConstants.ACTION_ADMINISTRAR_EJERCICIO);			
	}
	
	public ActionForward desactivar(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
		throws Exception {
		
		String funcName = DemodaUtil.currentMethodName();
		return forwardDesactivarSearchPage(mapping, request, funcName, BalConstants.ACTION_ADMINISTRAR_EJERCICIO);
	}
	
	public ActionForward seleccionar(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		String funcName = DemodaUtil.currentMethodName();
		return baseSeleccionar(mapping, request, response, funcName, EjercicioSearchPage.NAME);
		
	}

	public ActionForward volver(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
		throws Exception {
		
		return baseVolver(mapping, form, request, response, EjercicioSearchPage.NAME);
		
	}
		
	
}
