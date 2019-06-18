<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>

<f:subview id="oqueEhOportuni">
	<f:loadBundle basename="mensagens" var="msg" />
	<a4j:form>
		<h:panelGroup rendered="#{apresentacaoNavegacaoBean.OQueEhOportuni}">
			<t:div styleClass="cabecalhoSubView">
				<t:div styleClass="tituloSubView">
					<h:graphicImage styleClass="imagemTituloSubView"
						url="/images/oqueOportuni.png" title="#{msg.principal_linkOportuni}" />
					<h:outputText value="#{msg.principal_linkOportuni}" />
				</t:div>
				<rich:separator height="3px"></rich:separator>
			</t:div>
			<t:div styleClass="textoExterno">
				<t:div styleClass="titulo">
					<t:outputText value="#{msg.geral_Oportuni}"></t:outputText>
				</t:div>
				<t:div styleClass="corpoTexto">
					<t:outputText value="#{msg.principal_textoOqueEOportuni}"></t:outputText>
				</t:div>
			</t:div>
			<rich:spacer height="500px"></rich:spacer>
		</h:panelGroup>
	</a4j:form>
</f:subview>
