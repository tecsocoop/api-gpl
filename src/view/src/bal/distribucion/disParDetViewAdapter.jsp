<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>

<script type="text/javascript" language="javascript">			   
   	    <%@include file="/base/submitForm.js"%>	 
</script>

	<!-- Tabla que contiene todos los formularios -->
	<html:form styleId="filter" action="/bal/AdministrarDisParDet.do">
	
		<!-- Mensajes y/o Advertencias -->
		<%@ include file="/base/warning.jsp" %>
		<!-- Errors  -->
		<html:errors bundle="base"/>
		
		<h1><bean:message bundle="bal" key="bal.disParAdapter.title"/></h1>		
		<table class="tablabotones" width="100%">
			<tr>			
				<td align="right">
	    			<html:button property="btnVolver"  styleClass="boton" onclick="submitForm('volver', '');">
						<bean:message bundle="base" key="abm.button.volver"/>
					</html:button>
				</td>
			</tr>
		</table>
	
		<!-- DisParDet -->
		<fieldset>
			<legend><bean:message bundle="bal" key="bal.disParDet.title"/></legend>			
			<table class="tabladatos">
				<tr>
					<!-- Recurso -->		
					<td><label>&nbsp;<bean:message bundle="def" key="def.recurso.label"/>: </label></td>
					<td class="normal"><bean:write name="disParDetAdapterVO" property="disParDet.disPar.recurso.desRecurso"/></td>
				</tr>
				<tr>
					<!-- DesDisPar -->		
					<td><label>&nbsp;<bean:message bundle="bal" key="bal.disPar.desDisPar.label"/>: </label></td>
					<td class="normal"><bean:write name="disParDetAdapterVO" property="disParDet.disPar.desDisPar"/></td>
				</tr>
				<tr>
					<td><label>&nbsp;<bean:message bundle="bal" key="bal.tipoImporte.label"/>: </label></td>
					<td class="normal"><bean:write name="disParDetAdapterVO" property="disParDet.tipoImporte.desTipoImporte"/></td>
				</tr>	
				<tr>
					<td><label>&nbsp;<bean:message bundle="def" key="def.recCon.label"/>: </label></td>
					<td class="normal"><bean:write name="disParDetAdapterVO" property="disParDet.recCon.desRecCon"/></td>
				</tr>		
				<tr>
					<td><label>&nbsp;<bean:message bundle="bal" key="bal.disParDet.partida.label"/>: </label></td>
					<td class="normal"><bean:write name="disParDetAdapterVO" property="disParDet.partida.desPartidaView"/></td>				
					<logic:equal name="disParDetAdapterVO" property="paramRecNoTrib" value="true">
						<td><label>&nbsp;<bean:message bundle="bal" key="bal.disParDet.esEjeAct.label"/>: </label></td>
						<td class="normal"><bean:write name="disParDetAdapterVO" property="disParDet.esEjeAct.value"/></td>		
					</logic:equal>
				</tr>
				<tr>
					<td><label>&nbsp;<bean:message bundle="bal" key="bal.disParDet.porcentaje.label"/>: </label></td>
					<td class="normal"><bean:write name="disParDetAdapterVO" property="disParDet.porcentajeView"/></td>
				</tr>	
				<tr>
					<td><label>&nbsp;<bean:message bundle="bal" key="bal.disParDet.fechaDesde.label"/>: </label></td>
					<td class="normal"><bean:write name="disParDetAdapterVO" property="disParDet.fechaDesdeView"/></td>
					<td><label>&nbsp;<bean:message bundle="bal" key="bal.disParDet.fechaHasta.label"/>: </label></td>
					<td class="normal"><bean:write name="disParDetAdapterVO" property="disParDet.fechaHastaView"/></td>
				</tr>		
			</table>
		</fieldset>
		<!-- Fin DisParDet -->
	
		<table class="tablabotones" width="100%">
			<tr>				
				<td align="left">
	    			<html:button property="btnVolver"  styleClass="boton" onclick="submitForm('volver', '');">
						<bean:message bundle="base" key="abm.button.volver"/>
					</html:button>
				</td>
	   	    	<td align="right" width="50%">
					<logic:equal name="disParDetAdapterVO" property="act" value="eliminar">
						<html:button property="btnAccionBase"  styleClass="boton" onclick="submitForm('eliminar', '');">
							<bean:message bundle="base" key="abm.button.eliminar"/>
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