<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm"%>

<f:subview id="novaOportunidade">
	<f:loadBundle basename="mensagens" var="msg" />
	<h:panelGroup rendered="#{responsavelNavegacaoBean.novaOportunidade}"
		id="nvOportunidade">
		<a4j:loadScript src="/resources/price_format.js" />

		<!-- Cabecalho  -->
		<t:div styleClass="cabecalhoSubView">
			<t:div styleClass="tituloSubView">
				<h:graphicImage styleClass="imagemTituloSubView"
					url="/images/novo45.png" title="#{msg.responsavel_novaOportunidade}" />
				<h:outputText value="#{msg.responsavel_novaOportunidade}" />
			</t:div>
			<rich:separator height="3px"></rich:separator>
		</t:div>


		<a4j:form>
			<t:div id="barraMenuNovaOportunidade">
				<t:div styleClass="roundedcornr_box">
					<t:div styleClass="roundedcornr_top">
						<t:div></t:div>
					</t:div>
					<t:div styleClass="roundedcornr_content">

						<a4j:commandLink action="#{responsavelNavegacaoBean.voltar}"
							onclick="if(!confirm('As informações alteradas não serão salvas.')) {form.reset(); return false;}"
							reRender="conteudoResponsavel">
							<t:graphicImage url="/images/voltar20.png" styleClass="iconeMenu"
								title="#{msg.geral_voltar}"></t:graphicImage>
						</a4j:commandLink>

						<a4j:commandLink id="salvarOportunidade"
							action="#{responsavelOportunidadesBean.salvaNovaOportunidade}"
							reRender="#{responsavelOportunidadesBean.resultado}">
							<h:graphicImage url="/images/salvar20.png"
								title="#{msg.geral_Salvar}" />
						</a4j:commandLink>

					</t:div>
					<t:div styleClass="roundedcornr_bottom">
						<t:div></t:div>
					</t:div>
				</t:div>
			</t:div>

			<!-- Mensagens Oportuni -->
			<c:import url="../mensagens/mensagensBox.jsp"></c:import>

			<!-- Nome da Oportunidade -->
			<rich:spacer height="5px"></rich:spacer>
			<t:panelGrid columns="1" width="100%">
				<t:div id="nome">
					<rich:simpleTogglePanel label="#{msg.geral_optNome}"
						height="20px" styleClass="simpleTogglePanel" switchType="client">
						<h:outputText value="* " styleClass="asterisco"></h:outputText>
						<t:inputText maxlength="30" size="35"
							value="#{responsavelOportunidadesBean.novaOportunidade.nome}">
						</t:inputText>
					</rich:simpleTogglePanel>
				</t:div>
			</t:panelGrid>

			<rich:spacer height="3px"></rich:spacer>

			<!-- Tipo e Remuneração da Oportunidade -->
			<t:panelGrid columns="3" width="100%">
				<t:div id="tipo">
					<rich:simpleTogglePanel label="#{msg.geral_optTipo}"
						height="25px" styleClass="simpleTogglePanel" switchType="client">
						<h:outputText value="* " styleClass="asterisco"></h:outputText>
						<h:selectOneMenu
							value="#{responsavelOportunidadesBean.novaOportunidade.tipooportunidade.idtipopt}">
							<f:selectItems
								value="#{responsavelOportunidadeBB.tiposOportunidade}" />
						</h:selectOneMenu>

					</rich:simpleTogglePanel>
				</t:div>

				<t:div id="remuneracaoNvOportunidade">
					<rich:simpleTogglePanel label="#{msg.geral_optRemuneracao}"
						switchType="client" height="25px" id="stp"
						styleClass="simpleTogglePanel">
						<t:outputText value="R$ "></t:outputText>
						<t:inputText id="remInputNvOpt"
							value="#{responsavelOportunidadesBean.novaOportunidade.remuneracao}"
							maxlength="7" size="8"
							onkeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
							<rich:ajaxValidator event="onkeyup"></rich:ajaxValidator>
							<rich:jQuery selector="#remInputNvOpt"
								query="priceFormat({prefix:'',centsSeparator:'.',thousandsSeparator:''})"
								timing="onload"></rich:jQuery>
						</t:inputText>

					</rich:simpleTogglePanel>
				</t:div>

				<t:div id="periodo">
					<rich:simpleTogglePanel label="#{msg.geral_optPeriodo}"
						height="25px" styleClass="simpleTogglePanel" switchType="client">
						<h:outputText value="* " styleClass="asterisco"></h:outputText>
						<h:selectOneMenu
							value="#{responsavelOportunidadesBean.novaOportunidade.periodo}">
							<f:selectItems value="#{responsavelOportunidadeBB.periodos}" />
						</h:selectOneMenu>
					</rich:simpleTogglePanel>
				</t:div>
			</t:panelGrid>

			<rich:spacer height="3px"></rich:spacer>

			<!-- Cursos relacionados aa Oportunidade -->
			<t:panelGrid columns="1" width="100%">
				<t:div id="cursos">
					<rich:simpleTogglePanel label="#{msg.geral_optCursos}"
						styleClass="simpleTogglePanel" switchType="client">

						<t:div id="comboCursos" styleClass="menuCursoOportunidade">
							<!-- Nivel -->
							<h:outputText value="#{msg.geral_nivel}:" styleClass="label"></h:outputText>
							<h:selectOneMenu id="listaNivelCurso" styleClass="box"
								value="#{responsavelOportunidadesBean.nivelCurso}">
								<f:selectItems
									value="#{responsavelOportunidadesBean.opcaoNivelCurso}" />
								<a4j:support event="onchange" reRender="listaCursos"></a4j:support>
							</h:selectOneMenu>

							<!-- Curso -->
							<h:outputText value="#{msg.geral_curso}:" styleClass="label"></h:outputText>
							<h:selectOneMenu id="listaCursos" styleClass="box"
								value="#{responsavelOportunidadesBean.idNovoCurso}">
								<f:selectItems
									value="#{responsavelOportunidadesBean.opcaoNovosCursos}" />
							</h:selectOneMenu>

							<!-- Incluir -->
							<a4j:commandLink
								action="#{responsavelOportunidadesBean.incluiNovoCurso}"
								reRender="tabNovosCursos, comboCursos">
								<t:graphicImage url="/images/incluir_2_20.png"
									title="#{msg.geral_incluir}"></t:graphicImage>
							</a4j:commandLink>
						</t:div>

						<t:div id="tabNovosCursos">
							<rich:dataTable styleClass="dataTableCursoOportunidade"
								value="#{responsavelOportunidadesBean.novosCursos}" var="curso"
								rendered="#{not empty responsavelOportunidadesBean.novosCursos}"
								rowClasses="linha1, linha2">

								<!-- Excluir -->
								<rich:column styleClass="coluna">
									<a4j:commandLink reRender="tabNovosCursos, comboCursos"
										action="#{responsavelOportunidadesBean.excluiNovoCurso}">
										<t:graphicImage url="/images/excluirX16.png"
											title="#{msg.geral_excluir}"></t:graphicImage>
										<f:setPropertyActionListener value="#{curso}"
											target="#{responsavelOportunidadesBean.novoCursoExcluido}" />
									</a4j:commandLink>
								</rich:column>

								<!-- Curso -->
								<rich:column styleClass="coluna">
									<f:facet name="header">
										<h:outputText value="#{msg.geral_curso}" />
									</f:facet>
									<h:outputText value="#{curso.nome}" styleClass="fonteTexto1"></h:outputText>
								</rich:column>

								<!-- Nivel -->
								<rich:column styleClass="coluna">
									<f:facet name="header">
										<h:outputText value="#{msg.geral_nivel}" />
									</f:facet>
									<h:outputText value="#{curso.nivel}" styleClass="fonteTexto1"></h:outputText>
								</rich:column>

							</rich:dataTable>
							<t:div styleClass="mensageListaVazia"
								rendered="#{empty responsavelOportunidadesBean.novosCursos}">
								<t:graphicImage url="/images/aviso20.png" styleClass="imagem" />
								<h:outputText value="#{msg.geral_avisoSemCursos}"></h:outputText>
							</t:div>
						</t:div>
					</rich:simpleTogglePanel>
				</t:div>
			</t:panelGrid>

			<rich:spacer height="3px"></rich:spacer>

			<!-- Descrição da Oportunidade -->
			<t:panelGrid columns="1" width="100%">
				<t:div id="descricao">
					<rich:simpleTogglePanel label="#{msg.geral_optDescricao}"
						styleClass="simpleTogglePanel" switchType="client">
						<rich:editor
							value="#{responsavelOportunidadesBean.novaOportunidade.descricao}"
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
	</h:panelGroup>

</f:subview>
