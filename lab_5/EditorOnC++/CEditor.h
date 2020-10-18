//
// Created by Dmitrii Voronin on 18.10.2020.
//

#pragma once
#include "document/CDocument.h"
#include "menu/CMenu.h"

using namespace std;

class CEditor
{
public:
    CEditor();

    void Start();

private:
    // Óêàçàòåëü íà ìåòîä êëàññà CEditor, ïðèíèìàþùèé istream& è âîçâðàùàþùèé void
    typedef void (CEditor::*MenuHandler)(istream& in);

    void AddMenuItem(const string& shortcut, const string& description, MenuHandler handler);

    void InsertParagraph(istream& in);
    void InsertImage(istream& in);
    void SetTitle(istream& in);
    void List(istream&);
    void ReplaceText(istream& in);
    void ResizeImage(istream& in);
    void DeleteItem(istream& in);
    void Undo(istream&);
    void Redo(istream&);
    void Save(istream& in);

    CMenu m_menu;
    IDocumentPtr m_document;
};
