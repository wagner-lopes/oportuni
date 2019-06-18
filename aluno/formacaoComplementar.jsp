<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm"%>
<%@ taglib uri="http://stella.caelum.com.br/faces" prefix="stella"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<f:subview id="curriculoFormacaoComplementar">
	<f:loadBundle basename="mensagens" var="msg" />

	<t:panelGroup id="pGroupFormacaoComplementar">
		<a4j:form>



			<!-- Box Mensagens -->
			<c:import url="../mensagens/mensagensBox.jsp"></c:import>


			<!----------------- Box Incluir Formacao Complementar ------------------>
			<t:div id="boxIncluirFormacaoComplementar"
				rendered="#{alunoFormacaoComplementarBean.boxIncluirFormacaoComplementar}">

				<t:div styleClass="roundedcornr_box_sBorderHeaderBlue">
					<t:div styleClass="roundedcornr_top_sBorderHeaderBlue">
						<t:div></t:div>
					</t:div>
					<t:div styleClass="roundedcornr_content_sBorderHeaderBlue">

						<!-- Cabecalho -->
						<t:div styleClass="header">
							<h:outputText value="#{msg.aluno_curriculoIncluirFormComp}"></h:outputText>
						</t:div>

						<!-- Menu -->
						<a4j:commandLink reRender="pGroupFormacaoComplementar"
							action="#{alunoFormacaoComplementarBean.desrenderizarBoxIncluirFormacaoComplementar}"
							onclick="if(!confirm('As alterações não salvas serão descartadas!')) {form.reset(); return false;}"
							actionListener="#{alunoFormacaoComplementarBean.limparLcbFormComp}">
							<h:graphicImage styleClass="iconeMenu" url="/images/voltar20.png"
								title="#{msg.geral_voltar}" />
						</a4j:commandLink>

						<a4j:commandLink reRender="pGroupFormacaoComplementar"
							action="#{alunoFormacaoComplementarBean.salvarNovaFormacaoComplementar}"
							actionListener="#{alunoFormacaoComplementarBean.limparLcbFormComp}">
							<t:graphicImage styleClass="iconeMenu" url="/images/salvar20.png"
								title="#{msg.geral_Salvar}" />
						</a4j:commandLink>


						<!-- Corpo -->
						<t:div styleClass="corpo">
							<htm:table styleClass="conjuntoAtributos">
								<htm:tr styleClass="atributo">
									<htm:td>
										<h:outputText styleClass="label1"
											value="#{msg.geral_curriculoFormCompCurso} "></h:outputText>
									</htm:td>
									<htm:td>
										<h:inputText styleClass="texto1"
											value="#{alunoFormacaoComplementarBean.novaFormComp.nomecurso}">
										</h:inputText>
									</htm:td>
								</htm:tr>

								<htm:tr styleClass="atributo">
									<htm:td>
										<h:outputText styleClass="label1"
											value="#{msg.geral_curriculoFormCompAnoInicio} "></h:outputText>
									</htm:td>
									<htm:td>
										<rich:inputNumberSlider minValue="1950" maxValue="2010"
											value="#{alunoFormacaoComplementarBean.novaFormComp.anoini}">
										</rich:inputNumberSlider>
									</htm:td>
								</htm:tr>



								<htm:tr styleClass="atributo">
									<htm:td>
										<h:outputText styleClass="label1"
											value="#{msg.geral_curriculoFormCompAnoFim} "></h:outputText>
									</htm:td>
									<htm:td>
										<rich:inputNumberSlider minValue="1950" maxValue="2010"
											value="#{alunoFormacaoComplementarBean.novaFormComp.anofim}">
										</rich:inputNumberSlider>
									</htm:td>
								</htm:tr>

								<htm:tr styleClass="atributo">
									<htm:td>
										<h:outputText styleClass="label1"
											value="#{msg.geral_curriculoFormCompInstituicao} "></h:outputText>
									</htm:td>
									<htm:td>
										<h:inputText styleClass="texto1"
											value="#{alunoFormacaoComplementarBean.novaFormComp.instituicao}">
										</h:inputText>
									</htm:td>
								</htm:tr>

								<htm:tr styleClass="atributo">
									<htm:td>
										<h:outputText styleClass="label1"
											value="#{msg.geral_curriculoFormCompCargaHoraria}  "></h:outputText>
									</htm:td>
									<htm:td>
										<h:inputText id="impIncluirCargaHoraria" styleClass="texto2"
											value="#{alunoFormacaoComplementarBean.novaFormComp.cargahoraria}"
											onkeypress="if (event.keyCode < 48 || event.keyCode > 57) event.returnValue = false;">
											<rich:ajaxValidator event="onkeyup"></rich:ajaxValidator>
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


			<!----------------- Box Editar Formacao Complementar ------------------>
			<t:div id="boxEditarFormacaoComplementar"
				rendered="#{alunoFormacaoComplementarBean.boxEditarFormacaoComplementar}">

				<t:div styleClass="roundedcornr_box_sBorderHeaderBlue">
					<t:div styleClass="roundedcornr_top_sBorderHeaderBlue">
						<t:div></t:div>
					</t:div>
					<t:div styleClass="roundedcornr_content_sBorderHeaderBlue">

						<!-- Cabecalho -->
						<t:div styleClass="header">
							<h:outputText value="#{msg.aluno_curriculoEditarFormComp}"></h:outputText>
						</t:div>

						<!-- Menu -->
						<a4j:commandLink reRender="pGroupFormacaoComplementar"
							action="#{alunoFormacaoComplementarBean.desrenderizarBoxEditarFormacaoComplementar}"
							onclick="if(!confirm('As alterações não salvas serão descartadas!')) {form.reset(); return false;}"
							actionListener="#{alunoFormacaoComplementarBean.limparLcbFormComp}">
							<h:graphicImage styleClass="iconeMenu" url="/images/voltar20.png"
								title="#{msg.geral_voltar}" />
						</a4j:commandLink>

						<a4j:commandLink reRender="pGroupFormacaoComplementar"
							action="#{alunoFormacaoComplementarBean.atualizarFormacaoComplementar}">
							<t:graphicImage styleClass="iconeMenu" url="/images/salvar20.png"
								title="#{msg.geral_Salvar}" />
						</a4j:commandLink>

						<!-- Corpo -->
						<t:div styleClass="corpo">
							<htm:table styleClass="conjuntoAtributos">
								<htm:tr styleClass="atributo">
									<htm:td>
										<h:outputText styleClass="label1"
											value="#{msg.geral_curriculoFormCompCurso} "></h:outputText>
									</htm:td>
									<htm:td>
										<h:inputText styleClass="texto1"
											value="#{alunoFormacaoComplementarBean.formCompSelecionada.nomecurso}">
										</h:inputText>
									</htm:td>
								</htm:tr>

								<htm:tr styleClass="atributo">
									<htm:td>
										<h:outputText styleClass="label1"
											value="#{msg.geral_curriculoFormCompAnoInicio} "></h:outputText>
									</htm:td>
									<htm:td>
										<rich:inputNumberSlider minValue="1950" maxValue="2010"
											value="#{alunoFormacaoComplementarBean.formCompSelecionada.anoini}">
										</rich:inputNumberSlider>
									</htm:td>
								</htm:tr>


								<htm:tr styleClass="atributo">
									<htm:td>
										<h:outputText styleClass="label1"
											value="#{msg.geral_curriculoFormCompAnoFim} "></h:outputText>
									</htm:td>
									<htm:td>
										<rich:inputNumberSlider minValue="1950" maxValue="2010"
											value="#{alunoFormacaoComplementarBean.formCompSelecionada.anofim}">
										</rich:inputNumberSlider>
									</htm:td>
								</htm:tr>

								<htm:tr styleClass="atributo">
									<htm:td>
										<h:outputText styleClass="label1"
											value="#{msg.geral_curriculoFormCompInstituicao} "></h:outputText>
									</htm:td>
									<htm:td>
										<h:inputText styleClass="texto1"
											value="#{alunoFormacaoComplementarBean.formCompSelecionada.instituicao}">
										</h:inputText>
									</htm:td>
								</htm:tr>

								<htm:tr styleClass="atributo">
									<htm:td>
										<h:outputText styleClass="label1"
											value="#{msg.geral_curriculoFormCompCargaHoraria}  "></h:outputText>
									</htm:td>
									<htm:td>
										<h:inputText id="impEditarCargaHoraria" styleClass="texto2"
											value="#{alunoFormacaoComplementarBean.formCompSelecionada.cargahoraria}"
											onkeypress="if (event.keyCode < 48 || event.keyCode > 57) event.returnValue = false;">
											<rich:ajaxValidator event="onkeyup"></rich:ajaxValidator>
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

			<!-- Corpo principal Formacao Complementar -->
			<t:div id="corpoPrincipalFormacaoComplementar"
				rendered="#{not (alunoFormacaoComplementarBean.boxIncluirFormacaoComplementar or alunoFormacaoComplementarBean.boxEditarFormacaoComplementar)}">

				<!-- Menu Formacao Complementar-->
				<t:div id="menuFormacaoComplementar">
					<t:div styleClass="roundedcornr_box">
						<t:div styleClass="roundedcornr_top">
							<t:div></t:div>
						</t:div>
						<t:div styleClass="roundedcornr_content">

							<a4j:commandLink reRender="pGroupFormacaoComplementar"
								action="#{alunoFormacaoComplementarBean.inserirFormacaoComplementar}">
								<h:graphicImage styleClass="iconeMenu" url="/images/novo20.png"
									title="#{msg.geral_incluir}" />
							</a4j:commandLink>

							<a4j:commandLink
								rendered="#{alunoFormacaoComplementarBean.botaoEditar}"
								action="#{alunoFormacaoComplementarBean.editarFormacaoComplementar}"
								reRender="pGroupFormacaoComplementar">
								<t:graphicImage styleClass="iconeMenu"
									url="/images/editar20.png" title="#{msg.geral_editar}"></t:graphicImage>
							</a4j:commandLink>

							<t:graphicImage styleClass="iconeMenu"
								url="/images/editar20desabilitado.png"
								title="#{msg.aluno_curriculoAvisoSelecionarFormCompEditar}"
								rendered="#{not alunoFormacaoComplementarBean.botaoEditar}"></t:graphicImage>

							<a4j:commandLink
								rendered="#{alunoFormacaoComplementarBean.botaoExcluir}"
								action="#{alunoFormacaoComplementarBean.excluirFormacaoComplementar}"
								reRender="pGroupFormacaoComplementar"
								onclick="if(!confirm('Deseja confirmar a exclusão?')) {form.reset(); return false;}">
								<t:graphicImage styleClass="iconeMenu"
									url="/images/excluir20.png" title="#{msg.geral_excluir}"></t:graphicImage>
							</a4j:commandLink>

							<t:graphicImage styleClass="iconeMenu"
								url="/images/excluir20desabilitado.png"
								title="#{msg.aluno_curriculoAvisoSelecionarFormCompExcluir}"
								rendered="#{not alunoFormacaoComplementarBean.botaoExcluir}"></t:graphicImage>

						</t:div>
						<t:div styleClass="roundedcornr_bottom">
							<t:div></t:div>
						</t:div>
					</t:div>
				</t:div>

				<!-- Lista Formacao Complementar -->
				<t:div id="listaFormacaoComplementar">

					<rich:dataTable styleClass="dataTableItemCurriculo"
						rendered="#{not empty alunoFormacaoComplementarBean.listFormComp}"
						value="#{alunoFormacaoComplementarBean.listFormComp}"
						id="dtFormComp" var="formComp">


						<rich:column styleClass="checkbox">
							<h:selectBooleanCheckbox
								value="#{alunoFormacaoComplementarBean.lcbFormComp[formComp.idformcompl]}">
								<a4j:support event="onclick" reRender="menuFormacaoComplementar"></a4j:support>
							</h:selectBooleanCheckbox>
						</rich:column>

						<rich:column styleClass="conteudoItemCurriculo">


							<!-- Curso -->
							<t:div styleClass="itemCurriculo">
								<h:outputText value="#{msg.geral_curriculoFormCompCurso}:"
									styleClass="labelItemCurriculo" />
								<h:outputText value="#{formComp.nomecurso} "
									styleClass="valorItemCurriculo" />
							</t:div>


							<t:div styleClass="itemCurriculo">
								<!-- Ano Inicio -->
								<h:outputText value="#{msg.geral_curriculoFormCompAnoInicio}:"
									styleClass="labelItemCurriculo" />
								<h:outputText value="#{formComp.anoini}"
									styleClass="valorItemCurriculo" />

								<!-- Ano Fim -->
								<h:outputText value="#{msg.geral_curriculoFormCompAnoFim}:"
									styleClass="labelItemCurriculo" />
								<h:outputText value="#{formComp.anofim}"
									styleClass="valorItemCurriculo" />
							</t:div>

							<!-- Instituicao -->
							<t:div styleClass="itemCurriculo">
								<h:outputText value="#{msg.geral_curriculoFormCompInstituicao}:"
									styleClass="labelItemCurriculo" />
								<h:outputText value="#{formComp.instituicao}"
									styleClass="valorItemCurriculo" />
							</t:div>

							<!-- Carga Horaria -->
							<t:div styleClass="itemCurriculo">
								<h:outputText
									value="#{msg.geral_curriculoFormCompCargaHoraria}:"
									styleClass="labelItemCurriculo"></h:outputText>
								<h:outputText value="#{formComp.cargahoraria}"
									styleClass="valorItemCurriculo" />
							</t:div>

						</rich:column>
					</rich:dataTable>
					<!-- Mensagem lista vazia -->
					<t:div styleClass="mensageListaVazia"
						rendered="#{empty alunoFormacaoComplementarBean.listFormComp}">
						<t:graphicImage url="/images/aviso20.png" styleClass="imagem" />
						<h:outputText value="#{msg.geral_curriculoAvisoSemFormComp}"></h:outputText>
					</t:div>
				</t:div>
			</t:div>
		</a4j:form>
	</t:panelGroup>
</f:subview>