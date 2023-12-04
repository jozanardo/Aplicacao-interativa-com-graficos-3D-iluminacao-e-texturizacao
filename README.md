# Nome dos integrantes
João Augusto Zanardo de Lima - 11201920195

Guilherme Klinkerfuss Guimarães Pereira - 11201912414

# Explicação do Projeto

## Explicação detalhada Window.cpp
### onEvent(SDL_Event const &event)

    Este método responde a eventos SDL, como movimentos do mouse, cliques e rolagem. Ele controla interações do mouse para manipular a câmera, objetos e luz na cena.

    **SDL_MOUSEMOTION**: Atualiza a posição do mouse e aplica a movimentação no modelo e na luz (usando m_trackBallModel e m_trackBallLight).

    **SDL_MOUSEBUTTONDOWN / SDL_MOUSEBUTTONUP**: Captura cliques do mouse. No caso do botão esquerdo, é usado para interagir com o modelo, e no botão direito, com a luz.

    **SDL_MOUSEWHEEL**: Controla o zoom da cena com base na rolagem do mouse.

### onCreate()

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

### randomizeFish(Fish &fish)

    Gera posições aleatórias para os peixes dentro de determinados intervalos.

    Gera uma orientação aleatória para cada peixe.

    **std::uniform_real_distribution<float> distPosXY(-20.0f, 20.0f)** e **std::uniform_real_distribution<float> distPosZ(-100.0f, 0.0f)**: Essas linhas criam distribuições uniformes de números reais dentro de faixas específicas. No caso, **distPosXY** gera números no intervalo de -20 a 20 (para coordenadas X e Y) e **distPosZ** gera números de -100 a 0 (para coordenada Z).

    **fish.m_position = glm::vec3(distPosXY(m_randomEngine)**, **distPosXY(m_randomEngine)**, **distPosZ(m_randomEngine))**: Utiliza as distribuições geradas anteriormente para atribuir posições aleatórias ao peixe. Aqui, são definidas as coordenadas X, Y e Z do peixe com base nos valores aleatórios gerados pelas distribuições. Temos o **m_randomEngine**, um gerador de números aleatórios previamente inicializado.

    **fish.m_rotationAxis = glm::sphericalRand(1.0f)**: Utiliza a função **glm::sphericalRand()** para gerar um vetor aleatório uniformemente distribuído na superfície de uma esfera com raio 1.0. Esse vetor é usado para representar o eixo de rotação do peixe, definindo sua orientação aleatória.


### loadModel(std::string_view path)

    Limpeza e Carregamento de Modelos: Limpa o modelo anterior e carrega um novo modelo 3D especificado por um caminho.

    Carregamento de Texturas: Carrega texturas de difusão, normais e de cubemap associadas ao modelo.

    Configuração do VAO: Configura o Vertex Array Object (VAO) para o modelo carregado e associa ao programa atual.

### onPaint()

    Limpeza do Buffer: Limpa o buffer de cores e de profundidade.

    Definição da Viewport: Define as dimensões da viewport.

    Seleção do Programa OpenGL: Seleciona o programa atual.

    Configuração de Uniformes Comuns: Define uniformes comuns para todos os modelos, como matrizes de visualização e projeção, texturas, modo de mapeamento, entre outros.

    Renderização do Modelo Principal: Renderiza o modelo principal da cena.

    Renderização dos Peixes: Itera sobre cada peixe na cena, aplicando transformações e renderizando-os individualmente.

### onUpdate()

    Atualização das Matrizes de Modelo e Visualização: Atualiza as matrizes de modelo e de visualização com base nas interações do mouse e no zoom.

    Movimento dos Peixes: Move os peixes na cena e, se um peixe estiver fora do campo de visão da câmera, reposiciona-o aleatoriamente.

### onPaintUI()

    Renderização da Interface Gráfica do Usuário (GUI): Utiliza ImGui para criar widgets interativos que permitem carregar modelos, texturas, ajustar propriedades visuais e interagir com a cena.

### onResize(glm::ivec2 const &size)

    Atualização do Tamanho da Viewport: Atualiza as dimensões da viewport quando a janela é redimensionada.

### onDestroy()

    Limpeza de Recursos: Destrói os recursos OpenGL ao fechar a janela, como modelos, texturas e programas.

# Implementação do Projeto

Para ver o resultado final abre no navegador:
https://jozanardo.github.io/Aplicacao-interativa-com-graficos-2D/
