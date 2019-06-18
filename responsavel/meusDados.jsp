<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>


<f:subview id="meusDadosResponsavel">
	<f:loadBundle basename="mensagens" var="msg" />

	<!-- Box Menu Opcoes -->
	<t:panelGroup id="pg_MeusDadosResponsavel"
		rendered="#{responsavelNavegacaoBean.meusDados}">
		<a4j:form>
			<!-- Cabecalho  -->
			<t:div styleClass="cabecalhoSubView">
				<t:div styleClass="tituloSubView">
					<h:graphicImage styleClass="imagemTituloSubView"
						url="/images/perfil45.png" title="#{msg.responsavel_linkMeusDados}" />
					<h:outputText value="#{msg.responsavel_linkMeusDados}" />
				</t:div>
				<rich:separator height="3px"></rich:separator>
			</t:div>

			<t:div id="barraMenuDadosPessoais">
				<t:div styleClass="roundedcornr_box">
					<t:div styleClass="roundedcornr_top">
						<t:div></t:div>
					</t:div>
					<t:div styleClass="roundedcornr_content">
						<!-- Botao desativado 
							<a4j:commandLink action="#{responsavelNavegacaoBean.voltar}"
								reRender="conteudoResponsavel">
								<t:graphicImage url="/images/voltar20.png"
									styleClass="iconeMenu" title="#{msg.geral_voltar}"></t:graphicImage>
							</a4j:commandLink>
							-->
						<a4j:commandLink
							action="#{responsavelDadosPessoaisBean.atualizarDadosPessoais}"
							reRender="pg_MeusDadosResponsavel">
							<h:graphicImage url="/images/salvar20.png"
								title="#{msg.geral_Salvar}" />
						</a4j:commandLink>
					</t:div>
					<t:div styleClass="roundedcornr_bottom">
						<t:div></t:div>
					</t:div>
				</t:div>
			</t:div>


			<!-- Box Mensagens -->
			<c:import url="../mensagens/mensagensBox.jsp"></c:import>

			<!-- Conteudo -->
			<t:div styleClass="dadosPessoais">

				<!-- Dados Principais -->
				<t:div styleClass="topicoCurriculo">
					<h:outputText value="#{msg.responsavel_dadosPrincipais}"></h:outputText>
				</t:div>


				<htm:table styleClass="table">

					<!-- Nome -->
					<htm:tr>
						<htm:td styleClass="tdLabel">
							<h:outputText styleClass="label1"
								value="#{msg.responsavel_dadosNome}"></h:outputText>
						</htm:td>
						<htm:td styleClass="tdConteudo">
							<h:inputText styleClass="texto2" size="50" maxlength="50"
								value="#{responsavelDadosPessoaisBean.loginResponsavel.responsavel.nome}">
							</h:inputText>
						</htm:td>
					</htm:tr>

					<!-- Email -->
					<htm:tr>
						<htm:td styleClass="tdLabel">
							<h:outputText styleClass="label1"
								value="#{msg.responsavel_dadosEmail}"></h:outputText>
						</htm:td>
						<htm:td styleClass="tdConteudo">
							<h:inputText styleClass="texto2" size="50" maxlength="50"
								value="#{responsavelDadosPessoaisBean.loginResponsavel.responsavel.email}">
							</h:inputText>

						</htm:td>
					</htm:tr>

				</htm:table>
				<rich:spacer height="10px"></rich:spacer>
			</t:div>
		</a4j:form>
	</t:panelGroup>
</f:subview>
