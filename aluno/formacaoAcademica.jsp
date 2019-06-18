<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm"%>
<%@ taglib uri="http://stella.caelum.com.br/faces" prefix="stella"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<f:subview id="curriculoFormacaoAcademica">
	<f:loadBundle basename="mensagens" var="msg" />

	<!-- Formacao Academica Atual -->
	<t:panelGroup id="pGroupFormacaoAcademica">

		<t:div id="corpoFormacaoAcademicaAtual">
			<a4j:form>
				<t:div styleClass="topicoCurriculo">
					<h:outputText value="#{msg.geral_curriculoFormAcademicaAtual}"></h:outputText>
				</t:div>

				<!-- Box Mensagens -->
				<t:div id="boxFormAcAtual">
					<c:import url="../mensagens/mensagensBox.jsp"></c:import>
				</t:div>

				<!-- Menu do conteudo Formacao Academica Atual-->
				<t:div styleClass="roundedcornr_box">
					<t:div styleClass="roundedcornr_top">
						<t:div></t:div>
					</t:div>
					<t:div styleClass="roundedcornr_content">

						<a4j:commandLink reRender="corpoFormacaoAcademicaAtual"
							action="#{alunoFormacaoAcademicaBean.atualizarFormacaoAcademicaAtual}">
							<h:graphicImage styleClass="iconeMenu" url="/images/salvar20.png"
								title="#{msg.geral_Salvar}" />
						</a4j:commandLink>

					</t:div>
					<t:div styleClass="roundedcornr_bottom">
						<t:div></t:div>
					</t:div>
				</t:div>

				<!-- Corpo Formacao Academica Atual-->
				<t:div styleClass="itemCurriculoFormAcAtual">
					<h:outputText styleClass="labelItemCurriculoFormAcAtual"
						value="#{msg.geral_alunoCurso}:"></h:outputText>
					<h:outputText styleClass="conteudoItemCurriculoFormAcAtual"
						value="#{alunoFormacaoAcademicaBean.cursoAluno.nome}">
					</h:outputText>
				</t:div>


				<t:div styleClass="itemCurriculoFormAcAtual">
					<h:outputText styleClass="labelItemCurriculoFormAcAtual"
						value="#{msg.geral_nivel}:"></h:outputText>
					<h:outputText styleClass="conteudoItemCurriculoFormAcAtual"
						value="#{alunoFormacaoAcademicaBean.cursoAluno.nivel}">
					</h:outputText>
				</t:div>

				<t:div styleClass="itemCurriculoFormAcAtual">
					<h:outputText styleClass="labelItemCurriculoFormAcAtual"
						value="#{msg.geral_alunoPeriodo}:"></h:outputText>
					<h:selectOneMenu styleClass="conteudoItemCurriculoFormAcAtual"
						value="#{alunoFormacaoAcademicaBean.loginAluno.aluno.periodo}">
						<f:selectItems value="#{alunoFormacaoAcademicaBean.opcaoPeriodo}" />
					</h:selectOneMenu>
				</t:div>

			</a4j:form>
		</t:div>

		<!-- Formacoes Academica Anteriores -->
		<t:div id="corpoFormacaoAcademicaAnterior">
			<a4j:form>
				<t:div styleClass="topicoCurriculo">
					<h:outputText value="#{msg.geral_curriculoFormAcademicaAnterior}"></h:outputText>
				</t:div>

				<!-- Box Mensagens -->
				<t:div id="boxFormAcAnt">
					<c:import url="../mensagens/mensagensBox.jsp"></c:import>
				</t:div>

				<!-----------------Box Incluir Formacao Academica  Anterior ------------------>
				<t:div id="boxIncluirFormacaoAcademicaAnterior"
					rendered="#{alunoFormacaoAcademicaBean.boxIncluirFormacaoAnterior}">
					<t:div styleClass="roundedcornr_box_sBorderHeaderBlue">
						<t:div styleClass="roundedcornr_top_sBorderHeaderBlue">
							<t:div></t:div>
						</t:div>
						<t:div styleClass="roundedcornr_content_sBorderHeaderBlue">

							<!-- Cabecalho -->
							<t:div styleClass="header">
								<h:outputText value="#{msg.aluno_curriculoIncluirFormAcademica}"></h:outputText>
							</t:div>

							<!-- Menu -->
							<a4j:commandLink reRender="corpoFormacaoAcademicaAnterior"
								action="#{alunoFormacaoAcademicaBean.desrenderizarBoxIncluirFormacaoAnterior}"
								onclick="if(!confirm('As alterações não salvas serão descartadas!')) {form.reset(); return false;}"
								actionListener="#{alunoFormacaoAcademicaBean.limparLcbFormAcAnt}">
								<h:graphicImage styleClass="iconeMenu"
									url="/images/voltar20.png" title="#{msg.geral_voltar}" />
							</a4j:commandLink>

							<a4j:commandLink reRender="corpoFormacaoAcademicaAnterior"
								action="#{alunoFormacaoAcademicaBean.salvarNovaFormacaoAcademicaAnterior}"
								actionListener="#{alunoFormacaoAcademicaBean.limparLcbFormAcAnt}">
								<t:graphicImage styleClass="iconeMenu"
									url="/images/salvar20.png" title="#{msg.geral_Salvar}" />
							</a4j:commandLink>

							<!-- Corpo -->
							<t:div styleClass="corpo">
								<htm:table styleClass="conjuntoAtributos">
									<htm:tr styleClass="atributo">
										<htm:td>
											<h:outputText styleClass="label1"
												value="#{msg.geral_nivel}: "></h:outputText>
										</htm:td>
										<htm:td>
											<h:selectOneMenu styleClass="texto1"
												value="#{alunoFormacaoAcademicaBean.nivelCursoFormAnt}">
												<f:selectItems
													value="#{alunoFormacaoAcademicaBean.opcaoNivelCurso}" />
												<a4j:support event="onchange" reRender="incluirPgCursos"></a4j:support>
											</h:selectOneMenu>
										</htm:td>
									</htm:tr>

									<htm:tr styleClass="atributo" id="incluirPgCursos">
										<htm:td>
											<h:outputText styleClass="label1"
												value="#{msg.geral_alunoCurso}"></h:outputText>
										</htm:td>
										<htm:td>

											<h:selectOneMenu styleClass="texto1"
												value="#{alunoFormacaoAcademicaBean.idCursoFormAnt}">
												<f:selectItems
													value="#{alunoFormacaoAcademicaBean.opcaoCurso}" />
											</h:selectOneMenu>
										</htm:td>
									</htm:tr>

									<htm:tr styleClass="atributo">
										<htm:td>
											<h:outputText styleClass="label1"
												value="#{msg.geral_curriculoFormAcademicaAnteriorAnoInicio}: "></h:outputText>
										</htm:td>
										<htm:td>
											<rich:inputNumberSlider minValue="1950" maxValue="2010"
												value="#{alunoFormacaoAcademicaBean.novaFormAnt.anoinicio}">
											</rich:inputNumberSlider>
										</htm:td>
									</htm:tr>

									<htm:tr styleClass="atributo">
										<htm:td>
											<h:outputText styleClass="label1"
												value="#{msg.geral_curriculoFormAcademicaAnteriorAnoFim}: "></h:outputText>
										</htm:td>
										<htm:td>
											<rich:inputNumberSlider minValue="1950" maxValue="2010"
												value="#{alunoFormacaoAcademicaBean.novaFormAnt.anofim}">
											</rich:inputNumberSlider>
										</htm:td>
									</htm:tr>

									<htm:tr styleClass="atributo">
										<htm:td>
											<h:outputText styleClass="label1"
												value="#{msg.geral_curriculoFormAcademicaAnteriorUniversidade}: "></h:outputText>
										</htm:td>
										<htm:td>
											<h:inputText styleClass="texto1"
												value="#{alunoFormacaoAcademicaBean.novaFormAnt.universidade}">
											</h:inputText>
										</htm:td>
									</htm:tr>
								</htm:table>
							</t:div>

						</t:div>
						<t:div styleClass="roundedcornr_bottom_sBorderHeaderBlue">
							<t:div></t:div>
						</t:div>
					</t:div>
				</t:div>

				<!-----------------Box Editar Formacao Academica  Anterior ------------------>
				<t:div id="boxEditarFormacaoAcademicaAnterior"
					rendered="#{alunoFormacaoAcademicaBean.boxEditarFormacaoAnterior}">
					<t:div styleClass="roundedcornr_box_sBorderHeaderBlue">
						<t:div styleClass="roundedcornr_top_sBorderHeaderBlue">
							<t:div></t:div>
						</t:div>
						<t:div styleClass="roundedcornr_content_sBorderHeaderBlue">


							<!-- Cabecalho -->
							<t:div styleClass="header">
								<h:outputText value="#{msg.aluno_curriculoEditarFormAcademica}"></h:outputText>
							</t:div>

							<!-- Menu -->
							<a4j:commandLink reRender="corpoFormacaoAcademicaAnterior"
								action="#{alunoFormacaoAcademicaBean.desrenderizarBoxEditarFormacaoAnterior}"
								onclick="if(!confirm('As alterações não salvas serão descartadas!')) {form.reset(); return false;}"
								actionListener="#{alunoFormacaoAcademicaBean.limparLcbFormAcAnt}">
								<h:graphicImage styleClass="iconeMenu"
									url="/images/voltar20.png" title="#{msg.geral_voltar}" />
							</a4j:commandLink>

							<a4j:commandLink reRender="corpoFormacaoAcademicaAnterior"
								action="#{alunoFormacaoAcademicaBean.atualizarFormacaoAcademicaAnterior}">
								<t:graphicImage styleClass="iconeMenu"
									url="/images/salvar20.png" title="#{msg.geral_Salvar}" />
							</a4j:commandLink>

							<!-- Corpo -->
							<t:div styleClass="corpo">
								<htm:table styleClass="conjuntoAtributos">
									<htm:tr styleClass="atributo">
										<htm:td>
											<h:outputText styleClass="label1" value="#{msg.geral_nivel}"></h:outputText>
										</htm:td>
										<htm:td>
											<h:selectOneMenu styleClass="texto1"
												value="#{alunoFormacaoAcademicaBean.nivelCursoFormAnt}">
												<f:selectItems
													value="#{alunoFormacaoAcademicaBean.opcaoNivelCurso}" />
												<a4j:support event="onchange" reRender="editarPgCursos"></a4j:support>
											</h:selectOneMenu>
										</htm:td>
									</htm:tr>

									<htm:tr styleClass="atributo" id="editarPgCursos">
										<htm:td>
											<h:outputText styleClass="label1"
												value="#{msg.geral_alunoCurso}"></h:outputText>
										</htm:td>
										<htm:td>
											<h:selectOneMenu styleClass="texto1"
												value="#{alunoFormacaoAcademicaBean.formacaoAcademicaAnteriorSelecionada.curso.idcurso}">
												<f:selectItems
													value="#{alunoFormacaoAcademicaBean.opcaoCurso}" />
											</h:selectOneMenu>
										</htm:td>
									</htm:tr>

									<htm:tr styleClass="atributo">
										<htm:td>
											<h:outputText styleClass="label1"
												value="#{msg.geral_curriculoFormAcademicaAnteriorAnoInicio}"></h:outputText>
										</htm:td>
										<htm:td>
											<rich:inputNumberSlider minValue="1950" maxValue="2010"
												value="#{alunoFormacaoAcademicaBean.formacaoAcademicaAnteriorSelecionada.anoinicio}">
											</rich:inputNumberSlider>
										</htm:td>
									</htm:tr>

									<htm:tr styleClass="atributo">
										<htm:td>
											<h:outputText styleClass="label1"
												value="#{msg.geral_curriculoFormAcademicaAnteriorAnoFim}"></h:outputText>
										</htm:td>
										<htm:td>
											<rich:inputNumberSlider minValue="1950" maxValue="2010"
												value="#{alunoFormacaoAcademicaBean.formacaoAcademicaAnteriorSelecionada.anofim}">
											</rich:inputNumberSlider>
										</htm:td>
									</htm:tr>

									<htm:tr styleClass="atributo">
										<htm:td>
											<h:outputText styleClass="label1"
												value="#{msg.geral_curriculoFormAcademicaAnteriorUniversidade}"></h:outputText>
										</htm:td>
										<htm:td>
											<h:inputText styleClass="texto1"
												value="#{alunoFormacaoAcademicaBean.formacaoAcademicaAnteriorSelecionada.universidade}">
											</h:inputText>
										</htm:td>
									</htm:tr>
								</htm:table>
							</t:div>

						</t:div>
						<t:div styleClass="roundedcornr_bottom_sBorderHeaderBlue">
							<t:div></t:div>
						</t:div>
					</t:div>
				</t:div>

				<!-- Corpo principal Formacao Academica Anterior-->
				<t:div id="corpoPrincipalFormacaoAcademicaAnterior"
					rendered="#{not (alunoFormacaoAcademicaBean.boxIncluirFormacaoAnterior or alunoFormacaoAcademicaBean.boxEditarFormacaoAnterior)}">

					<!-- Menu do conteudo Formações Academica Anteriores-->
					<t:div styleClass="roundedcornr_box">
						<t:div styleClass="roundedcornr_top">
							<t:div></t:div>
						</t:div>
						<t:div styleClass="roundedcornr_content">

							<a4j:commandLink reRender="corpoFormacaoAcademicaAnterior"
								action="#{alunoFormacaoAcademicaBean.incluirFormacaoAcademicaAnterior}">
								<h:graphicImage styleClass="iconeMenu" url="/images/novo20.png"
									title="#{msg.geral_incluir}" />
							</a4j:commandLink>

							<a4j:commandLink
								rendered="#{alunoFormacaoAcademicaBean.botaoEditar}"
								action="#{alunoFormacaoAcademicaBean.editarFormacaoAcademicaAnterior}"
								reRender="corpoFormacaoAcademicaAnterior">
								<t:graphicImage styleClass="iconeMenu"
									url="/images/editar20.png" title="#{msg.geral_editar}"></t:graphicImage>
							</a4j:commandLink>

							<t:graphicImage styleClass="iconeMenu"
								url="/images/editar20desabilitado.png"
								title="#{msg.aluno_curriculoAvisoSelecionarFormAcademicaEditar}"
								rendered="#{not alunoFormacaoAcademicaBean.botaoEditar}"></t:graphicImage>

							<a4j:commandLink
								rendered="#{alunoFormacaoAcademicaBean.botaoExcluir}"
								action="#{alunoFormacaoAcademicaBean.excluirFormacaoAcademicaAnterior}"
								reRender="corpoFormacaoAcademicaAnterior"
								onclick="if(!confirm('As formações acadêmicas selecionadas serão excluídas!')) {form.reset(); return false;}">
								<t:graphicImage styleClass="iconeMenu"
									url="/images/excluir20.png" title="#{msg.geral_excluir}"></t:graphicImage>
							</a4j:commandLink>

							<t:graphicImage styleClass="iconeMenu"
								url="/images/excluir20desabilitado.png"
								title="#{msg.aluno_curriculoAvisoSelecionarFormAcademicaExcluir}"
								rendered="#{not alunoFormacaoAcademicaBean.botaoExcluir}"></t:graphicImage>

						</t:div>
						<t:div styleClass="roundedcornr_bottom">
							<t:div></t:div>
						</t:div>
					</t:div>

					<!-- Corpo Formacao Academica Anterior  -->

					<t:div id="listaFormacaoAcademicaAnterior">

						<rich:dataTable styleClass="dataTableItemCurriculo"
							rendered="#{not empty alunoFormacaoAcademicaBean.listFormAcAnt}"
							value="#{alunoFormacaoAcademicaBean.listFormAcAnt}"
							id="dtFormAnt" var="formAnt">


							<rich:column styleClass="checkbox">
								<h:selectBooleanCheckbox
									value="#{alunoFormacaoAcademicaBean.lcbFormAcAnt[formAnt.idformacao]}">
									<a4j:support event="onclick"
										reRender="corpoPrincipalFormacaoAcademicaAnterior"></a4j:support>
								</h:selectBooleanCheckbox>
							</rich:column>

							<rich:column styleClass="conteudoItemCurriculo">
								<t:div styleClass="itemCurriculo">
									<h:outputText value="#{msg.geral_alunoCurso}:"
										styleClass="labelItemCurriculo"></h:outputText>
									<h:outputText value="#{formAnt.curso.nome}"
										styleClass="valorItemCurriculo" />
								</t:div>

								<t:div styleClass="itemCurriculo">
									<h:outputText value="#{msg.geral_nivel}:"
										styleClass="labelItemCurriculo"></h:outputText>
									<h:outputText value="#{formAnt.curso.nivel}"
										styleClass="valorItemCurriculo" />
								</t:div>

								<t:div styleClass="itemCurriculo">
									<h:outputText
										value="#{msg.geral_curriculoFormAcademicaAnteriorAnoInicio}:"
										styleClass="labelItemCurriculo"></h:outputText>
									<h:outputText value="#{formAnt.anoinicio}"
										styleClass="valorItemCurriculo" />

									<h:outputText
										value="#{msg.geral_curriculoFormAcademicaAnteriorAnoFim}:"
										styleClass="labelItemCurriculo"></h:outputText>
									<h:outputText value="#{formAnt.anofim}"
										styleClass="valorItemCurriculo" />
								</t:div>


								<t:div styleClass="itemCurriculo">
									<h:outputText
										value="#{msg.geral_curriculoFormAcademicaAnteriorUniversidade}:"
										styleClass="labelItemCurriculo"></h:outputText>
									<h:outputText value="#{formAnt.universidade}"
										styleClass="valorItemCurriculo" />
								</t:div>
							</rich:column>
						</rich:dataTable>
						<!-- Mensagem lista vazia -->
						<t:div styleClass="mensageListaVazia"
							rendered="#{empty alunoFormacaoAcademicaBean.listFormAcAnt}">
							<t:graphicImage url="/images/aviso20.png" styleClass="imagem" />
							<h:outputText
								value="#{msg.geral_curriculoAvisoSemFormAcademicaAnterior}"></h:outputText>
						</t:div>
					</t:div>
				</t:div>
			</a4j:form>
		</t:div>


	</t:panelGroup>
</f:subview>