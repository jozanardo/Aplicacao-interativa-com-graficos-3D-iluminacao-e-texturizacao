#include "window.hpp"

#include <glm/gtc/random.hpp>
#include <glm/gtx/fast_trigonometry.hpp>
#include <glm/gtc/type_ptr.hpp>

void Window::onCreate() {
  m_fishs.resize(m_fish_quantity);
  auto const assetsPath{abcg::Application::getAssetsPath()};
  m_assetsPath = assetsPath;
  abcg::glClearColor(0.0f, 0.1f, 0.2f, 1.0f);
  abcg::glEnable(GL_DEPTH_TEST);

  m_program =
      abcg::createOpenGLProgram({{.source = assetsPath + "depth.vert",
                                  .stage = abcg::ShaderStage::Vertex},
                                 {.source = assetsPath + "depth.frag",
                                  .stage = abcg::ShaderStage::Fragment}});

  m_model.loadObj(m_assetsPath + m_object);
  m_model.setupVAO(m_program);

  glm::vec3 const eye{0.0f, 0.0f, 0.0f};
  glm::vec3 const at{0.0f, 0.0f, -1.0f};
  glm::vec3 const up{0.0f, 1.0f, 0.0f};
  m_viewMatrix = glm::lookAt(eye, at, up);

  for (auto &fish : m_fishs) {
    randomizeFish(fish);
  }
}

void Window::randomizeFish(Fish &fish) {
  std::uniform_real_distribution<float> distPosXY(-20.0f, 20.0f);
  std::uniform_real_distribution<float> distPosZ(-100.0f, 0.0f);
  fish.m_position =
      glm::vec3(distPosXY(m_randomEngine), distPosXY(m_randomEngine),
                distPosZ(m_randomEngine));

  fish.m_rotationAxis = glm::sphericalRand(1.0f);
}

void Window::onUpdate() {
  auto const deltaTime{gsl::narrow_cast<float>(getDeltaTime())};
  m_angle = glm::wrapAngle(m_angle + glm::radians(90.0f) * deltaTime);

  for (auto &fish : m_fishs) {
    fish.m_position.z += deltaTime * 10.0f;

    // If this fish is behind the camera, select a new random position &
    // orientation and move it back to -100
    if (fish.m_position.z > 0.1f) {
      randomizeFish(fish);
      fish.m_position.z = -100.0f; // Back to -100
    }
  }
}

void Window::onPaint() {
  abcg::glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

  abcg::glViewport(0, 0, m_viewportSize.x, m_viewportSize.y);

  abcg::glUseProgram(m_program);

  // Get location of uniform variables
  auto const viewMatrixLoc{abcg::glGetUniformLocation(m_program, "viewMatrix")};
  auto const projMatrixLoc{abcg::glGetUniformLocation(m_program, "projMatrix")};
  auto const modelMatrixLoc{
      abcg::glGetUniformLocation(m_program, "modelMatrix")};
  auto const colorLoc{abcg::glGetUniformLocation(m_program, "color")};

  auto const lightPositionLoc{abcg::glGetUniformLocation(m_program, "lightPosition")};
  auto const lightColorLoc{abcg::glGetUniformLocation(m_program, "lightColor")};
  auto const objectColorLoc{abcg::glGetUniformLocation(m_program, "objectColor")};
  auto const ambientStrengthLoc{abcg::glGetUniformLocation(m_program, "ambientStrength")};
  auto const specularStrengthLoc{abcg::glGetUniformLocation(m_program, "specularStrength")};
  auto const shininessLoc{abcg::glGetUniformLocation(m_program, "shininess")};

  // Set uniform variables
  abcg::glUniformMatrix4fv(viewMatrixLoc, 1, GL_FALSE, &m_viewMatrix[0][0]);
  abcg::glUniformMatrix4fv(projMatrixLoc, 1, GL_FALSE, &m_projMatrix[0][0]);
  abcg::glUniform4f(colorLoc, 1.0f, 1.0f, 1.0f, 1.0f); // White

  // Set lighting uniforms
  abcg::glUniform3fv(lightPositionLoc, 1, &m_lightPosition.x);
  abcg::glUniform3fv(lightColorLoc, 1, &m_lightColor.x);
  abcg::glUniform3fv(objectColorLoc, 1, &m_objectColor.x);
  abcg::glUniform1f(ambientStrengthLoc, m_ambientStrength);
  abcg::glUniform1f(specularStrengthLoc, m_specularStrength);
  abcg::glUniform1f(shininessLoc, m_shininess);

  // Render each fish
  for (auto &fish : m_fishs) {
    // Compute model matrix of the current fish
    glm::mat4 modelMatrix{1.0f};
    modelMatrix = glm::translate(modelMatrix, fish.m_position);
    modelMatrix = glm::scale(modelMatrix, glm::vec3(m_scale));
    modelMatrix = glm::rotate(modelMatrix, m_angle, fish.m_rotationAxis);

    // Set uniform variable
    abcg::glUniformMatrix4fv(modelMatrixLoc, 1, GL_FALSE, &modelMatrix[0][0]);

    m_model.render();
  }

  abcg::glUseProgram(0);
}


void Window::onPaintUI() {
  abcg::OpenGLWindow::onPaintUI();

  {
    auto const widgetSize{ImVec2(318, 400)}; //218 186 31
    ImGui::SetNextWindowPos(ImVec2(m_viewportSize.x - widgetSize.x - 5, 5));
    ImGui::SetNextWindowSize(widgetSize);
    ImGui::Begin("Widget window", nullptr, ImGuiWindowFlags_NoDecoration);

    {
      ImGui::PushItemWidth(120);
      static std::size_t currentIndex{};
      std::vector<std::string> const comboItems{"Perspective", "Orthographic"};

      if (ImGui::BeginCombo("Projection",
                            comboItems.at(currentIndex).c_str())) {
        for (auto const index : iter::range(comboItems.size())) {
          auto const isSelected{currentIndex == index};
          if (ImGui::Selectable(comboItems.at(index).c_str(), isSelected))
            currentIndex = index;
          if (isSelected)
            ImGui::SetItemDefaultFocus();
        }
        ImGui::EndCombo();
      }


      ImGui::PushItemWidth(150);
      static std::size_t currentIndexFish{};
      std::vector<std::string> const objects{"Fish_baby_V1.obj", "Puffer_fish_v1.obj", "Shark_v1.obj"};
      if (ImGui::BeginCombo("Peixe",
                            objects.at(currentIndexFish).c_str())) {
        for (auto const index : iter::range(objects.size())) {
          auto const isSelected{currentIndexFish == index};
          if (ImGui::Selectable(objects.at(index).c_str(), isSelected)) {
            currentIndexFish = index;
            m_object = objects[currentIndexFish];
            abcg::glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
            onCreate();
          }
        }
        onPaint();
        ImGui::EndCombo();
      }

      ImGui::PopItemWidth();

      ImGui::PushItemWidth(170);
      auto const aspect{gsl::narrow<float>(m_viewportSize.x) /
                        gsl::narrow<float>(m_viewportSize.y)};
      if (currentIndex == 0) {
        m_projMatrix =
            glm::perspective(glm::radians(m_FOV), aspect, 0.01f, 100.0f);

        ImGui::SliderFloat("FOV", &m_FOV, 5.0f, 179.0f, "%.0f degrees");
      } else {
        m_projMatrix = glm::ortho(-20.0f * aspect, 20.0f * aspect, -20.0f,
                                  20.0f, 0.01f, 100.0f);
      }

      ImGui::PushItemWidth(160);
      ImGui::SliderFloat("Scale", &m_scale, 0.05f, 5.0f, "%.01f");

      ImGui::InputInt("Quantidade", &m_fish_quantity);
      if (m_fish_quantity <= 0) {
        m_fish_quantity = 1;
      }
      if ((int)m_fishs.size() != m_fish_quantity) {
        abcg::glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
        onCreate();
      }

      ImGui::Separator();
      ImGui::Text("Shader");

      ImGui::Begin("Widget window", nullptr, ImGuiWindowFlags_NoDecoration);


      ImGui::SliderFloat3("Posição da Luz", glm::value_ptr(m_lightPosition), -10.0f, 10.0f);
      ImGui::ColorEdit3("Cor da Luz", glm::value_ptr(m_lightColor));

      // Controles para o material do objeto
      ImGui::ColorEdit3("Cor do objeto", glm::value_ptr(m_objectColor));
      ImGui::SliderFloat("Opacidade", &m_ambientStrength, 0.0f, 1.0f);
      ImGui::SliderFloat("Espectro de Luz", &m_specularStrength, 0.0f, 1.0f);
      ImGui::SliderFloat("Brilho", &m_shininess, 1.0f, 128.0f);

      if (ImGui::Button("Reset")) {
        m_fish_quantity = {5};
        m_FOV = {30.0f};
        m_scale = {1.5f};
        m_lightPosition = {0.0f, 0.0f, 5.0f};
        m_lightColor = {235.0f, 64.0f, 52.0f};
        m_objectColor = {1.0f, 1.0f, 1.0f};
        m_ambientStrength = {0.1f};
        m_specularStrength = {0.5f};
        m_shininess = {32.0f};
      }

    }

    ImGui::End();
  }
}

void Window::onResize(glm::ivec2 const &size) { m_viewportSize = size; }

void Window::onDestroy() {
  m_model.destroy();
  abcg::glDeleteProgram(m_program);
}