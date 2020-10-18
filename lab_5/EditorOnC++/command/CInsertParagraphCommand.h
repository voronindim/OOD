//
// Created by Dmitrii Voronin on 18.10.2020.
//

#pragma once
#include "../document/CDocumentItem.h"
#include "CAbstractCommand.h"
#include <optional>
#include <vector>

using namespace std;

class CInsertParagraphCommand : public CAbstractCommand
{
public:
    CInsertParagraphCommand(string  text, vector<CDocumentItem>& items, optional<size_t> position = nullopt);

protected:
    void DoExecute() override;
    void DoUnexecute() override;

private:
    string m_text;
    vector<CDocumentItem>& m_items;
    optional<size_t> m_position;
};
