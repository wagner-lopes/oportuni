<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm"%>
<%@ taglib uri="http://stella.caelum.com.br/faces" prefix="stella"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<f:subview id="curriculoIdiomas">
	<f:loadBundle basename="mensagens" var="msg" />

	<t:panelGroup id="pGroupIdiomas">
		<a4j:form>

			<!-- Box Mensagens -->
			<c:import url="../mensagens/mensagensBox.jsp"></c:import>

			<!----------------- Box Incluir Idioma ------------------>
			<t:div id="boxIncluirIdioma"
				rendered="#{alunoIdiomasBean.boxIncluirIdiomaAluno}">

				<t:div styleClass="roundedcornr_box_sBorderHeaderBlue">

					<t:div styleClass="roundedcornr_top_sBorderHeaderBlue">
						<t:div>
						</t:div>
					</t:div>
					<t:div styleClass="roundedcornr_content_sBorderHeaderBlue">
						<!-- Cabecalho -->
						<t:div styleClass="header">
							<h:outputText value="#{msg.aluno_curriculoIncluirIdioma}"></h:outputText>
						</t:div>

						<!-- Menu -->
						<a4j:commandLink reRender="pGroupIdiomas"
							action="#{alunoIdiomasBean.desrenderizarBoxIncluirIdiomaAluno}"
							onclick="if(!confirm('As alterações não salvas serão descartadas!')) {form.reset(); return false;}"
							actionListener="#{alunoIdiomasBean.limparLcbIdiomaAluno}">
							<h:graphicImage styleClass="iconeMenu" url="/images/voltar20.png"
								title="#{msg.geral_voltar}" />
						</a4j:commandLink>

						<a4j:commandLink reRender="pGroupIdiomas"
							action="#{alunoIdiomasBean.salvarNovoIdiomaAluno}"
							actionListener="#{alunoIdiomasBean.limparLcbIdiomaAluno}">
							<t:graphicImage styleClass="iconeMenu" url="/images/salvar20.png"
								title="#{msg.geral_Salvar}" />
						</a4j:commandLink>


						<!-- Corpo -->
						<t:div styleClass="corpo">
							<htm:table styleClass="conjuntoAtributos">
								<htm:tr styleClass="atributoPrincipal">
									<htm:td>
										<h:outputText styleClass="label1"
											value="#{msg.geral_curriculoIdioma}"></h:outputText>
									</htm:td>
									<htm:td>
										<t:selectOneMenu styleClass="texto1"
											value="#{alunoIdiomasBean.idIdiomaAluno}">
											<f:selectItems value="#{alunoIdiomasBean.idiomaListSelItem}" />
										</t:selectOneMenu>
									</htm:td>

								</htm:tr>



								<htm:tr styleClass="atributo">
									<htm:td>
										<h:outputText value="#{msg.geral_curriculoIdiomaLe}"
											styleClass="label1"></h:outputText>
									</htm:td>
									<htm:td>
										<h:selectOneRadio
											value="#{alunoIdiomasBean.novoIdioma.leitura}"
											styleClass="texto1">
											<f:selectItem itemLabel="Pouco " itemValue="1" />
											<f:selectItem itemLabel="Razoavelmente " itemValue="2" />
											<f:selectItem itemLabel="Bem " itemValue="3" />
										</h:selectOneRadio>
									</htm:td>
								</htm:tr>

								<htm:tr styleClass="atributo">
									<htm:td>
										<h:outputText value="#{msg.geral_curriculoIdiomaFala}"
											styleClass="label1"></h:outputText>
									</htm:td>
									<htm:td>
										<h:selectOneRadio
											value="#{alunoIdiomasBean.novoIdioma.conversacao}"
											styleClass="texto1">
											<f:selectItem itemLabel="Pouco " itemValue="1" />
											<f:selectItem itemLabel="Razoavelmente " itemValue="2" />
											<f:selectItem itemLabel="Bem " itemValue="3" />
										</h:selectOneRadio>
									</htm:td>
								</htm:tr>

								<htm:tr styleClass="atributo">
									<htm:td>
										<h:outputText value="#{msg.geral_curriculoIdiomaEscreve}"
											styleClass="label1"></h:outputText>
									</htm:td>
									<htm:td>
										<h:selectOneRadio
											value="#{alunoIdiomasBean.novoIdioma.escrita}"
											styleClass="texto1">
											<f:selectItem itemLabel="Pouco " itemValue="1" />
											<f:selectItem itemLabel="Razoavelmente " itemValue="2" />
											<f:selectItem itemLabel="Bem " itemValue="3" />
										</h:selectOneRadio>
									</htm:td>
								</htm:tr>

								<htm:tr styleClass="atributo">
									<htm:td>
										<h:outputText value="#{msg.geral_curriculoIdiomaCompreende}"
											styleClass="label1"></h:outputText>
									</htm:td>
									<htm:td>
										<h:selectOneRadio
											value="#{alunoIdiomasBean.novoIdioma.compreensao}"
											styleClass="texto1">
											<f:selectItem itemLabel="Pouco " itemValue="1" />
											<f:selectItem itemLabel="Razoavelmente " itemValue="2" />
											<f:selectItem itemLabel="Bem " itemValue="3" />
										</h:selectOneRadio>
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



			<!----------------- Box Editar Idioma ------------------>
			<t:div id="boxEditarIdioma"
				rendered="#{alunoIdiomasBean.boxEditarIdiomaAluno}">

				<t:div styleClass="roundedcornr_box_sBorderHeaderBlue">
					<t:div styleClass="roundedcornr_top_sBorderHeaderBlue">
						<t:div></t:div>
					</t:div>
					<t:div styleClass="roundedcornr_content_sBorderHeaderBlue">

						<!-- Cabecalho -->
						<t:div styleClass="header">
							<h:outputText value="#{msg.aluno_curriculoEditarIdioma}"></h:outputText>
						</t:div>

						<!-- Menu -->
						<a4j:commandLink reRender="pGroupIdiomas"
							action="#{alunoIdiomasBean.desrenderizarBoxEditarIdiomaAluno}"
							onclick="if(!confirm('As alterações não salvas serão descartadas!')) {form.reset(); return false;}"
							actionListener="#{alunoIdiomasBean.limparLcbIdiomaAluno}">
							<h:graphicImage styleClass="iconeMenu" url="/images/voltar20.png"
								title="#{msg.geral_voltar}" />
						</a4j:commandLink>

						<a4j:commandLink reRender="pGroupIdiomas"
							action="#{alunoIdiomasBean.atualizarIdiomaAluno}">
							<t:graphicImage styleClass="iconeMenu" url="/images/salvar20.png"
								title="#{msg.geral_Salvar}" />
						</a4j:commandLink>

						<!-- Corpo -->
						<t:div styleClass="corpo">
							<htm:table styleClass="conjuntoAtributos">
								<htm:tr styleClass="atributoPrincipal">
									<htm:td>
										<h:outputText value="#{msg.geral_curriculoIdioma}"
											styleClass="label1"></h:outputText>
										<h:outputText styleClass="texto1"
											value="#{alunoIdiomasBean.idiomaAlunoSelecionado.idioma.nome}">
										</h:outputText>
									</htm:td>
									<rich:spacer height="20px"></rich:spacer>
								</htm:tr>

								<htm:tr styleClass="atributo">
									<htm:td>
										<h:outputText value="#{msg.geral_curriculoIdiomaLe}"
											styleClass="label1"></h:outputText>
									</htm:td>
									<htm:td>
										<h:selectOneRadio
											value="#{alunoIdiomasBean.idiomaAlunoSelecionado.leitura}"
											styleClass="texto1">
											<f:selectItem itemLabel="Pouco" itemValue="1" />
											<f:selectItem itemLabel="Razoavelmente" itemValue="2" />
											<f:selectItem itemLabel="Bem" itemValue="3" />
										</h:selectOneRadio>
									</htm:td>
								</htm:tr>

								<htm:tr styleClass="atributo">
									<htm:td>
										<h:outputText value="#{msg.geral_curriculoIdiomaFala}"
											styleClass="label1"></h:outputText>
									</htm:td>
									<htm:td>
										<h:selectOneRadio
											value="#{alunoIdiomasBean.idiomaAlunoSelecionado.conversacao}"
											styleClass="texto1">
											<f:selectItem itemLabel="Pouco" itemValue="1" />
											<f:selectItem itemLabel="Razoavelmente" itemValue="2" />
											<f:selectItem itemLabel="Bem" itemValue="3" />
										</h:selectOneRadio>
									</htm:td>
								</htm:tr>

								<htm:tr styleClass="atributo">
									<htm:td>
										<h:outputText value="#{msg.geral_curriculoIdiomaEscreve}"
											styleClass="label1"></h:outputText>
									</htm:td>
									<htm:td>
										<h:selectOneRadio
											value="#{alunoIdiomasBean.idiomaAlunoSelecionado.escrita}"
											styleClass="texto1">
											<f:selectItem itemLabel="Pouco" itemValue="1" />
											<f:selectItem itemLabel="Razoavelmente" itemValue="2" />
											<f:selectItem itemLabel="Bem" itemValue="3" />
										</h:selectOneRadio>
									</htm:td>
								</htm:tr>

								<htm:tr styleClass="atributo">
									<htm:td>
										<h:outputText value="#{msg.geral_curriculoIdiomaCompreende}"
											styleClass="label1"></h:outputText>
									</htm:td>
									<htm:td>
										<h:selectOneRadio
											value="#{alunoIdiomasBean.idiomaAlunoSelecionado.compreensao}"
											styleClass="texto1">
											<f:selectItem itemLabel="Pouco " itemValue="1" />
											<f:selectItem itemLabel="Razoavelmente " itemValue="2" />
											<f:selectItem itemLabel="Bem " itemValue="3" />
										</h:selectOneRadio>
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

			<!-- Corpo principal Idiomas Aluno -->
			<t:div id="corpoPrincipalIdiomasAluno"
				rendered="#{not (alunoIdiomasBean.boxIncluirIdiomaAluno or alunoIdiomasBean.boxEditarIdiomaAluno)}">

				<!-- Menu do conteudo Idiomas-->
				<t:div id="menuIdiomas">
					<t:div styleClass="roundedcornr_box">
						<t:div styleClass="roundedcornr_top">
							<t:div></t:div>
						</t:div>
						<t:div styleClass="roundedcornr_content">

							<a4j:commandLink action="#{alunoIdiomasBean.incluirIdiomaAluno}"
								reRender="pGroupIdiomas">
								<t:graphicImage styleClass="iconeMenu" url="/images/novo20.png"
									title="#{msg.geral_incluir}" />
							</a4j:commandLink>

							<a4j:commandLink action="#{alunoIdiomasBean.editarIdiomaAluno}"
								rendered="#{alunoIdiomasBean.botaoEditar}"
								reRender="pGroupIdiomas">
								<t:graphicImage styleClass="iconeMenu"
									url="/images/editar20.png" title="#{msg.geral_editar}"></t:graphicImage>
							</a4j:commandLink>

							<t:graphicImage styleClass="iconeMenu"
								url="/images/editar20desabilitado.png"
								title="#{msg.aluno_curriculoAvisoSelecionarIdiomaEditar}"
								rendered="#{not alunoIdiomasBean.botaoEditar}"></t:graphicImage>

							<a4j:commandLink action="#{alunoIdiomasBean.excluirIdiomaAluno}"
								rendered="#{alunoIdiomasBean.botaoExcluir}"
								reRender="pGroupIdiomas"
								onclick="if(!confirm('Os idiomas selecionados serão excluídos.')) {form.reset(); return false;}">
								<t:graphicImage styleClass="iconeMenu"
									url="/images/excluir20.png" title="#{msg.geral_excluir}"></t:graphicImage>
							</a4j:commandLink>

							<t:graphicImage styleClass="iconeMenu"
								url="/images/excluir20desabilitado.png"
								title="#{msg.aluno_curriculoAvisoSelecionarIdiomaExcluir}"
								rendered="#{not alunoIdiomasBean.botaoExcluir}"></t:graphicImage>

						</t:div>
						<t:div styleClass="roundedcornr_bottom">
							<t:div></t:div>
						</t:div>
					</t:div>
				</t:div>

				<!-- Lista Idiomas Aluno -->
				<t:div id="listaIdiomasAluno">
					<rich:dataTable styleClass="dataTableItemCurriculo"
						rendered="#{not empty alunoIdiomasBean.listIdiomaAluno}"
						value="#{alunoIdiomasBean.listIdiomaAluno}" id="dtIdiomasAluno"
						var="idioma">

						<rich:column styleClass="checkbox">
							<h:selectBooleanCheckbox
								value="#{alunoIdiomasBean.lcbIdiomaAluno[idioma.ididiomaaluno]}">
								<a4j:support event="onclick" reRender="menuIdiomas"></a4j:support>
							</h:selectBooleanCheckbox>
						</rich:column>

						<rich:column styleClass="conteudoItemCurriculo">

							<!-- Idioma -->
							<t:div styleClass="cabecalhoItemCurriculo">
								<h:outputText value="#{msg.geral_curriculoIdioma}:"
									styleClass="labelCabecalhoItemCurriculo"></h:outputText>
								<h:outputText value="#{idioma.idioma.nome}"
									styleClass="valorCabecalhoItemCurriculo" />
							</t:div>

							<!-- Le -->
							<t:div styleClass="itemCurriculo">
								<h:outputText value="#{msg.geral_curriculoIdiomaLe}:"
									styleClass="labelItemCurriculo"></h:outputText>
								<h:outputText value="#{idioma.nivelLeitura} "
									styleClass="valorItemCurriculo" />
							</t:div>

							<!-- Fala -->
							<t:div styleClass="itemCurriculo">
								<h:outputText value="#{msg.geral_curriculoIdiomaFala}:"
									styleClass="labelItemCurriculo"></h:outputText>
								<h:outputText value="#{idioma.nivelConversacao} "
									styleClass="valorItemCurriculo" />
							</t:div>

							<!--Escreve -->
							<t:div styleClass="itemCurriculo">
								<h:outputText value="#{msg.geral_curriculoIdiomaEscreve}:"
									styleClass="labelItemCurriculo"></h:outputText>
								<h:outputText value="#{idioma.nivelEscrita} "
									styleClass="valorItemCurriculo" />
							</t:div>

							<!-- Compreende -->
							<t:div styleClass="itemCurriculo">
								<h:outputText value="#{msg.geral_curriculoIdiomaCompreende}:"
									styleClass="labelItemCurriculo"></h:outputText>
								<h:outputText value="#{idioma.nivelCompreensao}"
									styleClass="valorItemCurriculo" />
							</t:div>
						</rich:column>
					</rich:dataTable>
					<!-- Mensagem lista vazia -->
					<t:div styleClass="mensageListaVazia"
						rendered="#{empty alunoIdiomasBean.listIdiomaAluno}">
						<t:graphicImage url="/images/aviso20.png" styleClass="imagem" />
						<h:outputText value="#{msg.geral_curriculoAvisoSemIdioma}"></h:outputText>
					</t:div>
				</t:div>
			</t:div>
		</a4j:form>
	</t:panelGroup>
</f:subview>