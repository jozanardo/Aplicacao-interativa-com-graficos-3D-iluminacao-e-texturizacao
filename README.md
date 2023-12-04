# Nome dos integrantes
João Augusto Zanardo de Lima - 11201920195

Guilherme Klinkerfuss Guimarães Pereira - 11201912414

# Explicação do Projeto

# Explicação detalhada Window.cpp
## onEvent(SDL_Event const &event)

Este método responde a eventos SDL, como movimentos do mouse, cliques e rolagem. Ele controla interações do mouse para manipular a câmera, objetos e luz na cena.

**SDL_MOUSEMOTION**: Atualiza a posição do mouse e aplica a movimentação no modelo e na luz (usando m_trackBallModel e m_trackBallLight).

**SDL_MOUSEBUTTONDOWN / SDL_MOUSEBUTTONUP**: Captura cliques do mouse. No caso do botão esquerdo, é usado para interagir com o modelo, e no botão direito, com a luz.

**SDL_MOUSEWHEEL**: Controla o zoom da cena com base na rolagem do mouse.

## onCreate()

O método onCreate() realiza configurações iniciais essenciais para a cena OpenGL, incluindo limpeza de buffers, criação de programas shader, definição da matriz de visualização, posicionamento inicial dos peixes, carregamento de modelos e criação do skybox para a aplicação.

**auto const assetsPath{abcg::Application::getAssetsPath()}**: Obtém o caminho para o diretório de ativos (assets) onde os recursos (como modelos 3D, texturas, shaders, etc.) da aplicação estão armazenados.

**abcg::glClearColor(0, 0, 0, 1)** e **abcg::glEnable(GL_DEPTH_TEST)**: Define a cor de fundo da janela OpenGL como preto e habilita o teste de profundidade para lidar com a renderização em 3D e a sobreposição correta de objetos na cena.

**m_fishs.resize(m_fish_quantity)**: Redimensiona o vetor de peixes para conter a quantidade de peixes definida por **m_fish_quantity.**

**Criação de Programas (Shaders)**: Itera sobre os nomes dos shaders **(m_shaderNames)** e cria programas OpenGL para cada um desses shaders combinando os arquivos **.vert** e **.frag** correspondentes.

**Configuração da Matriz de Visualização (View Matrix)**: Define a matriz de visualização **(m_viewMatrix)** para posicionar a câmera na origem e apontá-la para o eixo negativo Z, olhando para a origem com a orientação para cima no eixo Y.

**Inicialização dos Peixes**: Itera sobre cada peixe no vetor **m_fishs** e utiliza o método **randomizeFish()** para atribuir posições e orientações aleatórias a cada peixe.

**Carregamento do Modelo Padrão**: Carrega um modelo 3D padrão usando o método **loadModel()** com o caminho do objeto especificado por **m_object**.

**Configuração Inicial da Trackball do Modelo**: Define um eixo inicial para a rotação da trackball do modelo e uma velocidade de rotação inicial.

**Criação do Skybox**: Invoca o método **createSkybox()** para configurar o ambiente de skybox, carregando os shaders e os dados necessários para renderizar a skybox na cena.

## randomizeFish(Fish &fish)

Gera posições aleatórias para os peixes dentro de determinados intervalos.
Gera uma orientação aleatória para cada peixe.

**std::uniform_real_distribution<float> distPosXY(-20.0f, 20.0f)** e **std::uniform_real_distribution<float> distPosZ(-100.0f, 0.0f)**: Essas linhas criam distribuições uniformes de números reais dentro de faixas específicas. No caso, **distPosXY** gera números no intervalo de -20 a 20 (para coordenadas X e Y) e **distPosZ** gera números de -100 a 0 (para coordenada Z).

**fish.m_position = glm::vec3(distPosXY(m_randomEngine)**, **distPosXY(m_randomEngine)**, **distPosZ(m_randomEngine))**: Utiliza as distribuições geradas anteriormente para atribuir posições aleatórias ao peixe. Aqui, são definidas as coordenadas X, Y e Z do peixe com base nos valores aleatórios gerados pelas distribuições. Temos o **m_randomEngine**, um gerador de números aleatórios previamente inicializado.

**fish.m_rotationAxis = glm::sphericalRand(1.0f)**: Utiliza a função **glm::sphericalRand()** para gerar um vetor aleatório uniformemente distribuído na superfície de uma esfera com raio 1.0. Esse vetor é usado para representar o eixo de rotação do peixe, definindo sua orientação aleatória.

## loadModel(std::string_view path)

Limpeza e Carregamento de Modelos: Limpa o modelo anterior e carrega um novo modelo 3D especificado por um caminho.
Carregamento de Texturas: Carrega texturas de difusão, normais e de cubemap associadas ao modelo.
Configuração do VAO: Configura o Vertex Array Object (VAO) para o modelo carregado e associa ao programa atual.

## onPaint()

O método onPaint() cuida da limpeza da tela, configuração do programa de shader, definição e envio de variáveis uniformes para o shader, renderização de modelos e peixes na cena, desativação do programa de shader e, por fim, renderização da skybox.

**abcg::glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)**: Limpa os buffers de cor e profundidade para preparar a tela para a renderização.

**abcg::glViewport(0, 0, m_viewportSize.x, m_viewportSize.y)**: Define a área de exibição (viewport) na janela para a renderização dos gráficos.

**auto const program{m_programs.at(m_currentProgramIndex)}**: Obtém o programa de shader (conjunto de shaders) atual com base no índice atual.

**abcg::glUseProgram(program)**: Ativa o programa de shader para uso.

**auto const viewMatrixLoc{abcg::glGetUniformLocation(program, "viewMatrix")}**: Obtém a localização da variável uniforme "viewMatrix" no shader.

**abcg::glUniformMatrix4fv(viewMatrixLoc, 1, GL_FALSE, &m_viewMatrix[0][0])**: Define a variável uniforme "viewMatrix" com a matriz de visão.

**abcg::glUniform1i(diffuseTexLoc, 0)**: Define a variável uniforme diffuseTexLoc como um inteiro com o valor 0. Normalmente, isso é usado para indicar o índice da textura de difusão usada no shader.

**abcg::glUniform1i(normalTexLoc, 1)**: Define a variável uniforme normalTexLoc como um inteiro com o valor 1. Geralmente, isso representa o índice da textura normal usada no shader.

**abcg::glUniform1i(mappingModeLoc, m_mappingMode)**: Define a variável uniforme mappingModeLoc como um inteiro com o valor m_mappingMode. Essa variável é usada para controlar o modo de mapeamento no shader.

**glm::mat3 const texMatrix{m_trackBallLight.getRotation()}**: Cria uma matriz 3x3 (mat3) chamada texMatrix com a rotação obtida do objeto m_trackBallLight. Essa matriz é utilizada para transformações em coordenadas de textura.

**auto const lightDirRotated{m_trackBallLight.getRotation() * m_lightDir}**: Calcula a direção da luz (lightDirRotated) após aplicar a rotação obtida de m_trackBallLight na direção original m_lightDir.

**abcg::glUniform4fv(lightDirLoc, 1, &lightDirRotated.x)**: Define a variável uniforme lightDirLoc como um vetor de 4 componentes (vec4) representando a direção da luz rotacionada (lightDirRotated).

**abcg::glUniform4fv(IaLoc, 1, &m_Ia.x)**: Define a variável uniforme IaLoc como um vetor de 4 componentes (vec4) representando a componente ambiente da luz.

**abcg::glUniform4fv(IdLoc, 1, &m_Id.x)**: Define a variável uniforme IdLoc como um vetor de 4 componentes (vec4) representando a componente difusa da luz.

**abcg::glUniform4fv(IsLoc, 1, &m_Is.x)**: Define a variável uniforme IsLoc como um vetor de 4 componentes (vec4) representando a componente especular da luz.

**abcg::glUniform4fv(KaLoc, 1, &m_Ka.x)**: Define a variável uniforme KaLoc como um vetor de 4 componentes (vec4) representando as propriedades de cor ambiente do material.

**abcg::glUniform4fv(KdLoc, 1, &m_Kd.x)**: Define a variável uniforme KdLoc como um vetor de 4 componentes (vec4) representando as propriedades de cor difusa do material.

**abcg::glUniform4fv(KsLoc, 1, &m_Ks.x)**: Define a variável uniforme KsLoc como um vetor de 4 componentes (vec4) representando as propriedades de cor especular do material.

**abcg::glUniform1f(shininessLoc, m_shininess)**: Define a variável uniforme shininessLoc como um valor de ponto flutuante (float) representando o coeficiente de brilho (shininess) do material, usado para calcular o reflexo especular.

**m_model.render(m_trianglesToDraw)**: Renderiza o modelo com os triângulos a serem desenhados.

**Para cada peixe em m_fishs**:
    Calcula a matriz de modelo para cada peixe com base em sua posição, escala e rotação.
    Define a variável uniforme "modelMatrix" com a matriz de modelo do peixe.
    Renderiza o modelo do peixe.

**abcg::glUseProgram(0)**: Desativa o programa de shader.

**renderSkybox()**: Renderiza a skybox na cena.

## onUpdate()

O método onUpdate() é responsável por atualizar informações na cena antes da renderização.

**m_modelMatrix = m_trackBallModel.getRotation()**: Atualiza a matriz de modelo (m_modelMatrix) com a rotação resultante do controle de rotação m_trackBallModel.

**m_viewMatrix = glm::lookAt(glm::vec3(0.0f, 0.0f, 2.0f + m_zoom), glm::vec3(0.0f, 0.0f, 0.0f), glm::vec3(0.0f, 1.0f, 0.0f))**: Atualiza a matriz de visão (m_viewMatrix) usando a função glm::lookAt() para posicionar a câmera na posição (0, 0, 2 + m_zoom) olhando para o ponto (0, 0, 0) na cena, com o vetor up definido como (0, 1, 0).

**auto const deltaTime{gsl::narrow_cast<float>(getDeltaTime())}**: Obtém o tempo decorrido desde o último frame e o converte para um tipo float (usualmente em segundos).

**m_angle = glm::wrapAngle(m_angle + glm::radians(90.0f) * deltaTime)**: Incrementa o ângulo m_angle em 90 graus por segundo multiplicado pelo tempo decorrido. O glm::wrapAngle() garante que o ângulo permaneça dentro do intervalo [0, 2*PI].

**Loop para atualização das posições dos peixes:**
        **for (auto &fish : m_fishs) { ... }**
        Atualiza a posição Z de cada peixe incrementando-a com base no tempo decorrido, movendo os peixes ao longo do eixo Z positivo (na direção da câmera).
        
**Verificação se o peixe está atrás da câmera e reposicionamento:**
        **if (fish.m_position.z > 0.1f) { ... }**
        Verifica se a posição Z do peixe está à frente da câmera.
        Se estiver, chama a função randomizeFish(fish) para definir uma nova posição e orientação aleatórias para o peixe e reposiciona-o na coordenada Z -100, movendo-o de volta para trás da câmera para reaparecer na cena.

## onPaintUI()

**abcg::OpenGLWindow::onPaintUI()**: Chama o método onPaintUI() da classe OpenGLWindow para lidar com a renderização da interface gráfica.

**auto const scaledWidth{gsl::narrow_cast<int>(m_viewportSize.x * 0.8f)}**: Calcula a largura da janela de seleção de arquivos (File Browser) como 80% do tamanho da viewport.

**auto const scaledHeight{gsl::narrow_cast<int>(m_viewportSize.y * 0.8f)}**: Calcula a altura da janela de seleção de arquivos (File Browser) como 80% do tamanho da viewport.

**static ImGui::FileBrowser fileDialogModel**: Declaração de um File Browser para modelos.

**fileDialogModel.SetTitle("Load 3D Model")**: Define o título do File Browser como "Load 3D Model".

**fileDialogModel.SetTypeFilters({".obj"})**: Filtros de tipo de arquivo permitidos como apenas arquivos .obj (modelos 3D).

**fileDialogModel.SetWindowSize(scaledWidth, scaledHeight)**: Define o tamanho da janela do File Browser para um tamanho específico, proporcionado pela variável scaledWidth e scaledHeight.
O mesmo padrão é repetido para File Browsers de texturas difusas **(fileDialogDiffuseMap)** e mapas normais **(fileDialogNormalMap)**, cada um configurado com seus próprios filtros de tipos de arquivo e tamanhos de janela.

**#if defined(__EMSCRIPTEN__)**: Isso é uma verificação condicional que testa se o símbolo __EMSCRIPTEN__ está definido. Isso é uma prática comum em código C/C++ para condicionar o código em tempo de compilação para um ambiente específico, neste caso, o ambiente Emscripten.

**auto const assetsPath{abcg::Application::getAssetsPath()}**: Essa linha usa a função getAssetsPath() da classe **abcg::Application** para obter o caminho dos ativos da aplicação. Geralmente, este caminho é onde os recursos como modelos 3D, texturas, etc., estão armazenados.

**fileDialogModel.SetPwd(assetsPath)**: Define o diretório de trabalho para o File Browser responsável por carregar modelos para o caminho dos ativos da aplicação.

**fileDialogDiffuseMap.SetPwd(assetsPath + "/maps")**: Define o diretório de trabalho para o File Browser responsável por carregar texturas difusas para um subdiretório específico chamado "maps" dentro do caminho dos ativos da aplicação.

**fileDialogNormalMap.SetPwd(assetsPath + "/maps")**: Define o diretório de trabalho para o File Browser responsável por carregar texturas normais para o mesmo subdiretório "maps" dentro do caminho dos ativos da aplicação.

**Definir Tamanho e Posição da Janela Principal:**
        Uso **ImGui::SetNextWindowPos()** para definir a posição da janela e ImGui::SetNextWindowSize() para definir seu tamanho.

**Criação de um Menu de Navegação:**
        Uso **ImGui::BeginMenuBar()** para iniciar a barra de menu.
        Adiciona itens ao menu usando **ImGui::BeginMenu()** e **ImGui::MenuItem()** para carregar modelos, texturas difusas e normais.

**Configuração de Widgets:**
        **ImGui::SliderInt()** para ajustar o número de triângulos a serem renderizados.
        **ImGui::Checkbox()** para ativar/desativar o culling de faces.
        **ImGui::Checkbox()** para gerar/desativar peixes.
        **ImGui::BeginCombo()** para criar um menu suspenso para a seleção de modelos de peixe.
        
**Ajuste de Propriedades de Luz e Materiais:**
A função **ImGui::ColorEdit3()** cria sliders de cores para as propriedades de luz **(Ia, Id, Is)** e materiais **(Ka, Kd, Ks)**. Isso permite ajustar a intensidade e cor de cada componente de luz e de material.
**ImGui::SliderFloat()** é usado para controlar o brilho especular **(m_shininess)** permitindo que o usuário ajuste o valor dentro de uma faixa específica.

**File Browsers:**
O objeto **fileDialogModel** (e equivalentes) exibe o file browser na interface.
**fileDialogModel.HasSelected()** verifica se um arquivo foi selecionado pelo usuário.
Se um arquivo for selecionado, **loadModel()** é chamada para carregar o arquivo na aplicação.
Limpa a seleção **fileDialogModel.ClearSelected()**.
**m_model.isUVMapped()** verifica se o modelo possui mapeamento UV e, com base nisso, define o modo de mapeamento UV **(m_mappingMode)**.

## onResize(glm::ivec2 const &size)

Atualização do Tamanho da Viewport: Atualiza as dimensões da viewport quando a janela é redimensionada.

## onDestroy()

O método onDestroy() é responsável por desalocar e liberar recursos usados pela aplicação antes de finalizá-la. Nesse caso, ele chama o método destroy() do modelo principal para limpar quaisquer recursos associados a esse modelo. 

## createSkybox()

Este método é responsável por criar o skybox na aplicação utilizando shaders e VAO (Vertex Array Object) para renderização do mesmo.

**auto const assetsPath{abcg::Application::getAssetsPath()}**: Obtém o caminho dos ativos da aplicação.

**path:** Uma string que representa o caminho para os shaders do skybox, composto pelo diretório de shaders **("shaders/")** e o nome do shader **(m_skyShaderName)**. Ele é usado para criar o programa OpenGL **(m_skyProgram)** do skybox.

**m_skyProgram**: Um programa OpenGL usado para renderizar o skybox. É criado com base nos shaders de vértice e fragmento específicos do skybox.

**m_skyVBO**: Um identificador (ID) do Vertex Buffer Object (VBO) usado para armazenar os dados de posição do skybox.

**m_skyPositions**: Uma estrutura de dados **(geralmente um std::array ou std::vector)** contendo as posições dos vértices do skybox.

## renderSkybox()

O método renderSkybox() é responsável por renderizar o skybox na cena gráfica utilizando OpenGL. Ele realiza uma série de operações, incluindo o uso do programa de shader associado ao skybox, a definição das matrizes de visualização e projeção, o carregamento da textura do cubo (cube map) e a renderização dos triângulos que compõem o skybox. 

**abcg::glUseProgram(m_skyProgram)**: Define o programa OpenGL **(m_skyProgram)** para uso, indicando que as chamadas de função OpenGL subsequentes serão aplicadas a esse programa.

**auto const viewMatrixLoc{ ... }, auto const projMatrixLoc{ ... }, auto const skyTexLoc{ ... }**: Obtém os locais das variáveis uniformes **(viewMatrix, projMatrix e skyTex)** no programa do skybox.

**auto const viewMatrix{m_trackBallLight.getRotation()}: Obtém a matriz de visão para o skybox. Geralmente, isso é obtido usando uma técnica de câmera específica ou matriz de rotação.

**abcg::glUniformMatrix4fv(viewMatrixLoc, 1, GL_FALSE, &viewMatrix[0][0])**: Envia a matriz de visão para a variável uniforme viewMatrix do shader do skybox.

**abcg::glUniformMatrix4fv(projMatrixLoc, 1, GL_FALSE, &m_projMatrix[0][0])**: Envia a matriz de projeção **(m_projMatrix)** para a variável uniforme projMatrix do shader do skybox.

**abcg::glUniform1i(skyTexLoc, 0)**: Define o índice da textura do céu como 0.

**abcg::glBindVertexArray(m_skyVAO)**: Vincula o Vertex Array Objec (VAO) do skybox.

**abcg::glActiveTexture(GL_TEXTURE0), abcg::glBindTexture(GL_TEXTURE_CUBE_MAP, m_model.getCubeTexture())**: Ativa a textura 0 e vincula o mapa de textura do cubo **(m_model.getCubeTexture())** ao tipo de textura **GL_TEXTURE_CUBE_MAP**.

**abcg::glEnable(GL_CULL_FACE), abcg::glFrontFace(GL_CW), abcg::glDepthFunc(GL_LEQUAL)**: Habilita o culling de faces, define a orientação da face frontal, e define a função de teste de profundidade para permitir o desenho do skybox.

**abcg::glDrawArrays(GL_TRIANGLES, 0, m_skyPositions.size())**: Desenha o skybox usando as posições dos vértices carregadas no VAO.
    
**abcg::glDepthFunc(GL_LESS)**: Restaura a função de teste de profundidade para o modo padrão.

**abcg::glBindVertexArray(0), abcg::glUseProgram(0)**: Desvincula o VAO e desativa o programa OpenGL.

## destroySkybox()

O método destroySkybox() é responsável por desalocar os recursos utilizados para renderizar o skybox na aplicação gráfica OpenGL. Em detalhes, este método remove o programa OpenGL associado ao skybox **(m_skyProgram)**, que controla os shaders utilizados para renderizar o céu, liberando a memória associada a ele. Além disso, ele deleta o **Vertex Buffer Object (VBO) (m_skyVBO)** e o **Array Object (VAO) (m_skyVAO)** utilizados para armazenar os atributos dos vértices e definir os estados de renderização do skybox, respectivamente. Essa destruição de recursos é crucial para evitar vazamento de memória e liberar os recursos alocados durante a execução do programa gráfico.

# Para ver o resultado final abre no navegador:
https://jozanardo.github.io/Aplicacao-interativa-com-graficos-2D/
