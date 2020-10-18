//
// Created by Dmitrii Voronin on 18.10.2020.
//

#include "CInsertParagraphCommand.h"

#include <utility>
#include "../document/paragraph/CParagraph.h"

CInsertParagraphCommand::CInsertParagraphCommand(string text, vector<CDocumentItem> &items, optional<size_t> position)
    : m_text(std::move(text))
    , m_items(items)
    , m_position(position)
{
    if (m_position >= m_items.size())
    {
        throw logic_error("cannot insert paragraph to the position greater than number of items");
    }
}

void CInsertParagraphCommand::DoExecute() {
    auto paragraph = make_shared<CParagraph>(m_text);
    auto documentItem = CDocumentItem(paragraph);

    if (m_position == nullopt)
    {
        m_items.emplace_back(documentItem);
    }
    else
    {
        m_items.emplace(m_items.begin() + *m_position, documentItem);
    }
}

void CInsertParagraphCommand::DoUnexecute() {
    if (m_position == nullopt)
    {
        m_items.pop_back();
    }
    else
    {
        m_items.erase(m_items.begin() + *m_position);
    }
}


