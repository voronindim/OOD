//
// Created by Dmitrii Voronin on 18.10.2020.
//
#pragma once
#include "IImage.h"

class CImage: public IImage {
public:
    CImage(Path path, int width, int height);
    [[nodiscard]] Path GetPath() const override;
    [[nodiscard]] int GetWidth() const override;
    [[nodiscard]] int GetHeight() const override;

    void Resize(int width, int height) override;
private:
    [[nodiscard]] static bool IsExtensionValid(const Path& path) ;

    Path m_path;
    int m_width;
    int m_height;
};
