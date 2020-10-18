#pragma once
#include <filesystem>
#include <string>


class IImage
{
public:
    typedef std::filesystem::path Path;

    [[nodiscard]] virtual Path GetPath() const = 0;
    [[nodiscard]] virtual int GetWidth() const = 0;
    [[nodiscard]] virtual int GetHeight() const = 0;

    virtual void Resize(int width, int height) = 0;
    virtual ~IImage() = default;
};