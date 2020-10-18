//
// Created by Dmitrii Voronin on 18.10.2020.
//

#include "CImage.h"

const std::string JPG = ".jpg";
const std::string PNG = ".png";
const std::string GIF = ".gif";

CImage::CImage(IImage::Path path, int width, int height) {
    if (!IsExtensionValid(path))
    {
        throw std::invalid_argument("Image file extension is invalid");
    }
    if (width < 0 || height < 0)
    {
        throw std::invalid_argument("Image size is negative");
    }

    m_path = path;
    m_width = width;
    m_height = height;
}

IImage::Path CImage::GetPath() const {
    return m_path;
}

int CImage::GetHeight() const {
    return m_height;
}

int CImage::GetWidth() const {
    return m_width;
}

void CImage::Resize(int width, int height) {
    if (width < 0 || height < 0)
    {
        throw std::invalid_argument("Image size will be negative after resize");
    }

    m_width = width;
    m_height = height;
}

bool CImage::IsExtensionValid(const Path& path) {
    auto extension = path.extension();
    return (extension == JPG || extension == PNG || extension == GIF);
}
