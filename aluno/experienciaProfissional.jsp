<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm"%>
<%@ taglib uri="http://stella.caelum.com.br/faces" prefix="stella"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<f:subview id="curriculoExperienciaProfissional">
	<f:loadBundle basename="mensagens" var="msg" />
	<t:panelGroup id="pGroupExpProf">
		<a4j:form>

			<!-- Box Mensagens -->
			<c:import url="../mensagens/mensagensBox.jsp"></c:import>

			<!----------------- Box Incluir Experiencia Profissional ------------------>
			<t:div id="boxIncluirExpProf">
				<t:div
					rendered="#{alunoExperienciaProfissionalBean.boxIncluirExperienciaProfissional}">

					<t:div styleClass="roundedcornr_box_sBorderHeaderBlue">
						<t:div styleClass="roundedcornr_top_sBorderHeaderBlue">
							<t:div></t:div>
						</t:div>
						<t:div styleClass="roundedcornr_content_sBorderHeaderBlue">

							<!-- Cabecalho -->
							<t:div styleClass="header">
								<h:outputText value="#{msg.aluno_curriculoIncluirExpProf}"></h:outputText>
							</t:div>

							<!-- Menu -->
							<a4j:commandLink reRender="pGroupExpProf"
								action="#{alunoExperienciaProfissionalBean.desrenderizarBoxIncluirExperienciaProfissional}"
								onclick="if(!confirm('As alterações não salvas serão descartadas!')) {form.reset(); return false;}"
								actionListener="#{alunoExperienciaProfissionalBean.limparLcbExpProf}">
								<h:graphicImage styleClass="iconeMenu"
									url="/images/voltar20.png" title="#{msg.geral_voltar}" />
							</a4j:commandLink>

							<a4j:commandLink reRender="pGroupExpProf"
								action="#{alunoExperienciaProfissionalBean.salvarNovaExperienciaProfissional}"
								actionListener="#{alunoExperienciaProfissionalBean.limparLcbExpProf}">
								<h:graphicImage styleClass="iconeMenu"
									url="/images/salvar20.png" title="#{msg.geral_Salvar}" />
							</a4j:commandLink>


							<!-- Corpo -->
							<t:div styleClass="corpo">
								<htm:table styleClass="conjuntoAtributos">

									<!-- Data Inicio -->
									<htm:tr styleClass="atributo">
										<htm:td>
											<h:outputText styleClass="label1"
												value="#{msg.geral_curriculoExpProfDataInicio}"></h:outputText>
										</htm:td>
										<htm:td>
											<rich:calendar datePattern="dd/MM/yyyy"
												value="#{alunoExperienciaProfissionalBean.novaExpProf.dataini}">
											</rich:calendar>
										</htm:td>
									</htm:tr>

									<!-- Data Fim -->
									<htm:tr styleClass="atributo">
										<htm:td>
											<h:outputText styleClass="label1"
												value="#{msg.geral_curriculoExpProfDataFim}"></h:outputText>
										</htm:td>
										<htm:td>
											<rich:calendar datePattern="dd/MM/yyyy"
												value="#{alunoExperienciaProfissionalBean.novaExpProf.datafim}">
											</rich:calendar>
										</htm:td>
									</htm:tr>

									<!-- Instituicao -->
									<htm:tr styleClass="atributo">
										<htm:td>
											<h:outputText styleClass="label1"
												value="#{msg.geral_curriculoExpProfInstituicao}"></h:outputText>
										</htm:td>
										<htm:td>
											<h:inputText styleClass="texto1"
												value="#{alunoExperienciaProfissionalBean.novaExpProf.instituicao}">
											</h:inputText>
										</htm:td>
									</htm:tr>

									<!-- Atividades -->
									<htm:tr styleClass="atributo">
										<htm:td>

											<h:outputText styleClass="label1"
												value="#{msg.geral_curriculoExpProfAtividades}"></h:outputText>
										</htm:td>
										<htm:td>
											<rich:editor
												value="#{alunoExperienciaProfissionalBean.novaExpProf.atividades}"
												width="590" height="300" theme="advanced">
												<f:param name="theme_advanced_buttons1"
													value="bold,italic,underline,separator,bullist,numlist,
                                        separator,undo,redo" />
												<f:param name="theme_advanced_buttons2" value="" />
												<f:param name="theme_advanced_buttons3" value="" />
												<f:param name="theme_advanced_toolbar_location" value="top" />
												<f:param name="theme_advanced_toolbar_align" value="left" />
											</rich:editor>
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
			</t:div>

			<!----------------- Box Editar Experiencia Profissional ------------------>
			<t:div id="boxEditarExpProf">
				<t:div
					rendered="#{alunoExperienciaProfissionalBean.boxEditarExperienciaProfissional}">

					<t:div styleClass="roundedcornr_box_sBorderHeaderBlue">
						<t:div styleClass="roundedcornr_top_sBorderHeaderBlue">
							<t:div></t:div>
						</t:div>
						<t:div styleClass="roundedcornr_content_sBorderHeaderBlue">

							<!-- Cabecalho -->
							<t:div styleClass="header">
								<h:outputText value="#{msg.aluno_curriculoEditarExpProf}"></h:outputText>
							</t:div>

							<!-- Menu -->
							<a4j:commandLink reRender="pGroupExpProf"
								action="#{alunoExperienciaProfissionalBean.desrenderizarBoxEditarExperienciaProfissional}"
								onclick="if(!confirm('As alterações não salvas serão descartadas!')) {form.reset(); return false;}"
								actionListener="#{alunoExperienciaProfissionalBean.limparLcbExpProf}">
								<h:graphicImage styleClass="iconeMenu"
									url="/images/voltar20.png" title="#{msg.geral_voltar}" />
							</a4j:commandLink>

							<a4j:commandLink reRender="pGroupExpProf"
								action="#{alunoExperienciaProfissionalBean.atualizarExperienciaProfissional}">
								<t:graphicImage styleClass="iconeMenu"
									url="/images/salvar20.png" title="#{msg.geral_Salvar}" />
							</a4j:commandLink>

							<!-- Corpo -->
							<t:div styleClass="corpo">
								<htm:table styleClass="conjuntoAtributos">
									<htm:tr styleClass="atributo">
										<htm:td>
											<h:outputText styleClass="label1"
												value="#{msg.geral_curriculoExpProfDataInicio}"></h:outputText>
										</htm:td>
										<htm:td>
											<rich:calendar datePattern="dd/MM/yyyy"
												value="#{alunoExperienciaProfissionalBean.expProfSelecionada.dataini}">
											</rich:calendar>
										</htm:td>
									</htm:tr>

									<htm:tr styleClass="atributo">
										<htm:td>
											<h:outputText styleClass="label1"
												value="#{msg.geral_curriculoExpProfDataFim}"></h:outputText>
										</htm:td>
										<htm:td>
											<rich:calendar datePattern="dd/MM/yyyy"
												value="#{alunoExperienciaProfissionalBean.expProfSelecionada.datafim}">
											</rich:calendar>
										</htm:td>
									</htm:tr>

									<htm:tr styleClass="atributo">
										<htm:td>
											<h:outputText styleClass="label1"
												value="#{msg.geral_curriculoExpProfInstituicao}"></h:outputText>
										</htm:td>
										<htm:td>
											<h:inputText styleClass="texto1"
												value="#{alunoExperienciaProfissionalBean.expProfSelecionada.instituicao}">
											</h:inputText>
										</htm:td>
									</htm:tr>

									<htm:tr styleClass="atributo">
										<htm:td>
											<h:outputText styleClass="label1"
												value="#{msg.geral_curriculoExpProfAtividades}"></h:outputText>
										</htm:td>
										<htm:td>
											<rich:editor
												value="#{alunoExperienciaProfissionalBean.expProfSelecionada.atividades}"
												width="590" height="300" theme="advanced">
												<f:param name="theme_advanced_buttons1"
													value="bold,italic,underline,separator,bullist,numlist,
                                        separator,undo,redo" />
												<f:param name="theme_advanced_buttons2" value="" />
												<f:param name="theme_advanced_buttons3" value="" />
												<f:param name="theme_advanced_toolbar_location" value="top" />
												<f:param name="theme_advanced_toolbar_align" value="left" />
											</rich:editor>
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
			</t:div>

			<!-- Corpo principal Exp Prof -->
			<t:div id="corpoPrincipalExpProf"
				rendered="#{not (alunoExperienciaProfissionalBean.boxIncluirExperienciaProfissional or alunoExperienciaProfissionalBean.boxEditarExperienciaProfissional)}">

				<!-- Menu do conteudo Experiências Profissionais-->
				<t:div id="menuExpProf">
					<t:div styleClass="roundedcornr_box">
						<t:div styleClass="roundedcornr_top">
							<t:div></t:div>
						</t:div>
						<t:div styleClass="roundedcornr_content">

							<a4j:commandLink
								action="#{alunoExperienciaProfissionalBean.incluirExperienciaProfissional}"
								reRender="pGroupExpProf">
								<h:graphicImage styleClass="iconeMenu" url="/images/novo20.png"
									title="#{msg.geral_incluir}" />
							</a4j:commandLink>

							<a4j:commandLink
								rendered="#{alunoExperienciaProfissionalBean.botaoEditar}"
								action="#{alunoExperienciaProfissionalBean.editarExperienciaProfissional}"
								reRender="pGroupExpProf">
								<t:graphicImage styleClass="iconeMenu"
									url="/images/editar20.png" title="#{msg.geral_editar}"></t:graphicImage>
							</a4j:commandLink>

							<t:graphicImage styleClass="iconeMenu"
								url="/images/editar20desabilitado.png"
								title="#{msg.aluno_curriculoAvisoSelecionarExpProfEditar}"
								rendered="#{not alunoExperienciaProfissionalBean.botaoEditar}"></t:graphicImage>

							<a4j:commandLink
								rendered="#{alunoExperienciaProfissionalBean.botaoExcluir}"
								action="#{alunoExperienciaProfissionalBean.excluirExperienciaProfissional}"
								reRender="pGroupExpProf"
								onclick="if(!confirm('As experiências profissionais selecionadas serão excluídas.')) {form.reset(); return false;}">
								<t:graphicImage styleClass="iconeMenu"
									url="/images/excluir20.png" title="#{msg.geral_excluir}"></t:graphicImage>
							</a4j:commandLink>

							<t:graphicImage styleClass="iconeMenu"
								url="/images/excluir20desabilitado.png"
								title="#{msg.aluno_curriculoAvisoSelecionarExpProfExcluir}"
								rendered="#{not alunoExperienciaProfissionalBean.botaoExcluir}"></t:graphicImage>

						</t:div>
						<t:div styleClass="roundedcornr_bottom">
							<t:div></t:div>
						</t:div>
					</t:div>
				</t:div>

				<!-- Lista Experiencia Profissional-->
				<t:div id="listaExperienciaProfissional">

					<rich:dataTable styleClass="dataTableItemCurriculo"
						rendered="#{not empty alunoExperienciaProfissionalBean.listExpProf}"
						value="#{alunoExperienciaProfissionalBean.listExpProf}"
						id="dtExpProf" var="expProf">


						<rich:column styleClass="checkbox">
							<h:selectBooleanCheckbox
								value="#{alunoExperienciaProfissionalBean.lcbExpProf[expProf.idexpprof]}">
								<a4j:support event="onclick" reRender="menuExpProf"></a4j:support>
							</h:selectBooleanCheckbox>
						</rich:column>

						<rich:column styleClass="conteudoItemCurriculo">

							<t:div styleClass="itemCurriculo">
								<!-- Data Inicio -->
								<h:outputText value="#{msg.geral_curriculoExpProfDataInicio}:"
									styleClass="labelItemCurriculo"></h:outputText>
								<h:outputText value="#{expProf.dataini}"
									styleClass="valorItemCurriculo" />

								<!-- Data Fim -->
								<h:outputText value="#{msg.geral_curriculoExpProfDataFim}:"
									styleClass="labelItemCurriculo"></h:outputText>
								<h:outputText value="#{expProf.datafim}"
									styleClass="valorItemCurriculo" />
							</t:div>

							<!-- Instituicao -->
							<t:div styleClass="itemCurriculo">
								<h:outputText value="#{msg.geral_curriculoExpProfInstituicao}:"
									styleClass="labelItemCurriculo"></h:outputText>
								<h:outputText value="#{expProf.instituicao}"
									styleClass="valorItemCurriculo" />
							</t:div>

							<!-- Atividades -->
							<t:div styleClass="itemCurriculo">
								<h:outputText value="#{msg.geral_curriculoExpProfAtividades}:"
									styleClass="labelItemCurriculo"></h:outputText>
							</t:div>

							<rich:editor value="#{expProf.atividades}" readonly="true"
								theme="advanced" width="670" height="300"></rich:editor>
							<f:param name="theme_advanced_buttons1" value="" />
							<f:param name="theme_advanced_buttons2" value="" />
							<f:param name="theme_advanced_buttons3" value="" />

							<rich:spacer height="5px"></rich:spacer>
						</rich:column>
					</rich:dataTable>
					<!-- Mensagem lista vazia -->
					<t:div styleClass="mensageListaVazia"
						rendered="#{empty alunoExperienciaProfissionalBean.listExpProf}">
						<t:graphicImage url="/images/aviso20.png" styleClass="imagem" />
						<h:outputText value="#{msg.geral_curriculoAvisoSemExpProf}"></h:outputText>
					</t:div>
				</t:div>
			</t:div>
		</a4j:form>
	</t:panelGroup>
</f:subview>