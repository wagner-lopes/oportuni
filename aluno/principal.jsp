<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>Oportuni</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<link href="${pageContext.request.contextPath}/css/estiloBase.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/estiloComum.css"
	rel="stylesheet" type="text/css" />
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/images/icone.png" />
	
<!-- Google Analytics -->	
<script type="text/javascript">
 var _gaq = _gaq || [];
 _gaq.push(['_setAccount', 'UA-16643576-1']);
 _gaq.push(['_trackPageview']);

 (function() {
   var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
   ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
   var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
 })();
</script>	
</head>
<body>
<!--[if IE]>
	<link href="${pageContext.request.contextPath}/css/estiloIE.css" rel="stylesheet" type="text/css" />
<![endif]-->
<script>
    window.history.forward(1);
</Script>

<f:view>
	<f:loadBundle basename="mensagens" var="msg" />
	<t:div styleClass="fundoCabecalho">
		<t:div styleClass="main">
			<!-- header -->
			<t:div styleClass="cabecalho">
				<t:div styleClass="linha1">
					<t:div styleClass="logoOportuni">
						<h:graphicImage url="/images/logo.png"
							title="#{msg.geral_Oportuni}" />
					</t:div>
					<t:div styleClass="login">
						<t:panelGrid columns="3">
							<!-- Contato -->
							<h:form>
								<a onclick="Richfaces.showModalPanel('mpContato');"> <t:graphicImage
									url="/images/contato16.png" title="#{msg.geral_contato}">
								</t:graphicImage> </a>
							</h:form>
							<c:import url="contato.jsp"></c:import>
							
							<!-- Ajuda -->
							<h:form>
								<h:outputLink value="http://150.164.2.29/oportuni/tutorial/OportuniTutorialAluno.pdf" target="_blank">
									<t:graphicImage url="/images/ajuda16.png"
										title="#{msg.geral_ajuda}"></t:graphicImage>
								</h:outputLink>
							</h:form>
						</t:panelGrid>
					</t:div>
				</t:div>

				<t:div styleClass="linha2">
					<t:panelGrid columns="3" width="100%">

						<!-- Mensagem com o login do usuario -->
						<t:div id="logoutMensagem" styleClass="logoutMensagem">
							<h:outputText value="#{msg.geral_ola}"></h:outputText>
							<h:outputText value="#{loginBean.aluno.login}"></h:outputText>
							<h:outputText value="! "></h:outputText>
						</t:div>
						<!-- Fim da mensagem -->

						<!-- Botao de logout -->
						<t:div id="logout" styleClass="logout">
							<a4j:form>
								<h:commandLink id="sair" action="#{loginBean.sair}">
									<t:graphicImage url="/images/logout48.png" styleClass="icone"
										title="#{msg.geral_sair}"></t:graphicImage>
								</h:commandLink>
							</a4j:form>
						</t:div>
						<!-- -->
					</t:panelGrid>

				</t:div>

			</t:div>
			<!-- content -->
			<a4j:region>
				<t:div styleClass="corpo">
					<t:div styleClass="wrapper">
						<t:div styleClass="menu">

							<!-- Opcao Pesquisar Oportunidades -->
							<t:div styleClass="item">
								<t:div styleClass="logo">
									<h:graphicImage url="/images/pesquisar25.png"></h:graphicImage>
								</t:div>
								<t:div styleClass="texto">
									<a4j:form>
										<h2><a4j:commandLink
											value="#{msg.aluno_pesquisarOportunidades}"
											action="#{pesquisaOportunidadeBB.inicializarPesquisaOportunidades}"
											actionListener="#{alunoNavegacaoBean.renderizarPesquisaOportunidade}"
											reRender="conteudo, painelPesquisaPorCodigo, painelPesquisaAvancada"></a4j:commandLink></h2>
									</a4j:form>
								</t:div>
							</t:div>
							<!-- Fim da opcao Pesquisar Oportunidades -->

							<!-- Opcao Minhas Oportunidades -->
							<t:div styleClass="item">
								<t:div styleClass="logo">
									<h:graphicImage url="/images/minhasOpts25.png"></h:graphicImage>
								</t:div>
								<t:div styleClass="texto">
									<a4j:form>
										<h2><a4j:commandLink
											value="#{msg.aluno_minhasOportunidades}"
											actionListener="#{alunoNavegacaoBean.renderizarMinhasOportunidades}"
											action="#{alunoMinhasOptBB.selecionarMinhasOportunidades}"
											reRender="conteudo"></a4j:commandLink></h2>
									</a4j:form>
								</t:div>
							</t:div>
							<!-- Fim da opcao Minhas Oportunidades -->

							<!-- Opcao Meu Curriculo -->
							<t:div styleClass="item">
								<t:div styleClass="logo">
									<h:graphicImage url="/images/curriculo25.png"></h:graphicImage>
								</t:div>
								<t:div styleClass="texto">
									<a4j:form>
										<h2><a4j:commandLink value="#{msg.aluno_meuCurriculo}"
											actionListener="#{alunoNavegacaoBean.renderizarMeuCurriculo}"
											reRender="conteudo"></a4j:commandLink></h2>
									</a4j:form>
								</t:div>
							</t:div>
							<!-- Fim da opcao Meu Currriculo -->

							<!-- Opcao Mensagens -->
							<t:div styleClass="item">
								<t:div styleClass="logo">
									<h:graphicImage url="/images/mensagem25.png"></h:graphicImage>
								</t:div>
								<t:div styleClass="texto">
									<a4j:form>
										<h2><a4j:commandLink value="#{msg.aluno_mensagens}"
											actionListener="#{alunoNavegacaoBean.renderizarMensagens}"
											action="#{alunoMensagensBean.inicializar}"
											reRender="conteudo"></a4j:commandLink></h2>
									</a4j:form>
								</t:div>
							</t:div>
							<!-- Fim da opcao Mensagens -->

							<rich:spacer height="15px"></rich:spacer>
							<!-- Box Mensagens -->
							<t:div id="boxMensagens" style="height: 50px">
								<t:div styleClass="roundedcornr_box">
									<t:div styleClass="roundedcornr_top">
										<t:div></t:div>
									</t:div>
									<t:div styleClass="roundedcornr_content">
										<t:panelGrid columns="1">
											<h:outputText value="#{msg.aluno_mensagens}"
												styleClass="label2"></h:outputText>
											<h:outputText
												value=" Existem #{alunoMensagensBean.numMsgNaoLidas} mensagem(ns) não lida(s)"
												styleClass="label1"></h:outputText>
										</t:panelGrid>
									</t:div>
									<t:div styleClass="roundedcornr_bottom">
										<t:div></t:div>
									</t:div>
								</t:div>
							</t:div>
							<!-- Fim Box Mensagens -->

							<rich:spacer height="15px"></rich:spacer>

							<!-- Box Candituras -->
							<t:div id="boxCandidaturas" style="height: 50px">

								<t:div styleClass="roundedcornr_lYe_box">
									<t:div styleClass="roundedcornr_lYe_top">
										<t:div></t:div>
									</t:div>
									<t:div styleClass="roundedcornr_lYe_content">
										<t:panelGrid columns="1">
											<h:outputText value="#{msg.aluno_candidaturas}"
												styleClass="label2"></h:outputText>
											<h:outputText
												value="Você possui #{loginBean.aluno.candidaturas} candidaturas este mês."
												styleClass="label1"></h:outputText>
										</t:panelGrid>
									</t:div>
									<t:div styleClass="roundedcornr_lYe_bottom">
										<t:div></t:div>
									</t:div>
								</t:div>
							</t:div>
							<!-- Fim Box Candituras -->
						</t:div>

						<t:div styleClass="conteudo" id="conteudo">
							<c:import url="pesquisarOportunidades.jsp"></c:import>
							<c:import url="exibirOportunidade.jsp"></c:import>
							<c:import url="minhasOportunidades.jsp"></c:import>
							<c:import url="exibirMinhaOportunidade.jsp"></c:import>
							<c:import url="curriculo.jsp"></c:import>
							<c:import url="mensagens.jsp"></c:import>
							<c:import url="exibirMensagem.jsp"></c:import>

						</t:div>
					</t:div>
				</t:div>
			</a4j:region>
		</t:div>
	</t:div>
</f:view>
</body>
</html>

