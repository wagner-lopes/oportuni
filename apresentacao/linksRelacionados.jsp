<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>

<f:subview id="linksRelacionados">
	<f:loadBundle basename="mensagens" var="msg" />
	<a4j:form>
		<h:panelGroup
			rendered="#{apresentacaoNavegacaoBean.linksRelacionados}">
			<t:div styleClass="cabecalhoSubView">
				<t:div styleClass="tituloSubView">
					<h:graphicImage styleClass="imagemTituloSubView"
						url="/images/link65.png"
						title="#{msg.principal_linksRelacionados}" />
					<h:outputText value="#{msg.principal_linksRelacionados}" />
				</t:div>
				<rich:separator height="3px"></rich:separator>
			</t:div>

			<h:outputLink value="http://lattes.cnpq.br/" target="_blank"
				styleClass="linkRelacionado">
				<h:outputText styleClass="texto" value="#{msg.principal_linksRelacionadosLattes}"></h:outputText>
			</h:outputLink>

			<h:outputLink value="http://www.cnpq.br/" target="_blank"
				styleClass="linkRelacionado">
				<h:outputText styleClass="texto" value="#{msg.principal_linksRelacionadosCNPq}"></h:outputText>
			</h:outputLink>

			<h:outputLink
				value="http://www.cnpq.br/programas/inct/_apresentacao/"
				target="_blank" styleClass="linkRelacionado">
				<h:outputText styleClass="texto" value="#{msg.principal_linksRelacionadosINCT}"></h:outputText>
			</h:outputLink>

			<h:outputLink
				value="http://www.fapemig.br/"
				target="_blank" styleClass="linkRelacionado">
				<h:outputText styleClass="texto" value="#{msg.principal_linksRelacionadosFAPEMIG}"></h:outputText>
			</h:outputLink>
			
			<rich:spacer height="500px"></rich:spacer>
		</h:panelGroup>
	</a4j:form>
</f:subview>
