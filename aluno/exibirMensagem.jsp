<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm"%>
<%@ taglib uri="http://stella.caelum.com.br/faces" prefix="stella"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<f:subview id="exibirMensagens">
	<f:loadBundle basename="mensagens" var="msg" />

	<h:panelGroup rendered="#{alunoNavegacaoBean.exibirMensagem}"
		id="pgAlunoMensagem">
		<a4j:form>

			<!-- Cabecalho -->
			<t:div styleClass="cabecalhoSubView">
				<t:div styleClass="tituloSubView">
					<h:graphicImage styleClass="imagemTituloSubView"
						url="/images/envelopeFolha45.png" title="#{msg.geral_optDetalhes}" />
					<h:outputText value="#{msg.geral_optDetalhes}" />
				</t:div>
				<t:div>
					<rich:separator height="3px"></rich:separator>
				</t:div>
			</t:div>

			<!-- Menu do conteudo  Aluno Mensagens Detalhes-->
			<t:div id="menuMensagensDetalhes">
				<t:div styleClass="roundedcornr_box">
					<t:div styleClass="roundedcornr_top">
						<t:div></t:div>
					</t:div>
					<t:div styleClass="roundedcornr_content">

						<a4j:commandLink action="#{alunoNavegacaoBean.voltar}"
							reRender="conteudo">
							<t:graphicImage url="/images/voltar20.png" styleClass="iconeMenu"
								title="#{msg.geral_voltar}"></t:graphicImage>
						</a4j:commandLink>

						<a4j:commandLink styleClass="iconeMenu"
							action="#{alunoMensagensBean.excluirMensagemAlunoSelecionada}"
							onclick="if(!confirm('As mensagens selecionadas serão excluídas.')) {form.reset(); return false;}"
							actionListener="#{alunoNavegacaoBean.renderizarMensagens}"
							reRender="conteudo, boxMensagens">
							<t:graphicImage url="/images/excluir20.png" title="#{msg.geral_excluir}"></t:graphicImage>
						</a4j:commandLink>

					</t:div>
					<t:div styleClass="roundedcornr_bottom">
						<t:div></t:div>
					</t:div>
				</t:div>
			</t:div>

			<!-- Corpo Detalhe Mensagens Aluno -->
			<t:panelGrid>

				<!-- Assunto -->
				<t:div styleClass="itemMensagem">
					<h:outputText value="#{msg.geral_msgAssunto}:" styleClass="labelItemMensagem"></h:outputText>
					<h:outputText
						value="#{alunoMensagensBean.mensagemAlunoSelecionada.assunto}"
						styleClass="valorItemMensagem" />
				</t:div>

				<t:div styleClass="itemMensagem">
					<!-- Remetente -->
					<h:outputText value="#{msg.geral_msgRemetente}:" styleClass="labelItemMensagem"></h:outputText>
					<h:outputText
						value="#{alunoMensagensBean.mensagemAlunoSelecionada.remetente}"
						styleClass="valorItemMensagem"></h:outputText>

					<!-- Data -->
					<h:outputText value="#{msg.geral_msgData}:" styleClass="labelItemMensagem"></h:outputText>
					<h:outputText
						value="#{alunoMensagensBean.mensagemAlunoSelecionada.data}"
						styleClass="valorItemMensagem" />
				</t:div>

				<!-- Mensagem -->
				<t:div styleClass="itemMensagem">
					<h:outputText value="#{msg.geral_msgTexto}:	" styleClass="labelItemMensagem"></h:outputText>
					<rich:editor
						value="#{alunoMensagensBean.mensagemAlunoSelecionada.mensagem}"
						readonly="true" theme="advanced" width="720" height="320"></rich:editor>
					<f:param name="theme_advanced_buttons1" value="" />
					<f:param name="theme_advanced_buttons2" value="" />
					<f:param name="theme_advanced_buttons3" value="" />
				</t:div>
			</t:panelGrid>
		</a4j:form>

	</h:panelGroup>
</f:subview>