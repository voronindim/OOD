//
// Created by Dmitrii Voronin on 18.10.2020.
//
#pragma once
#include <vector>
#include <functional>
#include "IDocument.h"
#include "CConstDocumentItem.h"
#include "CDocumentItem.h"
#include "CHistory.h"
#include "../HtmlSaver.h"

class CDocument: public IDocument {
public:
    typedef function<void(const string& path, const string& title, const vector<CDocumentItem>& items)> SaveFn;

    shared_ptr<IParagraph> InsertParagraph(const string& text, optional<size_t> position = nullopt) override;
    shared_ptr<IImage> InsertImage(const string& path, int width, int height, optional<size_t> position = nullopt) override;

    [[nodiscard]] size_t GetItemsCount() const override;

    [[nodiscard]] CConstDocumentItem GetItem(size_t index) const override;
    CDocumentItem GetItem(size_t index) override;

    void DeleteItem(size_t index) override;

    void SetTitle(const string& title) override;
    [[nodiscard]] string GetTitle() const override;

    void ReplaceParagraphText(size_t position, const std::string& text) override;
    void ResizeImage(size_t position, int width, int height) override;

    [[nodiscard]] bool CanUndo() const override;
    void Undo() override;
    [[nodiscard]] bool CanRedo() const override;
    void Redo() override;

    void Save(const string& path) const override;

    ~CDocument() override = default;

    CDocument(SaveFn saveFn = SaveToHtmlFunction);

private:
    string m_title;
    vector<CDocumentItem> m_items;
    CHistory m_history;
    SaveFn m_saveFn;
};

