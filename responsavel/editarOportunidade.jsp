<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<f:subview id="editarOportunidadeResp">
	<f:loadBundle basename="mensagens" var="msg" />
	<h:panelGroup rendered="#{responsavelNavegacaoBean.editarOportunidade}"
		id="tudo">
		<a4j:loadScript src="../resources/price_format.js" />

		<t:div styleClass="cabecalhoSubView">
			<t:div styleClass="tituloSubView">
				<h:graphicImage url="/images/editar50.png"
					styleClass="imagemTituloSubView"
					title="#{msg.responsavel_editarOpt}" />
				<h:outputText value="#{msg.responsavel_editarOpt}" />
			</t:div>
			<t:div>
				<rich:separator height="3px"></rich:separator>
			</t:div>
		</t:div>
		<a4j:form>
			<t:div id="barraMenu">
				<t:div styleClass="roundedcornr_box">
					<t:div styleClass="roundedcornr_top">
						<t:div></t:div>
					</t:div>
					<t:div styleClass="roundedcornr_content">

						<a4j:commandLink action="#{responsavelNavegacaoBean.voltar}"
							onclick="if(!confirm('As alterações não salvas serão perdidas.')) {form.reset(); return false;}"
							actionListener="#{responsavelOportunidadesBean.voltarDaEdicaoSemSalvar}"
							reRender="conteudoResponsavel">
							<t:graphicImage url="/images/voltar20.png" styleClass="iconeMenu"
								title="#{msg.geral_voltar}"></t:graphicImage>
						</a4j:commandLink>

						<a4j:commandLink id="btAtualizar"
							action="#{responsavelOportunidadesBean.atualizaOportunidade}"
							reRender="conteudoResponsavel">
							<h:graphicImage url="/images/salvar25.png" styleClass="iconeMenu"
								title="#{msg.geral_Salvar}" />
						</a4j:commandLink>

					</t:div>
					<t:div styleClass="roundedcornr_bottom">
						<t:div></t:div>
					</t:div>
				</t:div>
			</t:div>

			<!--  Mensagens de erro e de sucesso -->
			<c:import url="../mensagens/mensagensBox.jsp"></c:import>

			<!--  Fim das mensagens -->


			<rich:spacer height="5px"></rich:spacer>

			<t:panelGrid columns="2" width="100%">
				<t:div id="nome">
					<rich:simpleTogglePanel label="#{msg.geral_optNome}"
						height="20px" style="text-align:center" switchType="client">
						<h:outputText value="* " styleClass="asterisco"></h:outputText>
						<t:inputText maxlength="30" size="35"
							value="#{responsavelOportunidadesBean.oportunidadeSelecionada.nome}"></t:inputText>
					</rich:simpleTogglePanel>
				</t:div>
			</t:panelGrid>

			<rich:spacer height="3px"></rich:spacer>

			<t:panelGrid columns="3" width="100%">
				<t:div id="tipo">
					<rich:simpleTogglePanel label="#{msg.geral_optTipo}"
						height="25px" style="text-align:center" switchType="client">
						<h:form>
							<h:outputText value="* " styleClass="asterisco"></h:outputText>
							<h:selectOneMenu
								value="#{responsavelOportunidadesBean.oportunidadeSelecionada.tipooportunidade.idtipopt}">
								<f:selectItems
									value="#{responsavelOportunidadeBB.tiposOportunidade}" />
							</h:selectOneMenu>
						</h:form>
					</rich:simpleTogglePanel>
				</t:div>

				<t:div id="remuneracao">
					<rich:simpleTogglePanel label="#{msg.geral_optRemuneracao}"
						switchType="client" height="25px" id="stp"
						styleClass="simpleTogglePanel">
						<a4j:form>
							<t:outputText value="R$ " ></t:outputText>
							<t:inputText id="remInput"
								value="#{responsavelOportunidadesBean.oportunidadeSelecionada.remuneracao}"
								onkeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
								maxlength="7" size="8">
								<rich:ajaxValidator event="onkeyup"></rich:ajaxValidator>
								<rich:jQuery selector="#remInput"
									query="priceFormat({prefix:'',centsSeparator:'.',thousandsSeparator:''})"
									timing="onload"></rich:jQuery>
							</t:inputText>
						</a4j:form>
					</rich:simpleTogglePanel>
				</t:div>

				<t:div id="periodo">
					<rich:simpleTogglePanel label="#{msg.geral_optPeriodo}"
						height="25px" styleClass="simpleTogglePanel" switchType="client">
						<h:outputText value="* " styleClass="asterisco"></h:outputText>
						<h:selectOneMenu
							value="#{responsavelOportunidadesBean.oportunidadeSelecionada.periodo}">
							<f:selectItems value="#{responsavelOportunidadeBB.periodos}" />
						</h:selectOneMenu>
					</rich:simpleTogglePanel>
				</t:div>
			</t:panelGrid>

			<rich:spacer height="3px"></rich:spacer>

			<t:panelGrid columns="1" width="100%">
				<t:div id="cursos">
					<rich:simpleTogglePanel label="#{msg.geral_optCursos}"
						styleClass="simpleTogglePanel" switchType="client">

						<t:div id="selecaoCursos" styleClass="menuCursoOportunidade">

							<!-- Nivel -->
							<h:outputText value="#{msg.geral_nivel}" styleClass="label"></h:outputText>
							<h:selectOneMenu id="listaNivelCurso" styleClass="box"
								value="#{responsavelOportunidadesBean.nivelCurso}">
								<f:selectItems
									value="#{responsavelOportunidadesBean.opcaoNivelCurso}" />
								<a4j:support event="onchange" reRender="listaCursos"></a4j:support>
							</h:selectOneMenu>

							<!-- Curso -->
							<h:outputText value="#{msg.geral_curso}" styleClass="label"></h:outputText>
							<h:selectOneMenu id="listaCursos" styleClass="box"
								value="#{responsavelOportunidadesBean.idNovoCurso}">
								<f:selectItems
									value="#{responsavelOportunidadesBean.opcaoCursos}" />
							</h:selectOneMenu>

							<!-- Incluir -->
							<a4j:commandLink
								action="#{responsavelOportunidadesBean.incluiCurso}"
								reRender="tabCursosOpt, selecaoCursos">
								<t:graphicImage url="/images/incluir_2_20.png"
									title="#{msg.geral_incluir}"></t:graphicImage>
							</a4j:commandLink>

						</t:div>


						<rich:spacer height="5px"></rich:spacer>

						<t:div id="tabCursosOpt">
							<rich:dataTable styleClass="dataTableCursoOportunidade"
								value="#{responsavelOportunidadesBean.cursos}"
								rendered="#{not empty responsavelOportunidadesBean.cursos}"
								var="curso" rowClasses="linha1, linha2">

								<rich:column styleClass="coluna">
									<a4j:commandLink reRender="tabCursosOpt, selecaoCursos"
										action="#{responsavelOportunidadesBean.excluiCurso}">
										<t:graphicImage url="/images/excluirX16.png"
											title="#{msg.geral_excluir}"></t:graphicImage>
										<f:setPropertyActionListener value="#{curso}"
											target="#{responsavelOportunidadesBean.novoCursoExcluido}" />
									</a4j:commandLink>
								</rich:column>

								<rich:column styleClass="coluna">
									<f:facet name="header">
										<h:outputText value="#{msg.geral_curso}" />
									</f:facet>
									<h:outputText value="#{curso.nome}"></h:outputText>
								</rich:column>

								<rich:column styleClass="coluna">
									<f:facet name="header">
										<h:outputText value="#{msg.geral_nivel}" />
									</f:facet>
									<h:outputText value="#{curso.nivel}"></h:outputText>
								</rich:column>

							</rich:dataTable>

							<t:div styleClass="mensageListaVazia"
								rendered="#{empty responsavelOportunidadesBean.cursos}">
								<t:graphicImage url="/images/aviso20.png" styleClass="imagem" />
								<h:outputText value="#{msg.geral_avisoSemCursos}"></h:outputText>
							</t:div>
							
						</t:div>

					</rich:simpleTogglePanel>
				</t:div>
			</t:panelGrid>

			<t:panelGrid columns="1" width="100%">
				<t:div id="descricao">
					<rich:simpleTogglePanel label="#{msg.geral_optDescricao}"
						style="text-align:center" switchType="client">
						<rich:editor
							value="#{responsavelOportunidadesBean.oportunidadeSelecionada.descricao}"
							width="692" height="400" theme="advanced">
							<f:param name="theme_advanced_buttons1"
								value="bold,italic,underline,separator,bullist,numlist,
                                        separator,undo,redo" />
							<f:param name="theme_advanced_buttons2" value="" />
							<f:param name="theme_advanced_buttons3" value="" />
							<f:param name="theme_advanced_toolbar_location" value="top" />
							<f:param name="theme_advanced_toolbar_align" value="left" />
						</rich:editor>
					</rich:simpleTogglePanel>
				</t:div>
			</t:panelGrid>
		</a4j:form>
		<rich:spacer height="3px"></rich:spacer>
	</h:panelGroup>

</f:subview>