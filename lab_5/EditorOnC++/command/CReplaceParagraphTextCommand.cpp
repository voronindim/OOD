//
// Created by Dmitrii Voronin on 18.10.2020.
//

#include "CReplaceParagraphTextCommand.h"
#include <utility>

CReplaceParagraphTextCommand::CReplaceParagraphTextCommand(const shared_ptr<IParagraph>& paragraph, string text)
    : m_paragraph(paragraph)
    , m_newText(std::move(text))
{
    m_text = paragraph->GetText();
}

void CReplaceParagraphTextCommand::DoExecute() {
    m_paragraph->SetText(m_newText);
}

void CReplaceParagraphTextCommand::DoUnexecute() {
    m_paragraph->SetText(m_text);
}


