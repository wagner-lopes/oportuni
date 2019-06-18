<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm"%>
<%@ taglib uri="http://stella.caelum.com.br/faces" prefix="stella"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<f:subview id="contato">
	<f:loadBundle basename="mensagens" var="msg" />

	<t:panelGroup id="pGroupContato">

		<rich:modalPanel id="mpContato" width="600" height="500">
			<f:facet name="header">
				<t:outputText value="#{msg.geral_contato}"></t:outputText>
			</f:facet>

			<!-- Box Mensagens -->
			<t:div id="avisos">
				<c:import url="../mensagens/mensagensBox.jsp"></c:import>
			</t:div>
			
			<!-- Texto cabecalho -->
			<t:div styleClass="textoInicialContatoInterno">
				<t:outputText value="#{msg.geral_contatoTextoInicial}"></t:outputText>
			</t:div>
			
			<h:form>
				<htm:table styleClass="contatoInterno">

					<!-- Nome -->
					<htm:tr styleClass="item">
						<htm:td styleClass="label">
							<t:outputText value="#{msg.geral_contatoNome}"></t:outputText>
						</htm:td>
						<htm:td>
							<t:inputText value="#{alunoContatoBean.nome}" maxlength="50"
								size="50"></t:inputText>
						</htm:td>
					</htm:tr>

					<!-- Email -->
					<htm:tr styleClass="item">
						<htm:td styleClass="label">
							<t:outputText value="#{msg.geral_contatoEmail}"></t:outputText>
						</htm:td>
						<htm:td>
							<t:inputText value="#{alunoContatoBean.email}" maxlength="40"
								size="40"></t:inputText>
						</htm:td>
					</htm:tr>

					<!-- Assunto -->
					<htm:tr styleClass="item">
						<htm:td styleClass="label">
							<t:outputText value="#{msg.geral_contatoAssunto}"></t:outputText>
						</htm:td>
						<htm:td>
							<t:inputText value="#{alunoContatoBean.assunto}" maxlength="84"
								size="84"></t:inputText>
						</htm:td>
					</htm:tr>

					<!-- Mensagem -->
					<htm:tr styleClass="item">
						<htm:td styleClass="label">
							<t:outputText value="#{msg.geral_contatoTexto}"></t:outputText>
						</htm:td>
						<htm:td>
							<t:inputTextarea cols="86" rows="15"
								value="#{alunoContatoBean.mensagem}"></t:inputTextarea>
						</htm:td>
					</htm:tr>
				</htm:table>
				
				<!-- Opcoes  -->
				<t:div styleClass="menuContatoInterno">
					<t:div styleClass="item">
						<a4j:commandButton value="Enviar"
							action="#{alunoContatoBean.enviarEmail}" reRender="avisos"></a4j:commandButton>
					</t:div>
					<t:div styleClass="item">
						<a4j:commandButton value="Fechar"
							onclick="Richfaces.hideModalPanel('mpContato');"
							reRender="mpContato"></a4j:commandButton>
					</t:div>
				</t:div>
			</h:form>
		</rich:modalPanel>

	</t:panelGroup>

</f:subview>
