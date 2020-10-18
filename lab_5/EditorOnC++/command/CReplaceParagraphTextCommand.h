//
// Created by Dmitrii Voronin on 18.10.2020.
//

#pragma once
#include "../document/paragraph/IParagraph.h"
#include "CAbstractCommand.h"

using namespace std;

class CReplaceParagraphTextCommand : public CAbstractCommand
{
public:
    CReplaceParagraphTextCommand(const shared_ptr<IParagraph>& paragraph, string  text);

protected:
    void DoExecute() override;
    void DoUnexecute() override;

private:
    shared_ptr<IParagraph> m_paragraph;

    string m_text;
    string m_newText;
};
