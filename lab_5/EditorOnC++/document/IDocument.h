//
// Created by Dmitrii Voronin on 18.10.2020.
//

#pragma once
#include "CConstDocumentItem.h"
#include "CDocumentItem.h"
#include "image/IImage.h"
#include "paragraph/IParagraph.h"
#include <memory>
#include <optional>
#include <string>

using namespace std;

class IDocument
{
public:
    virtual shared_ptr<IParagraph> InsertParagraph(const string& text, optional<size_t> position = std::nullopt) = 0;

    virtual shared_ptr<IImage> InsertImage(const std::string& path, int width, int height, optional<size_t> position = std::nullopt) = 0;

    [[nodiscard]] virtual size_t GetItemsCount() const = 0;

    [[nodiscard]] virtual CConstDocumentItem GetItem(size_t index) const = 0;

    virtual CDocumentItem GetItem(size_t index) = 0;

    virtual void DeleteItem(size_t index) = 0;

    [[nodiscard]] virtual std::string GetTitle() const = 0;

    virtual void SetTitle(const std::string& title) = 0;

    virtual void ReplaceParagraphText(size_t position, const std::string& text) = 0;

    virtual void ResizeImage(size_t position, int width, int height) = 0;

    [[nodiscard]] virtual bool CanUndo() const = 0;

    virtual void Undo() = 0;

    [[nodiscard]] virtual bool CanRedo() const = 0;

    virtual void Redo() = 0;

    virtual void Save(const std::string& path) const = 0;

    virtual ~IDocument() = default;
};

typedef std::unique_ptr<IDocument> IDocumentPtr;
