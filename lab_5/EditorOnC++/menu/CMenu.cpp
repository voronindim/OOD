//
// Created by Dmitrii Voronin on 18.10.2020.
//

#include <sstream>
#include "CMenu.h"

CMenu::CMenu()
    : m_inStream(cin)
    , m_outStream(cout)
{
}

CMenu::CMenu(istream &inStream, ostream &outStream)
    : m_inStream(inStream)
    , m_outStream(outStream)
{
}

void CMenu::AddItem(const string &shortcut, const string &description, const CMenu::Command &command) {
    m_items.emplace_back(shortcut, description, command);
}

void CMenu::Run() {
    ShowInstructions();

    string command;
    while ((m_outStream << ">")
           && getline(m_inStream, command)
           && ExecuteCommand(command))
    {
    }
}

void CMenu::ShowInstructions() const {
    m_outStream << "Commands list:\n";
    for (auto & item : m_items)
    {
        m_outStream << "  " << item.shortcut << ": " << item.description << "\n";
    }
}

void CMenu::Exit() {
    m_exit = true;
}

bool CMenu::ExecuteCommand(const string &command) {
    istringstream iss(command);
    string name;
    iss >> name;

    m_exit = false;
    auto it = find_if(m_items.begin(), m_items.end(), [&](const Item& item) {
        return item.shortcut == name;
    });
    if (it != m_items.end())
    {
        it->command(iss);
    }

    else
    {
        m_outStream << "Unknown command\n";
    }
    return !m_exit;
}
