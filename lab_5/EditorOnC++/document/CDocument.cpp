//
// Created by Dmitrii Voronin on 18.10.2020.
//

#include "CDocument.h"
#include "../command/CInsertParagraphCommand.h"
#include "../command/CInsertImageCommand.h"
#include "../command/CDeleteItemCommand.h"
#include "../command/CDeleteItemCommand.h"
#include "../command/CReplaceParagraphTextCommand.h"
#include "../command/CResizeImageCommand.h"
#include "../command/CChangeTitleCommand.h"
#include "../HtmlSaver.h"
#include <utility>

const string IMAGES_DIR = "images";

CDocument::CDocument(CDocument::SaveFn saveFn)
    : m_saveFn(std::move(saveFn))
{
}

shared_ptr<IParagraph> CDocument::InsertParagraph(const string &text, optional<size_t> position) {
    // TODO::Добавить проверки на выброс исключений

    m_history.AddAndExecuteCommand(make_unique<CInsertParagraphCommand>(GetHtmlString(text), m_items, position));

    size_t index = m_items.size() - 1;
    if (position != nullopt)
    {
        index = *position;
    }

    return m_items[index].GetParagraph();
}

shared_ptr<IImage> CDocument::InsertImage(const string &path, int width, int height, optional<size_t> position) {
    m_history.AddAndExecuteCommand(make_unique<CInsertImageCommand>(path, width, height, IMAGES_DIR, m_items, position));

    size_t index = m_items.size() - 1;
    if (position != nullopt)
    {
        index = *position;
    }

    return m_items[index].GetImage();
}

size_t CDocument::GetItemsCount() const {
    return m_items.size();
}

CConstDocumentItem CDocument::GetItem(size_t index) const {
    return m_items[index];
}

CDocumentItem CDocument::GetItem(size_t index) {
    return m_items[index];
}

void CDocument::DeleteItem(size_t index) {
    if (index >= GetItemsCount())
    {
        throw invalid_argument("requested item index is out of range");
    }

    m_history.AddAndExecuteCommand(make_unique<CDeleteItemCommand>(m_items, index));
}

void CDocument::SetTitle(const string &title) {
    m_history.AddAndExecuteCommand(make_unique<CChangeTitleCommand>(m_title, GetHtmlString(title)));
}

string CDocument::GetTitle() const {
    return m_title;
}

void CDocument::ReplaceParagraphText(size_t position, const string &text) {
    if (position >= GetItemsCount())
    {
        throw invalid_argument("requested paragraph position is out of range");
    }

    auto paragraph = GetItem(position).GetParagraph();

    if (!paragraph)
    {
        throw invalid_argument("requested item is not a paragraph");
    }

    m_history.AddAndExecuteCommand(make_unique<CReplaceParagraphTextCommand>(paragraph, text));
}

void CDocument::ResizeImage(size_t position, int width, int height) {
    if (position >= GetItemsCount())
    {
        throw invalid_argument("requested image position is out of range");
    }

    auto image = GetItem(position).GetImage();

    if (!image)
    {
        throw invalid_argument("requested item is not am image");
    }

    m_history.AddAndExecuteCommand(make_unique<CResizeImageCommand>(image, width, height));
}

bool CDocument::CanUndo() const {
    return m_history.CanUndo();
}

bool CDocument::CanRedo() const {
    return m_history.CanRedo();
}

void CDocument::Undo() {
    m_history.Undo();
}

void CDocument::Redo() {
    m_history.Redo();
}

void CDocument::Save(const string &path) const {
    m_saveFn(path, m_title, m_items);
}





