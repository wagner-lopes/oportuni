<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm"%>
<%@ taglib uri="http://stella.caelum.com.br/faces" prefix="stella"%>

<f:subview id="mensagens"
	rendered="#{not empty facesContext.maximumSeverity}">
	<f:loadBundle basename="mensagens" var="msg" />

	<!-- Mensagem Box Sucesso -->
	<t:panelGrid width="100%"
		rendered="#{oportuniMensagensBoxBean.msgSucesso}">
		<t:div styleClass="roundedcornr_box_sBorderGreen">
			<t:div styleClass="roundedcornr_top_sBorderGreen">
				<t:div></t:div>
			</t:div>
			<t:div styleClass="roundedcornr_content_sBorderGreen">
				<rich:messages layout="table" showSummary="true"
					styleClass="estiloMensagemGreen">
					<f:facet name="infoMarker">
						<h:graphicImage url="/images/sucesso16.png" styleClass="iconeMenu" />
					</f:facet>
				</rich:messages>
			</t:div>
			<t:div styleClass="roundedcornr_bottom_sBorderGreen">
				<t:div></t:div>
			</t:div>
		</t:div>
	</t:panelGrid>

	<!-- Mensagem Box Alerta -->
	<t:panelGrid width="100%"
		rendered="#{oportuniMensagensBoxBean.msgAlerta}">
		<t:div styleClass="roundedcornr_box_sBorderRed">
			<t:div styleClass="roundedcornr_top_sBorderRed">
				<t:div></t:div>
			</t:div>
			<t:div styleClass="roundedcornr_content_sBorderRed">

				<rich:messages layout="table" showSummary="true"
					styleClass="estiloMensagemRed">
					<f:facet name="errorMarker">
						<h:graphicImage url="/images/exclamacao16.png"
							styleClass="iconeMenu" />
					</f:facet>
				</rich:messages>

			</t:div>
			<t:div styleClass="roundedcornr_bottom_sBorderRed">
				<t:div></t:div>
			</t:div>
		</t:div>
	</t:panelGrid>

	<!-- Mensagem Box Alerta Segundo -->
	<t:panelGrid width="100%"
		rendered="#{oportuniMensagensBoxBean.msgAlertaSegundo}">
		<t:div styleClass="roundedcornr_box_sBorderRed">
			<t:div styleClass="roundedcornr_top_sBorderRed">
				<t:div></t:div>
			</t:div>
			<t:div styleClass="roundedcornr_content_sBorderRed">

				<rich:messages layout="table" showSummary="true"
					styleClass="estiloMensagemRed">
					<f:facet name="fatalMarker">
						<h:graphicImage url="/images/exclamacao16.png"
							styleClass="iconeMenu" />
					</f:facet>
				</rich:messages>

			</t:div>
			<t:div styleClass="roundedcornr_bottom_sBorderRed">
				<t:div></t:div>
			</t:div>
		</t:div>
	</t:panelGrid>
	
	<!-- Mensagem Box Aviso -->
	<t:panelGrid width="100%"
		rendered="#{oportuniMensagensBoxBean.msgAviso}">
		<t:div styleClass="roundedcornr_box_sBorderYellow">
			<t:div styleClass="roundedcornr_top_sBorderYellow">
				<t:div></t:div>
			</t:div>
			<t:div styleClass="roundedcornr_content_sBorderYellow">

				<rich:messages layout="table" showSummary="true"
					styleClass="estiloMensagemYellow">
					<f:facet name="warnMarker">
						<h:graphicImage url="/images/aviso20.png"
							styleClass="iconeMenu" />
					</f:facet>
				</rich:messages>

			</t:div>
			<t:div styleClass="roundedcornr_bottom_sBorderYellow">
				<t:div></t:div>
			</t:div>
		</t:div>
	</t:panelGrid>

</f:subview>