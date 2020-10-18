//
// Created by Dmitrii Voronin on 18.10.2020.
//

#pragma once
#include "CConstDocumentItem.h"

class CDocumentItem : public CConstDocumentItem
{
public:
    typedef std::shared_ptr<IImage> ImagePtr;
    typedef std::shared_ptr<IParagraph> ParagraphPtr;

    CDocumentItem(CConstDocumentItem::Item item);

    ImagePtr GetImage();
    ParagraphPtr GetParagraph();
};

