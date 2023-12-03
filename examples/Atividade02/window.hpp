#ifndef WINDOW_HPP_
#define WINDOW_HPP_

#include <random>

#include "abcgOpenGL.hpp"
#include "model.hpp"

class Window : public abcg::OpenGLWindow {
protected:
  void onCreate() override;
  void onUpdate() override;
  void onPaint() override;
  void onPaintUI() override;
  void onResize(glm::ivec2 const &size) override;
  void onDestroy() override;

private:
  std::default_random_engine m_randomEngine;

  glm::ivec2 m_viewportSize{};
  
  std::string m_assetsPath;

  std::string m_object{"Fish_baby_V1.obj"};

  Model m_model;

  int m_selectedModelIndex{0};

  struct Fish {
    glm::vec3 m_position{};
    glm::vec3 m_rotationAxis{};
  };

  int m_fish_quantity{5};
  std::vector<Fish> m_fishs;

  float m_angle{0.0f};

  float m_scale{1.5f};

  glm::mat4 m_viewMatrix{1.0f};
  glm::mat4 m_projMatrix{1.0f};
  float m_FOV{30.0f};

  GLuint m_program{};

  void randomizeFish(Fish &fish);

  glm::vec3 m_lightPosition{0.0f, 0.0f, 5.0f};
  glm::vec3 m_lightColor{235.0f, 64.0f, 52.0f};
  glm::vec3 m_objectColor{1.0f, 1.0f, 1.0f};
  float m_ambientStrength{1.0f};
  float m_specularStrength{1.0f};
  float m_shininess{32.0f};
};

#endif
