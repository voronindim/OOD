//
// Created by Dmitrii Voronin on 18.10.2020.
//

#include "CParagraph.h"
CParagraph::CParagraph(const std::string &text)
    : m_text(text)
{
}


std::string CParagraph::GetText() const {
    return m_text;
}

void CParagraph::SetText(const std::string &text) {
    m_text = text;
}
