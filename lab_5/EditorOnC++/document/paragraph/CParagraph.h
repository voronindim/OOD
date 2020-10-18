//
// Created by Dmitrii Voronin on 18.10.2020.
//
#pragma once
#include "IParagraph.h"
class CParagraph: public IParagraph {
public:
    CParagraph() = default;
    CParagraph(const std::string& text);

    [[nodiscard]] std::string GetText() const override;
    void SetText(const std::string& text) override;
private:
    std::string m_text;
};
