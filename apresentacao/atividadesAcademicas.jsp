<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>

<f:subview id="atividadesAcademicas">
	<f:loadBundle basename="mensagens" var="msg" />
	<a4j:form>
		<h:panelGroup
			rendered="#{apresentacaoNavegacaoBean.atividadesAcademicas}">
			<t:div styleClass="cabecalhoSubView">
				<t:div styleClass="tituloSubView">
					<h:graphicImage styleClass="imagemTituloSubView"
						url="/images/atividadesAcademicas.png"
						title="#{msg.principal_linkAtAcademicas}" />
					<h:outputText value="#{msg.principal_linkAtividadesAcademicas}" />
				</t:div>
				<rich:separator height="3px"></rich:separator>
			</t:div>
			<t:div styleClass="textoExterno">
				
				<t:div styleClass="titulo">
					<t:outputText value="#{msg.principal_tituloProducaoConhecimento}"></t:outputText>
				</t:div>
				<t:div styleClass="corpoTexto">
					<t:outputText value="#{msg.principal_textoProducaoConhecimento}"></t:outputText>
				</t:div>
				
				<t:div styleClass="titulo">
					<t:outputText value="#{msg.principal_tituloIniciacaoCientifica}"></t:outputText>
				</t:div>
				<t:div styleClass="corpoTexto">
					<t:outputText value="#{msg.principal_textoIniciacaoCientifica}"></t:outputText>
				</t:div>
				
				<t:div styleClass="titulo">
					<t:outputText value="#{msg.principal_tituloMonitoria}"></t:outputText>
				</t:div>
				<t:div styleClass="corpoTexto">
					<t:outputText value="#{msg.principal_textoMonitoria}"></t:outputText>
				</t:div>
				
				<t:div styleClass="titulo">
					<t:outputText value="#{msg.principal_tituloEstagio}"></t:outputText>
				</t:div>
				<t:div styleClass="corpoTexto">
					<t:outputText value="#{msg.principal_textoEstagio}"></t:outputText>
				</t:div>
			
			</t:div>
		</h:panelGroup>
	</a4j:form>
</f:subview>
