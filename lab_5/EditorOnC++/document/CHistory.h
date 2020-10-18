//
// Created by Dmitrii Voronin on 18.10.2020.
//

#pragma once
#include <deque>
#include "../command/ICommand.h"

class CHistory
{
public:
    [[nodiscard]] bool CanUndo()const;
    void Undo();
    [[nodiscard]] bool CanRedo()const;
    void Redo();
    void AddAndExecuteCommand(ICommandPtr && command);

    ~CHistory();

private:
    std::deque<ICommandPtr> m_commands;
    size_t m_nextCommandIndex = 0;
};
