<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>

<!-- Tabla que contiene todos los formularios -->
<html:form styleId="filter" action="/def/BuscarCodEmi.do">

	<!-- Mensajes y/o Advertencias -->
	<%@ include file="/base/warning.jsp" %>
	<!-- Errors  -->
	<html:errors bundle="base"/>

	<!-- Busqueda de Recuso -->
	<span id="blockBusqueda" style="display:none"> 
		<bean:define id="adapterVO" name="codEmiSearchPageVO"/>
		<bean:define id="poseeParam" value="false" />
		<%@ include file="/def/gravamen/includeRecursoSearch.jsp" %>
	</span>

	<span id="blockSimple" style="display:block">
		
		<h1><bean:message bundle="def" key="def.codEmiSearchPage.title"/></h1>	
			
		<table class="tablabotones" width="100%">
			<tr>
				<td align="left">
					<p>
						<logic:equal name="codEmiSearchPageVO" property="modoSeleccionar" value="true">
							<bean:message bundle="base" key="base.busquedaLegendBusqueda"/>
							<bean:message bundle="def" key="def.codEmi.label"/>
						</logic:equal>
						<logic:notEqual name="codEmiSearchPageVO" property="modoSeleccionar" value="true">
							<bean:message bundle="def" key="def.codEmiSearchPage.legend"/>
						</logic:notEqual>		
					</p>
				</td>				
				<td align="right">
		 			<html:button property="btnVolver"  styleClass="boton" onclick="submitForm('volver', '');">
						<bean:message bundle="base" key="abm.button.volver"/>
					</html:button>
				</td>
			</tr>
		</table>
			
		<!-- Filtro -->
		<fieldset>
		<legend><bean:message bundle="base" key="base.parametrosBusqueda"/></legend>
			<table class="tabladatos">
				<tr>
					<!-- Recurso -->
					<td><label><bean:message bundle="def" key="def.recurso.label"/>: </label></td>
					<td class="normal" colspan="4">
						<html:select name="codEmiSearchPageVO" property="codEmi.recurso.id" styleClass="select" styleId="cboRecurso" style="width:90%">
							<bean:define id="includeRecursoList" name="codEmiSearchPageVO" property="listRecurso"/>
							<bean:define id="includeIdRecursoSelected" name="codEmiSearchPageVO" property="codEmi.recurso.id"/>
							<%@ include file="/def/gravamen/includeRecurso.jsp" %>
						</html:select>
						
						<a onclick="toggleSearchRecurso('blockSimple', 'blockBusqueda'); setFocus('recursoFilter');" >
							<img title='<bean:message bundle="def" key="def.recurso.filtro.button.busqueda"/>' border="0" 
							src="<%=request.getContextPath()%>/images/iconos/lupita.gif" width="20" height="20">
						</a>
						
					</td>
				</tr>
	
				<tr>
					<!-- Tipo de Codigo -->	
					<td><label><bean:message bundle="def" key="def.codEmi.tipCodEmi.label"/>: </label></td>
					<td class="normal">
						<html:select name="codEmiSearchPageVO" property="codEmi.tipCodEmi.desTipCodEmi" styleClass="select">
							<html:optionsCollection name="codEmiSearchPageVO" property="listTipCodEmi" label="desTipCodEmi" value="id" />
						</html:select>
					</td>					
				</tr>
	
				<tr>
					<!-- Fecha Desde -->
					<td><label><bean:message bundle="def" key="def.codEmi.fechaDesde.label"/>: </label></td>
					<td class="normal">
						<html:text name="codEmiSearchPageVO" property="codEmi.fechaDesdeView" styleId="fechaDesdeView" size="15" maxlength="10" styleClass="datos" />
						<a class="link_siat" onclick="return show_calendar('fechaDesdeView');" id="a_fechaDesdeView">
							<img border="0" src="<%= request.getContextPath()%>/images/calendario.gif"/></a>
					</td>
					
					<!-- Fecha Hasta -->
					<td><label><bean:message bundle="def" key="def.codEmi.fechaHasta.label"/>: </label></td>
					<td class="normal">
						<html:text name="codEmiSearchPageVO" property="codEmi.fechaHastaView" styleId="fechaHastaView" size="15" maxlength="10" styleClass="datos" />
						<a class="link_siat" onclick="return show_calendar('fechaHastaView');" id="a_fechaHastaView">
							<img border="0" src="<%= request.getContextPath()%>/images/calendario.gif"/></a>
					</td>				
				</tr>
			</table>
				
			<p align="center">
			  	<html:button property="btnLimpiar"  styleClass="boton" onclick="submitForm('limpiar', '');">
					<bean:message bundle="base" key="abm.button.limpiar"/>
				</html:button>
				&nbsp;
			  	<html:button property="btnBuscar"  styleClass="boton" onclick="submitForm('buscar', '');">
					<bean:message bundle="base" key="abm.button.buscar"/>
				</html:button>
			</p>
		</fieldset>	
		<!-- Fin Filtro -->
			
		<!-- Resultado Filtro -->
		<div id="resultadoFiltro">
			<logic:equal name="codEmiSearchPageVO" property="viewResult" value="true">
				<logic:notEmpty  name="codEmiSearchPageVO" property="listResult">	
					<table class="tramonline" border="0" cellpadding="0" cellspacing="1" width="100%">
						<caption><bean:message bundle="base" key="base.resultadoBusqueda"/></caption>
		               	<tbody>
			               	<tr>
								<th width="1">&nbsp;</th> <!-- Ver/Seleccionar -->
								<logic:notEqual name="codEmiSearchPageVO" property="modoSeleccionar" value="true">
									<th width="1">&nbsp;</th> <!-- Modificar -->
									<th width="1">&nbsp;</th> <!-- Eliminar -->
									<th width="1">&nbsp;</th> <!-- Activar Desactivar -->
								</logic:notEqual>
								<th align="left"><bean:message bundle="def" key="def.codEmi.nombre.label"/></th>
								<th align="left"><bean:message bundle="def" key="def.codEmi.fechaDesde.label"/></th>
								<th align="left"><bean:message bundle="def" key="def.codEmi.fechaHasta.label"/></th>
								<th align="left"><bean:message bundle="base" key="base.estado.label"/></th>
							</tr>
								
							<logic:iterate id="CodEmiVO" name="codEmiSearchPageVO" property="listResult">
								<tr>
									<!-- Seleccionar -->
									<logic:equal name="codEmiSearchPageVO" property="modoSeleccionar" value="true">
										<td>	
											<a style="cursor: pointer; cursor: hand;" onclick="submitForm('seleccionar', '<bean:write name="CodEmiVO" property="id" bundle="base" formatKey="general.format.id"/>');">
												<img title="<bean:message bundle="base" key="abm.button.seleccionar"/>" border="0" src="<%=request.getContextPath()%>/images/iconos/selec0.gif"/>
											</a>
										</td>
									</logic:equal>									
									<logic:notEqual name="codEmiSearchPageVO" property="modoSeleccionar" value="true">
										<!-- Ver -->
										<td>
											<logic:equal name="codEmiSearchPageVO" property="verEnabled" value="enabled">									
												<a style="cursor: pointer; cursor: hand;" onclick="submitForm('ver', '<bean:write name="CodEmiVO" property="id" bundle="base" formatKey="general.format.id"/>');">
													<img title="<bean:message bundle="base" key="abm.button.ver"/>" border="0" src="<%=request.getContextPath()%>/images/iconos/selec0.gif"/>
												</a>
											</logic:equal>
											<logic:notEqual name="CodEmiVO" property="verEnabled" value="enabled">
												<img border="0" src="<%=request.getContextPath()%>/images/iconos/selec1.gif"/>
											</logic:notEqual>
										</td>	
										<!-- Modificar-->								
										<td>
											<logic:equal name="codEmiSearchPageVO" property="modificarEnabled" value="enabled">
												<logic:equal name="CodEmiVO" property="modificarEnabled" value="enabled">
													<a style="cursor: pointer; cursor: hand;" onclick="submitForm('modificar', '<bean:write name="CodEmiVO" property="id" bundle="base" formatKey="general.format.id"/>');">
														<img title="<bean:message bundle="base" key="abm.button.modificar"/>" border="0" src="<%=request.getContextPath()%>/images/iconos/modif0.gif"/>
													</a>
												</logic:equal>
												<logic:notEqual name="CodEmiVO" property="modificarEnabled" value="enabled">
													<img border="0" src="<%=request.getContextPath()%>/images/iconos/modif1.gif"/>
												</logic:notEqual>
											</logic:equal>
											<logic:notEqual name="codEmiSearchPageVO" property="modificarEnabled" value="enabled">
												<img border="0" src="<%=request.getContextPath()%>/images/iconos/modif1.gif"/>
											</logic:notEqual>
										</td>
		
										<!-- Eliminar-->								
										<td>
											<logic:equal name="codEmiSearchPageVO" property="eliminarEnabled" value="enabled">
												<logic:equal name="CodEmiVO" property="eliminarEnabled" value="enabled">
													<a style="cursor: pointer; cursor: hand;" onclick="submitForm('eliminar', '<bean:write name="CodEmiVO" property="id" bundle="base" formatKey="general.format.id"/>');">
														<img title="<bean:message bundle="base" key="abm.button.eliminar"/>" border="0" src="<%=request.getContextPath()%>/images/iconos/eliminar0.gif"/>
													</a>
												</logic:equal>	
												<logic:notEqual name="CodEmiVO" property="eliminarEnabled" value="enabled">
													<img border="0" src="<%=request.getContextPath()%>/images/iconos/eliminar1.gif"/>
												</logic:notEqual>
											</logic:equal>
											<logic:notEqual name="codEmiSearchPageVO" property="eliminarEnabled" value="enabled">										
												<img border="0" src="<%=request.getContextPath()%>/images/iconos/eliminar1.gif"/>
											</logic:notEqual>
										</td>
										<td>
											<!-- Activar -->
											<logic:equal name="CodEmiVO" property="estado.id" value="0">
												<logic:equal name="codEmiSearchPageVO" property="activarEnabled" value="enabled">
													<logic:equal name="CodEmiVO" property="activarEnabled" value="enabled">
														<a style="cursor: pointer; cursor: hand;" onclick="submitForm('activar', '<bean:write name="CodEmiVO" property="id" bundle="base" formatKey="general.format.id"/>');">
															<img title="<bean:message bundle="base" key="abm.button.activar"/>" border="0" src="<%=request.getContextPath()%>/images/iconos/activar0.gif"/>
														</a>
													</logic:equal> 
													<logic:notEqual name="CodEmiVO" property="activarEnabled" value="enabled">
														<img border="0" src="<%=request.getContextPath()%>/images/iconos/activar1.gif"/>
													</logic:notEqual>
												</logic:equal>
												<logic:notEqual name="codEmiSearchPageVO" property="activarEnabled" value="enabled">
													<img border="0" src="<%=request.getContextPath()%>/images/iconos/activar1.gif"/>
												</logic:notEqual>
											</logic:equal> 
											<!-- Desactivar -->
											<logic:equal name="CodEmiVO" property="estado.id" value="1">
												<logic:equal name="codEmiSearchPageVO" property="desactivarEnabled" value="enabled">
													<logic:equal name="CodEmiVO" property="desactivarEnabled" value="enabled">
														<a style="cursor: pointer; cursor: hand;" onclick="submitForm('desactivar', '<bean:write name="CodEmiVO" property="id" bundle="base" formatKey="general.format.id"/>');">
															<img title="<bean:message bundle="base" key="abm.button.desactivar"/>" border="0" src="<%=request.getContextPath()%>/images/iconos/desactivar0.gif"/>
														</a>
													</logic:equal>
													<logic:notEqual name="CodEmiVO" property="desactivarEnabled" value="enabled">
														<img border="0" src="<%=request.getContextPath()%>/images/iconos/desactivar1.gif"/>
													</logic:notEqual>
												</logic:equal>
												<logic:notEqual name="codEmiSearchPageVO" property="desactivarEnabled" value="enabled">
													<img border="0" src="<%=request.getContextPath()%>/images/iconos/desactivar1.gif"/>
												</logic:notEqual>										
											</logic:equal>
											<!-- En estado creado -->
											<logic:equal name="CodEmiVO" property="estado.id" value="-1">
												<a style="cursor: pointer; cursor: hand;">
												<img border="0" title="<bean:message bundle="base" key="abm.button.creado"/>" src="<%=request.getContextPath()%>/images/iconos/creado0.gif"/>
												</a>
											</logic:equal> 
										</td>
									</logic:notEqual>
									<td><bean:write name="CodEmiVO" property="nombre"/>&nbsp;</td>
									<td><bean:write name="CodEmiVO" property="fechaDesdeView"/>&nbsp;</td>
									<td><bean:write name="CodEmiVO" property="fechaHastaView"/>&nbsp;</td>
									<td><bean:write name="CodEmiVO" property="estado.value"/>&nbsp;</td>
								</tr>
							</logic:iterate>
					
							<tr>
								<td class="paginador" align="center" colspan="20">
									<bean:define id="pager" name="codEmiSearchPageVO"/>
									<%@ include file="/base/pager.jsp" %>
								</td>
							</tr>
							
						</tbody>
					</table>
				</logic:notEmpty>
				
				<logic:empty name="codEmiSearchPageVO" property="listResult">
					<table class="tramonline" border="0" cellpadding="0" cellspacing="1" width="100%">
						<caption><bean:message bundle="base" key="base.resultadoBusqueda"/></caption>
	                	<tbody>
							<tr><td align="center">
								<bean:message bundle="base" key="base.resultadoVacio"/>
							</td></tr>
						</tbody>			
					</table>
				</logic:empty>
			</logic:equal>			
		</div>
		<!-- Fin Resultado Filtro -->
	
		<table class="tablabotones" width="100%">
			<tr>				
				<td align="left" width="50%">
	    			<html:button property="btnVolver"  styleClass="boton" onclick="submitForm('volver', '');">
						<bean:message bundle="base" key="abm.button.volver"/>
					</html:button>
				</td>
				<logic:equal name="codEmiSearchPageVO" property="viewResult" value="true">
					<td align="right" width="50%">
	  	    			<logic:equal name="codEmiSearchPageVO" property="modoSeleccionar" value="false">
							<bean:define id="agregarEnabled" name="codEmiSearchPageVO" property="agregarEnabled"/>
							<input type="button" <%=agregarEnabled%> class="boton" 
								onClick="submitForm('agregar', '0');" 
								value="<bean:message bundle="base" key="abm.button.agregar"/>"/>
						</logic:equal>
	  	    			<logic:equal name="codEmiSearchPageVO" property="modoSeleccionar" value="true">
	  	    				<logic:equal name="codEmiSearchPageVO" property="agregarEnSeleccion" value="true">
								<bean:define id="agregarEnabled" name="codEmiSearchPageVO" property="agregarEnabled"/>
								<input type="button" <%=agregarEnabled%> class="boton" 
									onClick="submitForm('agregar', '0');" 
									value="<bean:message bundle="base" key="abm.button.agregar"/>"/>
								</logic:equal>
						</logic:equal>
					</td>				
				</logic:equal>
			</tr>
		</table>
		
	</span>
		
	<input type="hidden" name="method" value=""/>
    <input type="hidden" name="anonimo" value="<bean:write name="userSession" property="isAnonimoView"/>"/>
    <input type="hidden" name="urlReComenzar" value="<bean:write name="userSession" property="urlReComenzar"/>"/>

	<input type="hidden" name="selectedId" value=""/>
	<input type="hidden" name="pageNumber" value="1" id="pageNumber">
	<input type="hidden" name="pageMethod" value="buscar" id="pageMethod">
	<input type="hidden" name="isSubmittedForm" value="true"/>

	<!-- Inclusion del Codigo Javascript del Calendar-->
	<div id="calendarDiv" style="position:absolute;visibility:hidden;background-color:white;layer-background-color:white;"></div>		
</html:form>
<!-- Fin Tabla que contiene todos los formularios -->
<!-- codEmiSearchPage.jsp -->