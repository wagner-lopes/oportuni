<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm"%>
<%@ taglib uri="http://stella.caelum.com.br/faces" prefix="stella"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<f:subview id="mensagens">
	<f:loadBundle basename="mensagens" var="msg" />

	<h:panelGroup rendered="#{alunoNavegacaoBean.mensagens}"
		id="pgAlunoMensagem">
		<a4j:form>
			<!-- Cabecalho Aluno Mensagens -->
			<t:div styleClass="cabecalhoSubView">
				<t:div styleClass="tituloSubView">
					<h:graphicImage styleClass="imagemTituloSubView"
						url="/images/mensagem45.png" title="#{msg.aluno_mensagens}" />
					<h:outputText value="#{msg.aluno_mensagens}" />
				</t:div>
				<rich:separator height="3px"></rich:separator>
			</t:div>

			<!-- Box Mensagens Aluno -->
			<c:import url="../mensagens/mensagensBox.jsp"></c:import>

			<!-- Menu do conteudo Aluno Mensagens-->
			<t:div id="menuMensagens"
				rendered="#{not empty alunoMensagensBean.listMensagensAluno}">
				<t:div styleClass="roundedcornr_box">
					<t:div styleClass="roundedcornr_top">
						<t:div></t:div>
					</t:div>
					<t:div styleClass="roundedcornr_content">
						<!-- Botao desativado
						<a4j:commandLink styleClass="iconeMenu"
							action="#{alunoMensagensBean.exibirDetalhesMensagemAlunoSelecionada}"
							reRender="conteudo, boxMensagens">
							<t:graphicImage url="/images/detalhe20.png" title="Detalhes"></t:graphicImage>
						</a4j:commandLink>
 						-->
						<!-- Botao desativado 
 						<a4j:commandLink action="#{alunoNavegacaoBean.voltar}"
							reRender="conteudo">
							<t:graphicImage url="/images/voltar20.png" styleClass="iconeMenu"
								title="#{msg.geral_voltar}"></t:graphicImage>
						</a4j:commandLink>
 						-->
						<a4j:commandLink styleClass="iconeMenu"
							rendered="#{alunoMensagensBean.botaoExcluir}"
							action="#{alunoMensagensBean.excluirMensagemAluno}"
							onclick="if(!confirm('As mensagens selecionadas serão excluídas.')) {form.reset(); return false;}"
							reRender="conteudo, boxMensagens, listaMensagemAluno, menuMensagens">
							<t:graphicImage url="/images/excluir20.png" title="#{msg.geral_excluir}"></t:graphicImage>
						</a4j:commandLink>

						<t:graphicImage styleClass="iconeMenu"
							url="/images/excluir20desabilitado.png"
							title="#{msg.aluno_avisoExcluirMensagem}"
							rendered="#{not alunoMensagensBean.botaoExcluir}"></t:graphicImage>

					</t:div>
					<t:div styleClass="roundedcornr_bottom">
						<t:div></t:div>
					</t:div>
				</t:div>
			</t:div>



			<!-- Lista Mensagens Aluno -->

			<t:div id="listaMensagemAluno">
				<rich:dataTable id="dtMensagensAluno"
					value="#{alunoMensagensBean.listMensagensAluno}" var="msgAluno"
					rendered="#{not empty alunoMensagensBean.listMensagensAluno}"
					rows="10" styleClass="dataTableCaixaMensagens">

					<!-- CheckBox -->
					<rich:column styleClass="coluna" width="5%">
					
						<f:facet name="header">
								<h:graphicImage url="/images/selecionar20.png"
									title="#{msg.geral_selecionarDeselecionar}">
									<a4j:support event="onclick"
										action="#{alunoMensagensBean.selecionarDeselecionarTodosCheckBox}"
										reRender="listaMensagemAluno, menuMensagens"></a4j:support>
								</h:graphicImage>
							</f:facet>
							
						<h:selectBooleanCheckbox id="cbMensagemAluno"
							value="#{alunoMensagensBean.lcbMensagensAluno[msgAluno.idmensagemaluno]}">
							<a4j:support event="onclick" reRender="menuMensagens"></a4j:support>
						</h:selectBooleanCheckbox>
					</rich:column>

					<!-- Imagem Status Leitura -->
					<rich:column styleClass="coluna" width="10%">
						<h:graphicImage url="#{msgAluno.imagemStatusLeitura}" />
					</rich:column>

					<!-- Assunto -->
					<rich:column width="50%" styleClass="coluna"
						sortBy="#{msgAluno.assunto}">
						<f:facet name="header">
							<h:outputText value="#{msg.geral_contatoAssunto}" />
						</f:facet>
						<a4j:commandLink
							action="#{alunoMensagensBean.setarMensagemAlunoSelecionadaComoLida}"
							actionListener="#{alunoNavegacaoBean.renderizarExibirMensagem}"
							reRender="conteudo, boxMensagens"
							styleClass="#{msgAluno.styleStatusLeitura}">
							<h:outputText value="#{msgAluno.assunto}"></h:outputText>
							<f:setPropertyActionListener value="#{msgAluno}"
								target="#{alunoMensagensBean.mensagemAlunoSelecionada}"></f:setPropertyActionListener>
						</a4j:commandLink>
					</rich:column>


					<!-- Data -->
					<rich:column styleClass="coluna" sortBy="#{msgAluno.data}"
						sortOrder="DESCENDING">
						<f:facet name="header">
							<h:outputText value="#{msg.geral_data}" />
						</f:facet>
						<h:outputText value="#{msgAluno.data}"
							styleClass="#{msgAluno.styleStatusLeitura}"></h:outputText>
					</rich:column>

				</rich:dataTable>
				<rich:datascroller for="dtMensagensAluno" maxPages="2"
					rendered="#{not empty alunoMensagensBean.listMensagensAluno}"></rich:datascroller>

				<!-- Mensagem lista vazia -->
				<t:div styleClass="mensageListaVazia"
					rendered="#{empty alunoMensagensBean.listMensagensAluno}">
					<t:graphicImage url="/images/aviso20.png" styleClass="imagem" />
					<h:outputText value="#{msg.aluno_avisoSemMensagem}"></h:outputText>
				</t:div>

			</t:div>
		</a4j:form>
	</h:panelGroup>
</f:subview>