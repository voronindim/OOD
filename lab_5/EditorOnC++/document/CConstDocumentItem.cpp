//
// Created by Dmitrii Voronin on 18.10.2020.
//

#include "CConstDocumentItem.h"

#include <utility>

CConstDocumentItem::CConstDocumentItem(Item item)
    : m_item(std::move(item))
{
}

CConstDocumentItem::ImagePtr CConstDocumentItem::GetImage() const {
    try
    {
        return std::get<std::shared_ptr<IImage>>(m_item);
    }
    catch(std::bad_variant_access&)
    {
        return nullptr;
    }
}

CConstDocumentItem::IParagraphPtr CConstDocumentItem::GetParagraph() const {
    try
    {
        return std::get<std::shared_ptr<IParagraph>>(m_item);
    }
    catch(std::bad_variant_access&)
    {
        return nullptr;
    }
}


