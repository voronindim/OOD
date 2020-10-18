//
// Created by Dmitrii Voronin on 18.10.2020.
//
#pragma once
#include "image/IImage.h"
#include "paragraph/IParagraph.h"
#include <variant>
#include <memory>

class CConstDocumentItem {
public:
    typedef std::shared_ptr<const IImage> ImagePtr;
    typedef std::shared_ptr<const IParagraph> IParagraphPtr;
    typedef std::variant<std::shared_ptr<IImage>, std::shared_ptr<IParagraph>> Item;

    CConstDocumentItem(Item item);

    [[nodiscard]] ImagePtr GetImage() const;
    [[nodiscard]] IParagraphPtr GetParagraph() const;

    virtual ~CConstDocumentItem() = default;
protected:
    Item m_item;
};
