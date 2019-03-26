<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>

<script type="text/javascript" language="javascript">			   
   	    <%@include file="/base/submitForm.js"%>	 
</script>

	<!-- Tabla que contiene todos los formularios -->
	<html:form styleId="filter" action="/pad/AdministrarCriRepCat.do">
	
		<!-- Mensajes y/o Advertencias -->
		<%@ include file="/base/warning.jsp" %>
		<!-- Errors  -->
		<html:errors bundle="base"/>
		
		<h1><bean:message bundle="pad" key="pad.repartidorAdapter.title"/></h1>		
	
	<table class="tablabotones" width="100%">
		<tr>			
			<td align="right">
    			<html:button property="btnVolver"  styleClass="boton" onclick="submitForm('volver', '');">
					<bean:message bundle="base" key="abm.button.volver"/>
				</html:button>
			</td>
		</tr>
	</table>
		
		<!-- Datos del Repartidor -->
		<fieldset>
			<legend><bean:message bundle="pad" key="pad.repartidor.title"/></legend>			
			<table class="tabladatos">
				<tr>
					<!-- Recurso -->		
					<td><label>&nbsp;<bean:message bundle="def" key="def.recurso.label"/>: </label></td>
					<td class="normal"><bean:write name="criRepCatAdapterVO" property="criRepCat.repartidor.recurso.desRecurso"/></td>
					<!-- Tipo Repartidor -->		
					<td><label>&nbsp;<bean:message bundle="pad" key="pad.tipoRepartidor.label"/>: </label></td>
					<td class="normal"><bean:write name="criRepCatAdapterVO" property="criRepCat.repartidor.tipoRepartidor.desTipoRepartidor"/></td>
					</td>	
				</tr>
				<tr>
					<!-- Persona -->		
					<td><label>&nbsp;<bean:message bundle="pad" key="pad.persona.label"/>: </label></td>
					<td class="normal"><bean:write name="criRepCatAdapterVO" property="criRepCat.repartidor.personaView"/></td>
					<!-- Legajo -->		
					<td><label>&nbsp;<bean:message bundle="pad" key="pad.repartidor.legajo.label"/>: </label></td>
					<td class="normal"><bean:write name="criRepCatAdapterVO" property="criRepCat.repartidor.legajo"/></td>
				</tr>
				<tr>
					<!-- Zona -->		
					<td><label>&nbsp;<bean:message bundle="def" key="def.zona.label"/>: </label></td>
					<td class="normal"><bean:write name="criRepCatAdapterVO" property="criRepCat.repartidor.zona.descripcion"/></td>
					<!-- Broche -->		
					<td><label>&nbsp;<bean:message bundle="pad" key="pad.broche.label"/>: </label></td>
					<td class="normal"><bean:write name="criRepCatAdapterVO" property="criRepCat.repartidor.broche.desBroche"/></td>
				</tr>				
			</table>
		</fieldset>
		<!-- Fin Datos del Repartidor -->
	
		<!-- CriRepCat -->
		<fieldset>
			<legend><bean:message bundle="pad" key="pad.criRepCat.title"/></legend>			
			<table class="tabladatos">
				<tr>
					<td><label>&nbsp;<bean:message bundle="def" key="def.seccion.label"/>: </label></td>
					<td class="normal"><bean:write name="criRepCatAdapterVO" property="criRepCat.seccion.descripcion"/></td>
				</tr>		
				<tr>
					<td><label>&nbsp;<bean:message bundle="pad" key="pad.criRepCat.catastralDesde.label"/>: </label></td>
					<td class="normal"><bean:write name="criRepCatAdapterVO" property="criRepCat.catastralDesde"/></td>
					<td><label>&nbsp;<bean:message bundle="pad" key="pad.criRepCat.catastralHasta.label"/>: </label></td>
					<td class="normal"><bean:write name="criRepCatAdapterVO" property="criRepCat.catastralHasta"/></td>
				</tr>	
				<tr>
					<td><label>&nbsp;<bean:message bundle="pad" key="pad.criRepCat.fechaDesde.label"/>: </label></td>
					<td class="normal"><bean:write name="criRepCatAdapterVO" property="criRepCat.fechaDesdeView"/></td>
					<td><label>&nbsp;<bean:message bundle="pad" key="pad.criRepCat.fechaHasta.label"/>: </label></td>
					<td class="normal"><bean:write name="criRepCatAdapterVO" property="criRepCat.fechaHastaView"/></td>
				</tr>		
			</table>
		</fieldset>
		<!-- Fin CriRepCat -->
	
		<table class="tablabotones" width="100%">
			<tr>				
				<td align="left">
	    			<html:button property="btnVolver"  styleClass="boton" onclick="submitForm('volver', '');">
						<bean:message bundle="base" key="abm.button.volver"/>
					</html:button>
				</td>
	   	    	<td align="right" width="50%">
					<logic:equal name="criRepCatAdapterVO" property="act" value="eliminar">
						<html:button property="btnAccionBase"  styleClass="boton" onclick="submitForm('eliminar', '');">
							<bean:message bundle="base" key="abm.button.eliminar"/>
						</html:button>
					</logic:equal>
					<logic:equal name="criRepCatAdapterVO" property="act" value="activar">
						<html:button property="btnAccionBase"  styleClass="boton" onclick="submitForm('activar', '');">
							<bean:message bundle="base" key="abm.button.activar"/>
						</html:button>
					</logic:equal>
					<logic:equal name="criRepCatAdapterVO" property="act" value="desactivar">
						<html:button property="btnAccionBase"  styleClass="boton" onclick="submitForm('desactivar', '');">
							<bean:message bundle="base" key="abm.button.desactivar"/>
						</html:button>
					</logic:equal>
	   	    	</td>
 			</tr>
		</table>
		<input type="hidden" name="method" value=""/>
		<input type="hidden" name="anonimo" value="<bean:write name="userSession" property="isAnonimoView"/>"/>
		<input type="hidden" name="urlReComenzar" value="<bean:write name="userSession" property="urlReComenzar"/>"/>

		<input type="hidden" name="selectedId" value=""/>
		<input type="hidden" name="isSubmittedForm" value="true"/>
		
		<!-- Inclusion del Codigo Javascript del Calendar-->
		<div id="calendarDiv" style="position:absolute;visibility:hidden;background-color:white;layer-background-color:white;"></div>
		
	</html:form>
	<!-- Fin Tabla que contiene todos los formularios -->